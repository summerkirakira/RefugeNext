// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_modifier_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintModifierRange _$BlueprintModifierRangeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintModifierRange',
  json,
  ($checkedConvert) {
    final val = BlueprintModifierRange(
      atMinQuality: $checkedConvert(
        'at_min_quality',
        (v) => (v as num?)?.toDouble(),
      ),
      atMaxQuality: $checkedConvert(
        'at_max_quality',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'atMinQuality': 'at_min_quality',
    'atMaxQuality': 'at_max_quality',
  },
);

Map<String, dynamic> _$BlueprintModifierRangeToJson(
  BlueprintModifierRange instance,
) => <String, dynamic>{
  'at_min_quality': ?instance.atMinQuality,
  'at_max_quality': ?instance.atMaxQuality,
};
