// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_modifier_regen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModifierRegen _$WeaponModifierRegenFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeaponModifierRegen',
      json,
      ($checkedConvert) {
        final val = WeaponModifierRegen(
          powerRatioMultiplier: $checkedConvert(
            'power_ratio_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          maxAmmoLoadMultiplier: $checkedConvert(
            'max_ammo_load_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          maxRegenPerSecMultiplier: $checkedConvert(
            'max_regen_per_sec_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'powerRatioMultiplier': 'power_ratio_multiplier',
        'maxAmmoLoadMultiplier': 'max_ammo_load_multiplier',
        'maxRegenPerSecMultiplier': 'max_regen_per_sec_multiplier',
      },
    );

Map<String, dynamic> _$WeaponModifierRegenToJson(
  WeaponModifierRegen instance,
) => <String, dynamic>{
  'power_ratio_multiplier': ?instance.powerRatioMultiplier,
  'max_ammo_load_multiplier': ?instance.maxAmmoLoadMultiplier,
  'max_regen_per_sec_multiplier': ?instance.maxRegenPerSecMultiplier,
};
