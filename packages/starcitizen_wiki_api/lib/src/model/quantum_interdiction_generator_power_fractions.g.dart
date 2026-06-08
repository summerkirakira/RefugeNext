// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantum_interdiction_generator_power_fractions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantumInterdictionGeneratorPowerFractions
_$QuantumInterdictionGeneratorPowerFractionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'QuantumInterdictionGeneratorPowerFractions',
  json,
  ($checkedConvert) {
    final val = QuantumInterdictionGeneratorPowerFractions(
      base_: $checkedConvert('base', (v) => (v as num?)?.toDouble()),
      pulse: $checkedConvert('pulse', (v) => (v as num?)?.toDouble()),
      jammer: $checkedConvert('jammer', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {'base_': 'base'},
);

Map<String, dynamic> _$QuantumInterdictionGeneratorPowerFractionsToJson(
  QuantumInterdictionGeneratorPowerFractions instance,
) => <String, dynamic>{
  'base': ?instance.base_,
  'pulse': ?instance.pulse,
  'jammer': ?instance.jammer,
};
