// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_matrix_vehicle_agility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipMatrixVehicleAgility _$ShipMatrixVehicleAgilityFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ShipMatrixVehicleAgility', json, ($checkedConvert) {
  final val = ShipMatrixVehicleAgility(
    pitch: $checkedConvert('pitch', (v) => (v as num?)?.toDouble()),
    yaw: $checkedConvert('yaw', (v) => (v as num?)?.toDouble()),
    roll: $checkedConvert('roll', (v) => (v as num?)?.toDouble()),
    acceleration: $checkedConvert(
      'acceleration',
      (v) => v == null
          ? null
          : ShipMatrixVehicleAgilityAcceleration.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ShipMatrixVehicleAgilityToJson(
  ShipMatrixVehicleAgility instance,
) => <String, dynamic>{
  'pitch': ?instance.pitch,
  'yaw': ?instance.yaw,
  'roll': ?instance.roll,
  'acceleration': ?instance.acceleration?.toJson(),
};
