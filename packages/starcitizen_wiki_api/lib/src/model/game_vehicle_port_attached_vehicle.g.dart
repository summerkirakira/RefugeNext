// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_port_attached_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePortAttachedVehicle _$GameVehiclePortAttachedVehicleFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehiclePortAttachedVehicle',
  json,
  ($checkedConvert) {
    final val = GameVehiclePortAttachedVehicle(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      sizeClass: $checkedConvert('size_class', (v) => (v as num?)?.toInt()),
      isSpaceship: $checkedConvert('is_spaceship', (v) => v as bool?),
      isVehicle: $checkedConvert('is_vehicle', (v) => v as bool?),
      isGravlev: $checkedConvert('is_gravlev', (v) => v as bool?),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'className': 'class_name',
    'sizeClass': 'size_class',
    'isSpaceship': 'is_spaceship',
    'isVehicle': 'is_vehicle',
    'isGravlev': 'is_gravlev',
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$GameVehiclePortAttachedVehicleToJson(
  GameVehiclePortAttachedVehicle instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'class_name': ?instance.className,
  'size_class': ?instance.sizeClass,
  'is_spaceship': ?instance.isSpaceship,
  'is_vehicle': ?instance.isVehicle,
  'is_gravlev': ?instance.isGravlev,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
