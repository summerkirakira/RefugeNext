// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_absorption_stun.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldAbsorptionStun _$GameVehicleShieldAbsorptionStunFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleShieldAbsorptionStun', json, ($checkedConvert) {
  final val = GameVehicleShieldAbsorptionStun(
    minimum: $checkedConvert('minimum', (v) => v as num?),
    maximum: $checkedConvert('maximum', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleShieldAbsorptionStunToJson(
  GameVehicleShieldAbsorptionStun instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
