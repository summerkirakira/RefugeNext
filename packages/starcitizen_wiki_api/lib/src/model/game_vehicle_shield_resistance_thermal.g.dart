// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_resistance_thermal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldResistanceThermal _$GameVehicleShieldResistanceThermalFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleShieldResistanceThermal', json, (
  $checkedConvert,
) {
  final val = GameVehicleShieldResistanceThermal(
    minimum: $checkedConvert('minimum', (v) => v as num?),
    maximum: $checkedConvert('maximum', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleShieldResistanceThermalToJson(
  GameVehicleShieldResistanceThermal instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
