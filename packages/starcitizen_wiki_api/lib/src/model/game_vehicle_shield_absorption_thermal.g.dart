// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_absorption_thermal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldAbsorptionThermal _$GameVehicleShieldAbsorptionThermalFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleShieldAbsorptionThermal', json, (
  $checkedConvert,
) {
  final val = GameVehicleShieldAbsorptionThermal(
    minimum: $checkedConvert('minimum', (v) => v as num?),
    maximum: $checkedConvert('maximum', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleShieldAbsorptionThermalToJson(
  GameVehicleShieldAbsorptionThermal instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
