// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_starsystem_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListStarsystemFilters200ResponseFilters
_$ListStarsystemFilters200ResponseFiltersFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListStarsystemFilters200ResponseFilters', json, (
      $checkedConvert,
    ) {
      final val = ListStarsystemFilters200ResponseFilters(
        affiliation: $checkedConvert(
          'affiliation',
          (v) => (v as List<dynamic>?)
              ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        status: $checkedConvert(
          'status',
          (v) => (v as List<dynamic>?)
              ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        type: $checkedConvert(
          'type',
          (v) => (v as List<dynamic>?)
              ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        size: $checkedConvert(
          'size',
          (v) => (v as List<dynamic>?)
              ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListStarsystemFilters200ResponseFiltersToJson(
  ListStarsystemFilters200ResponseFilters instance,
) => <String, dynamic>{
  'affiliation': ?instance.affiliation?.map((e) => e.toJson()).toList(),
  'status': ?instance.status?.map((e) => e.toJson()).toList(),
  'type': ?instance.type?.map((e) => e.toJson()).toList(),
  'size': ?instance.size?.map((e) => e.toJson()).toList(),
};
