// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_matrix_vehicle_manufacturer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipMatrixVehicleManufacturer _$ShipMatrixVehicleManufacturerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ShipMatrixVehicleManufacturer', json, ($checkedConvert) {
  final val = ShipMatrixVehicleManufacturer(
    code: $checkedConvert('code', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ShipMatrixVehicleManufacturerToJson(
  ShipMatrixVehicleManufacturer instance,
) => <String, dynamic>{'code': ?instance.code, 'name': ?instance.name};
