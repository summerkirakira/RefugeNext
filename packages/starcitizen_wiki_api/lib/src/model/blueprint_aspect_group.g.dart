// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_aspect_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintAspectGroup _$BlueprintAspectGroupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintAspectGroup',
  json,
  ($checkedConvert) {
    final val = BlueprintAspectGroup(
      key: $checkedConvert('key', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      requiredCount: $checkedConvert(
        'required_count',
        (v) => (v as num?)?.toInt(),
      ),
      optionCount: $checkedConvert('option_count', (v) => (v as num?)?.toInt()),
      isChoiceGroup: $checkedConvert('is_choice_group', (v) => v as bool?),
      selectedCount: $checkedConvert(
        'selected_count',
        (v) => (v as num?)?.toInt(),
      ),
      aspectIndexes: $checkedConvert(
        'aspect_indexes',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'requiredCount': 'required_count',
    'optionCount': 'option_count',
    'isChoiceGroup': 'is_choice_group',
    'selectedCount': 'selected_count',
    'aspectIndexes': 'aspect_indexes',
  },
);

Map<String, dynamic> _$BlueprintAspectGroupToJson(
  BlueprintAspectGroup instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'name': ?instance.name,
  'display_name': ?instance.displayName,
  'required_count': ?instance.requiredCount,
  'option_count': ?instance.optionCount,
  'is_choice_group': ?instance.isChoiceGroup,
  'selected_count': ?instance.selectedCount,
  'aspect_indexes': ?instance.aspectIndexes,
};
