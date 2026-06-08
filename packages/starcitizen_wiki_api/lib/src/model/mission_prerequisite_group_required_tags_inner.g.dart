// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_prerequisite_group_required_tags_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionPrerequisiteGroupRequiredTagsInner
_$MissionPrerequisiteGroupRequiredTagsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionPrerequisiteGroupRequiredTagsInner', json, (
  $checkedConvert,
) {
  final val = MissionPrerequisiteGroupRequiredTagsInner(
    name: $checkedConvert('name', (v) => v as String?),
    uuid: $checkedConvert('uuid', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$MissionPrerequisiteGroupRequiredTagsInnerToJson(
  MissionPrerequisiteGroupRequiredTagsInner instance,
) => <String, dynamic>{'name': ?instance.name, 'uuid': ?instance.uuid};
