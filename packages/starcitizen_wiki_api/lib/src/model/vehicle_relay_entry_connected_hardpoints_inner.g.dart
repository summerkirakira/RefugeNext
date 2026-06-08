// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_relay_entry_connected_hardpoints_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleRelayEntryConnectedHardpointsInner
_$VehicleRelayEntryConnectedHardpointsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VehicleRelayEntryConnectedHardpointsInner', json, (
  $checkedConvert,
) {
  final val = VehicleRelayEntryConnectedHardpointsInner(
    category: $checkedConvert('category', (v) => v as String?),
    count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => VehicleRelayEntryConnectedHardpointsInnerItemsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$VehicleRelayEntryConnectedHardpointsInnerToJson(
  VehicleRelayEntryConnectedHardpointsInner instance,
) => <String, dynamic>{
  'category': ?instance.category,
  'count': ?instance.count,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
};
