// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_cargo_limits_min.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleCargoLimitsMin _$GameVehicleCargoLimitsMinFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleCargoLimitsMin', json, ($checkedConvert) {
  final val = GameVehicleCargoLimitsMin(
    x: $checkedConvert('x', (v) => v as num?),
    y: $checkedConvert('y', (v) => v as num?),
    z: $checkedConvert('z', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleCargoLimitsMinToJson(
  GameVehicleCargoLimitsMin instance,
) => <String, dynamic>{'x': ?instance.x, 'y': ?instance.y, 'z': ?instance.z};
