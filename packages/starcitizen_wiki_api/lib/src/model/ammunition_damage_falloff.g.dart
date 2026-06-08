// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_damage_falloff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionDamageFalloff _$AmmunitionDamageFalloffFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AmmunitionDamageFalloff',
  json,
  ($checkedConvert) {
    final val = AmmunitionDamageFalloff(
      physical: $checkedConvert('Physical', (v) => (v as num?)?.toDouble()),
      energy: $checkedConvert('Energy', (v) => (v as num?)?.toDouble()),
      distortion: $checkedConvert('Distortion', (v) => (v as num?)?.toDouble()),
      thermal: $checkedConvert('Thermal', (v) => (v as num?)?.toDouble()),
      biochemical: $checkedConvert(
        'Biochemical',
        (v) => (v as num?)?.toDouble(),
      ),
      stun: $checkedConvert('Stun', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'physical': 'Physical',
    'energy': 'Energy',
    'distortion': 'Distortion',
    'thermal': 'Thermal',
    'biochemical': 'Biochemical',
    'stun': 'Stun',
  },
);

Map<String, dynamic> _$AmmunitionDamageFalloffToJson(
  AmmunitionDamageFalloff instance,
) => <String, dynamic>{
  'Physical': ?instance.physical,
  'Energy': ?instance.energy,
  'Distortion': ?instance.distortion,
  'Thermal': ?instance.thermal,
  'Biochemical': ?instance.biochemical,
  'Stun': ?instance.stun,
};
