// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_relay_entry_connected_hardpoints_inner_items_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleRelayEntryConnectedHardpointsInnerItemsInner
_$VehicleRelayEntryConnectedHardpointsInnerItemsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleRelayEntryConnectedHardpointsInnerItemsInner',
  json,
  ($checkedConvert) {
    final val = VehicleRelayEntryConnectedHardpointsInnerItemsInner(
      hardpoint: $checkedConvert('hardpoint', (v) => v as String?),
      itemName: $checkedConvert('item_name', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'itemName': 'item_name', 'className': 'class_name'},
);

Map<String, dynamic>
_$VehicleRelayEntryConnectedHardpointsInnerItemsInnerToJson(
  VehicleRelayEntryConnectedHardpointsInnerItemsInner instance,
) => <String, dynamic>{
  'hardpoint': ?instance.hardpoint,
  'item_name': ?instance.itemName,
  'class_name': ?instance.className,
  'type': ?instance.type,
  'uuid': ?instance.uuid,
};
