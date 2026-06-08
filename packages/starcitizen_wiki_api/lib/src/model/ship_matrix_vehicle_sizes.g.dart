// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_matrix_vehicle_sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipMatrixVehicleSizes _$ShipMatrixVehicleSizesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ShipMatrixVehicleSizes', json, ($checkedConvert) {
  final val = ShipMatrixVehicleSizes(
    length: $checkedConvert('length', (v) => (v as num?)?.toDouble()),
    beam: $checkedConvert('beam', (v) => (v as num?)?.toDouble()),
    height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ShipMatrixVehicleSizesToJson(
  ShipMatrixVehicleSizes instance,
) => <String, dynamic>{
  'length': ?instance.length,
  'beam': ?instance.beam,
  'height': ?instance.height,
};
