// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_hardpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleHardpoint _$GameVehicleHardpointFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleHardpoint',
  json,
  ($checkedConvert) {
    final val = GameVehicleHardpoint(
      name: $checkedConvert('name', (v) => v as String?),
      position: $checkedConvert('position', (v) => v as String?),
      minSize: $checkedConvert('min_size', (v) => (v as num?)?.toInt()),
      maxSize: $checkedConvert('max_size', (v) => (v as num?)?.toInt()),
      className: $checkedConvert('class_name', (v) => v as String?),
      health: $checkedConvert('health', (v) => v as num?),
      type: $checkedConvert('type', (v) => v as String?),
      subType: $checkedConvert('sub_type', (v) => v as String?),
      pilotSlaveable: $checkedConvert('pilot_slaveable', (v) => v as bool?),
      item: $checkedConvert(
        'item',
        (v) => v == null
            ? null
            : GameVehicleHardpointItem.fromJson(v as Map<String, dynamic>),
      ),
      children: $checkedConvert(
        'children',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameVehicleHardpoint.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      version: $checkedConvert('version', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'minSize': 'min_size',
    'maxSize': 'max_size',
    'className': 'class_name',
    'subType': 'sub_type',
    'pilotSlaveable': 'pilot_slaveable',
  },
);

Map<String, dynamic> _$GameVehicleHardpointToJson(
  GameVehicleHardpoint instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'position': ?instance.position,
  'min_size': ?instance.minSize,
  'max_size': ?instance.maxSize,
  'class_name': ?instance.className,
  'health': ?instance.health,
  'type': ?instance.type,
  'sub_type': ?instance.subType,
  'pilot_slaveable': ?instance.pilotSlaveable,
  'item': ?instance.item?.toJson(),
  'children': ?instance.children?.map((e) => e.toJson()).toList(),
  'version': ?instance.version,
};
