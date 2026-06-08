// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_ejection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatEjection _$SeatEjectionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SeatEjection',
      json,
      ($checkedConvert) {
        final val = SeatEjection(
          maxLinearVelocity: $checkedConvert(
            'max_linear_velocity',
            (v) => (v as num?)?.toDouble(),
          ),
          maxLinearAcceleration: $checkedConvert(
            'max_linear_acceleration',
            (v) => (v as num?)?.toDouble(),
          ),
          maxAngularVelocity: $checkedConvert(
            'max_angular_velocity',
            (v) => (v as num?)?.toDouble(),
          ),
          maxAngularAcceleration: $checkedConvert(
            'max_angular_acceleration',
            (v) => (v as num?)?.toDouble(),
          ),
          ejectionLoopTime: $checkedConvert(
            'ejection_loop_time',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxLinearVelocity': 'max_linear_velocity',
        'maxLinearAcceleration': 'max_linear_acceleration',
        'maxAngularVelocity': 'max_angular_velocity',
        'maxAngularAcceleration': 'max_angular_acceleration',
        'ejectionLoopTime': 'ejection_loop_time',
      },
    );

Map<String, dynamic> _$SeatEjectionToJson(SeatEjection instance) =>
    <String, dynamic>{
      'max_linear_velocity': ?instance.maxLinearVelocity,
      'max_linear_acceleration': ?instance.maxLinearAcceleration,
      'max_angular_velocity': ?instance.maxAngularVelocity,
      'max_angular_acceleration': ?instance.maxAngularAcceleration,
      'ejection_loop_time': ?instance.ejectionLoopTime,
    };
