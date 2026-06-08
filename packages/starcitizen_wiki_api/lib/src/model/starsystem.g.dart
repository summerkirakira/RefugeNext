// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starsystem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Starsystem _$StarsystemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Starsystem',
  json,
  ($checkedConvert) {
    final val = Starsystem(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      code: $checkedConvert('code', (v) => v as String?),
      systemApiUrl: $checkedConvert('system_api_url', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      status: $checkedConvert('status', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      position: $checkedConvert(
        'position',
        (v) => v == null
            ? null
            : StarsystemPosition.fromJson(v as Map<String, dynamic>),
      ),
      frostLine: $checkedConvert('frost_line', (v) => (v as num?)?.toDouble()),
      habitableZoneInner: $checkedConvert(
        'habitable_zone_inner',
        (v) => (v as num?)?.toDouble(),
      ),
      habitableZoneOuter: $checkedConvert(
        'habitable_zone_outer',
        (v) => (v as num?)?.toDouble(),
      ),
      infoUrl: $checkedConvert('info_url', (v) => v as String?),
      description: $checkedConvert('description', (v) => v),
      aggregated: $checkedConvert(
        'aggregated',
        (v) => v == null
            ? null
            : StarsystemAggregated.fromJson(v as Map<String, dynamic>),
      ),
      timeModified: $checkedConvert('time_modified', (v) => v as String?),
      celestialObject: $checkedConvert(
        'celestial_object',
        (v) => v == null
            ? null
            : StarsystemCelestialObject.fromJson(v as Map<String, dynamic>),
      ),
      jumppoints: $checkedConvert(
        'jumppoints',
        (v) => v == null
            ? null
            : StarsystemJumppoints.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'systemApiUrl': 'system_api_url',
    'webUrl': 'web_url',
    'frostLine': 'frost_line',
    'habitableZoneInner': 'habitable_zone_inner',
    'habitableZoneOuter': 'habitable_zone_outer',
    'infoUrl': 'info_url',
    'timeModified': 'time_modified',
    'celestialObject': 'celestial_object',
  },
);

Map<String, dynamic> _$StarsystemToJson(Starsystem instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'code': ?instance.code,
      'system_api_url': ?instance.systemApiUrl,
      'name': ?instance.name,
      'status': ?instance.status,
      'type': ?instance.type,
      'web_url': ?instance.webUrl,
      'position': ?instance.position?.toJson(),
      'frost_line': ?instance.frostLine,
      'habitable_zone_inner': ?instance.habitableZoneInner,
      'habitable_zone_outer': ?instance.habitableZoneOuter,
      'info_url': ?instance.infoUrl,
      'description': ?instance.description,
      'aggregated': ?instance.aggregated?.toJson(),
      'time_modified': ?instance.timeModified,
      'celestial_object': ?instance.celestialObject?.toJson(),
      'jumppoints': ?instance.jumppoints?.toJson(),
    };
