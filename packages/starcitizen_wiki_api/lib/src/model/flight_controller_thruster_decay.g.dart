// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_thruster_decay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerThrusterDecay _$FlightControllerThrusterDecayFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerThrusterDecay',
  json,
  ($checkedConvert) {
    final val = FlightControllerThrusterDecay(
      linearAccel: $checkedConvert(
        'linear_accel',
        (v) => (v as num?)?.toDouble(),
      ),
      angularAccel: $checkedConvert(
        'angular_accel',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'linearAccel': 'linear_accel',
    'angularAccel': 'angular_accel',
  },
);

Map<String, dynamic> _$FlightControllerThrusterDecayToJson(
  FlightControllerThrusterDecay instance,
) => <String, dynamic>{
  'linear_accel': ?instance.linearAccel,
  'angular_accel': ?instance.angularAccel,
};
