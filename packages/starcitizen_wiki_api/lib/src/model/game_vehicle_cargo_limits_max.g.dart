// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_cargo_limits_max.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleCargoLimitsMax _$GameVehicleCargoLimitsMaxFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleCargoLimitsMax', json, ($checkedConvert) {
  final val = GameVehicleCargoLimitsMax(
    x: $checkedConvert('x', (v) => v as num?),
    y: $checkedConvert('y', (v) => v as num?),
    z: $checkedConvert('z', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleCargoLimitsMaxToJson(
  GameVehicleCargoLimitsMax instance,
) => <String, dynamic>{'x': ?instance.x, 'y': ?instance.y, 'z': ?instance.z};
