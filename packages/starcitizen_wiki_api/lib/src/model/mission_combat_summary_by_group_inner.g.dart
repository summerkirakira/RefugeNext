// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_combat_summary_by_group_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCombatSummaryByGroupInner _$MissionCombatSummaryByGroupInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionCombatSummaryByGroupInner',
  json,
  ($checkedConvert) {
    final val = MissionCombatSummaryByGroupInner(
      groupName: $checkedConvert('group_name', (v) => v as String?),
      min: $checkedConvert('min', (v) => (v as num?)?.toInt()),
      max: $checkedConvert('max', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'groupName': 'group_name'},
);

Map<String, dynamic> _$MissionCombatSummaryByGroupInnerToJson(
  MissionCombatSummaryByGroupInner instance,
) => <String, dynamic>{
  'group_name': ?instance.groupName,
  'min': ?instance.min,
  'max': ?instance.max,
};
