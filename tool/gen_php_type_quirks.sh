#!/usr/bin/env bash
# 从生成模型扫描每个 JSON 键的声明类型,产出 PHP 类型怪癖归一化用的键集合:
#   phpBoolKeys / phpStringKeys / phpNumKeys —— 各自类型唯一、互不重叠
#   (类型在不同模型里不一致的「歧义键」会被剔除,留给运行期保持原样)。
#
# 用法(从仓库根目录):  ./tool/gen_php_type_quirks.sh
# 改 spec/模型(./tool/regen_wiki_api.sh)后应重跑本脚本刷新集合。
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MODEL_DIR="$ROOT/packages/starcitizen_wiki_api/lib/src/model"
OUT="$ROOT/lib/src/network/wiki/php_type_quirks.dart"

cd "$MODEL_DIR"

# 1) 收集 (key, 类型标记) 对:紧邻 `name: r'key'` 之后的 final 字段类型。
#    S=String, N=int/num/double, B=bool。只看顶层标量(List<T>/对象不计)。
pairs="$(awk '
  /name: r'"'"'/ { k=$0; gsub(/.*name: r.|.,.*/, "", k) }
  /final String\?/         { print k" S" }
  /final (int|num|double)\?/ { print k" N" }
  /final bool\?/           { print k" B" }
' $(ls *.dart | grep -v '\.g\.dart') | sort -u)"

# 2) 聚合:某键若出现多种类型则视为歧义键,丢弃;否则归入对应集合。
emit() { # $1 = 类型标记 S/N/B
  awk -v want="$1" '
    { t[$1]=t[$1] $2 }
    END { for (k in t) if (t[k]==want) print k }
  ' <<< "$pairs" | sort
}

dart_set() { # $1 = set 名, $2 = 类型标记
  echo "const Set<String> $1 = {"
  emit "$2" | sed "s/.*/  '&',/"
  echo "};"
  echo
}

{
  echo "// 自动生成,请勿手改。"
  echo "// 由 tool/gen_php_type_quirks.sh 扫描 starcitizen_wiki_api 模型字段声明产出。"
  echo "// 改 spec/模型(./tool/regen_wiki_api.sh)后重跑该脚本刷新。"
  echo "//"
  echo "// 这些 JSON 键在所有模型里类型唯一;PHP 后端若以错类型返回,"
  echo "// WikiApiClient 的响应拦截器据此在反序列化前归一化(见 normalizePhpEmptyArrays)。"
  echo
  echo "/// 模型期望 bool 的键。"
  dart_set "phpBoolKeys" "B"
  echo "/// 模型期望 String 的键。"
  dart_set "phpStringKeys" "S"
  echo "/// 模型期望数值(int/double/num)的键。"
  dart_set "phpNumKeys" "N"
} > "$OUT"

echo "wrote $OUT"
echo "  bool:   $(emit B | wc -l | tr -d ' ')"
echo "  string: $(emit S | wc -l | tr -d ' ')"
echo "  num:    $(emit N | wc -l | tr -d ' ')"
