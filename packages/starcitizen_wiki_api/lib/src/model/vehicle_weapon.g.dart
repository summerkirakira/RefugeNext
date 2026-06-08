// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeapon _$VehicleWeaponFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleWeapon',
  json,
  ($checkedConvert) {
    final val = VehicleWeapon(
      class_: $checkedConvert('class', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      capacity: $checkedConvert('capacity', (v) => (v as num?)?.toInt()),
      range: $checkedConvert('range', (v) => (v as num?)?.toDouble()),
      rpm: $checkedConvert('rpm', (v) => (v as num?)?.toDouble()),
      damage: $checkedConvert(
        'damage',
        (v) => v == null
            ? null
            : VehicleWeaponDamage.fromJson(v as Map<String, dynamic>),
      ),
      modes: $checkedConvert(
        'modes',
        (v) => (v as List<dynamic>?)
            ?.map((e) => VehicleWeaponMode.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      damagePerShot: $checkedConvert(
        'damage_per_shot',
        (v) => (v as num?)?.toDouble(),
      ),
      damages: $checkedConvert(
        'damages',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  VehicleWeaponDamageEntry.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      regeneration: $checkedConvert(
        'regeneration',
        (v) => (v as num?)?.toDouble(),
      ),
      ammunition: $checkedConvert('ammunition', (v) => v),
      spread: $checkedConvert(
        'spread',
        (v) => v == null
            ? null
            : VehicleWeaponSpread.fromJson(v as Map<String, dynamic>),
      ),
      barrelSpinTime: $checkedConvert(
        'barrel_spin_time',
        (v) => v == null
            ? null
            : VehicleWeaponBarrelSpinTime.fromJson(v as Map<String, dynamic>),
      ),
      heat: $checkedConvert(
        'heat',
        (v) => v == null
            ? null
            : VehicleWeaponHeat.fromJson(v as Map<String, dynamic>),
      ),
      capacitor: $checkedConvert(
        'capacitor',
        (v) => v == null
            ? null
            : VehicleWeaponCapacitor.fromJson(v as Map<String, dynamic>),
      ),
      charge: $checkedConvert(
        'charge',
        (v) => v == null
            ? null
            : VehicleWeaponCharge.fromJson(v as Map<String, dynamic>),
      ),
      chargeModifier: $checkedConvert(
        'charge_modifier',
        (v) => v == null
            ? null
            : VehicleWeaponChargeModifier.fromJson(v as Map<String, dynamic>),
      ),
      magazineVolume: $checkedConvert(
        'magazine_volume',
        (v) => v == null
            ? null
            : VehicleWeaponMagazineVolume.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'class_': 'class',
    'damagePerShot': 'damage_per_shot',
    'barrelSpinTime': 'barrel_spin_time',
    'chargeModifier': 'charge_modifier',
    'magazineVolume': 'magazine_volume',
  },
);

Map<String, dynamic> _$VehicleWeaponToJson(VehicleWeapon instance) =>
    <String, dynamic>{
      'class': ?instance.class_,
      'type': ?instance.type,
      'capacity': ?instance.capacity,
      'range': ?instance.range,
      'rpm': ?instance.rpm,
      'damage': ?instance.damage?.toJson(),
      'modes': ?instance.modes?.map((e) => e.toJson()).toList(),
      'damage_per_shot': ?instance.damagePerShot,
      'damages': ?instance.damages?.map((e) => e.toJson()).toList(),
      'regeneration': ?instance.regeneration,
      'ammunition': ?instance.ammunition,
      'spread': ?instance.spread?.toJson(),
      'barrel_spin_time': ?instance.barrelSpinTime?.toJson(),
      'heat': ?instance.heat?.toJson(),
      'capacitor': ?instance.capacitor?.toJson(),
      'charge': ?instance.charge?.toJson(),
      'charge_modifier': ?instance.chargeModifier?.toJson(),
      'magazine_volume': ?instance.magazineVolume?.toJson(),
    };
