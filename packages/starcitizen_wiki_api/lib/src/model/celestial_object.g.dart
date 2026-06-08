// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celestial_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CelestialObject _$CelestialObjectFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CelestialObject',
  json,
  ($checkedConvert) {
    final val = CelestialObject(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      code: $checkedConvert('code', (v) => v as String?),
      systemId: $checkedConvert('system_id', (v) => (v as num?)?.toInt()),
      celestialObjectApiUrl: $checkedConvert(
        'celestial_object_api_url',
        (v) => v as String?,
      ),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      age: $checkedConvert('age', (v) => (v as num?)?.toInt()),
      habitable: $checkedConvert('habitable', (v) => v as bool?),
      fairchanceact: $checkedConvert('fairchanceact', (v) => v as bool?),
      appearance: $checkedConvert('appearance', (v) => v as String?),
      designation: $checkedConvert('designation', (v) => v as String?),
      distance: $checkedConvert('distance', (v) => (v as num?)?.toDouble()),
      latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
      longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
      axialTilt: $checkedConvert('axial_tilt', (v) => (v as num?)?.toDouble()),
      orbitPeriod: $checkedConvert(
        'orbit_period',
        (v) => (v as num?)?.toDouble(),
      ),
      infoUrl: $checkedConvert('info_url', (v) => v as String?),
      description: $checkedConvert('description', (v) => v),
      sensor: $checkedConvert(
        'sensor',
        (v) => v == null
            ? null
            : CelestialObjectSensor.fromJson(v as Map<String, dynamic>),
      ),
      size: $checkedConvert('size', (v) => (v as num?)?.toDouble()),
      parentId: $checkedConvert('parent_id', (v) => (v as num?)?.toInt()),
      starsystem: $checkedConvert(
        'starsystem',
        (v) => v == null
            ? null
            : CelestialObjectStarsystem.fromJson(v as Map<String, dynamic>),
      ),
      timeModified: $checkedConvert('time_modified', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'systemId': 'system_id',
    'celestialObjectApiUrl': 'celestial_object_api_url',
    'webUrl': 'web_url',
    'axialTilt': 'axial_tilt',
    'orbitPeriod': 'orbit_period',
    'infoUrl': 'info_url',
    'parentId': 'parent_id',
    'timeModified': 'time_modified',
  },
);

Map<String, dynamic> _$CelestialObjectToJson(CelestialObject instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'code': ?instance.code,
      'system_id': ?instance.systemId,
      'celestial_object_api_url': ?instance.celestialObjectApiUrl,
      'web_url': ?instance.webUrl,
      'name': ?instance.name,
      'type': ?instance.type,
      'age': ?instance.age,
      'habitable': ?instance.habitable,
      'fairchanceact': ?instance.fairchanceact,
      'appearance': ?instance.appearance,
      'designation': ?instance.designation,
      'distance': ?instance.distance,
      'latitude': ?instance.latitude,
      'longitude': ?instance.longitude,
      'axial_tilt': ?instance.axialTilt,
      'orbit_period': ?instance.orbitPeriod,
      'info_url': ?instance.infoUrl,
      'description': ?instance.description,
      'sensor': ?instance.sensor?.toJson(),
      'size': ?instance.size,
      'parent_id': ?instance.parentId,
      'starsystem': ?instance.starsystem?.toJson(),
      'time_modified': ?instance.timeModified,
    };
