// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionSummary _$MissionSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionSummary',
      json,
      ($checkedConvert) {
        final val = MissionSummary(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          missionType: $checkedConvert('mission_type', (v) => v as String?),
          illegal: $checkedConvert('illegal', (v) => v as bool?),
          hasCombat: $checkedConvert('has_combat', (v) => v as bool?),
          faction: $checkedConvert(
            'faction',
            (v) => v == null
                ? null
                : MissionIndexFaction.fromJson(v as Map<String, dynamic>),
          ),
          link: $checkedConvert('link', (v) => v as String?),
          webUrl: $checkedConvert('web_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'missionType': 'mission_type',
        'hasCombat': 'has_combat',
        'webUrl': 'web_url',
      },
    );

Map<String, dynamic> _$MissionSummaryToJson(MissionSummary instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'title': ?instance.title,
      'mission_type': ?instance.missionType,
      'illegal': ?instance.illegal,
      'has_combat': ?instance.hasCombat,
      'faction': ?instance.faction?.toJson(),
      'link': ?instance.link,
      'web_url': ?instance.webUrl,
    };
