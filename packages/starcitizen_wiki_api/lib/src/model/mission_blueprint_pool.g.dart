// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_blueprint_pool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionBlueprintPool _$MissionBlueprintPoolFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionBlueprintPool',
  json,
  ($checkedConvert) {
    final val = MissionBlueprintPool(
      dropChance: $checkedConvert(
        'drop_chance',
        (v) => (v as num?)?.toDouble(),
      ),
      dropChancePercent: $checkedConvert(
        'drop_chance_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      poolUuid: $checkedConvert('pool_uuid', (v) => v as String?),
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionBlueprintItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dropChance': 'drop_chance',
    'dropChancePercent': 'drop_chance_percent',
    'poolUuid': 'pool_uuid',
  },
);

Map<String, dynamic> _$MissionBlueprintPoolToJson(
  MissionBlueprintPool instance,
) => <String, dynamic>{
  'drop_chance': ?instance.dropChance,
  'drop_chance_percent': ?instance.dropChancePercent,
  'pool_uuid': ?instance.poolUuid,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
};
