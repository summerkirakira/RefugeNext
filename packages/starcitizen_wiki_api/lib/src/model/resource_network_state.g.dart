// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkState _$ResourceNetworkStateFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceNetworkState', json, ($checkedConvert) {
  final val = ResourceNetworkState(
    name: $checkedConvert('name', (v) => v as String?),
    signature: $checkedConvert(
      'signature',
      (v) => v == null
          ? null
          : ResourceNetworkStateSignature.fromJson(v as Map<String, dynamic>),
    ),
    deltas: $checkedConvert(
      'deltas',
      (v) => (v as List<dynamic>?)
          ?.map((e) => ResourceNetworkDelta.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    powerRanges: $checkedConvert(
      'power_ranges',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ResourceNetworkStatePowerRangesInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'powerRanges': 'power_ranges'});

Map<String, dynamic> _$ResourceNetworkStateToJson(
  ResourceNetworkState instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'signature': ?instance.signature?.toJson(),
  'deltas': ?instance.deltas?.map((e) => e.toJson()).toList(),
  'power_ranges': ?instance.powerRanges?.map((e) => e.toJson()).toList(),
};
