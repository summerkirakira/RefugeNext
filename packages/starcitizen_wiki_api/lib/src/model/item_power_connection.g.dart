// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_power_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPowerConnection _$ItemPowerConnectionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ItemPowerConnection',
  json,
  ($checkedConvert) {
    final val = ItemPowerConnection(
      powerBase: $checkedConvert('power_base', (v) => (v as num?)?.toDouble()),
      powerDraw: $checkedConvert('power_draw', (v) => (v as num?)?.toDouble()),
      throttleable: $checkedConvert('throttleable', (v) => v as bool?),
      overclockable: $checkedConvert('overclockable', (v) => v as bool?),
      overclockThresholdMin: $checkedConvert(
        'overclock_threshold_min',
        (v) => (v as num?)?.toDouble(),
      ),
      overclockThresholdMax: $checkedConvert(
        'overclock_threshold_max',
        (v) => (v as num?)?.toDouble(),
      ),
      overclockPerformance: $checkedConvert(
        'overclock_performance',
        (v) => (v as num?)?.toDouble(),
      ),
      overpowerPerformance: $checkedConvert(
        'overpower_performance',
        (v) => (v as num?)?.toDouble(),
      ),
      powerToEm: $checkedConvert('power_to_em', (v) => (v as num?)?.toDouble()),
      decayRateEm: $checkedConvert(
        'decay_rate_em',
        (v) => (v as num?)?.toDouble(),
      ),
      emMin: $checkedConvert('em_min', (v) => (v as num?)?.toDouble()),
      emMax: $checkedConvert('em_max', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'powerBase': 'power_base',
    'powerDraw': 'power_draw',
    'overclockThresholdMin': 'overclock_threshold_min',
    'overclockThresholdMax': 'overclock_threshold_max',
    'overclockPerformance': 'overclock_performance',
    'overpowerPerformance': 'overpower_performance',
    'powerToEm': 'power_to_em',
    'decayRateEm': 'decay_rate_em',
    'emMin': 'em_min',
    'emMax': 'em_max',
  },
);

Map<String, dynamic> _$ItemPowerConnectionToJson(
  ItemPowerConnection instance,
) => <String, dynamic>{
  'power_base': ?instance.powerBase,
  'power_draw': ?instance.powerDraw,
  'throttleable': ?instance.throttleable,
  'overclockable': ?instance.overclockable,
  'overclock_threshold_min': ?instance.overclockThresholdMin,
  'overclock_threshold_max': ?instance.overclockThresholdMax,
  'overclock_performance': ?instance.overclockPerformance,
  'overpower_performance': ?instance.overpowerPerformance,
  'power_to_em': ?instance.powerToEm,
  'decay_rate_em': ?instance.decayRateEm,
  'em_min': ?instance.emMin,
  'em_max': ?instance.emMax,
};
