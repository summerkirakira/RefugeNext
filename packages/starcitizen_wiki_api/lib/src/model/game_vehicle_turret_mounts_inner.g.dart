// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_turret_mounts_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleTurretMountsInner _$GameVehicleTurretMountsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleTurretMountsInner',
  json,
  ($checkedConvert) {
    final val = GameVehicleTurretMountsInner(
      displayName: $checkedConvert('display_name', (v) => v as String?),
      hardpointName: $checkedConvert('hardpoint_name', (v) => v as String?),
      mountType: $checkedConvert('mount_type', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      weaponSizes: $checkedConvert(
        'weapon_sizes',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      payloadSizes: $checkedConvert(
        'payload_sizes',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      payloadTypes: $checkedConvert(
        'payload_types',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      payloadClassNames: $checkedConvert(
        'payload_class_names',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'hardpointName': 'hardpoint_name',
    'mountType': 'mount_type',
    'className': 'class_name',
    'weaponSizes': 'weapon_sizes',
    'payloadSizes': 'payload_sizes',
    'payloadTypes': 'payload_types',
    'payloadClassNames': 'payload_class_names',
  },
);

Map<String, dynamic> _$GameVehicleTurretMountsInnerToJson(
  GameVehicleTurretMountsInner instance,
) => <String, dynamic>{
  'display_name': ?instance.displayName,
  'hardpoint_name': ?instance.hardpointName,
  'mount_type': ?instance.mountType,
  'class_name': ?instance.className,
  'size': ?instance.size,
  'weapon_sizes': ?instance.weaponSizes,
  'payload_sizes': ?instance.payloadSizes,
  'payload_types': ?instance.payloadTypes,
  'payload_class_names': ?instance.payloadClassNames,
};
