// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationTag _$GameStarmapLocationTagFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameStarmapLocationTag', json, ($checkedConvert) {
  final val = GameStarmapLocationTag(
    uuid: $checkedConvert('uuid', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$GameStarmapLocationTagToJson(
  GameStarmapLocationTag instance,
) => <String, dynamic>{'uuid': ?instance.uuid, 'name': ?instance.name};
