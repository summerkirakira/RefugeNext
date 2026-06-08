// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_modifier_quality_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintModifierQualityRange _$BlueprintModifierQualityRangeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BlueprintModifierQualityRange', json, ($checkedConvert) {
  final val = BlueprintModifierQualityRange(
    min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
    max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$BlueprintModifierQualityRangeToJson(
  BlueprintModifierQualityRange instance,
) => <String, dynamic>{'min': ?instance.min, 'max': ?instance.max};
