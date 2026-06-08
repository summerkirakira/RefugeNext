// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_relay_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleRelayEntry _$VehicleRelayEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VehicleRelayEntry',
      json,
      ($checkedConvert) {
        final val = VehicleRelayEntry(
          hardpoint: $checkedConvert('hardpoint', (v) => v as String?),
          className: $checkedConvert('class_name', (v) => v as String?),
          fuseSlots: $checkedConvert('fuse_slots', (v) => (v as num?)?.toInt()),
          room: $checkedConvert('room', (v) => v as String?),
          connectionCount: $checkedConvert(
            'connection_count',
            (v) => (v as num?)?.toInt(),
          ),
          connectedHardpoints: $checkedConvert(
            'connected_hardpoints',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => VehicleRelayEntryConnectedHardpointsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'className': 'class_name',
        'fuseSlots': 'fuse_slots',
        'connectionCount': 'connection_count',
        'connectedHardpoints': 'connected_hardpoints',
      },
    );

Map<String, dynamic> _$VehicleRelayEntryToJson(VehicleRelayEntry instance) =>
    <String, dynamic>{
      'hardpoint': ?instance.hardpoint,
      'class_name': ?instance.className,
      'fuse_slots': ?instance.fuseSlots,
      'room': ?instance.room,
      'connection_count': ?instance.connectionCount,
      'connected_hardpoints': ?instance.connectedHardpoints
          ?.map((e) => e.toJson())
          .toList(),
    };
