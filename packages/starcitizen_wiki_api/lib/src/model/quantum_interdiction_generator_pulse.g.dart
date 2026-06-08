// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantum_interdiction_generator_pulse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantumInterdictionGeneratorPulse _$QuantumInterdictionGeneratorPulseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'QuantumInterdictionGeneratorPulse',
  json,
  ($checkedConvert) {
    final val = QuantumInterdictionGeneratorPulse(
      chargeTime: $checkedConvert(
        'charge_time',
        (v) => (v as num?)?.toDouble(),
      ),
      dischargeTime: $checkedConvert(
        'discharge_time',
        (v) => (v as num?)?.toDouble(),
      ),
      cooldownTime: $checkedConvert(
        'cooldown_time',
        (v) => (v as num?)?.toDouble(),
      ),
      radius: $checkedConvert('radius', (v) => (v as num?)?.toDouble()),
      decreaseChargeRateTime: $checkedConvert(
        'decrease_charge_rate_time',
        (v) => (v as num?)?.toDouble(),
      ),
      increaseChargeRateTime: $checkedConvert(
        'increase_charge_rate_time',
        (v) => (v as num?)?.toDouble(),
      ),
      activationPhaseDuration: $checkedConvert(
        'activation_phase_duration',
        (v) => (v as num?)?.toDouble(),
      ),
      disperseChargeTime: $checkedConvert(
        'disperse_charge_time',
        (v) => (v as num?)?.toDouble(),
      ),
      maxPowerDraw: $checkedConvert(
        'max_power_draw',
        (v) => (v as num?)?.toDouble(),
      ),
      stopChargingPowerFraction: $checkedConvert(
        'stop_charging_power_fraction',
        (v) => (v as num?)?.toDouble(),
      ),
      maxChargeRatePowerFraction: $checkedConvert(
        'max_charge_rate_power_fraction',
        (v) => (v as num?)?.toDouble(),
      ),
      activePowerFraction: $checkedConvert(
        'active_power_fraction',
        (v) => (v as num?)?.toDouble(),
      ),
      tetheringPowerFraction: $checkedConvert(
        'tethering_power_fraction',
        (v) => (v as num?)?.toDouble(),
      ),
      greenZoneCheckRange: $checkedConvert(
        'green_zone_check_range',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'chargeTime': 'charge_time',
    'dischargeTime': 'discharge_time',
    'cooldownTime': 'cooldown_time',
    'decreaseChargeRateTime': 'decrease_charge_rate_time',
    'increaseChargeRateTime': 'increase_charge_rate_time',
    'activationPhaseDuration': 'activation_phase_duration',
    'disperseChargeTime': 'disperse_charge_time',
    'maxPowerDraw': 'max_power_draw',
    'stopChargingPowerFraction': 'stop_charging_power_fraction',
    'maxChargeRatePowerFraction': 'max_charge_rate_power_fraction',
    'activePowerFraction': 'active_power_fraction',
    'tetheringPowerFraction': 'tethering_power_fraction',
    'greenZoneCheckRange': 'green_zone_check_range',
  },
);

Map<String, dynamic> _$QuantumInterdictionGeneratorPulseToJson(
  QuantumInterdictionGeneratorPulse instance,
) => <String, dynamic>{
  'charge_time': ?instance.chargeTime,
  'discharge_time': ?instance.dischargeTime,
  'cooldown_time': ?instance.cooldownTime,
  'radius': ?instance.radius,
  'decrease_charge_rate_time': ?instance.decreaseChargeRateTime,
  'increase_charge_rate_time': ?instance.increaseChargeRateTime,
  'activation_phase_duration': ?instance.activationPhaseDuration,
  'disperse_charge_time': ?instance.disperseChargeTime,
  'max_power_draw': ?instance.maxPowerDraw,
  'stop_charging_power_fraction': ?instance.stopChargingPowerFraction,
  'max_charge_rate_power_fraction': ?instance.maxChargeRatePowerFraction,
  'active_power_fraction': ?instance.activePowerFraction,
  'tethering_power_fraction': ?instance.tetheringPowerFraction,
  'green_zone_check_range': ?instance.greenZoneCheckRange,
};
