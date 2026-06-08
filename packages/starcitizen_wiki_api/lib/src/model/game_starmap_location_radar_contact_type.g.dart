// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_radar_contact_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationRadarContactType
_$GameStarmapLocationRadarContactTypeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameStarmapLocationRadarContactType',
      json,
      ($checkedConvert) {
        final val = GameStarmapLocationRadarContactType(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          displayName: $checkedConvert('display_name', (v) => v as String?),
          tagUuid: $checkedConvert('tag_uuid', (v) => v as String?),
          tagName: $checkedConvert('tag_name', (v) => v as String?),
          isObjectOfInterest: $checkedConvert(
            'is_object_of_interest',
            (v) => v as bool?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'displayName': 'display_name',
        'tagUuid': 'tag_uuid',
        'tagName': 'tag_name',
        'isObjectOfInterest': 'is_object_of_interest',
      },
    );

Map<String, dynamic> _$GameStarmapLocationRadarContactTypeToJson(
  GameStarmapLocationRadarContactType instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'display_name': ?instance.displayName,
  'tag_uuid': ?instance.tagUuid,
  'tag_name': ?instance.tagName,
  'is_object_of_interest': ?instance.isObjectOfInterest,
};
