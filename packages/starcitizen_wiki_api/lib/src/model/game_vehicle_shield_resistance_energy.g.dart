// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_resistance_energy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldResistanceEnergy _$GameVehicleShieldResistanceEnergyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleShieldResistanceEnergy', json, (
  $checkedConvert,
) {
  final val = GameVehicleShieldResistanceEnergy(
    minimum: $checkedConvert('minimum', (v) => v as num?),
    maximum: $checkedConvert('maximum', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleShieldResistanceEnergyToJson(
  GameVehicleShieldResistanceEnergy instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
