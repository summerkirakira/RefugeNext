#!/usr/bin/env bash
#
# 预处理 Star Citizen Wiki API 的 OpenAPI spec,修正其与线上 API 实际
# 行为不符的字段类型。不修改 api/starcitizen_wiki.yaml 本体(保持与上游
# 一致,方便 diff/更新),由 regen_wiki_api.sh 在生成前调用本脚本,
# 用修正后的副本喂给 openapi-generator。
#
# 用法:
#   ./tool/preprocess_wiki_spec.sh <输入spec> <输出spec>
#
# 当前修正项:
#   1. spec 声明为 number[] 但线上 API 实际返回「组件类型 → 数值」对象
#      (如 {"Radar":1980,"Cooler":3278,...})的字段,改为
#      type: object + additionalProperties: number(生成 Map<String, num>?):
#      - GameVehicleSignature: em_groups_quantum / em_groups_shields /
#        em_segment_groups_quantum / em_segment_groups_shields
#      - GameVehicleCooling: used_segments_shields_grouped /
#        used_segments_quantum_grouped
#      - GameVehiclePower: used_segments_grouped
#   2. translation schema 的多语言 key:spec 声明为 en/de/zh/fr,
#      线上 API 实际返回 en_EN/de_DE/zh_CN/fr_FR(vehicles 与 shipmatrix
#      端点的 description/production_status/foci 均如此)。改为实际 key,
#      生成字段为 enEN/deDE/zhCN/frFR。
#   3. 单船端点(/api/vehicles/{id})实测的类型不符:
#      - register_range:spec boolean,实际为 0/1 整数 → number
#      - grade(两处 type: integer 的):列表端点给数字、单船端点给
#        字符串("1"/"A"/"C")→ string(数字侧由 WikiApiClient
#        运行时归一化为字符串)
#      - vehicle_component 的 component_size / size:spec integer,
#        实际为字符串("-"/"3"/"S")→ string
#
# 注意:后端为 PHP,空关联数组会被序列化成 []而非 {},该「空数组怪癖」
# 无法靠 spec 类型修正,由 WikiApiClient 的响应拦截器在运行时归一化。
#
# 每项修正都会校验替换次数,若上游 spec 结构变化导致没改到,立刻报错退出,
# 避免悄悄生成出错误的客户端。
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "用法: $0 <输入spec> <输出spec>" >&2
  exit 1
fi

IN="$1"
OUT="$2"

