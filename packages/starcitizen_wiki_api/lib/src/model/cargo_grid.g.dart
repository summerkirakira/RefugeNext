// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cargo_grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CargoGrid _$CargoGridFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CargoGrid', json, ($checkedConvert) {
      final val = CargoGrid(
        scu: $checkedConvert('scu', (v) => (v as num?)?.toDouble()),
        x: $checkedConvert('x', (v) => (v as num?)?.toDouble()),
        y: $checkedConvert('y', (v) => (v as num?)?.toDouble()),
        z: $checkedConvert('z', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$CargoGridToJson(CargoGrid instance) => <String, dynamic>{
  'scu': ?instance.scu,
  'x': ?instance.x,
  'y': ?instance.y,
  'z': ?instance.z,
};
