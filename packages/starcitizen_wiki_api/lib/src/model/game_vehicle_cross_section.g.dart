// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_cross_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleCrossSection _$GameVehicleCrossSectionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleCrossSection', json, ($checkedConvert) {
  final val = GameVehicleCrossSection(
    length: $checkedConvert('length', (v) => v as num?),
    width: $checkedConvert('width', (v) => v as num?),
    height: $checkedConvert('height', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleCrossSectionToJson(
  GameVehicleCrossSection instance,
) => <String, dynamic>{
  'length': ?instance.length,
  'width': ?instance.width,
  'height': ?instance.height,
};