/usr/bin/perl -e '
  my ($in, $out) = @ARGV;
  open(my $fh, "<", $in) or die "无法读取 $in: $!";
  open(my $oh, ">", $out) or die "无法写入 $out: $!";

  # 修正 1:em_groups_* / em_segment_groups_* 数组改 map。
  # 状态机:命中目标字段名后,把其块内的 type: array → type: object、
  # items: → additionalProperties:,遇到 nullable/下一个字段即退出该块。
  # 修正 2:translation schema 内的多语言 key 改为线上实际 key。
  # 修正 3:register_range/grade/vehicle_component 尺寸的类型修正。
  my $in_target = 0;
  my $in_translation = 0;
  my $in_vehicle_component = 0;
  my $pending = "";   # 命中目标 key 后,等待其 type 行
  my ($fixed_type, $fixed_items, $fixed_lang) = (0, 0, 0);
  my ($fixed_rr, $fixed_grade, $fixed_vcsize) = (0, 0, 0);
  while (my $line = <$fh>) {
    if ($line =~ /^\s*(em_groups_quantum|em_groups_shields|em_segment_groups_quantum|em_segment_groups_shields|used_segments_shields_grouped|used_segments_quantum_grouped|used_segments_grouped):\s*$/) {
      $in_target = 1;
    } elsif ($in_target) {
      if ($line =~ s/^(\s*)type: array\s*$/$1type: object\n/) {
        $fixed_type++;
      } elsif ($line =~ s/^(\s*)items:\s*$/$1additionalProperties:\n/) {
        $fixed_items++;
      } elsif ($line =~ /^\s*nullable:/) {
        $in_target = 0;
      } elsif ($line !~ /^\s*(description|type|items|additionalProperties|example|nullable)\b|^\s*type: number\s*$/) {
        # 进入了意料之外的行(如下一个字段),保险起见退出该块
        $in_target = 0;
      }
    }

    # 修正 2:仅作用于 components/schemas 下的 translation 块
    if ($line =~ /^    translation:\s*$/) {
      $in_translation = 1;
    } elsif ($in_translation) {
      if ($line =~ /^    \S/) {
        # 缩进回到 schema 名层级(如 translation_single:),退出该块
        $in_translation = 0;
      } elsif ($line =~ s/^(\s+)en:\s*$/$1en_EN:\n/
            || $line =~ s/^(\s+)de:\s*$/$1de_DE:\n/
            || $line =~ s/^(\s+)zh:\s*$/$1zh_CN:\n/
            || $line =~ s/^(\s+)fr:\s*$/$1fr_FR:\n/) {
        $fixed_lang++;
      }
    }

    # 修正 3a:register_range boolean → number
    if ($line =~ /^\s*register_range:\s*$/) {
      $pending = "register_range";
    } elsif ($pending eq "register_range") {
      if ($line =~ s/^(\s*)type: boolean\s*$/$1type: number\n/) {
        $fixed_rr++;
        $pending = "";
      } elsif ($line =~ /^\s*\w[\w-]*:\s*($|\S)/ && $line !~ /^\s*description:/) {
        $pending = "";
      }
    }

    # 修正 3b:grade 的 type: integer → string(type: string 的两处不受影响)
    if ($line =~ /^\s*grade:\s*$/) {
      $pending = "grade";
    } elsif ($pending eq "grade") {
      if ($line =~ s/^(\s*)type: integer\s*$/$1type: string\n/) {
        $fixed_grade++;
        $pending = "";
      } elsif ($line =~ /^\s*type:/) {
        $pending = "";
      } elsif ($line =~ /^\s*\w[\w-]*:\s*($|\S)/ && $line !~ /^\s*description:/) {
        $pending = "";
      }
    }

    # 修正 3c:vehicle_component schema 内 component_size / size 的 integer → string
    if ($line =~ /^    vehicle_component:\s*$/) {
      $in_vehicle_component = 1;
    } elsif ($in_vehicle_component) {
      if ($line =~ /^    \S/) {
        $in_vehicle_component = 0;
      } elsif ($line =~ /^\s*(component_size|size):\s*$/) {
        $pending = "vc_size";
      } elsif ($pending eq "vc_size") {
        if ($line =~ s/^(\s*)type: integer\s*$/$1type: string\n/) {
          $fixed_vcsize++;
          $pending = "";
        } elsif ($line =~ /^\s*type:/) {
          $pending = "";
        }
      }
    }

    print $oh $line;
  }
  close($fh);
  close($oh);

  die "修正 1 失败:期望替换 7 处 type: array,实际 $fixed_type 处(上游 spec 结构可能已变化)\n"
    if $fixed_type != 7;
  die "修正 1 失败:期望替换 7 处 items:,实际 $fixed_items 处(上游 spec 结构可能已变化)\n"
    if $fixed_items != 7;
  die "修正 2 失败:期望替换 4 处多语言 key,实际 $fixed_lang 处(上游 spec 结构可能已变化)\n"
    if $fixed_lang != 4;
  die "修正 3a 失败:期望替换 1 处 register_range,实际 $fixed_rr 处\n"
    if $fixed_rr != 1;
  die "修正 3b 失败:期望替换 2 处 grade integer,实际 $fixed_grade 处\n"
    if $fixed_grade != 2;
  die "修正 3c 失败:期望替换 2 处 vehicle_component 尺寸,实际 $fixed_vcsize 处\n"
    if $fixed_vcsize != 2;
  print STDERR "  修正 1:em_groups_*/em_segment_groups_*/used_segments_*_grouped 数组→map,共替换 $fixed_type 处\n";
  print STDERR "  修正 2:translation 多语言 key en/de/zh/fr → en_EN/de_DE/zh_CN/fr_FR,共替换 $fixed_lang 处\n";
  print STDERR "  修正 3:register_range($fixed_rr)/grade($fixed_grade)/vehicle_component 尺寸($fixed_vcsize)类型修正\n";
' "$IN" "$OUT"

echo "==> spec 预处理完成: $OUT"
