// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_measure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CounterMeasure _$CounterMeasureFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CounterMeasure', json, ($checkedConvert) {
      final val = CounterMeasure(
        type: $checkedConvert('type', (v) => v as String?),
        signature: $checkedConvert(
          'signature',
          (v) => v == null
              ? null
              : CounterMeasureSignature.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CounterMeasureToJson(CounterMeasure instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'signature': ?instance.signature?.toJson(),
    };
