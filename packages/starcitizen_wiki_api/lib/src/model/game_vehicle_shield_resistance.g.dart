// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_resistance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldResistance _$GameVehicleShieldResistanceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleShieldResistance', json, ($checkedConvert) {
  final val = GameVehicleShieldResistance(
    physical: $checkedConvert(
      'physical',
      (v) => v == null
          ? null
          : GameVehicleShieldResistancePhysical.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    energy: $checkedConvert(
      'energy',
      (v) => v == null
          ? null
          : GameVehicleShieldResistanceEnergy.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    distortion: $checkedConvert(
      'distortion',
      (v) => v == null
          ? null
          : GameVehicleShieldResistanceDistortion.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    thermal: $checkedConvert(
      'thermal',
      (v) => v == null
          ? null
          : GameVehicleShieldResistanceThermal.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    biochemical: $checkedConvert(
      'biochemical',
      (v) => v == null
          ? null
          : GameVehicleShieldResistanceBiochemical.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    stun: $checkedConvert(
      'stun',
      (v) => v == null
          ? null
          : GameVehicleShieldResistanceStun.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleShieldResistanceToJson(
  GameVehicleShieldResistance instance,
) => <String, dynamic>{
  'physical': ?instance.physical?.toJson(),
  'energy': ?instance.energy?.toJson(),
  'distortion': ?instance.distortion?.toJson(),
  'thermal': ?instance.thermal?.toJson(),
  'biochemical': ?instance.biochemical?.toJson(),
  'stun': ?instance.stun?.toJson(),
};
