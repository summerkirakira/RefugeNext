// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_boost_capacitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerBoostCapacitor _$FlightControllerBoostCapacitorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerBoostCapacitor',
  json,
  ($checkedConvert) {
    final val = FlightControllerBoostCapacitor(
      capacity: $checkedConvert('capacity', (v) => (v as num?)?.toDouble()),
      thresholdRatio: $checkedConvert(
        'threshold_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      idleCost: $checkedConvert('idle_cost', (v) => (v as num?)?.toDouble()),
      linearCost: $checkedConvert(
        'linear_cost',
        (v) => (v as num?)?.toDouble(),
      ),
      angularCost: $checkedConvert(
        'angular_cost',
        (v) => (v as num?)?.toDouble(),
      ),
      regenPerSec: $checkedConvert(
        'regen_per_sec',
        (v) => (v as num?)?.toDouble(),
      ),
      regenDelay: $checkedConvert(
        'regen_delay',
        (v) => (v as num?)?.toDouble(),
      ),
      regenTime: $checkedConvert('regen_time', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'thresholdRatio': 'threshold_ratio',
    'idleCost': 'idle_cost',
    'linearCost': 'linear_cost',
    'angularCost': 'angular_cost',
    'regenPerSec': 'regen_per_sec',
    'regenDelay': 'regen_delay',
    'regenTime': 'regen_time',
  },
);

Map<String, dynamic> _$FlightControllerBoostCapacitorToJson(
  FlightControllerBoostCapacitor instance,
) => <String, dynamic>{
  'capacity': ?instance.capacity,
  'threshold_ratio': ?instance.thresholdRatio,
  'idle_cost': ?instance.idleCost,
  'linear_cost': ?instance.linearCost,
  'angular_cost': ?instance.angularCost,
  'regen_per_sec': ?instance.regenPerSec,
  'regen_delay': ?instance.regenDelay,
  'regen_time': ?instance.regenTime,
};
