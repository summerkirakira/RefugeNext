// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_damage_drop_per_meter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionDamageDropPerMeter _$AmmunitionDamageDropPerMeterFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AmmunitionDamageDropPerMeter', json, ($checkedConvert) {
  final val = AmmunitionDamageDropPerMeter(
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

Map<String, dynamic> _$AmmunitionDamageDropPerMeterToJson(
  AmmunitionDamageDropPerMeter instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
  'total': ?instance.total,
};
