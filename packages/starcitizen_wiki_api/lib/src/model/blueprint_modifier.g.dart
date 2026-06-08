// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintModifier _$BlueprintModifierFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintModifier',
  json,
  ($checkedConvert) {
    final val = BlueprintModifier(
      propertyKey: $checkedConvert('property_key', (v) => v as String?),
      propertyUuid: $checkedConvert('property_uuid', (v) => v as String?),
      label: $checkedConvert('label', (v) => v as String?),
      betterWhen: $checkedConvert(
        'better_when',
        (v) => $enumDecodeNullable(_$BlueprintModifierBetterWhenEnumEnumMap, v),
      ),
      qualityRange: $checkedConvert(
        'quality_range',
        (v) => v == null
            ? null
            : BlueprintModifierQualityRange.fromJson(v as Map<String, dynamic>),
      ),
      modifierRange: $checkedConvert(
        'modifier_range',
        (v) => v == null
            ? null
            : BlueprintModifierRange.fromJson(v as Map<String, dynamic>),
      ),
      valueRangeType: $checkedConvert(
        'value_range_type',
        (v) => $enumDecodeNullable(
          _$BlueprintModifierValueRangeTypeEnumEnumMap,
          v,
        ),
      ),
      valueSegments: $checkedConvert(
        'value_segments',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => BlueprintModifierValueSegmentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'propertyKey': 'property_key',
    'propertyUuid': 'property_uuid',
    'betterWhen': 'better_when',
    'qualityRange': 'quality_range',
    'modifierRange': 'modifier_range',
    'valueRangeType': 'value_range_type',
    'valueSegments': 'value_segments',
  },
);

Map<String, dynamic> _$BlueprintModifierToJson(
  BlueprintModifier instance,
) => <String, dynamic>{
  'property_key': ?instance.propertyKey,
  'property_uuid': ?instance.propertyUuid,
  'label': ?instance.label,
  'better_when': ?_$BlueprintModifierBetterWhenEnumEnumMap[instance.betterWhen],
  'quality_range': ?instance.qualityRange?.toJson(),
  'modifier_range': ?instance.modifierRange?.toJson(),
  'value_range_type':
      ?_$BlueprintModifierValueRangeTypeEnumEnumMap[instance.valueRangeType],
  'value_segments': ?instance.valueSegments?.map((e) => e.toJson()).toList(),
};

const _$BlueprintModifierBetterWhenEnumEnumMap = {
  BlueprintModifierBetterWhenEnum.higher: 'higher',
  BlueprintModifierBetterWhenEnum.lower: 'lower',
  BlueprintModifierBetterWhenEnum.neutral: 'neutral',
};

const _$BlueprintModifierValueRangeTypeEnumEnumMap = {
  BlueprintModifierValueRangeTypeEnum.linear: 'linear',
};
