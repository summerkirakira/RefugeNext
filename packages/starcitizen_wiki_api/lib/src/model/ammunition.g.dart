// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ammunition _$AmmunitionFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Ammunition',
  json,
  ($checkedConvert) {
    final val = Ammunition(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      speed: $checkedConvert('speed', (v) => (v as num?)?.toDouble()),
      lifetime: $checkedConvert('lifetime', (v) => (v as num?)?.toDouble()),
      range: $checkedConvert('range', (v) => (v as num?)?.toDouble()),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      capacity: $checkedConvert('capacity', (v) => (v as num?)?.toInt()),
      initialCapacity: $checkedConvert(
        'initial_capacity',
        (v) => (v as num?)?.toInt(),
      ),
      damageFalloffLevel1: $checkedConvert(
        'damage_falloff_level_1',
        (v) => (v as num?)?.toDouble(),
      ),
      damageFalloffLevel2: $checkedConvert(
        'damage_falloff_level_2',
        (v) => (v as num?)?.toDouble(),
      ),
      damageFalloffLevel3: $checkedConvert(
        'damage_falloff_level_3',
        (v) => (v as num?)?.toDouble(),
      ),
      maxPenetrationThickness: $checkedConvert(
        'max_penetration_thickness',
        (v) => (v as num?)?.toDouble(),
      ),
      penetration: $checkedConvert(
        'penetration',
        (v) => v == null
            ? null
            : AmmunitionPenetration.fromJson(v as Map<String, dynamic>),
      ),
      impactDamage: $checkedConvert(
        'impact_damage',
        (v) => (v as List<dynamic>?)
            ?.map((e) => WeaponDamageEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      detonationDamage: $checkedConvert(
        'detonation_damage',
        (v) => (v as List<dynamic>?)
            ?.map((e) => WeaponDamageEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      impactDamageMap: $checkedConvert(
        'impact_damage_map',
        (v) => v == null
            ? null
            : AmmunitionImpactDamageMap.fromJson(v as Map<String, dynamic>),
      ),
      detonationDamageMap: $checkedConvert(
        'detonation_damage_map',
        (v) => v == null
            ? null
            : AmmunitionDetonationDamageMap.fromJson(v as Map<String, dynamic>),
      ),
      explosionRadius: $checkedConvert(
        'explosion_radius',
        (v) => v == null
            ? null
            : AmmunitionExplosionRadius.fromJson(v as Map<String, dynamic>),
      ),
      impulseScale: $checkedConvert(
        'impulse_scale',
        (v) => (v as num?)?.toDouble(),
      ),
      bulletType: $checkedConvert('bullet_type', (v) => (v as num?)?.toInt()),
      damageDropMinDistance: $checkedConvert(
        'damage_drop_min_distance',
        (v) => v == null
            ? null
            : AmmunitionDamageDropMinDistance.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      damageDropPerMeter: $checkedConvert(
        'damage_drop_per_meter',
        (v) => v == null
            ? null
            : AmmunitionDamageDropPerMeter.fromJson(v as Map<String, dynamic>),
      ),
      damageDropMinDamage: $checkedConvert(
        'damage_drop_min_damage',
        (v) => v == null
            ? null
            : AmmunitionDamageDropMinDamage.fromJson(v as Map<String, dynamic>),
      ),
      bulletImpulseFalloff: $checkedConvert(
        'bullet_impulse_falloff',
        (v) => v == null
            ? null
            : AmmunitionBulletImpulseFalloff.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      bulletElectron: $checkedConvert(
        'bullet_electron',
        (v) => v == null
            ? null
            : AmmunitionBulletElectron.fromJson(v as Map<String, dynamic>),
      ),
      conversionRate: $checkedConvert(
        'conversion_rate',
        (v) => (v as num?)?.toInt(),
      ),
      damageFalloffs: $checkedConvert(
        'damage_falloffs',
        (v) => v == null
            ? null
            : AmmunitionDamageFalloffs.fromJson(v as Map<String, dynamic>),
      ),
      piercability: $checkedConvert('piercability', (v) => v),
    );
    return val;
  },
  fieldKeyMap: const {
    'initialCapacity': 'initial_capacity',
    'damageFalloffLevel1': 'damage_falloff_level_1',
    'damageFalloffLevel2': 'damage_falloff_level_2',
    'damageFalloffLevel3': 'damage_falloff_level_3',
    'maxPenetrationThickness': 'max_penetration_thickness',
    'impactDamage': 'impact_damage',
    'detonationDamage': 'detonation_damage',
    'impactDamageMap': 'impact_damage_map',
    'detonationDamageMap': 'detonation_damage_map',
    'explosionRadius': 'explosion_radius',
    'impulseScale': 'impulse_scale',
    'bulletType': 'bullet_type',
    'damageDropMinDistance': 'damage_drop_min_distance',
    'damageDropPerMeter': 'damage_drop_per_meter',
    'damageDropMinDamage': 'damage_drop_min_damage',
    'bulletImpulseFalloff': 'bullet_impulse_falloff',
    'bulletElectron': 'bullet_electron',
    'conversionRate': 'conversion_rate',
    'damageFalloffs': 'damage_falloffs',
  },
);

Map<String, dynamic> _$AmmunitionToJson(Ammunition instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'speed': ?instance.speed,
      'lifetime': ?instance.lifetime,
      'range': ?instance.range,
      'size': ?instance.size,
      'capacity': ?instance.capacity,
      'initial_capacity': ?instance.initialCapacity,
      'damage_falloff_level_1': ?instance.damageFalloffLevel1,
      'damage_falloff_level_2': ?instance.damageFalloffLevel2,
      'damage_falloff_level_3': ?instance.damageFalloffLevel3,
      'max_penetration_thickness': ?instance.maxPenetrationThickness,
      'penetration': ?instance.penetration?.toJson(),
      'impact_damage': ?instance.impactDamage?.map((e) => e.toJson()).toList(),
      'detonation_damage': ?instance.detonationDamage
          ?.map((e) => e.toJson())
          .toList(),
      'impact_damage_map': ?instance.impactDamageMap?.toJson(),
      'detonation_damage_map': ?instance.detonationDamageMap?.toJson(),
      'explosion_radius': ?instance.explosionRadius?.toJson(),
      'impulse_scale': ?instance.impulseScale,
      'bullet_type': ?instance.bulletType,
      'damage_drop_min_distance': ?instance.damageDropMinDistance?.toJson(),
      'damage_drop_per_meter': ?instance.damageDropPerMeter?.toJson(),
      'damage_drop_min_damage': ?instance.damageDropMinDamage?.toJson(),
      'bullet_impulse_falloff': ?instance.bulletImpulseFalloff?.toJson(),
      'bullet_electron': ?instance.bulletElectron?.toJson(),
      'conversion_rate': ?instance.conversionRate,
      'damage_falloffs': ?instance.damageFalloffs?.toJson(),
      'piercability': ?instance.piercability,
    };
