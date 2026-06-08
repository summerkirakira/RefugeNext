// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_emission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleEmission _$GameVehicleEmissionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehicleEmission',
      json,
      ($checkedConvert) {
        final val = GameVehicleEmission(
          ir: $checkedConvert('ir', (v) => v as num?),
          emIdle: $checkedConvert('em_idle', (v) => v as num?),
          emMax: $checkedConvert('em_max', (v) => v as num?),
        );
        return val;
      },
      fieldKeyMap: const {'emIdle': 'em_idle', 'emMax': 'em_max'},
    );

Map<String, dynamic> _$GameVehicleEmissionToJson(
  GameVehicleEmission instance,
) => <String, dynamic>{
  'ir': ?instance.ir,
  'em_idle': ?instance.emIdle,
  'em_max': ?instance.emMax,
};
