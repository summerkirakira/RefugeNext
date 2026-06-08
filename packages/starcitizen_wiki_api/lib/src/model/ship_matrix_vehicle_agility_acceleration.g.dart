// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_matrix_vehicle_agility_acceleration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipMatrixVehicleAgilityAcceleration
_$ShipMatrixVehicleAgilityAccelerationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ShipMatrixVehicleAgilityAcceleration',
      json,
      ($checkedConvert) {
        final val = ShipMatrixVehicleAgilityAcceleration(
          xAxis: $checkedConvert('x_axis', (v) => (v as num?)?.toDouble()),
          yAxis: $checkedConvert('y_axis', (v) => (v as num?)?.toDouble()),
          zAxis: $checkedConvert('z_axis', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'xAxis': 'x_axis',
        'yAxis': 'y_axis',
        'zAxis': 'z_axis',
      },
    );

Map<String, dynamic> _$ShipMatrixVehicleAgilityAccelerationToJson(
  ShipMatrixVehicleAgilityAcceleration instance,
) => <String, dynamic>{
  'x_axis': ?instance.xAxis,
  'y_axis': ?instance.yAxis,
  'z_axis': ?instance.zAxis,
};
