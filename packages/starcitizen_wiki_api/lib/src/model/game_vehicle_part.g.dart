// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePart _$GameVehiclePartFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehiclePart',
      json,
      ($checkedConvert) {
        final val = GameVehiclePart(
          name: $checkedConvert('name', (v) => v as String?),
          displayName: $checkedConvert('display_name', (v) => v as String?),
          damageMax: $checkedConvert('damage_max', (v) => v as num?),
          destructionDamage: $checkedConvert(
            'destruction_damage',
            (v) => v as num?,
          ),
          detachDamage: $checkedConvert('detach_damage', (v) => v as num?),
          children: $checkedConvert(
            'children',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => GameVehiclePart.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          version: $checkedConvert('version', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'displayName': 'display_name',
        'damageMax': 'damage_max',
        'destructionDamage': 'destruction_damage',
        'detachDamage': 'detach_damage',
      },
    );

Map<String, dynamic> _$GameVehiclePartToJson(GameVehiclePart instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'display_name': ?instance.displayName,
      'damage_max': ?instance.damageMax,
      'destruction_damage': ?instance.destructionDamage,
      'detach_damage': ?instance.detachDamage,
      'children': ?instance.children?.map((e) => e.toJson()).toList(),
      'version': ?instance.version,
    };
