// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_weapon_charge_modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalWeaponChargeModifier _$PersonalWeaponChargeModifierFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PersonalWeaponChargeModifier',
  json,
  ($checkedConvert) {
    final val = PersonalWeaponChargeModifier(
      damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
      fireRate: $checkedConvert('fire_rate', (v) => (v as num?)?.toDouble()),
      ammoSpeed: $checkedConvert('ammo_speed', (v) => (v as num?)?.toDouble()),
      fireRateOverride: $checkedConvert(
        'fire_rate_override',
        (v) => (v as num?)?.toDouble(),
      ),
      pelletsOverride: $checkedConvert(
        'pellets_override',
        (v) => (v as num?)?.toInt(),
      ),
      burstShotsOverride: $checkedConvert(
        'burst_shots_override',
        (v) => (v as num?)?.toInt(),
      ),
      heatMultiplier: $checkedConvert(
        'heat_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'fireRate': 'fire_rate',
    'ammoSpeed': 'ammo_speed',
    'fireRateOverride': 'fire_rate_override',
    'pelletsOverride': 'pellets_override',
    'burstShotsOverride': 'burst_shots_override',
    'heatMultiplier': 'heat_multiplier',
  },
);

Map<String, dynamic> _$PersonalWeaponChargeModifierToJson(
  PersonalWeaponChargeModifier instance,
) => <String, dynamic>{
  'damage': ?instance.damage,
  'fire_rate': ?instance.fireRate,
  'ammo_speed': ?instance.ammoSpeed,
  'fire_rate_override': ?instance.fireRateOverride,
  'pellets_override': ?instance.pelletsOverride,
  'burst_shots_override': ?instance.burstShotsOverride,
  'heat_multiplier': ?instance.heatMultiplier,
};
