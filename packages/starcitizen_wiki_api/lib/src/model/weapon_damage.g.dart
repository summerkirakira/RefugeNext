// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_damage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponDamage _$WeaponDamageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WeaponDamage', json, ($checkedConvert) {
      final val = WeaponDamage(
        type: $checkedConvert('type', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$WeaponDamageToJson(WeaponDamage instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'name': ?instance.name,
      'damage': ?instance.damage,
    };
