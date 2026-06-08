// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_bullet_impulse_falloff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionBulletImpulseFalloff _$AmmunitionBulletImpulseFalloffFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AmmunitionBulletImpulseFalloff',
  json,
  ($checkedConvert) {
    final val = AmmunitionBulletImpulseFalloff(
      minDistance: $checkedConvert(
        'min_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      dropFalloff: $checkedConvert(
        'drop_falloff',
        (v) => (v as num?)?.toDouble(),
      ),
      maxFalloff: $checkedConvert(
        'max_falloff',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'minDistance': 'min_distance',
    'dropFalloff': 'drop_falloff',
    'maxFalloff': 'max_falloff',
  },
);

Map<String, dynamic> _$AmmunitionBulletImpulseFalloffToJson(
  AmmunitionBulletImpulseFalloff instance,
) => <String, dynamic>{
  'min_distance': ?instance.minDistance,
  'drop_falloff': ?instance.dropFalloff,
  'max_falloff': ?instance.maxFalloff,
};
