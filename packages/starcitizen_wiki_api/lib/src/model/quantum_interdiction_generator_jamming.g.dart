// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantum_interdiction_generator_jamming.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantumInterdictionGeneratorJamming
_$QuantumInterdictionGeneratorJammingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'QuantumInterdictionGeneratorJamming',
      json,
      ($checkedConvert) {
        final val = QuantumInterdictionGeneratorJamming(
          range: $checkedConvert('range', (v) => (v as num?)?.toDouble()),
          maxPowerDraw: $checkedConvert(
            'max_power_draw',
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
        'maxPowerDraw': 'max_power_draw',
        'greenZoneCheckRange': 'green_zone_check_range',
      },
    );

Map<String, dynamic> _$QuantumInterdictionGeneratorJammingToJson(
  QuantumInterdictionGeneratorJamming instance,
) => <String, dynamic>{
  'range': ?instance.range,
  'max_power_draw': ?instance.maxPowerDraw,
  'green_zone_check_range': ?instance.greenZoneCheckRange,
};
