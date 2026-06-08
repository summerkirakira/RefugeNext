// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_combat_spawns_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCombatSpawnsInner _$MissionCombatSpawnsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionCombatSpawnsInner',
  json,
  ($checkedConvert) {
    final val = MissionCombatSpawnsInner(
      role: $checkedConvert('role', (v) => v as String?),
      weight: $checkedConvert('weight', (v) => (v as num?)?.toInt()),
      groupName: $checkedConvert('group_name', (v) => v as String?),
      spawnKind: $checkedConvert('spawn_kind', (v) => v as String?),
      concurrentAmount: $checkedConvert(
        'concurrent_amount',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupName': 'group_name',
    'spawnKind': 'spawn_kind',
    'concurrentAmount': 'concurrent_amount',
  },
);

Map<String, dynamic> _$MissionCombatSpawnsInnerToJson(
  MissionCombatSpawnsInner instance,
) => <String, dynamic>{
  'role': ?instance.role,
  'weight': ?instance.weight,
  'group_name': ?instance.groupName,
  'spawn_kind': ?instance.spawnKind,
  'concurrent_amount': ?instance.concurrentAmount,
};
