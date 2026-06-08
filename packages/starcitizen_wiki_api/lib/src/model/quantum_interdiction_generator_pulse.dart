//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'quantum_interdiction_generator_pulse.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QuantumInterdictionGeneratorPulse {
  /// Returns a new [QuantumInterdictionGeneratorPulse] instance.
  QuantumInterdictionGeneratorPulse({

     this.chargeTime,

     this.dischargeTime,

     this.cooldownTime,

     this.radius,

     this.decreaseChargeRateTime,

     this.increaseChargeRateTime,

     this.activationPhaseDuration,

     this.disperseChargeTime,

     this.maxPowerDraw,

     this.stopChargingPowerFraction,

     this.maxChargeRatePowerFraction,

     this.activePowerFraction,

     this.tetheringPowerFraction,

     this.greenZoneCheckRange,
  });

      /// Seconds to charge the pulse.
  @JsonKey(
    
    name: r'charge_time',
    required: false,
    includeIfNull: false,
  )


  final double? chargeTime;



      /// Duration of the active pulse.
  @JsonKey(
    
    name: r'discharge_time',
    required: false,
    includeIfNull: false,
  )


  final double? dischargeTime;



      /// Cooldown before the next charge cycle.
  @JsonKey(
    
    name: r'cooldown_time',
    required: false,
    includeIfNull: false,
  )


  final double? cooldownTime;



      /// Pulse radius in meters.
  @JsonKey(
    
    name: r'radius',
    required: false,
    includeIfNull: false,
  )


  final double? radius;



      /// Seconds to ramp down charging rate.
  @JsonKey(
    
    name: r'decrease_charge_rate_time',
    required: false,
    includeIfNull: false,
  )


  final double? decreaseChargeRateTime;



      /// Seconds to ramp up charging rate.
  @JsonKey(
    
    name: r'increase_charge_rate_time',
    required: false,
    includeIfNull: false,
  )


  final double? increaseChargeRateTime;



      /// Activation animation/FX phase length.
  @JsonKey(
    
    name: r'activation_phase_duration',
    required: false,
    includeIfNull: false,
  )


  final double? activationPhaseDuration;



      /// Time to disperse the pulse if cancelled.
  @JsonKey(
    
    name: r'disperse_charge_time',
    required: false,
    includeIfNull: false,
  )


  final double? disperseChargeTime;



      /// Maximum power draw during pulse operations.
  @JsonKey(
    
    name: r'max_power_draw',
    required: false,
    includeIfNull: false,
  )


  final double? maxPowerDraw;



      /// Power fraction at which charging halts.
  @JsonKey(
    
    name: r'stop_charging_power_fraction',
    required: false,
    includeIfNull: false,
  )


  final double? stopChargingPowerFraction;



      /// Peak charge-rate power fraction.
  @JsonKey(
    
    name: r'max_charge_rate_power_fraction',
    required: false,
    includeIfNull: false,
  )


  final double? maxChargeRatePowerFraction;



      /// Power fraction while pulse is active.
  @JsonKey(
    
    name: r'active_power_fraction',
    required: false,
    includeIfNull: false,
  )


  final double? activePowerFraction;



      /// Power fraction while maintaining tether.
  @JsonKey(
    
    name: r'tethering_power_fraction',
    required: false,
    includeIfNull: false,
  )


  final double? tetheringPowerFraction;



      /// Safety buffer used for pulse firing checks.
  @JsonKey(
    
    name: r'green_zone_check_range',
    required: false,
    includeIfNull: false,
  )


  final double? greenZoneCheckRange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QuantumInterdictionGeneratorPulse &&
      other.chargeTime == chargeTime &&
      other.dischargeTime == dischargeTime &&
      other.cooldownTime == cooldownTime &&
      other.radius == radius &&
      other.decreaseChargeRateTime == decreaseChargeRateTime &&
      other.increaseChargeRateTime == increaseChargeRateTime &&
      other.activationPhaseDuration == activationPhaseDuration &&
      other.disperseChargeTime == disperseChargeTime &&
      other.maxPowerDraw == maxPowerDraw &&
      other.stopChargingPowerFraction == stopChargingPowerFraction &&
      other.maxChargeRatePowerFraction == maxChargeRatePowerFraction &&
      other.activePowerFraction == activePowerFraction &&
      other.tetheringPowerFraction == tetheringPowerFraction &&
      other.greenZoneCheckRange == greenZoneCheckRange;

    @override
    int get hashCode =>
        (chargeTime == null ? 0 : chargeTime.hashCode) +
        (dischargeTime == null ? 0 : dischargeTime.hashCode) +
        (cooldownTime == null ? 0 : cooldownTime.hashCode) +
        (radius == null ? 0 : radius.hashCode) +
        (decreaseChargeRateTime == null ? 0 : decreaseChargeRateTime.hashCode) +
        (increaseChargeRateTime == null ? 0 : increaseChargeRateTime.hashCode) +
        (activationPhaseDuration == null ? 0 : activationPhaseDuration.hashCode) +
        (disperseChargeTime == null ? 0 : disperseChargeTime.hashCode) +
        (maxPowerDraw == null ? 0 : maxPowerDraw.hashCode) +
        (stopChargingPowerFraction == null ? 0 : stopChargingPowerFraction.hashCode) +
        (maxChargeRatePowerFraction == null ? 0 : maxChargeRatePowerFraction.hashCode) +
        (activePowerFraction == null ? 0 : activePowerFraction.hashCode) +
        (tetheringPowerFraction == null ? 0 : tetheringPowerFraction.hashCode) +
        (greenZoneCheckRange == null ? 0 : greenZoneCheckRange.hashCode);

  factory QuantumInterdictionGeneratorPulse.fromJson(Map<String, dynamic> json) => _$QuantumInterdictionGeneratorPulseFromJson(json);

  Map<String, dynamic> toJson() => _$QuantumInterdictionGeneratorPulseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

