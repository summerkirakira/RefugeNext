// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_drive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleDrive _$GameVehicleDriveFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehicleDrive',
      json,
      ($checkedConvert) {
        final val = GameVehicleDrive(
          maxSpeedKph: $checkedConvert('max_speed_kph', (v) => v as num?),
          maxSpeedMs: $checkedConvert('max_speed_ms', (v) => v as num?),
          reverseSpeedKph: $checkedConvert(
            'reverse_speed_kph',
            (v) => v as num?,
          ),
          reverseSpeedMs: $checkedConvert('reverse_speed_ms', (v) => v as num?),
          isTracked: $checkedConvert('is_tracked', (v) => v as bool?),
          wheels: $checkedConvert(
            'wheels',
            (v) => v == null
                ? null
                : GameVehicleDriveWheels.fromJson(v as Map<String, dynamic>),
          ),
          agility: $checkedConvert(
            'agility',
            (v) => v == null
                ? null
                : GameVehicleDriveAgility.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxSpeedKph': 'max_speed_kph',
        'maxSpeedMs': 'max_speed_ms',
        'reverseSpeedKph': 'reverse_speed_kph',
        'reverseSpeedMs': 'reverse_speed_ms',
        'isTracked': 'is_tracked',
      },
    );

Map<String, dynamic> _$GameVehicleDriveToJson(GameVehicleDrive instance) =>
    <String, dynamic>{
      'max_speed_kph': ?instance.maxSpeedKph,
      'max_speed_ms': ?instance.maxSpeedMs,
      'reverse_speed_kph': ?instance.reverseSpeedKph,
      'reverse_speed_ms': ?instance.reverseSpeedMs,
      'is_tracked': ?instance.isTracked,
      'wheels': ?instance.wheels?.toJson(),
      'agility': ?instance.agility?.toJson(),
    };
