// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTemperature _$ItemTemperatureFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ItemTemperature',
      json,
      ($checkedConvert) {
        final val = ItemTemperature(
          unit: $checkedConvert('unit', (v) => v as String?),
          coolingThreshold: $checkedConvert(
            'cooling_threshold',
            (v) => (v as num?)?.toDouble(),
          ),
          irThreshold: $checkedConvert(
            'ir_threshold',
            (v) => (v as num?)?.toDouble(),
          ),
          overheatThreshold: $checkedConvert(
            'overheat_threshold',
            (v) => (v as num?)?.toDouble(),
          ),
          overheatTemperature: $checkedConvert(
            'overheat_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          maxTemperature: $checkedConvert(
            'max_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          recoveryTemperature: $checkedConvert(
            'recovery_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'coolingThreshold': 'cooling_threshold',
        'irThreshold': 'ir_threshold',
        'overheatThreshold': 'overheat_threshold',
        'overheatTemperature': 'overheat_temperature',
        'maxTemperature': 'max_temperature',
        'recoveryTemperature': 'recovery_temperature',
      },
    );

Map<String, dynamic> _$ItemTemperatureToJson(ItemTemperature instance) =>
    <String, dynamic>{
      'unit': ?instance.unit,
      'cooling_threshold': ?instance.coolingThreshold,
      'ir_threshold': ?instance.irThreshold,
      'overheat_threshold': ?instance.overheatThreshold,
      'overheat_temperature': ?instance.overheatTemperature,
      'max_temperature': ?instance.maxTemperature,
      'recovery_temperature': ?instance.recoveryTemperature,
    };
