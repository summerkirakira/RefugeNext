// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_requirement_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintRequirementGroup _$BlueprintRequirementGroupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintRequirementGroup',
  json,
  ($checkedConvert) {
    final val = BlueprintRequirementGroup(
      key: $checkedConvert('key', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      kind: $checkedConvert(
        'kind',
        (v) =>
            $enumDecodeNullable(_$BlueprintRequirementGroupKindEnumEnumMap, v),
      ),
      requiredCount: $checkedConvert(
        'required_count',
        (v) => (v as num?)?.toInt(),
      ),
      modifiers: $checkedConvert(
        'modifiers',
        (v) => (v as List<dynamic>?)
            ?.map((e) => BlueprintModifier.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      children: $checkedConvert(
        'children',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  BlueprintRequirementChild.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'requiredCount': 'required_count'},
);

Map<String, dynamic> _$BlueprintRequirementGroupToJson(
  BlueprintRequirementGroup instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'name': ?instance.name,
  'kind': ?_$BlueprintRequirementGroupKindEnumEnumMap[instance.kind],
  'required_count': ?instance.requiredCount,
  'modifiers': ?instance.modifiers?.map((e) => e.toJson()).toList(),
  'children': ?instance.children?.map((e) => e.toJson()).toList(),
};

const _$BlueprintRequirementGroupKindEnumEnumMap = {
  BlueprintRequirementGroupKindEnum.group: 'group',
};
