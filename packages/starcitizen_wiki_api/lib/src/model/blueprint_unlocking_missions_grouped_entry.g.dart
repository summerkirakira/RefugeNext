// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_unlocking_missions_grouped_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintUnlockingMissionsGroupedEntry
_$BlueprintUnlockingMissionsGroupedEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BlueprintUnlockingMissionsGroupedEntry',
      json,
      ($checkedConvert) {
        final val = BlueprintUnlockingMissionsGroupedEntry(
          title: $checkedConvert('title', (v) => v as String?),
          rewardScope: $checkedConvert('reward_scope', (v) => v as String?),
          count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
          webUrl: $checkedConvert('web_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'rewardScope': 'reward_scope', 'webUrl': 'web_url'},
    );

Map<String, dynamic> _$BlueprintUnlockingMissionsGroupedEntryToJson(
  BlueprintUnlockingMissionsGroupedEntry instance,
) => <String, dynamic>{
  'title': ?instance.title,
  'reward_scope': ?instance.rewardScope,
  'count': ?instance.count,
  'web_url': ?instance.webUrl,
};
