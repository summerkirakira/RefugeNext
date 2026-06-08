// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_agility_acceleration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleAgilityAcceleration _$GameVehicleAgilityAccelerationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleAgilityAcceleration',
  json,
  ($checkedConvert) {
    final val = GameVehicleAgilityAcceleration(
      main: $checkedConvert('main', (v) => v as num?),
      retro: $checkedConvert('retro', (v) => v as num?),
      vtol: $checkedConvert('vtol', (v) => v as num?),
      maneuvering: $checkedConvert('maneuvering', (v) => v as num?),
      mainG: $checkedConvert('main_g', (v) => v as num?),
      retroG: $checkedConvert('retro_g', (v) => v as num?),
      vtolG: $checkedConvert('vtol_g', (v) => v as num?),
      maneuveringG: $checkedConvert('maneuvering_g', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'mainG': 'main_g',
    'retroG': 'retro_g',
    'vtolG': 'vtol_g',
    'maneuveringG': 'maneuvering_g',
  },
);

Map<String, dynamic> _$GameVehicleAgilityAccelerationToJson(
  GameVehicleAgilityAcceleration instance,
) => <String, dynamic>{
  'main': ?instance.main,
  'retro': ?instance.retro,
  'vtol': ?instance.vtol,
  'maneuvering': ?instance.maneuvering,
  'main_g': ?instance.mainG,
  'retro_g': ?instance.retroG,
  'vtol_g': ?instance.vtolG,
  'maneuvering_g': ?instance.maneuveringG,
};
