// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_weapon_damage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalWeaponDamage _$PersonalWeaponDamageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PersonalWeaponDamage',
  json,
  ($checkedConvert) {
    final val = PersonalWeaponDamage(
      dpsTotal: $checkedConvert('dps_total', (v) => (v as num?)?.toDouble()),
      alphaTotal: $checkedConvert(
        'alpha_total',
        (v) => (v as num?)?.toDouble(),
      ),
      max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
      maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
      dps: $checkedConvert(
        'dps',
        (v) => v == null
            ? null
            : PersonalWeaponDamageVector.fromJson(v as Map<String, dynamic>),
      ),
      alpha: $checkedConvert(
        'alpha',
        (v) => v == null
            ? null
            : PersonalWeaponDamageVector.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'dpsTotal': 'dps_total', 'alphaTotal': 'alpha_total'},
);

Map<String, dynamic> _$PersonalWeaponDamageToJson(
  PersonalWeaponDamage instance,
) => <String, dynamic>{
  'dps_total': ?instance.dpsTotal,
  'alpha_total': ?instance.alphaTotal,
  'max': ?instance.max,
  'maximum': ?instance.maximum,
  'dps': ?instance.dps?.toJson(),
  'alpha': ?instance.alpha?.toJson(),
};
