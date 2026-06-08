//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'quantum_drive_jump_profile.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QuantumDriveJumpProfile {
  /// Returns a new [QuantumDriveJumpProfile] instance.
  QuantumDriveJumpProfile({

     this.driveSpeed,

     this.cooldownTime,

     this.stageOneAccelRate,

     this.stageTwoAccelRate,

     this.engageSpeed,

     this.interdictionEffectTime,

     this.calibrationRate,

     this.minCalibrationRequirement,

     this.maxCalibrationRequirement,

     this.calibrationProcessAngleLimit,

     this.calibrationWarningAngleLimit,

     this.calibrationDelayInSeconds,

     this.spoolUpTime,

     this.driveSpeedFormatted,

     this.stageOneAccelRateFormatted,

     this.stageTwoAccelRateFormatted,

     this.engageSpeedFormatted,
  });

      /// Max cruise velocity for the jump profile (m/s). Standard jumps range ~138,000,000-876,000,000; spline jumps ~400,000-500,000.
  @JsonKey(
    
    name: r'drive_speed',
    required: false,
    includeIfNull: false,
  )


  final double? driveSpeed;



      /// Cooldown after exit in seconds; dataset ranges 0-92.07.
  @JsonKey(
    
    name: r'cooldown_time',
    required: false,
    includeIfNull: false,
  )


  final double? cooldownTime;



      /// Initial acceleration phase (m/s²). Standard ~1.75M; spline as low as 250.
  @JsonKey(
    
    name: r'stage_one_accel_rate',
    required: false,
    includeIfNull: false,
  )


  final double? stageOneAccelRate;



      /// Secondary acceleration phase (m/s²). Standard up to 11,000,000; spline around 50,000.
  @JsonKey(
    
    name: r'stage_two_accel_rate',
    required: false,
    includeIfNull: false,
  )


  final double? stageTwoAccelRate;



      /// Minimum ship speed to engage QT (m/s).
  @JsonKey(
    
    name: r'engage_speed',
    required: false,
    includeIfNull: false,
  )


  final double? engageSpeed;



      /// Duration of interdiction effect (seconds).
  @JsonKey(
    
    name: r'interdiction_effect_time',
    required: false,
    includeIfNull: false,
  )


  final double? interdictionEffectTime;



      /// Calibration progress per second.
  @JsonKey(
    
    name: r'calibration_rate',
    required: false,
    includeIfNull: false,
  )


  final double? calibrationRate;



      /// Minimum calibration distance gate.
  @JsonKey(
    
    name: r'min_calibration_requirement',
    required: false,
    includeIfNull: false,
  )


  final double? minCalibrationRequirement;



      /// Maximum calibration distance gate.
  @JsonKey(
    
    name: r'max_calibration_requirement',
    required: false,
    includeIfNull: false,
  )


  final double? maxCalibrationRequirement;



      /// Angular tolerance during calibration (degrees).
  @JsonKey(
    
    name: r'calibration_process_angle_limit',
    required: false,
    includeIfNull: false,
  )


  final double? calibrationProcessAngleLimit;



      /// Warning threshold for calibration cone (degrees).
  @JsonKey(
    
    name: r'calibration_warning_angle_limit',
    required: false,
    includeIfNull: false,
  )


  final double? calibrationWarningAngleLimit;



      /// Delay applied before calibration proceeds (seconds).
  @JsonKey(
    
    name: r'calibration_delay_in_seconds',
    required: false,
    includeIfNull: false,
  )


  final double? calibrationDelayInSeconds;



      /// Time to spool from idle to ready (seconds).
  @JsonKey(
    
    name: r'spool_up_time',
    required: false,
    includeIfNull: false,
  )


  final double? spoolUpTime;



      /// Drive speed formatted for display (e.g. \"165 Mm/s\", \"400 km/s\"). Null when drive_speed is null.
  @JsonKey(
    
    name: r'drive_speed_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? driveSpeedFormatted;



      /// Stage one acceleration formatted for display (e.g. \"5.0 Mm/s²\"). Null when stage_one_accel_rate is null.
  @JsonKey(
    
    name: r'stage_one_accel_rate_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? stageOneAccelRateFormatted;



      /// Stage two acceleration formatted for display (e.g. \"15 Mm/s²\"). Null when stage_two_accel_rate is null.
  @JsonKey(
    
    name: r'stage_two_accel_rate_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? stageTwoAccelRateFormatted;



      /// Engage speed formatted for display (e.g. \"1.5 km/s\"). Null when engage_speed is null.
  @JsonKey(
    
    name: r'engage_speed_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? engageSpeedFormatted;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QuantumDriveJumpProfile &&
      other.driveSpeed == driveSpeed &&
      other.cooldownTime == cooldownTime &&
      other.stageOneAccelRate == stageOneAccelRate &&
      other.stageTwoAccelRate == stageTwoAccelRate &&
      other.engageSpeed == engageSpeed &&
      other.interdictionEffectTime == interdictionEffectTime &&
      other.calibrationRate == calibrationRate &&
      other.minCalibrationRequirement == minCalibrationRequirement &&
      other.maxCalibrationRequirement == maxCalibrationRequirement &&
      other.calibrationProcessAngleLimit == calibrationProcessAngleLimit &&
      other.calibrationWarningAngleLimit == calibrationWarningAngleLimit &&
      other.calibrationDelayInSeconds == calibrationDelayInSeconds &&
      other.spoolUpTime == spoolUpTime &&
      other.driveSpeedFormatted == driveSpeedFormatted &&
      other.stageOneAccelRateFormatted == stageOneAccelRateFormatted &&
      other.stageTwoAccelRateFormatted == stageTwoAccelRateFormatted &&
      other.engageSpeedFormatted == engageSpeedFormatted;

    @override
    int get hashCode =>
        (driveSpeed == null ? 0 : driveSpeed.hashCode) +
        (cooldownTime == null ? 0 : cooldownTime.hashCode) +
        (stageOneAccelRate == null ? 0 : stageOneAccelRate.hashCode) +
        (stageTwoAccelRate == null ? 0 : stageTwoAccelRate.hashCode) +
        (engageSpeed == null ? 0 : engageSpeed.hashCode) +
        (interdictionEffectTime == null ? 0 : interdictionEffectTime.hashCode) +
        (calibrationRate == null ? 0 : calibrationRate.hashCode) +
        (minCalibrationRequirement == null ? 0 : minCalibrationRequirement.hashCode) +
        (maxCalibrationRequirement == null ? 0 : maxCalibrationRequirement.hashCode) +
        (calibrationProcessAngleLimit == null ? 0 : calibrationProcessAngleLimit.hashCode) +
        (calibrationWarningAngleLimit == null ? 0 : calibrationWarningAngleLimit.hashCode) +
        (calibrationDelayInSeconds == null ? 0 : calibrationDelayInSeconds.hashCode) +
        (spoolUpTime == null ? 0 : spoolUpTime.hashCode) +
        (driveSpeedFormatted == null ? 0 : driveSpeedFormatted.hashCode) +
        (stageOneAccelRateFormatted == null ? 0 : stageOneAccelRateFormatted.hashCode) +
        (stageTwoAccelRateFormatted == null ? 0 : stageTwoAccelRateFormatted.hashCode) +
        (engageSpeedFormatted == null ? 0 : engageSpeedFormatted.hashCode);

  factory QuantumDriveJumpProfile.fromJson(Map<String, dynamic> json) => _$QuantumDriveJumpProfileFromJson(json);

  Map<String, dynamic> toJson() => _$QuantumDriveJumpProfileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

