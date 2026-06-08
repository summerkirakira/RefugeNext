// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_boost_activation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerBoostActivation _$FlightControllerBoostActivationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerBoostActivation',
  json,
  ($checkedConvert) {
    final val = FlightControllerBoostActivation(
      preDelayTime: $checkedConvert(
        'pre_delay_time',
        (v) => (v as num?)?.toDouble(),
      ),
      rampUpTime: $checkedConvert(
        'ramp_up_time',
        (v) => (v as num?)?.toDouble(),
      ),
      rampDownTime: $checkedConvert(
        'ramp_down_time',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'preDelayTime': 'pre_delay_time',
    'rampUpTime': 'ramp_up_time',
    'rampDownTime': 'ramp_down_time',
  },
);

Map<String, dynamic> _$FlightControllerBoostActivationToJson(
  FlightControllerBoostActivation instance,
) => <String, dynamic>{
  'pre_delay_time': ?instance.preDelayTime,
  'ramp_up_time': ?instance.rampUpTime,
  'ramp_down_time': ?instance.rampDownTime,
};
