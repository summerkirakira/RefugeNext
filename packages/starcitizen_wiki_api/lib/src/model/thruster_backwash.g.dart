// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thruster_backwash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThrusterBackwash _$ThrusterBackwashFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ThrusterBackwash',
      json,
      ($checkedConvert) {
        final val = ThrusterBackwash(
          enabled: $checkedConvert('enabled', (v) => v as bool?),
          automateSize: $checkedConvert('automate_size', (v) => v as bool?),
          maxSpeed: $checkedConvert(
            'max_speed',
            (v) => (v as num?)?.toDouble(),
          ),
          maxDensity: $checkedConvert(
            'max_density',
            (v) => (v as num?)?.toDouble(),
          ),
          maxResistance: $checkedConvert(
            'max_resistance',
            (v) => (v as num?)?.toDouble(),
          ),
          afterburnerMultiplier: $checkedConvert(
            'afterburner_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'automateSize': 'automate_size',
        'maxSpeed': 'max_speed',
        'maxDensity': 'max_density',
        'maxResistance': 'max_resistance',
        'afterburnerMultiplier': 'afterburner_multiplier',
      },
    );

Map<String, dynamic> _$ThrusterBackwashToJson(ThrusterBackwash instance) =>
    <String, dynamic>{
      'enabled': ?instance.enabled,
      'automate_size': ?instance.automateSize,
      'max_speed': ?instance.maxSpeed,
      'max_density': ?instance.maxDensity,
      'max_resistance': ?instance.maxResistance,
      'afterburner_multiplier': ?instance.afterburnerMultiplier,
    };
