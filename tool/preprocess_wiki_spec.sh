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
  my $in_target = 0;
  my ($fixed_type, $fixed_items) = (0, 0);
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
    print $oh $line;
  }
  close($fh);
  close($oh);

  die "修正 1 失败:期望替换 7 处 type: array,实际 $fixed_type 处(上游 spec 结构可能已变化)\n"
    if $fixed_type != 7;
  die "修正 1 失败:期望替换 7 处 items:,实际 $fixed_items 处(上游 spec 结构可能已变化)\n"
    if $fixed_items != 7;
  print STDERR "  修正 1:em_groups_*/em_segment_groups_*/used_segments_*_grouped 数组→map,共替换 $fixed_type 处\n";
' "$IN" "$OUT"

echo "==> spec 预处理完成: $OUT"
