// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emp _$EmpFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Emp',
  json,
  ($checkedConvert) {
    final val = Emp(
      distortionDamage: $checkedConvert(
        'distortion_damage',
        (v) => (v as num?)?.toDouble(),
      ),
      empRadius: $checkedConvert('emp_radius', (v) => (v as num?)?.toDouble()),
      minEmpRadius: $checkedConvert(
        'min_emp_radius',
        (v) => (v as num?)?.toDouble(),
      ),
      chargeDuration: $checkedConvert(
        'charge_duration',
        (v) => (v as num?)?.toDouble(),
      ),
      unleashDuration: $checkedConvert(
        'unleash_duration',
        (v) => (v as num?)?.toDouble(),
      ),
      cooldownDuration: $checkedConvert(
        'cooldown_duration',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'distortionDamage': 'distortion_damage',
    'empRadius': 'emp_radius',
    'minEmpRadius': 'min_emp_radius',
    'chargeDuration': 'charge_duration',
    'unleashDuration': 'unleash_duration',
    'cooldownDuration': 'cooldown_duration',
  },
);

Map<String, dynamic> _$EmpToJson(Emp instance) => <String, dynamic>{
  'distortion_damage': ?instance.distortionDamage,
  'emp_radius': ?instance.empRadius,
  'min_emp_radius': ?instance.minEmpRadius,
  'charge_duration': ?instance.chargeDuration,
  'unleash_duration': ?instance.unleashDuration,
  'cooldown_duration': ?instance.cooldownDuration,
};
