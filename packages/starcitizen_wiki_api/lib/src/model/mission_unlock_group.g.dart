// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_unlock_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionUnlockGroup _$MissionUnlockGroupFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionUnlockGroup',
      json,
      ($checkedConvert) {
        final val = MissionUnlockGroup(
          tagName: $checkedConvert('tag_name', (v) => v as String?),
          tagUuid: $checkedConvert('tag_uuid', (v) => v as String?),
          missions: $checkedConvert(
            'missions',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => MissionChainLink.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'tagName': 'tag_name', 'tagUuid': 'tag_uuid'},
    );

Map<String, dynamic> _$MissionUnlockGroupToJson(MissionUnlockGroup instance) =>
    <String, dynamic>{
      'tag_name': ?instance.tagName,
      'tag_uuid': ?instance.tagUuid,
      'missions': ?instance.missions?.map((e) => e.toJson()).toList(),
    };
