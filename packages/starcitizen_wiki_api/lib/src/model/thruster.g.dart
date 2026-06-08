// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thruster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thruster _$ThrusterFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Thruster',
  json,
  ($checkedConvert) {
    final val = Thruster(
      performance: $checkedConvert(
        'performance',
        (v) => v == null
            ? null
            : ThrusterPerformance.fromJson(v as Map<String, dynamic>),
      ),
      fuel: $checkedConvert(
        'fuel',
        (v) =>
            v == null ? null : ThrusterFuel.fromJson(v as Map<String, dynamic>),
      ),
      role: $checkedConvert('role', (v) => v as String?),
      vtolOnly: $checkedConvert('vtol_only', (v) => v as bool?),
      backwash: $checkedConvert(
        'backwash',
        (v) => v == null
            ? null
            : ThrusterBackwash.fromJson(v as Map<String, dynamic>),
      ),
      handling: $checkedConvert(
        'handling',
        (v) => v == null
            ? null
            : ThrusterHandling.fromJson(v as Map<String, dynamic>),
      ),
      thrustCapacity: $checkedConvert(
        'thrust_capacity',
        (v) => (v as num?)?.toDouble(),
      ),
      minHealthThrustMultiplier: $checkedConvert(
        'min_health_thrust_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      fuelBurnPer10kNewton: $checkedConvert(
        'fuel_burn_per_10k_newton',
        (v) => (v as num?)?.toDouble(),
      ),
      type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'vtolOnly': 'vtol_only',
    'thrustCapacity': 'thrust_capacity',
    'minHealthThrustMultiplier': 'min_health_thrust_multiplier',
    'fuelBurnPer10kNewton': 'fuel_burn_per_10k_newton',
  },
);

Map<String, dynamic> _$ThrusterToJson(Thruster instance) => <String, dynamic>{
  'performance': ?instance.performance?.toJson(),
  'fuel': ?instance.fuel?.toJson(),
  'role': ?instance.role,
  'vtol_only': ?instance.vtolOnly,
  'backwash': ?instance.backwash?.toJson(),
  'handling': ?instance.handling?.toJson(),
  'thrust_capacity': ?instance.thrustCapacity,
  'min_health_thrust_multiplier': ?instance.minHealthThrustMultiplier,
  'fuel_burn_per_10k_newton': ?instance.fuelBurnPer10kNewton,
  'type': ?instance.type,
};
