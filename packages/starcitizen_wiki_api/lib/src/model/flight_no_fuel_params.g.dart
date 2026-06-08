// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_no_fuel_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightNoFuelParams _$FlightNoFuelParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FlightNoFuelParams',
      json,
      ($checkedConvert) {
        final val = FlightNoFuelParams(
          linearAccelerationModifier: $checkedConvert(
            'linear_acceleration_modifier',
            (v) => v as num?,
          ),
          angularAccelerationModifier: $checkedConvert(
            'angular_acceleration_modifier',
            (v) => v as num?,
          ),
          angularVelocityModifier: $checkedConvert(
            'angular_velocity_modifier',
            (v) => v as num?,
          ),
          legacyMaxSpeed: $checkedConvert('legacy_max_speed', (v) => v as num?),
        );
        return val;
      },
      fieldKeyMap: const {
        'linearAccelerationModifier': 'linear_acceleration_modifier',
        'angularAccelerationModifier': 'angular_acceleration_modifier',
        'angularVelocityModifier': 'angular_velocity_modifier',
        'legacyMaxSpeed': 'legacy_max_speed',
      },
    );

Map<String, dynamic> _$FlightNoFuelParamsToJson(FlightNoFuelParams instance) =>
    <String, dynamic>{
      'linear_acceleration_modifier': ?instance.linearAccelerationModifier,
      'angular_acceleration_modifier': ?instance.angularAccelerationModifier,
      'angular_velocity_modifier': ?instance.angularVelocityModifier,
      'legacy_max_speed': ?instance.legacyMaxSpeed,
    };
