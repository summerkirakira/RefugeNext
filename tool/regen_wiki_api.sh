#!/usr/bin/env bash
#
# 重新生成 Star Citizen Wiki API 客户端(packages/starcitizen_wiki_api)。
#
# 用法:从仓库根目录运行
#   ./tool/regen_wiki_api.sh
#
# 依赖:
#   - openapi-generator  (brew install openapi-generator)
#   - dart / flutter     (用于 dart pub get + build_runner)
#
# 流程:
#   1. 调用 tool/preprocess_wiki_spec.sh 预处理 spec(修正与线上 API 实际
#      行为不符的字段类型,不改动 api/starcitizen_wiki.yaml 本体)。
#   2. 用 openapi-generator(dart-dio + json_serializable)从预处理后的 spec 生成包。
#   3. 应用两处必要的产物修补(见下)。
#   4. dart pub get + build_runner 生成 .g.dart 序列化代码。
#
# 修补原因(均为 dart-dio json_serializable 模板的已知问题):
#   A. 生成的 pubspec SDK 下限为 >=3.5.0,但 json_serializable 6.9.x 会产出
#      null-aware-elements 语法(`'k': ?v`),需要 Dart >=3.8。下限不够会导致
#      格式化器报 FormatterException。这里抬到 >=3.8.0。
#   B. spec 中的空对象 / oneOf 自由类型会生成「无字段」的空 model,模板对空类
#      产出非法代码:空的具名参数块 `({})`(非法 Dart)以及残缺的 `==` /
#      `hashCode`(悬空的 `&&` 和空的 `=>`)。这里把它们补成合法实现。
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SPEC="$REPO_ROOT/api/starcitizen_wiki.yaml"
OUT="$REPO_ROOT/packages/starcitizen_wiki_api"

DART="$(command -v dart)"

echo "==> 预处理 spec"
PREPROCESSED_DIR="$(mktemp -d)"
trap 'rm -rf "$PREPROCESSED_DIR"' EXIT
PREPROCESSED="$PREPROCESSED_DIR/starcitizen_wiki.yaml"
"$REPO_ROOT/tool/preprocess_wiki_spec.sh" "$SPEC" "$PREPROCESSED"

echo "==> 生成客户端到 $OUT"
rm -rf "$OUT"
openapi-generator generate \
  -i "$PREPROCESSED" \
  -g dart-dio \
  -o "$OUT" \
  --additional-properties=pubName=starcitizen_wiki_api,serializationLibrary=json_serializable,skipCopyWith=true

echo "==> 修补 A:抬高 SDK 下限到 >=3.8.0(null-aware-elements);收紧 json_annotation 约束"
/usr/bin/perl -0pi -e "s/sdk: '>=3\.5\.0 <4\.0\.0'/sdk: '>=3.8.0 <4.0.0'/" "$OUT/pubspec.yaml"
/usr/bin/perl -0pi -e "s/json_annotation: '\^4\.9\.0'/json_annotation: '^4.12.0'/" "$OUT/pubspec.yaml"

echo "==> 修补 B:修复空 model(空具名参数块 + 残缺的 == / hashCode)"
# B1: 空具名构造参数块 `Name({ });` -> `Name();`(空 `({})` 是非法 Dart)
/usr/bin/perl -0pi -e 's/(\b\w+)\(\{\s*\}\);/$1();/gs' "$OUT"/lib/src/model/*.dart
# B2: 残缺的 == / hashCode:`other is <Class> &&` <空> `@override int get hashCode =>` <空> (后接 factory)
/usr/bin/perl -0pi -e '
  s/other is (\w+) \&\&\s*\@override\s*int get hashCode =>\s*(?=factory)/other is $1;\n\n    \@override\n    int get hashCode => runtimeType.hashCode;\n\n  /gs
' "$OUT"/lib/src/model/*.dart

echo "==> dart pub get"
( cd "$OUT" && "$DART" pub get >/dev/null )

echo "==> build_runner(生成 .g.dart)"
( cd "$OUT" && "$DART" run build_runner build )

echo "==> 刷新 PHP 类型怪癖归一化集合(php_type_quirks.dart)"
"$(dirname "$0")/gen_php_type_quirks.sh"

echo "==> 完成。"
