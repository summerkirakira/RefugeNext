// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_summary_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintSummaryProperty _$BlueprintSummaryPropertyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintSummaryProperty',
  json,
  ($checkedConvert) {
    final val = BlueprintSummaryProperty(
      propertyKey: $checkedConvert('property_key', (v) => v as String?),
      propertyUuid: $checkedConvert('property_uuid', (v) => v as String?),
      label: $checkedConvert('label', (v) => v as String?),
      betterWhen: $checkedConvert(
        'better_when',
        (v) => $enumDecodeNullable(
          _$BlueprintSummaryPropertyBetterWhenEnumEnumMap,
          v,
        ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'propertyKey': 'property_key',
    'propertyUuid': 'property_uuid',
    'betterWhen': 'better_when',
  },
);

Map<String, dynamic> _$BlueprintSummaryPropertyToJson(
  BlueprintSummaryProperty instance,
) => <String, dynamic>{
  'property_key': ?instance.propertyKey,
  'property_uuid': ?instance.propertyUuid,
  'label': ?instance.label,
  'better_when':
      ?_$BlueprintSummaryPropertyBetterWhenEnumEnumMap[instance.betterWhen],
};

const _$BlueprintSummaryPropertyBetterWhenEnumEnumMap = {
  BlueprintSummaryPropertyBetterWhenEnum.higher: 'higher',
  BlueprintSummaryPropertyBetterWhenEnum.lower: 'lower',
  BlueprintSummaryPropertyBetterWhenEnum.neutral: 'neutral',
};
