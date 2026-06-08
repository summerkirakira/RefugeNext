// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_damage_drop_min_damage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionDamageDropMinDamage _$AmmunitionDamageDropMinDamageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AmmunitionDamageDropMinDamage', json, ($checkedConvert) {
  final val = AmmunitionDamageDropMinDamage(
    physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
    energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
    distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
    thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
    biochemical: $checkedConvert('biochemical', (v) => (v as num?)?.toDouble()),
    stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
    total: $checkedConvert('total', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$AmmunitionDamageDropMinDamageToJson(
  AmmunitionDamageDropMinDamage instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
  'total': ?instance.total,
};
