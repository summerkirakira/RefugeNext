// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_relay_network_links_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleRelayNetworkLinksInner _$VehicleRelayNetworkLinksInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VehicleRelayNetworkLinksInner', json, ($checkedConvert) {
  final val = VehicleRelayNetworkLinksInner(
    from: $checkedConvert('from', (v) => v as String?),
    to: $checkedConvert('to', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$VehicleRelayNetworkLinksInnerToJson(
  VehicleRelayNetworkLinksInner instance,
) => <String, dynamic>{'from': ?instance.from, 'to': ?instance.to};
