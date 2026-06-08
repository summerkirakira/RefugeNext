// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grenade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grenade _$GrenadeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Grenade',
  json,
  ($checkedConvert) {
    final val = Grenade(
      damageType: $checkedConvert('damage_type', (v) => v as String?),
      damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
      aoe: $checkedConvert(
        'aoe',
        (v) =>
            v == null ? null : GrenadeAoe.fromJson(v as Map<String, dynamic>),
      ),
      areaOfEffect: $checkedConvert(
        'area_of_effect',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'damageType': 'damage_type',
    'areaOfEffect': 'area_of_effect',
  },
);

Map<String, dynamic> _$GrenadeToJson(Grenade instance) => <String, dynamic>{
  'damage_type': ?instance.damageType,
  'damage': ?instance.damage,
  'aoe': ?instance.aoe?.toJson(),
  'area_of_effect': ?instance.areaOfEffect,
};
