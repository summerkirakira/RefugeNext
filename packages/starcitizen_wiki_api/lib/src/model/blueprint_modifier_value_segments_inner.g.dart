// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_modifier_value_segments_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintModifierValueSegmentsInner
_$BlueprintModifierValueSegmentsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintModifierValueSegmentsInner',
  json,
  ($checkedConvert) {
    final val = BlueprintModifierValueSegmentsInner(
      qualityMin: $checkedConvert('quality_min', (v) => (v as num?)?.toInt()),
      qualityMax: $checkedConvert('quality_max', (v) => (v as num?)?.toInt()),
      modifierAtStart: $checkedConvert(
        'modifier_at_start',
        (v) => (v as num?)?.toDouble(),
      ),
      modifierAtEnd: $checkedConvert(
        'modifier_at_end',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'qualityMin': 'quality_min',
    'qualityMax': 'quality_max',
    'modifierAtStart': 'modifier_at_start',
    'modifierAtEnd': 'modifier_at_end',
  },
);

Map<String, dynamic> _$BlueprintModifierValueSegmentsInnerToJson(
  BlueprintModifierValueSegmentsInner instance,
) => <String, dynamic>{
  'quality_min': ?instance.qualityMin,
  'quality_max': ?instance.qualityMax,
  'modifier_at_start': ?instance.modifierAtStart,
  'modifier_at_end': ?instance.modifierAtEnd,
};
