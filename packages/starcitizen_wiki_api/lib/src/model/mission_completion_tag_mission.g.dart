// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_completion_tag_mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCompletionTagMission _$MissionCompletionTagMissionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionCompletionTagMission', json, ($checkedConvert) {
  final val = MissionCompletionTagMission(
    uuid: $checkedConvert('uuid', (v) => v as String?),
    title: $checkedConvert('title', (v) => v as String?),
    link: $checkedConvert('link', (v) => v as String?),
    webUrl: $checkedConvert('web_url', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'webUrl': 'web_url'});

Map<String, dynamic> _$MissionCompletionTagMissionToJson(
  MissionCompletionTagMission instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'title': ?instance.title,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
