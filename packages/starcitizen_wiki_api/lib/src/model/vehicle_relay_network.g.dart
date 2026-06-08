// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_relay_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleRelayNetwork _$VehicleRelayNetworkFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VehicleRelayNetwork', json, ($checkedConvert) {
  final val = VehicleRelayNetwork(
    totalFuses: $checkedConvert('total_fuses', (v) => (v as num?)?.toInt()),
    relays: $checkedConvert(
      'relays',
      (v) => (v as List<dynamic>?)
          ?.map((e) => VehicleRelayEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    links: $checkedConvert(
      'links',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => VehicleRelayNetworkLinksInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'totalFuses': 'total_fuses'});

Map<String, dynamic> _$VehicleRelayNetworkToJson(
  VehicleRelayNetwork instance,
) => <String, dynamic>{
  'total_fuses': ?instance.totalFuses,
  'relays': ?instance.relays?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.map((e) => e.toJson()).toList(),
};
