// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_modifier_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModifierBase _$WeaponModifierBaseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeaponModifierBase',
      json,
      ($checkedConvert) {
        final val = WeaponModifierBase(
          muzzleFlashMultiplier: $checkedConvert(
            'muzzle_flash_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          muzzleFlashChange: $checkedConvert(
            'muzzle_flash_change',
            (v) => (v as num?)?.toDouble(),
          ),
          fireRateMultiplier: $checkedConvert(
            'fire_rate_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          fireRateChange: $checkedConvert(
            'fire_rate_change',
            (v) => (v as num?)?.toDouble(),
          ),
          damageMultiplier: $checkedConvert(
            'damage_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          damageChange: $checkedConvert(
            'damage_change',
            (v) => (v as num?)?.toDouble(),
          ),
          projectileSpeedMultiplier: $checkedConvert(
            'projectile_speed_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          projectileSpeedChange: $checkedConvert(
            'projectile_speed_change',
            (v) => (v as num?)?.toDouble(),
          ),
          ammoCostMultiplier: $checkedConvert(
            'ammo_cost_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          ammoCostChange: $checkedConvert(
            'ammo_cost_change',
            (v) => (v as num?)?.toDouble(),
          ),
          heatGenerationMultiplier: $checkedConvert(
            'heat_generation_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          heatGenerationChange: $checkedConvert(
            'heat_generation_change',
            (v) => (v as num?)?.toDouble(),
          ),
          soundRadiusMultiplier: $checkedConvert(
            'sound_radius_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          soundRadiusChange: $checkedConvert(
            'sound_radius_change',
            (v) => (v as num?)?.toDouble(),
          ),
          chargeTimeMultiplier: $checkedConvert(
            'charge_time_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          chargeTimeChange: $checkedConvert(
            'charge_time_change',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'muzzleFlashMultiplier': 'muzzle_flash_multiplier',
        'muzzleFlashChange': 'muzzle_flash_change',
        'fireRateMultiplier': 'fire_rate_multiplier',
        'fireRateChange': 'fire_rate_change',
        'damageMultiplier': 'damage_multiplier',
        'damageChange': 'damage_change',
        'projectileSpeedMultiplier': 'projectile_speed_multiplier',
        'projectileSpeedChange': 'projectile_speed_change',
        'ammoCostMultiplier': 'ammo_cost_multiplier',
        'ammoCostChange': 'ammo_cost_change',
        'heatGenerationMultiplier': 'heat_generation_multiplier',
        'heatGenerationChange': 'heat_generation_change',
        'soundRadiusMultiplier': 'sound_radius_multiplier',
        'soundRadiusChange': 'sound_radius_change',
        'chargeTimeMultiplier': 'charge_time_multiplier',
        'chargeTimeChange': 'charge_time_change',
      },
    );

Map<String, dynamic> _$WeaponModifierBaseToJson(WeaponModifierBase instance) =>
    <String, dynamic>{
      'muzzle_flash_multiplier': ?instance.muzzleFlashMultiplier,
      'muzzle_flash_change': ?instance.muzzleFlashChange,
      'fire_rate_multiplier': ?instance.fireRateMultiplier,
      'fire_rate_change': ?instance.fireRateChange,
      'damage_multiplier': ?instance.damageMultiplier,
      'damage_change': ?instance.damageChange,
      'projectile_speed_multiplier': ?instance.projectileSpeedMultiplier,
      'projectile_speed_change': ?instance.projectileSpeedChange,
      'ammo_cost_multiplier': ?instance.ammoCostMultiplier,
      'ammo_cost_change': ?instance.ammoCostChange,
      'heat_generation_multiplier': ?instance.heatGenerationMultiplier,
      'heat_generation_change': ?instance.heatGenerationChange,
      'sound_radius_multiplier': ?instance.soundRadiusMultiplier,
      'sound_radius_change': ?instance.soundRadiusChange,
      'charge_time_multiplier': ?instance.chargeTimeMultiplier,
      'charge_time_change': ?instance.chargeTimeChange,
    };
