// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_aspects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintAspects _$BlueprintAspectsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BlueprintAspects',
      json,
      ($checkedConvert) {
        final val = BlueprintAspects(
          aspects: $checkedConvert(
            'aspects',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => BlueprintAspect.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          aspectGroups: $checkedConvert(
            'aspect_groups',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      BlueprintAspectGroup.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          hasInteractiveAspects: $checkedConvert(
            'has_interactive_aspects',
            (v) => v as bool?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'aspectGroups': 'aspect_groups',
        'hasInteractiveAspects': 'has_interactive_aspects',
      },
    );

Map<String, dynamic> _$BlueprintAspectsToJson(BlueprintAspects instance) =>
    <String, dynamic>{
      'aspects': ?instance.aspects?.map((e) => e.toJson()).toList(),
      'aspect_groups': ?instance.aspectGroups?.map((e) => e.toJson()).toList(),
      'has_interactive_aspects': ?instance.hasInteractiveAspects,
    };
