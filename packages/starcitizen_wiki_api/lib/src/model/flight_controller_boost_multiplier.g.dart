// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_boost_multiplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerBoostMultiplier _$FlightControllerBoostMultiplierFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerBoostMultiplier',
  json,
  ($checkedConvert) {
    final val = FlightControllerBoostMultiplier(
      accelX: $checkedConvert(
        'accel_x',
        (v) => v == null
            ? null
            : FlightControllerSignedAxisMultiplier.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      accelY: $checkedConvert(
        'accel_y',
        (v) => v == null
            ? null
            : FlightControllerSignedAxisMultiplier.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      accelZ: $checkedConvert(
        'accel_z',
        (v) => v == null
            ? null
            : FlightControllerSignedAxisMultiplier.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      pitch: $checkedConvert('pitch', (v) => (v as num?)?.toDouble()),
      yaw: $checkedConvert('yaw', (v) => (v as num?)?.toDouble()),
      roll: $checkedConvert('roll', (v) => (v as num?)?.toDouble()),
      pitchAccel: $checkedConvert(
        'pitch_accel',
        (v) => (v as num?)?.toDouble(),
      ),
      yawAccel: $checkedConvert('yaw_accel', (v) => (v as num?)?.toDouble()),
      rollAccel: $checkedConvert('roll_accel', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'accelX': 'accel_x',
    'accelY': 'accel_y',
    'accelZ': 'accel_z',
    'pitchAccel': 'pitch_accel',
    'yawAccel': 'yaw_accel',
    'rollAccel': 'roll_accel',
  },
);

Map<String, dynamic> _$FlightControllerBoostMultiplierToJson(
  FlightControllerBoostMultiplier instance,
) => <String, dynamic>{
  'accel_x': ?instance.accelX?.toJson(),
  'accel_y': ?instance.accelY?.toJson(),
  'accel_z': ?instance.accelZ?.toJson(),
  'pitch': ?instance.pitch,
  'yaw': ?instance.yaw,
  'roll': ?instance.roll,
  'pitch_accel': ?instance.pitchAccel,
  'yaw_accel': ?instance.yawAccel,
  'roll_accel': ?instance.rollAccel,
};
