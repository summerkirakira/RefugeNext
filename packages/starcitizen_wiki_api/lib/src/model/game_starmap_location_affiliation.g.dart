// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_affiliation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationAffiliation _$GameStarmapLocationAffiliationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameStarmapLocationAffiliation', json, ($checkedConvert) {
  final val = GameStarmapLocationAffiliation(
    uuid: $checkedConvert('uuid', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$GameStarmapLocationAffiliationToJson(
  GameStarmapLocationAffiliation instance,
) => <String, dynamic>{'uuid': ?instance.uuid, 'name': ?instance.name};
