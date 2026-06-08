// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_child_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationChildSummary _$GameStarmapLocationChildSummaryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameStarmapLocationChildSummary',
  json,
  ($checkedConvert) {
    final val = GameStarmapLocationChildSummary(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      designation: $checkedConvert('designation', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      typeName: $checkedConvert('type_name', (v) => v as String?),
      typeClassification: $checkedConvert(
        'type_classification',
        (v) => v as String?,
      ),
      respawnLocationType: $checkedConvert(
        'respawn_location_type',
        (v) => v as String?,
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
      amenityLabels: $checkedConvert(
        'amenity_labels',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      hasResources: $checkedConvert('has_resources', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'webUrl': 'web_url',
    'typeName': 'type_name',
    'typeClassification': 'type_classification',
    'respawnLocationType': 'respawn_location_type',
    'amenityLabels': 'amenity_labels',
    'hasResources': 'has_resources',
  },
);

Map<String, dynamic> _$GameStarmapLocationChildSummaryToJson(
  GameStarmapLocationChildSummary instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'designation': ?instance.designation,
  'web_url': ?instance.webUrl,
  'type_name': ?instance.typeName,
  'type_classification': ?instance.typeClassification,
  'respawn_location_type': ?instance.respawnLocationType,
  'amenities': ?instance.amenities?.map((e) => e.toJson()).toList(),
  'amenity_labels': ?instance.amenityLabels,
  'has_resources': ?instance.hasResources,
};
