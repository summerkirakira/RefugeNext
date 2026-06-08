// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_weapon_damage_vector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalWeaponDamageVector _$PersonalWeaponDamageVectorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PersonalWeaponDamageVector', json, ($checkedConvert) {
  final val = PersonalWeaponDamageVector(
    physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
    energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
    distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
    thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
    biochemical: $checkedConvert('biochemical', (v) => (v as num?)?.toDouble()),
    stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$PersonalWeaponDamageVectorToJson(
  PersonalWeaponDamageVector instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
};
