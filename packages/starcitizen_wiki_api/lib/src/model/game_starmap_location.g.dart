// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocation _$GameStarmapLocationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameStarmapLocation',
  json,
  ($checkedConvert) {
    final val = GameStarmapLocation(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      size: $checkedConvert('size', (v) => v as num?),
      respawnLocationType: $checkedConvert(
        'respawn_location_type',
        (v) => v as String?,
      ),
      childCount: $checkedConvert('child_count', (v) => (v as num?)?.toInt()),
      hasResources: $checkedConvert('has_resources', (v) => v as bool?),
      missionCount: $checkedConvert(
        'mission_count',
        (v) => (v as num?)?.toInt(),
      ),
      isScannable: $checkedConvert('is_scannable', (v) => v as bool?),
      hideInStarmap: $checkedConvert('hide_in_starmap', (v) => v as bool?),
      hideInWorld: $checkedConvert('hide_in_world', (v) => v as bool?),
      blockTravel: $checkedConvert('block_travel', (v) => v as bool?),
      quantumTravel: $checkedConvert(
        'quantum_travel',
        (v) => v == null
            ? null
            : GameStarmapLocationQuantumTravel.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      asteroidRing: $checkedConvert(
        'asteroid_ring',
        (v) => v == null
            ? null
            : GameStarmapLocationAsteroidRing.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      system: $checkedConvert('system', (v) => v as String?),
      parent: $checkedConvert(
        'parent',
        (v) => v == null
            ? null
            : GameStarmapLocationLinkedSummary.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      star: $checkedConvert(
        'star',
        (v) => v == null
            ? null
            : GameStarmapLocationLinkedSummary.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      children: $checkedConvert(
        'children',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameStarmapLocationChildSummary.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      type: $checkedConvert(
        'type',
        (v) => v == null
            ? null
            : GameStarmapLocationType.fromJson(v as Map<String, dynamic>),
      ),
      jurisdiction: $checkedConvert(
        'jurisdiction',
        (v) => v == null
            ? null
            : GameStarmapLocationJurisdiction.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      affiliation: $checkedConvert(
        'affiliation',
        (v) => v == null
            ? null
            : GameStarmapLocationAffiliation.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      amenities: $checkedConvert(
        'amenities',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameStarmapLocationAmenity.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      tag: $checkedConvert(
        'tag',
        (v) => v == null
            ? null
            : GameStarmapLocationTag.fromJson(v as Map<String, dynamic>),
      ),
      designation: $checkedConvert('designation', (v) => v as String?),
      radarContactType: $checkedConvert(
        'radar_contact_type',
        (v) => v == null
            ? null
            : GameStarmapLocationRadarContactType.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => v as String?),
      images: $checkedConvert(
        'images',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameStarmapLocationImagesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      areaBoosts: $checkedConvert(
        'area_boosts',
        (v) => (v as List<dynamic>?)
            ?.map((e) => AreaBoost.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      resources: $checkedConvert(
        'resources',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => StarmapLocationMiningTypeGroup.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      missions: $checkedConvert(
        'missions',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameStarmapLocationMissionGroup.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'respawnLocationType': 'respawn_location_type',
    'childCount': 'child_count',
    'hasResources': 'has_resources',
    'missionCount': 'mission_count',
    'isScannable': 'is_scannable',
    'hideInStarmap': 'hide_in_starmap',
    'hideInWorld': 'hide_in_world',
    'blockTravel': 'block_travel',
    'quantumTravel': 'quantum_travel',
    'asteroidRing': 'asteroid_ring',
    'radarContactType': 'radar_contact_type',
    'webUrl': 'web_url',
    'updatedAt': 'updated_at',
    'areaBoosts': 'area_boosts',
  },
);

Map<String, dynamic> _$GameStarmapLocationToJson(
  GameStarmapLocation instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'slug': ?instance.slug,
  'name': ?instance.name,
  'description': ?instance.description,
  'size': ?instance.size,
  'respawn_location_type': ?instance.respawnLocationType,
  'child_count': ?instance.childCount,
  'has_resources': ?instance.hasResources,
  'mission_count': ?instance.missionCount,
  'is_scannable': ?instance.isScannable,
  'hide_in_starmap': ?instance.hideInStarmap,
  'hide_in_world': ?instance.hideInWorld,
  'block_travel': ?instance.blockTravel,
  'quantum_travel': ?instance.quantumTravel?.toJson(),
  'asteroid_ring': ?instance.asteroidRing?.toJson(),
  'system': ?instance.system,
  'parent': ?instance.parent?.toJson(),
  'star': ?instance.star?.toJson(),
  'children': ?instance.children?.map((e) => e.toJson()).toList(),
  'type': ?instance.type?.toJson(),
  'jurisdiction': ?instance.jurisdiction?.toJson(),
  'affiliation': ?instance.affiliation?.toJson(),
  'amenities': ?instance.amenities?.map((e) => e.toJson()).toList(),
  'tag': ?instance.tag?.toJson(),
  'designation': ?instance.designation,
  'radar_contact_type': ?instance.radarContactType?.toJson(),
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
  'updated_at': ?instance.updatedAt?.toIso8601String(),
  'version': ?instance.version,
  'images': ?instance.images?.map((e) => e.toJson()).toList(),
  'area_boosts': ?instance.areaBoosts?.map((e) => e.toJson()).toList(),
  'resources': ?instance.resources?.map((e) => e.toJson()).toList(),
  'missions': ?instance.missions?.map((e) => e.toJson()).toList(),
};
