// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_attachment_magazine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponAttachmentMagazine _$WeaponAttachmentMagazineFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WeaponAttachmentMagazine',
  json,
  ($checkedConvert) {
    final val = WeaponAttachmentMagazine(
      initialAmmoCount: $checkedConvert(
        'initial_ammo_count',
        (v) => (v as num?)?.toInt(),
      ),
      maxAmmoCount: $checkedConvert(
        'max_ammo_count',
        (v) => (v as num?)?.toInt(),
      ),
      maxRestockCount: $checkedConvert(
        'max_restock_count',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'initialAmmoCount': 'initial_ammo_count',
    'maxAmmoCount': 'max_ammo_count',
    'maxRestockCount': 'max_restock_count',
  },
);

Map<String, dynamic> _$WeaponAttachmentMagazineToJson(
  WeaponAttachmentMagazine instance,
) => <String, dynamic>{
  'initial_ammo_count': ?instance.initialAmmoCount,
  'max_ammo_count': ?instance.maxAmmoCount,
  'max_restock_count': ?instance.maxRestockCount,
};
