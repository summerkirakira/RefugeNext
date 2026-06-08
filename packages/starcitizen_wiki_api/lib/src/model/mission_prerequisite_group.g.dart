// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_prerequisite_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionPrerequisiteGroup _$MissionPrerequisiteGroupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionPrerequisiteGroup',
  json,
  ($checkedConvert) {
    final val = MissionPrerequisiteGroup(
      requiredCount: $checkedConvert(
        'required_count',
        (v) => (v as num?)?.toInt(),
      ),
      requiredTags: $checkedConvert(
        'required_tags',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionPrerequisiteGroupRequiredTagsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      excludedTags: $checkedConvert(
        'excluded_tags',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionPrerequisiteGroupRequiredTagsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      missions: $checkedConvert(
        'missions',
        (v) => (v as List<dynamic>?)
            ?.map((e) => MissionChainLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'requiredCount': 'required_count',
    'requiredTags': 'required_tags',
    'excludedTags': 'excluded_tags',
  },
);

Map<String, dynamic> _$MissionPrerequisiteGroupToJson(
  MissionPrerequisiteGroup instance,
) => <String, dynamic>{
  'required_count': ?instance.requiredCount,
  'required_tags': ?instance.requiredTags?.map((e) => e.toJson()).toList(),
  'excluded_tags': ?instance.excludedTags?.map((e) => e.toJson()).toList(),
  'missions': ?instance.missions?.map((e) => e.toJson()).toList(),
};
