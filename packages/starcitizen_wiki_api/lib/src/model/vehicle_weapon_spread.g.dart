// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_spread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponSpread _$VehicleWeaponSpreadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleWeaponSpread',
  json,
  ($checkedConvert) {
    final val = VehicleWeaponSpread(
      min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
      max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
      minimum: $checkedConvert('minimum', (v) => (v as num?)?.toDouble()),
      maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
      firstAttack: $checkedConvert(
        'first_attack',
        (v) => (v as num?)?.toDouble(),
      ),
      perAttack: $checkedConvert('per_attack', (v) => (v as num?)?.toDouble()),
      decay: $checkedConvert('decay', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {'firstAttack': 'first_attack', 'perAttack': 'per_attack'},
);

Map<String, dynamic> _$VehicleWeaponSpreadToJson(
  VehicleWeaponSpread instance,
) => <String, dynamic>{
  'min': ?instance.min,
  'max': ?instance.max,
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
  'first_attack': ?instance.firstAttack,
  'per_attack': ?instance.perAttack,
  'decay': ?instance.decay,
};
