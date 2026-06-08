// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_dimension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleDimension _$GameVehicleDimensionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleDimension', json, ($checkedConvert) {
  final val = GameVehicleDimension(
    length: $checkedConvert('length', (v) => v as num?),
    width: $checkedConvert('width', (v) => v as num?),
    height: $checkedConvert('height', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleDimensionToJson(
  GameVehicleDimension instance,
) => <String, dynamic>{
  'length': ?instance.length,
  'width': ?instance.width,
  'height': ?instance.height,
};
