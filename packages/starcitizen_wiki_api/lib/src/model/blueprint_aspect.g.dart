// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_aspect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintAspect _$BlueprintAspectFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintAspect',
  json,
  ($checkedConvert) {
    final val = BlueprintAspect(
      key: $checkedConvert('key', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      requiredCount: $checkedConvert(
        'required_count',
        (v) => (v as num?)?.toInt(),
      ),
      selectionGroup: $checkedConvert(
        'selection_group',
        (v) => v == null
            ? null
            : BlueprintAspectSelectionGroup.fromJson(v as Map<String, dynamic>),
      ),
      input: $checkedConvert(
        'input',
        (v) => v == null
            ? null
            : BlueprintAspectInput.fromJson(v as Map<String, dynamic>),
      ),
      modifiers: $checkedConvert(
        'modifiers',
        (v) => (v as List<dynamic>?)
            ?.map((e) => BlueprintModifier.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      initialQuality: $checkedConvert(
        'initial_quality',
        (v) => (v as num?)?.toInt(),
      ),
      sliderMin: $checkedConvert('slider_min', (v) => (v as num?)?.toInt()),
      sliderMax: $checkedConvert('slider_max', (v) => (v as num?)?.toInt()),
      hasModifiers: $checkedConvert('has_modifiers', (v) => v as bool?),
      hasDynamicModifiers: $checkedConvert(
        'has_dynamic_modifiers',
        (v) => v as bool?,
      ),
      isSelected: $checkedConvert('is_selected', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'requiredCount': 'required_count',
    'selectionGroup': 'selection_group',
    'initialQuality': 'initial_quality',
    'sliderMin': 'slider_min',
    'sliderMax': 'slider_max',
    'hasModifiers': 'has_modifiers',
    'hasDynamicModifiers': 'has_dynamic_modifiers',
    'isSelected': 'is_selected',
  },
);

Map<String, dynamic> _$BlueprintAspectToJson(BlueprintAspect instance) =>
    <String, dynamic>{
      'key': ?instance.key,
      'name': ?instance.name,
      'required_count': ?instance.requiredCount,
      'selection_group': ?instance.selectionGroup?.toJson(),
      'input': ?instance.input?.toJson(),
      'modifiers': ?instance.modifiers?.map((e) => e.toJson()).toList(),
      'initial_quality': ?instance.initialQuality,
      'slider_min': ?instance.sliderMin,
      'slider_max': ?instance.sliderMax,
      'has_modifiers': ?instance.hasModifiers,
      'has_dynamic_modifiers': ?instance.hasDynamicModifiers,
      'is_selected': ?instance.isSelected,
    };
