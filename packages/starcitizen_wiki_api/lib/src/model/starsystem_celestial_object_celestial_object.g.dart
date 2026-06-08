// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starsystem_celestial_object_celestial_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarsystemCelestialObjectCelestialObject
_$StarsystemCelestialObjectCelestialObjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StarsystemCelestialObjectCelestialObject', json, (
      $checkedConvert,
    ) {
      final val = StarsystemCelestialObjectCelestialObject(
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : CelestialObject.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$StarsystemCelestialObjectCelestialObjectToJson(
  StarsystemCelestialObjectCelestialObject instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
