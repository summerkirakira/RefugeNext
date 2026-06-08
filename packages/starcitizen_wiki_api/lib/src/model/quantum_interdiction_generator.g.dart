// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantum_interdiction_generator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantumInterdictionGenerator _$QuantumInterdictionGeneratorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'QuantumInterdictionGenerator',
  json,
  ($checkedConvert) {
    final val = QuantumInterdictionGenerator(
      powerFractions: $checkedConvert(
        'power_fractions',
        (v) => v == null
            ? null
            : QuantumInterdictionGeneratorPowerFractions.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      jamming: $checkedConvert(
        'jamming',
        (v) => v == null
            ? null
            : QuantumInterdictionGeneratorJamming.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      pulse: $checkedConvert(
        'pulse',
        (v) => v == null
            ? null
            : QuantumInterdictionGeneratorPulse.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      interdictionRange: $checkedConvert(
        'interdiction_range',
        (v) => (v as num?)?.toDouble(),
      ),
      jammerRange: $checkedConvert(
        'jammer_range',
        (v) => (v as num?)?.toDouble(),
      ),
      chargeDuration: $checkedConvert(
        'charge_duration',
        (v) => (v as num?)?.toDouble(),
      ),
      activationDuration: $checkedConvert(
        'activation_duration',
        (v) => (v as num?)?.toDouble(),
      ),
      dischargeDuration: $checkedConvert(
        'discharge_duration',
        (v) => (v as num?)?.toDouble(),
      ),
      cooldownDuration: $checkedConvert(
        'cooldown_duration',
        (v) => (v as num?)?.toDouble(),
      ),
      disperseChargeDuration: $checkedConvert(
        'disperse_charge_duration',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'powerFractions': 'power_fractions',
    'interdictionRange': 'interdiction_range',
    'jammerRange': 'jammer_range',
    'chargeDuration': 'charge_duration',
    'activationDuration': 'activation_duration',
    'dischargeDuration': 'discharge_duration',
    'cooldownDuration': 'cooldown_duration',
    'disperseChargeDuration': 'disperse_charge_duration',
  },
);

Map<String, dynamic> _$QuantumInterdictionGeneratorToJson(
  QuantumInterdictionGenerator instance,
) => <String, dynamic>{
  'power_fractions': ?instance.powerFractions?.toJson(),
  'jamming': ?instance.jamming?.toJson(),
  'pulse': ?instance.pulse?.toJson(),
  'interdiction_range': ?instance.interdictionRange,
  'jammer_range': ?instance.jammerRange,
  'charge_duration': ?instance.chargeDuration,
  'activation_duration': ?instance.activationDuration,
  'discharge_duration': ?instance.dischargeDuration,
  'cooldown_duration': ?instance.cooldownDuration,
  'disperse_charge_duration': ?instance.disperseChargeDuration,
};
