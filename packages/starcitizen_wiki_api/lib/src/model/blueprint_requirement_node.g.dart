// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_requirement_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintRequirementNode _$BlueprintRequirementNodeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintRequirementNode',
  json,
  ($checkedConvert) {
    final val = BlueprintRequirementNode(
      kind: $checkedConvert(
        'kind',
        (v) =>
            $enumDecodeNullable(_$BlueprintRequirementNodeKindEnumEnumMap, v),
      ),
      key: $checkedConvert('key', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
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
                  BlueprintRequirementNode.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$BlueprintRequirementNodeToJson(
  BlueprintRequirementNode instance,
) => <String, dynamic>{
  'kind': ?_$BlueprintRequirementNodeKindEnumEnumMap[instance.kind],
  'key': ?instance.key,
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'required_count': ?instance.requiredCount,
  'quantity': ?instance.quantity,
  'quantity_scu': ?instance.quantityScu,
  'min_quality': ?instance.minQuality,
  'modifiers': ?instance.modifiers?.map((e) => e.toJson()).toList(),
  'children': ?instance.children?.map((e) => e.toJson()).toList(),
};

const _$BlueprintRequirementNodeKindEnumEnumMap = {
  BlueprintRequirementNodeKindEnum.root: 'root',
  BlueprintRequirementNodeKindEnum.group: 'group',
  BlueprintRequirementNodeKindEnum.resource: 'resource',
  BlueprintRequirementNodeKindEnum.item: 'item',
};
