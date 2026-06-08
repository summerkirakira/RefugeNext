// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield_reserve_pool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShieldReservePool _$ShieldReservePoolFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ShieldReservePool',
  json,
  ($checkedConvert) {
    final val = ShieldReservePool(
      regenRate: $checkedConvert('regen_rate', (v) => (v as num?)?.toDouble()),
      regenTime: $checkedConvert('regen_time', (v) => (v as num?)?.toDouble()),
      initialHealthRatio: $checkedConvert(
        'initial_health_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      maxHealthRatio: $checkedConvert(
        'max_health_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      regenRateRatio: $checkedConvert(
        'regen_rate_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      drainRateRatio: $checkedConvert(
        'drain_rate_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'regenRate': 'regen_rate',
    'regenTime': 'regen_time',
    'initialHealthRatio': 'initial_health_ratio',
    'maxHealthRatio': 'max_health_ratio',
    'regenRateRatio': 'regen_rate_ratio',
    'drainRateRatio': 'drain_rate_ratio',
  },
);

Map<String, dynamic> _$ShieldReservePoolToJson(ShieldReservePool instance) =>
    <String, dynamic>{
      'regen_rate': ?instance.regenRate,
      'regen_time': ?instance.regenTime,
      'initial_health_ratio': ?instance.initialHealthRatio,
      'max_health_ratio': ?instance.maxHealthRatio,
      'regen_rate_ratio': ?instance.regenRateRatio,
      'drain_rate_ratio': ?instance.drainRateRatio,
    };
