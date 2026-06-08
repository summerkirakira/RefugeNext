// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_measure_signature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CounterMeasureSignature _$CounterMeasureSignatureFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CounterMeasureSignature',
  json,
  ($checkedConvert) {
    final val = CounterMeasureSignature(
      infrared: $checkedConvert('infrared', (v) => (v as num?)?.toDouble()),
      crossSection: $checkedConvert(
        'cross_section',
        (v) => (v as num?)?.toDouble(),
      ),
      electromagnetic: $checkedConvert(
        'electromagnetic',
        (v) => (v as num?)?.toDouble(),
      ),
      decibel: $checkedConvert('decibel', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {'crossSection': 'cross_section'},
);

Map<String, dynamic> _$CounterMeasureSignatureToJson(
  CounterMeasureSignature instance,
) => <String, dynamic>{
  'infrared': ?instance.infrared,
  'cross_section': ?instance.crossSection,
  'electromagnetic': ?instance.electromagnetic,
  'decibel': ?instance.decibel,
};
