// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_absorption_biochemical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldAbsorptionBiochemical
_$GameVehicleShieldAbsorptionBiochemicalFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleShieldAbsorptionBiochemical', json, (
      $checkedConvert,
    ) {
      final val = GameVehicleShieldAbsorptionBiochemical(
        minimum: $checkedConvert('minimum', (v) => v as num?),
        maximum: $checkedConvert('maximum', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehicleShieldAbsorptionBiochemicalToJson(
  GameVehicleShieldAbsorptionBiochemical instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
