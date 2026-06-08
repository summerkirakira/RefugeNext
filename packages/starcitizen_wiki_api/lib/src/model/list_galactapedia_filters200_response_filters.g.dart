// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_galactapedia_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListGalactapediaFilters200ResponseFilters
_$ListGalactapediaFilters200ResponseFiltersFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListGalactapediaFilters200ResponseFilters', json, (
  $checkedConvert,
) {
  final val = ListGalactapediaFilters200ResponseFilters(
    category: $checkedConvert(
      'category',
      (v) => (v as List<dynamic>?)
          ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    tag: $checkedConvert(
      'tag',
      (v) => (v as List<dynamic>?)
          ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    template: $checkedConvert(
      'template',
      (v) => (v as List<dynamic>?)
          ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListGalactapediaFilters200ResponseFiltersToJson(
  ListGalactapediaFilters200ResponseFilters instance,
) => <String, dynamic>{
  'category': ?instance.category?.map((e) => e.toJson()).toList(),
  'tag': ?instance.tag?.map((e) => e.toJson()).toList(),
  'template': ?instance.template?.map((e) => e.toJson()).toList(),
};
