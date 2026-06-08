// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_absorption_energy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldAbsorptionEnergy _$GameVehicleShieldAbsorptionEnergyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleShieldAbsorptionEnergy', json, (
  $checkedConvert,
) {
  final val = GameVehicleShieldAbsorptionEnergy(
    minimum: $checkedConvert('minimum', (v) => v as num?),
    maximum: $checkedConvert('maximum', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleShieldAbsorptionEnergyToJson(
  GameVehicleShieldAbsorptionEnergy instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
