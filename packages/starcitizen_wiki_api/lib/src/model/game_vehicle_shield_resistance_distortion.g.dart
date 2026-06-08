// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_resistance_distortion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldResistanceDistortion
_$GameVehicleShieldResistanceDistortionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleShieldResistanceDistortion', json, (
      $checkedConvert,
    ) {
      final val = GameVehicleShieldResistanceDistortion(
        minimum: $checkedConvert('minimum', (v) => v as num?),
        maximum: $checkedConvert('maximum', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehicleShieldResistanceDistortionToJson(
  GameVehicleShieldResistanceDistortion instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
