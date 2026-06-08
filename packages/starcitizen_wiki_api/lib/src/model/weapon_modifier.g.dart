// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModifier _$WeaponModifierFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeaponModifier',
      json,
      ($checkedConvert) {
        final val = WeaponModifier(
          activateOnAttach: $checkedConvert(
            'activate_on_attach',
            (v) => v as bool?,
          ),
          ignoreWear: $checkedConvert('ignore_wear', (v) => v as bool?),
          base_: $checkedConvert(
            'base',
            (v) => v == null
                ? null
                : WeaponModifierBase.fromJson(v as Map<String, dynamic>),
          ),
          recoil: $checkedConvert(
            'recoil',
            (v) => v == null
                ? null
                : WeaponModifierRecoil.fromJson(v as Map<String, dynamic>),
          ),
          spread: $checkedConvert(
            'spread',
            (v) => v == null
                ? null
                : WeaponModifierSpread.fromJson(v as Map<String, dynamic>),
          ),
          aim: $checkedConvert(
            'aim',
            (v) => v == null
                ? null
                : WeaponModifierAim.fromJson(v as Map<String, dynamic>),
          ),
          regen: $checkedConvert(
            'regen',
            (v) => v == null
                ? null
                : WeaponModifierRegen.fromJson(v as Map<String, dynamic>),
          ),
          salvage: $checkedConvert(
            'salvage',
            (v) => v == null
                ? null
                : WeaponModifierSalvage.fromJson(v as Map<String, dynamic>),
          ),
          zeroing: $checkedConvert(
            'zeroing',
            (v) => v == null
                ? null
                : WeaponModifierZeroing.fromJson(v as Map<String, dynamic>),
          ),
          fireRateMultiplier: $checkedConvert(
            'fire_rate_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          damageMultiplier: $checkedConvert(
            'damage_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          damageOverTimeMultiplier: $checkedConvert(
            'damage_over_time_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          projectileSpeedMultiplier: $checkedConvert(
            'projectile_speed_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          ammoCostMultiplier: $checkedConvert(
            'ammo_cost_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          heatGenerationMultiplier: $checkedConvert(
            'heat_generation_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          soundRadiusMultiplier: $checkedConvert(
            'sound_radius_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          chargeTimeMultiplier: $checkedConvert(
            'charge_time_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'activateOnAttach': 'activate_on_attach',
        'ignoreWear': 'ignore_wear',
        'base_': 'base',
        'fireRateMultiplier': 'fire_rate_multiplier',
        'damageMultiplier': 'damage_multiplier',
        'damageOverTimeMultiplier': 'damage_over_time_multiplier',
        'projectileSpeedMultiplier': 'projectile_speed_multiplier',
        'ammoCostMultiplier': 'ammo_cost_multiplier',
        'heatGenerationMultiplier': 'heat_generation_multiplier',
        'soundRadiusMultiplier': 'sound_radius_multiplier',
        'chargeTimeMultiplier': 'charge_time_multiplier',
      },
    );

Map<String, dynamic> _$WeaponModifierToJson(WeaponModifier instance) =>
    <String, dynamic>{
      'activate_on_attach': ?instance.activateOnAttach,
      'ignore_wear': ?instance.ignoreWear,
      'base': ?instance.base_?.toJson(),
      'recoil': ?instance.recoil?.toJson(),
      'spread': ?instance.spread?.toJson(),
      'aim': ?instance.aim?.toJson(),
      'regen': ?instance.regen?.toJson(),
      'salvage': ?instance.salvage?.toJson(),
      'zeroing': ?instance.zeroing?.toJson(),
      'fire_rate_multiplier': ?instance.fireRateMultiplier,
      'damage_multiplier': ?instance.damageMultiplier,
      'damage_over_time_multiplier': ?instance.damageOverTimeMultiplier,
      'projectile_speed_multiplier': ?instance.projectileSpeedMultiplier,
      'ammo_cost_multiplier': ?instance.ammoCostMultiplier,
      'heat_generation_multiplier': ?instance.heatGenerationMultiplier,
      'sound_radius_multiplier': ?instance.soundRadiusMultiplier,
      'charge_time_multiplier': ?instance.chargeTimeMultiplier,
    };
