// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_resistance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureResistance _$TemperatureResistanceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TemperatureResistance', json, ($checkedConvert) {
  final val = TemperatureResistance(
    min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
    max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
    minimum: $checkedConvert('minimum', (v) => (v as num?)?.toDouble()),
    maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$TemperatureResistanceToJson(
  TemperatureResistance instance,
) => <String, dynamic>{
  'min': ?instance.min,
  'max': ?instance.max,
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
