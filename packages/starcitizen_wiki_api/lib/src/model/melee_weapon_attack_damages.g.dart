// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melee_weapon_attack_damages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeleeWeaponAttackDamages _$MeleeWeaponAttackDamagesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MeleeWeaponAttackDamages', json, ($checkedConvert) {
  final val = MeleeWeaponAttackDamages(
    physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
    energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
    distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
    thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
    biochemical: $checkedConvert('biochemical', (v) => (v as num?)?.toDouble()),
    stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$MeleeWeaponAttackDamagesToJson(
  MeleeWeaponAttackDamages instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
};
