// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_starmap_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionStarmapLocation _$MissionStarmapLocationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionStarmapLocation', json, ($checkedConvert) {
  final val = MissionStarmapLocation(
    uuid: $checkedConvert('uuid', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
    system: $checkedConvert('system', (v) => v as String?),
    type: $checkedConvert('type', (v) => v as String?),
    link: $checkedConvert('link', (v) => v as String?),
    webUrl: $checkedConvert('web_url', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'webUrl': 'web_url'});

Map<String, dynamic> _$MissionStarmapLocationToJson(
  MissionStarmapLocation instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'system': ?instance.system,
  'type': ?instance.type,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
