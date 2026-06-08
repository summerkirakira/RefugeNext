// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_combat_summary_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCombatSummaryTotal _$MissionCombatSummaryTotalFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionCombatSummaryTotal', json, ($checkedConvert) {
  final val = MissionCombatSummaryTotal(
    min: $checkedConvert('min', (v) => (v as num?)?.toInt()),
    max: $checkedConvert('max', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$MissionCombatSummaryTotalToJson(
  MissionCombatSummaryTotal instance,
) => <String, dynamic>{'min': ?instance.min, 'max': ?instance.max};
