// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_durability_resistance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDurabilityResistance _$ItemDurabilityResistanceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ItemDurabilityResistance', json, ($checkedConvert) {
  final val = ItemDurabilityResistance(
    physical: $checkedConvert('physical', (v) => (v as num?)?.toDouble()),
    energy: $checkedConvert('energy', (v) => (v as num?)?.toDouble()),
    distortion: $checkedConvert('distortion', (v) => (v as num?)?.toDouble()),
    thermal: $checkedConvert('thermal', (v) => (v as num?)?.toDouble()),
    biochemical: $checkedConvert('biochemical', (v) => (v as num?)?.toDouble()),
    stun: $checkedConvert('stun', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ItemDurabilityResistanceToJson(
  ItemDurabilityResistance instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
};
