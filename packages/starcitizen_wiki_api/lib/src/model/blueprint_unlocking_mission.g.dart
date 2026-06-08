// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_unlocking_mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintUnlockingMission _$BlueprintUnlockingMissionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintUnlockingMission',
  json,
  ($checkedConvert) {
    final val = BlueprintUnlockingMission(
      title: $checkedConvert('title', (v) => v as String?),
      debugName: $checkedConvert('debug_name', (v) => v as String?),
      rewardScope: $checkedConvert('reward_scope', (v) => v as String?),
      chance: $checkedConvert('chance', (v) => (v as num?)?.toDouble()),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'debugName': 'debug_name',
    'rewardScope': 'reward_scope',
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$BlueprintUnlockingMissionToJson(
  BlueprintUnlockingMission instance,
) => <String, dynamic>{
  'title': ?instance.title,
  'debug_name': ?instance.debugName,
  'reward_scope': ?instance.rewardScope,
  'chance': ?instance.chance,
  'web_url': ?instance.webUrl,
};
