// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_impact_damage_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionImpactDamageMap _$AmmunitionImpactDamageMapFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AmmunitionImpactDamageMap', json, ($checkedConvert) {
  final val = AmmunitionImpactDamageMap(
    physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
    energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
    distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
    thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
    biochemical: $checkedConvert('biochemical', (v) => (v as num?)?.toDouble()),
    stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$AmmunitionImpactDamageMapToJson(
  AmmunitionImpactDamageMap instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
};
