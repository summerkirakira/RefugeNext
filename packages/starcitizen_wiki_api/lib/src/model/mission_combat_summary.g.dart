// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_combat_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCombatSummary _$MissionCombatSummaryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionCombatSummary', json, ($checkedConvert) {
  final val = MissionCombatSummary(
    total: $checkedConvert(
      'total',
      (v) => v == null
          ? null
          : MissionCombatSummaryTotal.fromJson(v as Map<String, dynamic>),
    ),
    byGroup: $checkedConvert(
      'by_group',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => MissionCombatSummaryByGroupInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'byGroup': 'by_group'});

Map<String, dynamic> _$MissionCombatSummaryToJson(
  MissionCombatSummary instance,
) => <String, dynamic>{
  'total': ?instance.total?.toJson(),
  'by_group': ?instance.byGroup?.map((e) => e.toJson()).toList(),
};
