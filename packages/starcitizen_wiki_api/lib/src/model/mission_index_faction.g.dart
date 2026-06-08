// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_index_faction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionIndexFaction _$MissionIndexFactionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MissionIndexFaction', json, ($checkedConvert) {
      final val = MissionIndexFaction(
        name: $checkedConvert('name', (v) => v as String?),
        uuid: $checkedConvert('uuid', (v) => v as String?),
        link: $checkedConvert('link', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$MissionIndexFactionToJson(
  MissionIndexFaction instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'link': ?instance.link,
};
