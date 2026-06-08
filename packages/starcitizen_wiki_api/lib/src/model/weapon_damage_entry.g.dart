// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_damage_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponDamageEntry _$WeaponDamageEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WeaponDamageEntry', json, ($checkedConvert) {
      final val = WeaponDamageEntry(
        type: $checkedConvert('type', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$WeaponDamageEntryToJson(WeaponDamageEntry instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'name': ?instance.name,
      'damage': ?instance.damage,
    };
