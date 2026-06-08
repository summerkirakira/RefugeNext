// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkUsage _$ResourceNetworkUsageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceNetworkUsage', json, ($checkedConvert) {
  final val = ResourceNetworkUsage(
    power: $checkedConvert(
      'power',
      (v) => v == null
          ? null
          : ResourceNetworkUsagePower.fromJson(v as Map<String, dynamic>),
    ),
    coolant: $checkedConvert(
      'coolant',
      (v) => v == null
          ? null
          : ResourceNetworkUsageCoolant.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ResourceNetworkUsageToJson(
  ResourceNetworkUsage instance,
) => <String, dynamic>{
  'power': ?instance.power?.toJson(),
  'coolant': ?instance.coolant?.toJson(),
};
