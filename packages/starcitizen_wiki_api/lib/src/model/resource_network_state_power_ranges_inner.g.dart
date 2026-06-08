// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_state_power_ranges_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkStatePowerRangesInner
_$ResourceNetworkStatePowerRangesInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ResourceNetworkStatePowerRangesInner',
      json,
      ($checkedConvert) {
        final val = ResourceNetworkStatePowerRangesInner(
          start: $checkedConvert('start', (v) => (v as num?)?.toDouble()),
          modifier: $checkedConvert('modifier', (v) => (v as num?)?.toDouble()),
          registerRange: $checkedConvert('register_range', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'registerRange': 'register_range'},
    );

Map<String, dynamic> _$ResourceNetworkStatePowerRangesInnerToJson(
  ResourceNetworkStatePowerRangesInner instance,
) => <String, dynamic>{
  'start': ?instance.start,
  'modifier': ?instance.modifier,
  'register_range': ?instance.registerRange,
};
