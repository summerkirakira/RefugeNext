// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_turret_weapons_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleTurretWeaponsInner _$GameVehicleTurretWeaponsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleTurretWeaponsInner',
  json,
  ($checkedConvert) {
    final val = GameVehicleTurretWeaponsInner(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      dps: $checkedConvert('dps', (v) => v as num?),
      sustainedDps: $checkedConvert('sustained_dps', (v) => v as num?),
      alpha: $checkedConvert('alpha', (v) => v as num?),
      isPilotSlaveable: $checkedConvert(
        'is_pilot_slaveable',
        (v) => v as bool?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'className': 'class_name',
    'webUrl': 'web_url',
    'sustainedDps': 'sustained_dps',
    'isPilotSlaveable': 'is_pilot_slaveable',
  },
);

Map<String, dynamic> _$GameVehicleTurretWeaponsInnerToJson(
  GameVehicleTurretWeaponsInner instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'class_name': ?instance.className,
  'name': ?instance.name,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
  'dps': ?instance.dps,
  'sustained_dps': ?instance.sustainedDps,
  'alpha': ?instance.alpha,
  'is_pilot_slaveable': ?instance.isPilotSlaveable,
};
