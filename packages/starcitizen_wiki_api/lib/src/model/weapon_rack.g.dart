// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_rack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponRack _$WeaponRackFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WeaponRack', json, ($checkedConvert) {
      final val = WeaponRack(
        pistols: $checkedConvert('pistols', (v) => (v as num?)?.toInt()),
        rifles: $checkedConvert('rifles', (v) => (v as num?)?.toInt()),
        gadgets: $checkedConvert('gadgets', (v) => (v as num?)?.toInt()),
        totalWeaponSlots: $checkedConvert(
          'total_weapon_slots',
          (v) => (v as num?)?.toInt(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'totalWeaponSlots': 'total_weapon_slots'});

Map<String, dynamic> _$WeaponRackToJson(WeaponRack instance) =>
    <String, dynamic>{
      'pistols': ?instance.pistols,
      'rifles': ?instance.rifles,
      'gadgets': ?instance.gadgets,
      'total_weapon_slots': ?instance.totalWeaponSlots,
    };
