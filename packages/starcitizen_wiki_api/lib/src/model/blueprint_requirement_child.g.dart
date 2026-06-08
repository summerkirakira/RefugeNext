// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_requirement_child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintRequirementChild _$BlueprintRequirementChildFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintRequirementChild',
  json,
  ($checkedConvert) {
    final val = BlueprintRequirementChild(
      key: $checkedConvert('key', (v) => v as String?),
      kind: $checkedConvert(
        'kind',
        (v) =>
            $enumDecodeNullable(_$BlueprintRequirementChildKindEnumEnumMap, v),
      ),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      requiredCount: $checkedConvert(
        'required_count',
        (v) => (v as num?)?.toInt(),
      ),
      quantity: $checkedConvert('quantity', (v) => (v as num?)?.toDouble()),
      quantityScu: $checkedConvert(
        'quantity_scu',
        (v) => (v as num?)?.toDouble(),
      ),
      minQuality: $checkedConvert('min_quality', (v) => (v as num?)?.toInt()),
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
  fieldKeyMap: const {
    'requiredCount': 'required_count',
    'quantityScu': 'quantity_scu',
    'minQuality': 'min_quality',
  },
);

Map<String, dynamic> _$BlueprintRequirementChildToJson(
  BlueprintRequirementChild instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'kind': ?_$BlueprintRequirementChildKindEnumEnumMap[instance.kind],
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'required_count': ?instance.requiredCount,
  'quantity': ?instance.quantity,
  'quantity_scu': ?instance.quantityScu,
  'min_quality': ?instance.minQuality,
  'modifiers': ?instance.modifiers?.map((e) => e.toJson()).toList(),
  'children': ?instance.children?.map((e) => e.toJson()).toList(),
};

const _$BlueprintRequirementChildKindEnumEnumMap = {
  BlueprintRequirementChildKindEnum.group: 'group',
  BlueprintRequirementChildKindEnum.resource: 'resource',
  BlueprintRequirementChildKindEnum.item: 'item',
};
