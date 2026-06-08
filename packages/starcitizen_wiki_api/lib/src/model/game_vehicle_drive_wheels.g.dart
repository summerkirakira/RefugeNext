// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_drive_wheels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleDriveWheels _$GameVehicleDriveWheelsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleDriveWheels',
  json,
  ($checkedConvert) {
    final val = GameVehicleDriveWheels(
      count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
      drivingCount: $checkedConvert(
        'driving_count',
        (v) => (v as num?)?.toInt(),
      ),
      steeringCount: $checkedConvert(
        'steering_count',
        (v) => (v as num?)?.toInt(),
      ),
      driveType: $checkedConvert('drive_type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'drivingCount': 'driving_count',
    'steeringCount': 'steering_count',
    'driveType': 'drive_type',
  },
);

Map<String, dynamic> _$GameVehicleDriveWheelsToJson(
  GameVehicleDriveWheels instance,
) => <String, dynamic>{
  'count': ?instance.count,
  'driving_count': ?instance.drivingCount,
  'steering_count': ?instance.steeringCount,
  'drive_type': ?instance.driveType,
};
