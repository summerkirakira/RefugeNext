// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_axis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatAxis _$SeatAxisFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SeatAxis', json, ($checkedConvert) {
      final val = SeatAxis(
        min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
        max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
        minimum: $checkedConvert('minimum', (v) => (v as num?)?.toDouble()),
        maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$SeatAxisToJson(SeatAxis instance) => <String, dynamic>{
  'min': ?instance.min,
  'max': ?instance.max,
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
