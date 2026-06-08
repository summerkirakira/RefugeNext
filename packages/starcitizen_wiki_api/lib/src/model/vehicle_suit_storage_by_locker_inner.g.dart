// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_suit_storage_by_locker_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleSuitStorageByLockerInner _$VehicleSuitStorageByLockerInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleSuitStorageByLockerInner',
  json,
  ($checkedConvert) {
    final val = VehicleSuitStorageByLockerInner(
      count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      port: $checkedConvert('port', (v) => v as String?),
      slotsTotal: $checkedConvert('slots_total', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'className': 'class_name', 'slotsTotal': 'slots_total'},
);

Map<String, dynamic> _$VehicleSuitStorageByLockerInnerToJson(
  VehicleSuitStorageByLockerInner instance,
) => <String, dynamic>{
  'count': ?instance.count,
  'name': ?instance.name,
  'class_name': ?instance.className,
  'port': ?instance.port,
  'slots_total': ?instance.slotsTotal,
};
