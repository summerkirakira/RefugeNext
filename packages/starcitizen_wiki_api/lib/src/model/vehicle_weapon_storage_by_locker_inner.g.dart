// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_storage_by_locker_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponStorageByLockerInner _$VehicleWeaponStorageByLockerInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleWeaponStorageByLockerInner',
  json,
  ($checkedConvert) {
    final val = VehicleWeaponStorageByLockerInner(
      count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      port: $checkedConvert('port', (v) => v as String?),
      slotsTotal: $checkedConvert('slots_total', (v) => (v as num?)?.toInt()),
      slotsRifle: $checkedConvert('slots_rifle', (v) => (v as num?)?.toInt()),
      slotsPistol: $checkedConvert('slots_pistol', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'className': 'class_name',
    'slotsTotal': 'slots_total',
    'slotsRifle': 'slots_rifle',
    'slotsPistol': 'slots_pistol',
  },
);

Map<String, dynamic> _$VehicleWeaponStorageByLockerInnerToJson(
  VehicleWeaponStorageByLockerInner instance,
) => <String, dynamic>{
  'count': ?instance.count,
  'name': ?instance.name,
  'class_name': ?instance.className,
  'port': ?instance.port,
  'slots_total': ?instance.slotsTotal,
  'slots_rifle': ?instance.slotsRifle,
  'slots_pistol': ?instance.slotsPistol,
};
