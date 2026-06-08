// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bomb_damage_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BombDamageMap _$BombDamageMapFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BombDamageMap', json, ($checkedConvert) {
  final val = BombDamageMap(
    physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
    energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
    distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
    thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
    biochemical: $checkedConvert('biochemical', (v) => (v as num?)?.toDouble()),
    stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$BombDamageMapToJson(BombDamageMap instance) =>
    <String, dynamic>{
      'physical': ?instance.physical,
      'energy': ?instance.energy,
      'distortion': ?instance.distortion,
      'thermal': ?instance.thermal,
      'biochemical': ?instance.biochemical,
      'stun': ?instance.stun,
    };
