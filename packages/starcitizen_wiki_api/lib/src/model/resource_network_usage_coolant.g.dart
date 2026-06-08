// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_usage_coolant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkUsageCoolant _$ResourceNetworkUsageCoolantFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceNetworkUsageCoolant', json, ($checkedConvert) {
  final val = ResourceNetworkUsageCoolant(
    min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
    max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
    minimum: $checkedConvert('minimum', (v) => (v as num?)?.toDouble()),
    maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ResourceNetworkUsageCoolantToJson(
  ResourceNetworkUsageCoolant instance,
) => <String, dynamic>{
  'min': ?instance.min,
  'max': ?instance.max,
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
