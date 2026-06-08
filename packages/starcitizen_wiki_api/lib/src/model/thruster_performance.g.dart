// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thruster_performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThrusterPerformance _$ThrusterPerformanceFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ThrusterPerformance',
      json,
      ($checkedConvert) {
        final val = ThrusterPerformance(
          thrustCapacity: $checkedConvert(
            'thrust_capacity',
            (v) => (v as num?)?.toDouble(),
          ),
          maxSupportedAtmosphericEfficiency: $checkedConvert(
            'max_supported_atmospheric_efficiency',
            (v) => (v as num?)?.toDouble(),
          ),
          minHealthThrustMultiplier: $checkedConvert(
            'min_health_thrust_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'thrustCapacity': 'thrust_capacity',
        'maxSupportedAtmosphericEfficiency':
            'max_supported_atmospheric_efficiency',
        'minHealthThrustMultiplier': 'min_health_thrust_multiplier',
      },
    );

Map<String, dynamic> _$ThrusterPerformanceToJson(
  ThrusterPerformance instance,
) => <String, dynamic>{
  'thrust_capacity': ?instance.thrustCapacity,
  'max_supported_atmospheric_efficiency':
      ?instance.maxSupportedAtmosphericEfficiency,
  'min_health_thrust_multiplier': ?instance.minHealthThrustMultiplier,
};
