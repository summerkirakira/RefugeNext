// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celestial_object_starsystem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CelestialObjectStarsystem _$CelestialObjectStarsystemFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CelestialObjectStarsystem', json, ($checkedConvert) {
  final val = CelestialObjectStarsystem(
    id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
    code: $checkedConvert('code', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$CelestialObjectStarsystemToJson(
  CelestialObjectStarsystem instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'code': ?instance.code,
  'name': ?instance.name,
};
