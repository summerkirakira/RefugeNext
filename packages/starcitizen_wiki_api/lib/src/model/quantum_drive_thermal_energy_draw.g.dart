// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantum_drive_thermal_energy_draw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantumDriveThermalEnergyDraw _$QuantumDriveThermalEnergyDrawFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'QuantumDriveThermalEnergyDraw',
  json,
  ($checkedConvert) {
    final val = QuantumDriveThermalEnergyDraw(
      preRampUp: $checkedConvert('pre_ramp_up', (v) => (v as num?)?.toDouble()),
      rampUp: $checkedConvert('ramp_up', (v) => (v as num?)?.toDouble()),
      inFlight: $checkedConvert('in_flight', (v) => (v as num?)?.toDouble()),
      rampDown: $checkedConvert('ramp_down', (v) => (v as num?)?.toDouble()),
      postRampDown: $checkedConvert(
        'post_ramp_down',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'preRampUp': 'pre_ramp_up',
    'rampUp': 'ramp_up',
    'inFlight': 'in_flight',
    'rampDown': 'ramp_down',
    'postRampDown': 'post_ramp_down',
  },
);

Map<String, dynamic> _$QuantumDriveThermalEnergyDrawToJson(
  QuantumDriveThermalEnergyDraw instance,
) => <String, dynamic>{
  'pre_ramp_up': ?instance.preRampUp,
  'ramp_up': ?instance.rampUp,
  'in_flight': ?instance.inFlight,
  'ramp_down': ?instance.rampDown,
  'post_ramp_down': ?instance.postRampDown,
};
