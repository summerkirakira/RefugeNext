// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_damage_falloffs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionDamageFalloffs _$AmmunitionDamageFalloffsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AmmunitionDamageFalloffs',
  json,
  ($checkedConvert) {
    final val = AmmunitionDamageFalloffs(
      minDistance: $checkedConvert(
        'min_distance',
        (v) => v == null
            ? null
            : AmmunitionDamageFalloff.fromJson(v as Map<String, dynamic>),
      ),
      perMeter: $checkedConvert(
        'per_meter',
        (v) => v == null
            ? null
            : AmmunitionDamageFalloff.fromJson(v as Map<String, dynamic>),
      ),
      minDamage: $checkedConvert(
        'min_damage',
        (v) => v == null
            ? null
            : AmmunitionDamageFalloff.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'minDistance': 'min_distance',
    'perMeter': 'per_meter',
    'minDamage': 'min_damage',
  },
);

Map<String, dynamic> _$AmmunitionDamageFalloffsToJson(
  AmmunitionDamageFalloffs instance,
) => <String, dynamic>{
  'min_distance': ?instance.minDistance?.toJson(),
  'per_meter': ?instance.perMeter?.toJson(),
  'min_damage': ?instance.minDamage?.toJson(),
};
