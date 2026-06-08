// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_resistance_biochemical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldResistanceBiochemical
_$GameVehicleShieldResistanceBiochemicalFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleShieldResistanceBiochemical', json, (
      $checkedConvert,
    ) {
      final val = GameVehicleShieldResistanceBiochemical(
        minimum: $checkedConvert('minimum', (v) => v as num?),
        maximum: $checkedConvert('maximum', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehicleShieldResistanceBiochemicalToJson(
  GameVehicleShieldResistanceBiochemical instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
