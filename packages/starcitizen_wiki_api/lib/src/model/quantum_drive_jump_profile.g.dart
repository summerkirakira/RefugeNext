// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantum_drive_jump_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantumDriveJumpProfile _$QuantumDriveJumpProfileFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'QuantumDriveJumpProfile',
  json,
  ($checkedConvert) {
    final val = QuantumDriveJumpProfile(
      driveSpeed: $checkedConvert(
        'drive_speed',
        (v) => (v as num?)?.toDouble(),
      ),
      cooldownTime: $checkedConvert(
        'cooldown_time',
        (v) => (v as num?)?.toDouble(),
      ),
      stageOneAccelRate: $checkedConvert(
        'stage_one_accel_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      stageTwoAccelRate: $checkedConvert(
        'stage_two_accel_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      engageSpeed: $checkedConvert(
        'engage_speed',
        (v) => (v as num?)?.toDouble(),
      ),
      interdictionEffectTime: $checkedConvert(
        'interdiction_effect_time',
        (v) => (v as num?)?.toDouble(),
      ),
      calibrationRate: $checkedConvert(
        'calibration_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      minCalibrationRequirement: $checkedConvert(
        'min_calibration_requirement',
        (v) => (v as num?)?.toDouble(),
      ),
      maxCalibrationRequirement: $checkedConvert(
        'max_calibration_requirement',
        (v) => (v as num?)?.toDouble(),
      ),
      calibrationProcessAngleLimit: $checkedConvert(
        'calibration_process_angle_limit',
        (v) => (v as num?)?.toDouble(),
      ),
      calibrationWarningAngleLimit: $checkedConvert(
        'calibration_warning_angle_limit',
        (v) => (v as num?)?.toDouble(),
      ),
      calibrationDelayInSeconds: $checkedConvert(
        'calibration_delay_in_seconds',
        (v) => (v as num?)?.toDouble(),
      ),
      spoolUpTime: $checkedConvert(
        'spool_up_time',
        (v) => (v as num?)?.toDouble(),
      ),
      driveSpeedFormatted: $checkedConvert(
        'drive_speed_formatted',
        (v) => v as String?,
      ),
      stageOneAccelRateFormatted: $checkedConvert(
        'stage_one_accel_rate_formatted',
        (v) => v as String?,
      ),
      stageTwoAccelRateFormatted: $checkedConvert(
        'stage_two_accel_rate_formatted',
        (v) => v as String?,
      ),
      engageSpeedFormatted: $checkedConvert(
        'engage_speed_formatted',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'driveSpeed': 'drive_speed',
    'cooldownTime': 'cooldown_time',
    'stageOneAccelRate': 'stage_one_accel_rate',
    'stageTwoAccelRate': 'stage_two_accel_rate',
    'engageSpeed': 'engage_speed',
    'interdictionEffectTime': 'interdiction_effect_time',
    'calibrationRate': 'calibration_rate',
    'minCalibrationRequirement': 'min_calibration_requirement',
    'maxCalibrationRequirement': 'max_calibration_requirement',
    'calibrationProcessAngleLimit': 'calibration_process_angle_limit',
    'calibrationWarningAngleLimit': 'calibration_warning_angle_limit',
    'calibrationDelayInSeconds': 'calibration_delay_in_seconds',
    'spoolUpTime': 'spool_up_time',
    'driveSpeedFormatted': 'drive_speed_formatted',
    'stageOneAccelRateFormatted': 'stage_one_accel_rate_formatted',
    'stageTwoAccelRateFormatted': 'stage_two_accel_rate_formatted',
    'engageSpeedFormatted': 'engage_speed_formatted',
  },
);

Map<String, dynamic> _$QuantumDriveJumpProfileToJson(
  QuantumDriveJumpProfile instance,
) => <String, dynamic>{
  'drive_speed': ?instance.driveSpeed,
  'cooldown_time': ?instance.cooldownTime,
  'stage_one_accel_rate': ?instance.stageOneAccelRate,
  'stage_two_accel_rate': ?instance.stageTwoAccelRate,
  'engage_speed': ?instance.engageSpeed,
  'interdiction_effect_time': ?instance.interdictionEffectTime,
  'calibration_rate': ?instance.calibrationRate,
  'min_calibration_requirement': ?instance.minCalibrationRequirement,
  'max_calibration_requirement': ?instance.maxCalibrationRequirement,
  'calibration_process_angle_limit': ?instance.calibrationProcessAngleLimit,
  'calibration_warning_angle_limit': ?instance.calibrationWarningAngleLimit,
  'calibration_delay_in_seconds': ?instance.calibrationDelayInSeconds,
  'spool_up_time': ?instance.spoolUpTime,
  'drive_speed_formatted': ?instance.driveSpeedFormatted,
  'stage_one_accel_rate_formatted': ?instance.stageOneAccelRateFormatted,
  'stage_two_accel_rate_formatted': ?instance.stageTwoAccelRateFormatted,
  'engage_speed_formatted': ?instance.engageSpeedFormatted,
};
