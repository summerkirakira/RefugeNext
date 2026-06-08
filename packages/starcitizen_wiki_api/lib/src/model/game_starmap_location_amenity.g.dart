// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_amenity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationAmenity _$GameStarmapLocationAmenityFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameStarmapLocationAmenity',
  json,
  ($checkedConvert) {
    final val = GameStarmapLocationAmenity(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'displayName': 'display_name'},
);

Map<String, dynamic> _$GameStarmapLocationAmenityToJson(
  GameStarmapLocationAmenity instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'display_name': ?instance.displayName,
};
