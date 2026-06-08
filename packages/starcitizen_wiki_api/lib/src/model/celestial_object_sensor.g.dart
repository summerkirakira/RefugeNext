// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celestial_object_sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CelestialObjectSensor _$CelestialObjectSensorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CelestialObjectSensor', json, ($checkedConvert) {
  final val = CelestialObjectSensor(
    population: $checkedConvert('population', (v) => (v as num?)?.toDouble()),
    economy: $checkedConvert('economy', (v) => (v as num?)?.toDouble()),
    danger: $checkedConvert('danger', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$CelestialObjectSensorToJson(
  CelestialObjectSensor instance,
) => <String, dynamic>{
  'population': ?instance.population,
  'economy': ?instance.economy,
  'danger': ?instance.danger,
};
