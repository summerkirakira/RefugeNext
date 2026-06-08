// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_resistance_physical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldResistancePhysical
_$GameVehicleShieldResistancePhysicalFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleShieldResistancePhysical', json, (
      $checkedConvert,
    ) {
      final val = GameVehicleShieldResistancePhysical(
        minimum: $checkedConvert('minimum', (v) => v as num?),
        maximum: $checkedConvert('maximum', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehicleShieldResistancePhysicalToJson(
  GameVehicleShieldResistancePhysical instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
