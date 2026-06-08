// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_explosion_radius.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionExplosionRadius _$AmmunitionExplosionRadiusFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AmmunitionExplosionRadius', json, ($checkedConvert) {
  final val = AmmunitionExplosionRadius(
    min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
    max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$AmmunitionExplosionRadiusToJson(
  AmmunitionExplosionRadius instance,
) => <String, dynamic>{'min': ?instance.min, 'max': ?instance.max};
