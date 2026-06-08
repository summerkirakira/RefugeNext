// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_absorption_distortion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldAbsorptionDistortion
_$GameVehicleShieldAbsorptionDistortionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleShieldAbsorptionDistortion', json, (
      $checkedConvert,
    ) {
      final val = GameVehicleShieldAbsorptionDistortion(
        minimum: $checkedConvert('minimum', (v) => v as num?),
        maximum: $checkedConvert('maximum', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehicleShieldAbsorptionDistortionToJson(
  GameVehicleShieldAbsorptionDistortion instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
