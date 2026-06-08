// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missile_flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissileFlight _$MissileFlightFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissileFlight',
      json,
      ($checkedConvert) {
        final val = MissileFlight(
          enableLifetime: $checkedConvert('enable_lifetime', (v) => v as bool?),
          maxLifetime: $checkedConvert(
            'max_lifetime',
            (v) => (v as num?)?.toDouble(),
          ),
          range: $checkedConvert('range', (v) => (v as num?)?.toDouble()),
          speed: $checkedConvert('speed', (v) => (v as num?)?.toDouble()),
          boostSpeed: $checkedConvert(
            'boost_speed',
            (v) => (v as num?)?.toDouble(),
          ),
          interceptSpeed: $checkedConvert(
            'intercept_speed',
            (v) => (v as num?)?.toDouble(),
          ),
          terminalSpeed: $checkedConvert(
            'terminal_speed',
            (v) => (v as num?)?.toDouble(),
          ),
          boostPhaseDuration: $checkedConvert(
            'boost_phase_duration',
            (v) => (v as num?)?.toDouble(),
          ),
          terminalPhaseEngagementTime: $checkedConvert(
            'terminal_phase_engagement_time',
            (v) => (v as num?)?.toDouble(),
          ),
          terminalPhaseEngagementAngle: $checkedConvert(
            'terminal_phase_engagement_angle',
            (v) => (v as num?)?.toDouble(),
          ),
          fuelTankSize: $checkedConvert(
            'fuel_tank_size',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'enableLifetime': 'enable_lifetime',
        'maxLifetime': 'max_lifetime',
        'boostSpeed': 'boost_speed',
        'interceptSpeed': 'intercept_speed',
        'terminalSpeed': 'terminal_speed',
        'boostPhaseDuration': 'boost_phase_duration',
        'terminalPhaseEngagementTime': 'terminal_phase_engagement_time',
        'terminalPhaseEngagementAngle': 'terminal_phase_engagement_angle',
        'fuelTankSize': 'fuel_tank_size',
      },
    );

Map<String, dynamic> _$MissileFlightToJson(MissileFlight instance) =>
    <String, dynamic>{
      'enable_lifetime': ?instance.enableLifetime,
      'max_lifetime': ?instance.maxLifetime,
      'range': ?instance.range,
      'speed': ?instance.speed,
      'boost_speed': ?instance.boostSpeed,
      'intercept_speed': ?instance.interceptSpeed,
      'terminal_speed': ?instance.terminalSpeed,
      'boost_phase_duration': ?instance.boostPhaseDuration,
      'terminal_phase_engagement_time': ?instance.terminalPhaseEngagementTime,
      'terminal_phase_engagement_angle': ?instance.terminalPhaseEngagementAngle,
      'fuel_tank_size': ?instance.fuelTankSize,
    };
