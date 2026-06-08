// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suit_armor_damage_resistance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuitArmorDamageResistance _$SuitArmorDamageResistanceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SuitArmorDamageResistance', json, ($checkedConvert) {
  final val = SuitArmorDamageResistance(
    impact: $checkedConvert('impact', (v) => (v as num?)?.toDouble()),
    physical: $checkedConvert(
      'physical',
      (v) => v == null
          ? null
          : SuitArmorTypeResistance.fromJson(v as Map<String, dynamic>),
    ),
    energy: $checkedConvert(
      'energy',
      (v) => v == null
          ? null
          : SuitArmorTypeResistance.fromJson(v as Map<String, dynamic>),
    ),
    distortion: $checkedConvert(
      'distortion',
      (v) => v == null
          ? null
          : SuitArmorTypeResistance.fromJson(v as Map<String, dynamic>),
    ),
    thermal: $checkedConvert(
      'thermal',
      (v) => v == null
          ? null
          : SuitArmorTypeResistance.fromJson(v as Map<String, dynamic>),
    ),
    biochemical: $checkedConvert(
      'biochemical',
      (v) => v == null
          ? null
          : SuitArmorTypeResistance.fromJson(v as Map<String, dynamic>),
    ),
    stun: $checkedConvert(
      'stun',
      (v) => v == null
          ? null
          : SuitArmorTypeResistance.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SuitArmorDamageResistanceToJson(
  SuitArmorDamageResistance instance,
) => <String, dynamic>{
  'impact': ?instance.impact,
  'physical': ?instance.physical?.toJson(),
  'energy': ?instance.energy?.toJson(),
  'distortion': ?instance.distortion?.toJson(),
  'thermal': ?instance.thermal?.toJson(),
  'biochemical': ?instance.biochemical?.toJson(),
  'stun': ?instance.stun?.toJson(),
};
