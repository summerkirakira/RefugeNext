// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalWeapon _$PersonalWeaponFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PersonalWeapon',
  json,
  ($checkedConvert) {
    final val = PersonalWeapon(
      class_: $checkedConvert('class', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      magazineType: $checkedConvert('magazine_type', (v) => v as String?),
      magazineSize: $checkedConvert(
        'magazine_size',
        (v) => (v as num?)?.toInt(),
      ),
      effectiveRange: $checkedConvert(
        'effective_range',
        (v) => (v as num?)?.toDouble(),
      ),
      capacity: $checkedConvert('capacity', (v) => (v as num?)?.toInt()),
      range: $checkedConvert('range', (v) => (v as num?)?.toDouble()),
      damagePerShot: $checkedConvert(
        'damage_per_shot',
        (v) => (v as num?)?.toDouble(),
      ),
      pelletsPerShot: $checkedConvert(
        'pellets_per_shot',
        (v) => (v as num?)?.toInt(),
      ),
      rof: $checkedConvert('rof', (v) => (v as num?)?.toDouble()),
      rpm: $checkedConvert('rpm', (v) => (v as num?)?.toDouble()),
      damages: $checkedConvert(
        'damages',
        (v) => (v as List<dynamic>?)
            ?.map((e) => WeaponDamageEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      modes: $checkedConvert(
        'modes',
        (v) => (v as List<dynamic>?)
            ?.map((e) => PersonalWeaponMode.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      fireMode: $checkedConvert('fire_mode', (v) => v as String?),
      damage: $checkedConvert(
        'damage',
        (v) => v == null
            ? null
            : PersonalWeaponDamage.fromJson(v as Map<String, dynamic>),
      ),
      spread: $checkedConvert(
        'spread',
        (v) => v == null
            ? null
            : PersonalWeaponSpread.fromJson(v as Map<String, dynamic>),
      ),
      adsSpread: $checkedConvert(
        'ads_spread',
        (v) => v == null
            ? null
            : PersonalWeaponSpread.fromJson(v as Map<String, dynamic>),
      ),
      charge: $checkedConvert(
        'charge',
        (v) => v == null
            ? null
            : PersonalWeaponCharge.fromJson(v as Map<String, dynamic>),
      ),
      chargeModifier: $checkedConvert(
        'charge_modifier',
        (v) => v == null
            ? null
            : PersonalWeaponChargeModifier.fromJson(v as Map<String, dynamic>),
      ),
      ammunition: $checkedConvert('ammunition', (v) => v),
    );
    return val;
  },
  fieldKeyMap: const {
    'class_': 'class',
    'magazineType': 'magazine_type',
    'magazineSize': 'magazine_size',
    'effectiveRange': 'effective_range',
    'damagePerShot': 'damage_per_shot',
    'pelletsPerShot': 'pellets_per_shot',
    'fireMode': 'fire_mode',
    'adsSpread': 'ads_spread',
    'chargeModifier': 'charge_modifier',
  },
);

Map<String, dynamic> _$PersonalWeaponToJson(PersonalWeapon instance) =>
    <String, dynamic>{
      'class': ?instance.class_,
      'type': ?instance.type,
      'magazine_type': ?instance.magazineType,
      'magazine_size': ?instance.magazineSize,
      'effective_range': ?instance.effectiveRange,
      'capacity': ?instance.capacity,
      'range': ?instance.range,
      'damage_per_shot': ?instance.damagePerShot,
      'pellets_per_shot': ?instance.pelletsPerShot,
      'rof': ?instance.rof,
      'rpm': ?instance.rpm,
      'damages': ?instance.damages?.map((e) => e.toJson()).toList(),
      'modes': ?instance.modes?.map((e) => e.toJson()).toList(),
      'fire_mode': ?instance.fireMode,
      'damage': ?instance.damage?.toJson(),
      'spread': ?instance.spread?.toJson(),
      'ads_spread': ?instance.adsSpread?.toJson(),
      'charge': ?instance.charge?.toJson(),
      'charge_modifier': ?instance.chargeModifier?.toJson(),
      'ammunition': ?instance.ammunition,
    };
