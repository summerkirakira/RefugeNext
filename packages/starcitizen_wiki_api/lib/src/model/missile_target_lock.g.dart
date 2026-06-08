// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missile_target_lock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissileTargetLock _$MissileTargetLockFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissileTargetLock',
  json,
  ($checkedConvert) {
    final val = MissileTargetLock(
      signalResilienceMin: $checkedConvert(
        'signal_resilience_min',
        (v) => (v as num?)?.toDouble(),
      ),
      signalResilienceMax: $checkedConvert(
        'signal_resilience_max',
        (v) => (v as num?)?.toDouble(),
      ),
      rangeMax: $checkedConvert('range_max', (v) => (v as num?)?.toDouble()),
      rangeMin: $checkedConvert('range_min', (v) => (v as num?)?.toDouble()),
      angle: $checkedConvert('angle', (v) => (v as num?)?.toDouble()),
      signalAmplifier: $checkedConvert(
        'signal_amplifier',
        (v) => (v as num?)?.toDouble(),
      ),
      increaseRate: $checkedConvert(
        'increase_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      allowDumbFiring: $checkedConvert('allow_dumb_firing', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'signalResilienceMin': 'signal_resilience_min',
    'signalResilienceMax': 'signal_resilience_max',
    'rangeMax': 'range_max',
    'rangeMin': 'range_min',
    'signalAmplifier': 'signal_amplifier',
    'increaseRate': 'increase_rate',
    'allowDumbFiring': 'allow_dumb_firing',
  },
);

Map<String, dynamic> _$MissileTargetLockToJson(MissileTargetLock instance) =>
    <String, dynamic>{
      'signal_resilience_min': ?instance.signalResilienceMin,
      'signal_resilience_max': ?instance.signalResilienceMax,
      'range_max': ?instance.rangeMax,
      'range_min': ?instance.rangeMin,
      'angle': ?instance.angle,
      'signal_amplifier': ?instance.signalAmplifier,
      'increase_rate': ?instance.increaseRate,
      'allow_dumb_firing': ?instance.allowDumbFiring,
    };
