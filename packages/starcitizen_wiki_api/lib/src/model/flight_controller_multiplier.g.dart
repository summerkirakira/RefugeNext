// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_multiplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerMultiplier _$FlightControllerMultiplierFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerMultiplier',
  json,
  ($checkedConvert) {
    final val = FlightControllerMultiplier(
      torqueImbalance: $checkedConvert(
        'torque_imbalance',
        (v) => (v as num?)?.toDouble(),
      ),
      lift: $checkedConvert('lift', (v) => (v as num?)?.toDouble()),
      drag: $checkedConvert('drag', (v) => (v as num?)?.toDouble()),
      scmMaxDrag: $checkedConvert(
        'scm_max_drag',
        (v) => (v as num?)?.toDouble(),
      ),
      precisionLanding: $checkedConvert(
        'precision_landing',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'torqueImbalance': 'torque_imbalance',
    'scmMaxDrag': 'scm_max_drag',
    'precisionLanding': 'precision_landing',
  },
);

Map<String, dynamic> _$FlightControllerMultiplierToJson(
  FlightControllerMultiplier instance,
) => <String, dynamic>{
  'torque_imbalance': ?instance.torqueImbalance,
  'lift': ?instance.lift,
  'drag': ?instance.drag,
  'scm_max_drag': ?instance.scmMaxDrag,
  'precision_landing': ?instance.precisionLanding,
};
