// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_completion_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCompletionTag _$MissionCompletionTagFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionCompletionTag',
  json,
  ($checkedConvert) {
    final val = MissionCompletionTag(
      name: $checkedConvert('name', (v) => v as String?),
      unlocksMissions: $checkedConvert(
        'unlocks_missions',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionCompletionTagMission.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'unlocksMissions': 'unlocks_missions'},
);

Map<String, dynamic> _$MissionCompletionTagToJson(
  MissionCompletionTag instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'unlocks_missions': ?instance.unlocksMissions
      ?.map((e) => e.toJson())
      .toList(),
};
