// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_aspect_selection_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintAspectSelectionGroup _$BlueprintAspectSelectionGroupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintAspectSelectionGroup',
  json,
  ($checkedConvert) {
    final val = BlueprintAspectSelectionGroup(
      key: $checkedConvert('key', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      requiredCount: $checkedConvert(
        'required_count',
        (v) => (v as num?)?.toInt(),
      ),
      optionCount: $checkedConvert('option_count', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'requiredCount': 'required_count',
    'optionCount': 'option_count',
  },
);

Map<String, dynamic> _$BlueprintAspectSelectionGroupToJson(
  BlueprintAspectSelectionGroup instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'name': ?instance.name,
  'required_count': ?instance.requiredCount,
  'option_count': ?instance.optionCount,
};
