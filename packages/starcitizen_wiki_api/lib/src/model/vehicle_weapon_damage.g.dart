// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_damage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponDamage _$VehicleWeaponDamageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VehicleWeaponDamage',
      json,
      ($checkedConvert) {
        final val = VehicleWeaponDamage(
          sustained60s: $checkedConvert(
            'sustained_60s',
            (v) => (v as num?)?.toDouble(),
          ),
          burst: $checkedConvert('burst', (v) => (v as num?)?.toDouble()),
          alphaTotal: $checkedConvert(
            'alpha_total',
            (v) => (v as num?)?.toDouble(),
          ),
          max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
          maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
          alpha: $checkedConvert(
            'alpha',
            (v) => v == null
                ? null
                : VehicleWeaponDamageTypes.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'sustained60s': 'sustained_60s',
        'alphaTotal': 'alpha_total',
      },
    );

Map<String, dynamic> _$VehicleWeaponDamageToJson(
  VehicleWeaponDamage instance,
) => <String, dynamic>{
  'sustained_60s': ?instance.sustained60s,
  'burst': ?instance.burst,
  'alpha_total': ?instance.alphaTotal,
  'max': ?instance.max,
  'maximum': ?instance.maximum,
  'alpha': ?instance.alpha?.toJson(),
};
