// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_modifier_recoil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModifierRecoil _$WeaponModifierRecoilFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WeaponModifierRecoil',
  json,
  ($checkedConvert) {
    final val = WeaponModifierRecoil(
      decayMultiplier: $checkedConvert(
        'decay_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      decayChange: $checkedConvert(
        'decay_change',
        (v) => (v as num?)?.toDouble(),
      ),
      multiplier: $checkedConvert('multiplier', (v) => (v as num?)?.toDouble()),
      multiplierChange: $checkedConvert(
        'multiplier_change',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'decayMultiplier': 'decay_multiplier',
    'decayChange': 'decay_change',
    'multiplierChange': 'multiplier_change',
  },
);

Map<String, dynamic> _$WeaponModifierRecoilToJson(
  WeaponModifierRecoil instance,
) => <String, dynamic>{
  'decay_multiplier': ?instance.decayMultiplier,
  'decay_change': ?instance.decayChange,
  'multiplier': ?instance.multiplier,
  'multiplier_change': ?instance.multiplierChange,
};
