// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_suit_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleSuitStorage _$VehicleSuitStorageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VehicleSuitStorage',
      json,
      ($checkedConvert) {
        final val = VehicleSuitStorage(
          lockers: $checkedConvert('lockers', (v) => (v as num?)?.toInt()),
          slotsTotal: $checkedConvert(
            'slots_total',
            (v) => (v as num?)?.toInt(),
          ),
          byLocker: $checkedConvert(
            'by_locker',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => VehicleSuitStorageByLockerInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'slotsTotal': 'slots_total', 'byLocker': 'by_locker'},
    );

Map<String, dynamic> _$VehicleSuitStorageToJson(VehicleSuitStorage instance) =>
    <String, dynamic>{
      'lockers': ?instance.lockers,
      'slots_total': ?instance.slotsTotal,
      'by_locker': ?instance.byLocker?.map((e) => e.toJson()).toList(),
    };
