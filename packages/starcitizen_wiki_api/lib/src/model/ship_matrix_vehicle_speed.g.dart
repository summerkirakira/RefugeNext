// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_matrix_vehicle_speed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipMatrixVehicleSpeed _$ShipMatrixVehicleSpeedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ShipMatrixVehicleSpeed', json, ($checkedConvert) {
  final val = ShipMatrixVehicleSpeed(
    scm: $checkedConvert('scm', (v) => (v as num?)?.toDouble()),
    max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ShipMatrixVehicleSpeedToJson(
  ShipMatrixVehicleSpeed instance,
) => <String, dynamic>{'scm': ?instance.scm, 'max': ?instance.max};
