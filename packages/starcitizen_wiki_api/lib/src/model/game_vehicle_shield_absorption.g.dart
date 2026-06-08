// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_absorption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldAbsorption _$GameVehicleShieldAbsorptionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleShieldAbsorption', json, ($checkedConvert) {
  final val = GameVehicleShieldAbsorption(
    physical: $checkedConvert(
      'physical',
      (v) => v == null
          ? null
          : GameVehicleShieldAbsorptionPhysical.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    energy: $checkedConvert(
      'energy',
      (v) => v == null
          ? null
          : GameVehicleShieldAbsorptionEnergy.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    distortion: $checkedConvert(
      'distortion',
      (v) => v == null
          ? null
          : GameVehicleShieldAbsorptionDistortion.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    thermal: $checkedConvert(
      'thermal',
      (v) => v == null
          ? null
          : GameVehicleShieldAbsorptionThermal.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    biochemical: $checkedConvert(
      'biochemical',
      (v) => v == null
          ? null
          : GameVehicleShieldAbsorptionBiochemical.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    stun: $checkedConvert(
      'stun',
      (v) => v == null
          ? null
          : GameVehicleShieldAbsorptionStun.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleShieldAbsorptionToJson(
  GameVehicleShieldAbsorption instance,
) => <String, dynamic>{
  'physical': ?instance.physical?.toJson(),
  'energy': ?instance.energy?.toJson(),
  'distortion': ?instance.distortion?.toJson(),
  'thermal': ?instance.thermal?.toJson(),
  'biochemical': ?instance.biochemical?.toJson(),
  'stun': ?instance.stun?.toJson(),
};
