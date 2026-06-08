// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_combat_aggregated_spawns_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCombatAggregatedSpawnsInner _$MissionCombatAggregatedSpawnsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionCombatAggregatedSpawnsInner',
  json,
  ($checkedConvert) {
    final val = MissionCombatAggregatedSpawnsInner(
      role: $checkedConvert('role', (v) => v as String?),
      groupName: $checkedConvert('group_name', (v) => v as String?),
      spawnKind: $checkedConvert('spawn_kind', (v) => v as String?),
      concurrentMin: $checkedConvert(
        'concurrent_min',
        (v) => (v as num?)?.toInt(),
      ),
      concurrentMax: $checkedConvert(
        'concurrent_max',
        (v) => (v as num?)?.toInt(),
      ),
      weight: $checkedConvert('weight', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupName': 'group_name',
    'spawnKind': 'spawn_kind',
    'concurrentMin': 'concurrent_min',
    'concurrentMax': 'concurrent_max',
  },
);

Map<String, dynamic> _$MissionCombatAggregatedSpawnsInnerToJson(
  MissionCombatAggregatedSpawnsInner instance,
) => <String, dynamic>{
  'role': ?instance.role,
  'group_name': ?instance.groupName,
  'spawn_kind': ?instance.spawnKind,
  'concurrent_min': ?instance.concurrentMin,
  'concurrent_max': ?instance.concurrentMax,
  'weight': ?instance.weight,
};
