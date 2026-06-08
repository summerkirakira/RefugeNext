// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_modifier_spread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModifierSpread _$WeaponModifierSpreadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WeaponModifierSpread',
  json,
  ($checkedConvert) {
    final val = WeaponModifierSpread(
      minMultiplier: $checkedConvert(
        'min_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      minChange: $checkedConvert('min_change', (v) => (v as num?)?.toDouble()),
      maxMultiplier: $checkedConvert(
        'max_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      maxChange: $checkedConvert('max_change', (v) => (v as num?)?.toDouble()),
      firstAttackMultiplier: $checkedConvert(
        'first_attack_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      firstAttackChange: $checkedConvert(
        'first_attack_change',
        (v) => (v as num?)?.toDouble(),
      ),
      perAttackMultiplier: $checkedConvert(
        'per_attack_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      perAttackChange: $checkedConvert(
        'per_attack_change',
        (v) => (v as num?)?.toDouble(),
      ),
      decayMultiplier: $checkedConvert(
        'decay_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      decayChange: $checkedConvert(
        'decay_change',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'minMultiplier': 'min_multiplier',
    'minChange': 'min_change',
    'maxMultiplier': 'max_multiplier',
    'maxChange': 'max_change',
    'firstAttackMultiplier': 'first_attack_multiplier',
    'firstAttackChange': 'first_attack_change',
    'perAttackMultiplier': 'per_attack_multiplier',
    'perAttackChange': 'per_attack_change',
    'decayMultiplier': 'decay_multiplier',
    'decayChange': 'decay_change',
  },
);

Map<String, dynamic> _$WeaponModifierSpreadToJson(
  WeaponModifierSpread instance,
) => <String, dynamic>{
  'min_multiplier': ?instance.minMultiplier,
  'min_change': ?instance.minChange,
  'max_multiplier': ?instance.maxMultiplier,
  'max_change': ?instance.maxChange,
  'first_attack_multiplier': ?instance.firstAttackMultiplier,
  'first_attack_change': ?instance.firstAttackChange,
  'per_attack_multiplier': ?instance.perAttackMultiplier,
  'per_attack_change': ?instance.perAttackChange,
  'decay_multiplier': ?instance.decayMultiplier,
  'decay_change': ?instance.decayChange,
};
