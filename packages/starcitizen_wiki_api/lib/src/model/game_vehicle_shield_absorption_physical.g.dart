// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_absorption_physical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldAbsorptionPhysical
_$GameVehicleShieldAbsorptionPhysicalFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleShieldAbsorptionPhysical', json, (
      $checkedConvert,
    ) {
      final val = GameVehicleShieldAbsorptionPhysical(
        minimum: $checkedConvert('minimum', (v) => v as num?),
        maximum: $checkedConvert('maximum', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehicleShieldAbsorptionPhysicalToJson(
  GameVehicleShieldAbsorptionPhysical instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
