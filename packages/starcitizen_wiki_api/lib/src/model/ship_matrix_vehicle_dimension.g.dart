// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_matrix_vehicle_dimension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipMatrixVehicleDimension _$ShipMatrixVehicleDimensionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ShipMatrixVehicleDimension', json, ($checkedConvert) {
  final val = ShipMatrixVehicleDimension(
    length: $checkedConvert('length', (v) => (v as num?)?.toDouble()),
    width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
    height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ShipMatrixVehicleDimensionToJson(
  ShipMatrixVehicleDimension instance,
) => <String, dynamic>{
  'length': ?instance.length,
  'width': ?instance.width,
  'height': ?instance.height,
};
