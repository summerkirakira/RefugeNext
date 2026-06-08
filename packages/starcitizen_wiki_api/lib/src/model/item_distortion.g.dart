// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_distortion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDistortion _$ItemDistortionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ItemDistortion',
      json,
      ($checkedConvert) {
        final val = ItemDistortion(
          decayRate: $checkedConvert(
            'decay_rate',
            (v) => (v as num?)?.toDouble(),
          ),
          decayDelay: $checkedConvert(
            'decay_delay',
            (v) => (v as num?)?.toDouble(),
          ),
          max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
          maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
          overloadRatio: $checkedConvert(
            'overload_ratio',
            (v) => (v as num?)?.toDouble(),
          ),
          warningRatio: $checkedConvert(
            'warning_ratio',
            (v) => (v as num?)?.toDouble(),
          ),
          recoveryRatio: $checkedConvert(
            'recovery_ratio',
            (v) => (v as num?)?.toDouble(),
          ),
          recoveryTime: $checkedConvert(
            'recovery_time',
            (v) => (v as num?)?.toDouble(),
          ),
          powerRatioAtMaxDistortion: $checkedConvert(
            'power_ratio_at_max_distortion',
            (v) => (v as num?)?.toDouble(),
          ),
          powerChangeOnlyAtMaxDistortion: $checkedConvert(
            'power_change_only_at_max_distortion',
            (v) => (v as num?)?.toInt(),
          ),
          shutdownTime: $checkedConvert(
            'shutdown_time',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'decayRate': 'decay_rate',
        'decayDelay': 'decay_delay',
        'overloadRatio': 'overload_ratio',
        'warningRatio': 'warning_ratio',
        'recoveryRatio': 'recovery_ratio',
        'recoveryTime': 'recovery_time',
        'powerRatioAtMaxDistortion': 'power_ratio_at_max_distortion',
        'powerChangeOnlyAtMaxDistortion': 'power_change_only_at_max_distortion',
        'shutdownTime': 'shutdown_time',
      },
    );

Map<String, dynamic> _$ItemDistortionToJson(ItemDistortion instance) =>
    <String, dynamic>{
      'decay_rate': ?instance.decayRate,
      'decay_delay': ?instance.decayDelay,
      'max': ?instance.max,
      'maximum': ?instance.maximum,
      'overload_ratio': ?instance.overloadRatio,
      'warning_ratio': ?instance.warningRatio,
      'recovery_ratio': ?instance.recoveryRatio,
      'recovery_time': ?instance.recoveryTime,
      'power_ratio_at_max_distortion': ?instance.powerRatioAtMaxDistortion,
      'power_change_only_at_max_distortion':
          ?instance.powerChangeOnlyAtMaxDistortion,
      'shutdown_time': ?instance.shutdownTime,
    };
