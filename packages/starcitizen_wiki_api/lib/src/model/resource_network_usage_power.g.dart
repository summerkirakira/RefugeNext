// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_usage_power.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkUsagePower _$ResourceNetworkUsagePowerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceNetworkUsagePower', json, ($checkedConvert) {
  final val = ResourceNetworkUsagePower(
    min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
    max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
    minimum: $checkedConvert('minimum', (v) => (v as num?)?.toDouble()),
    maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ResourceNetworkUsagePowerToJson(
  ResourceNetworkUsagePower instance,
) => <String, dynamic>{
  'min': ?instance.min,
  'max': ?instance.max,
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
