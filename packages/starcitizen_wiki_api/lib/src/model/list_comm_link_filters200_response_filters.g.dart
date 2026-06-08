// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comm_link_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommLinkFilters200ResponseFilters
_$ListCommLinkFilters200ResponseFiltersFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListCommLinkFilters200ResponseFilters', json, (
      $checkedConvert,
    ) {
      final val = ListCommLinkFilters200ResponseFilters(
        category: $checkedConvert(
          'category',
          (v) => (v as List<dynamic>?)
              ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        channel: $checkedConvert(
          'channel',
          (v) => (v as List<dynamic>?)
              ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        series: $checkedConvert(
          'series',
          (v) => (v as List<dynamic>?)
              ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListCommLinkFilters200ResponseFiltersToJson(
  ListCommLinkFilters200ResponseFilters instance,
) => <String, dynamic>{
  'category': ?instance.category?.map((e) => e.toJson()).toList(),
  'channel': ?instance.channel?.map((e) => e.toJson()).toList(),
  'series': ?instance.series?.map((e) => e.toJson()).toList(),
};
