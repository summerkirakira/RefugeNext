// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponStorage _$VehicleWeaponStorageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleWeaponStorage',
  json,
  ($checkedConvert) {
    final val = VehicleWeaponStorage(
      lockers: $checkedConvert('lockers', (v) => (v as num?)?.toInt()),
      slotsTotal: $checkedConvert('slots_total', (v) => (v as num?)?.toInt()),
      slotsRifle: $checkedConvert('slots_rifle', (v) => (v as num?)?.toInt()),
      slotsPistol: $checkedConvert('slots_pistol', (v) => (v as num?)?.toInt()),
      byLocker: $checkedConvert(
        'by_locker',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => VehicleWeaponStorageByLockerInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'slotsTotal': 'slots_total',
    'slotsRifle': 'slots_rifle',
    'slotsPistol': 'slots_pistol',
    'byLocker': 'by_locker',
  },
);

Map<String, dynamic> _$VehicleWeaponStorageToJson(
  VehicleWeaponStorage instance,
) => <String, dynamic>{
  'lockers': ?instance.lockers,
  'slots_total': ?instance.slotsTotal,
  'slots_rifle': ?instance.slotsRifle,
  'slots_pistol': ?instance.slotsPistol,
  'by_locker': ?instance.byLocker?.map((e) => e.toJson()).toList(),
};
