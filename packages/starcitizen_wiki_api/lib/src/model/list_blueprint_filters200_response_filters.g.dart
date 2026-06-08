// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_blueprint_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBlueprintFilters200ResponseFilters
_$ListBlueprintFilters200ResponseFiltersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListBlueprintFilters200ResponseFilters',
      json,
      ($checkedConvert) {
        final val = ListBlueprintFilters200ResponseFilters(
          outputPeriodType: $checkedConvert(
            'output.type',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          ingredientPeriodUuid: $checkedConvert(
            'ingredient.uuid',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          resourcePeriodUuid: $checkedConvert(
            'resource.uuid',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'outputPeriodType': 'output.type',
        'ingredientPeriodUuid': 'ingredient.uuid',
        'resourcePeriodUuid': 'resource.uuid',
      },
    );

Map<String, dynamic> _$ListBlueprintFilters200ResponseFiltersToJson(
  ListBlueprintFilters200ResponseFilters instance,
) => <String, dynamic>{
  'output.type': ?instance.outputPeriodType?.map((e) => e.toJson()).toList(),
  'ingredient.uuid': ?instance.ingredientPeriodUuid
      ?.map((e) => e.toJson())
      .toList(),
  'resource.uuid': ?instance.resourcePeriodUuid
      ?.map((e) => e.toJson())
      .toList(),
};
