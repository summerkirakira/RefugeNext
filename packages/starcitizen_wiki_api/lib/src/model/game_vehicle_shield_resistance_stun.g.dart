// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield_resistance_stun.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShieldResistanceStun _$GameVehicleShieldResistanceStunFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleShieldResistanceStun', json, ($checkedConvert) {
  final val = GameVehicleShieldResistanceStun(
    minimum: $checkedConvert('minimum', (v) => v as num?),
    maximum: $checkedConvert('maximum', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleShieldResistanceStunToJson(
  GameVehicleShieldResistanceStun instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
