// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_signed_axis_multiplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerSignedAxisMultiplier
_$FlightControllerSignedAxisMultiplierFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FlightControllerSignedAxisMultiplier', json, (
      $checkedConvert,
    ) {
      final val = FlightControllerSignedAxisMultiplier(
        positive: $checkedConvert('positive', (v) => (v as num?)?.toDouble()),
        negative: $checkedConvert('negative', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$FlightControllerSignedAxisMultiplierToJson(
  FlightControllerSignedAxisMultiplier instance,
) => <String, dynamic>{
  'positive': ?instance.positive,
  'negative': ?instance.negative,
};
