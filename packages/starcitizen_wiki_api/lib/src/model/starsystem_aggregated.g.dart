// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starsystem_aggregated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarsystemAggregated _$StarsystemAggregatedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('StarsystemAggregated', json, ($checkedConvert) {
  final val = StarsystemAggregated(
    size: $checkedConvert('size', (v) => (v as num?)?.toDouble()),
    population: $checkedConvert('population', (v) => (v as num?)?.toDouble()),
    economy: $checkedConvert('economy', (v) => (v as num?)?.toDouble()),
    danger: $checkedConvert('danger', (v) => (v as num?)?.toDouble()),
    stars: $checkedConvert('stars', (v) => (v as num?)?.toInt()),
    planets: $checkedConvert('planets', (v) => (v as num?)?.toInt()),
    moons: $checkedConvert('moons', (v) => (v as num?)?.toInt()),
    stations: $checkedConvert('stations', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$StarsystemAggregatedToJson(
  StarsystemAggregated instance,
) => <String, dynamic>{
  'size': ?instance.size,
  'population': ?instance.population,
  'economy': ?instance.economy,
  'danger': ?instance.danger,
  'stars': ?instance.stars,
  'planets': ?instance.planets,
  'moons': ?instance.moons,
  'stations': ?instance.stations,
};
