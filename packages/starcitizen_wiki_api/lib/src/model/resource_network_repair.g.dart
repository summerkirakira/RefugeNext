// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_repair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkRepair _$ResourceNetworkRepairFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ResourceNetworkRepair',
  json,
  ($checkedConvert) {
    final val = ResourceNetworkRepair(
      maxRepairCount: $checkedConvert(
        'max_repair_count',
        (v) => (v as num?)?.toInt(),
      ),
      timeToRepair: $checkedConvert(
        'time_to_repair',
        (v) => (v as num?)?.toDouble(),
      ),
      healthRatio: $checkedConvert(
        'health_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxRepairCount': 'max_repair_count',
    'timeToRepair': 'time_to_repair',
    'healthRatio': 'health_ratio',
  },
);

Map<String, dynamic> _$ResourceNetworkRepairToJson(
  ResourceNetworkRepair instance,
) => <String, dynamic>{
  'max_repair_count': ?instance.maxRepairCount,
  'time_to_repair': ?instance.timeToRepair,
  'health_ratio': ?instance.healthRatio,
};
