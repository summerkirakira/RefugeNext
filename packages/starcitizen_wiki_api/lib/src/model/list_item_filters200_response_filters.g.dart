// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemFilters200ResponseFilters _$ListItemFilters200ResponseFiltersFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ListItemFilters200ResponseFilters',
  json,
  ($checkedConvert) {
    final val = ListItemFilters200ResponseFilters(
      type: $checkedConvert(
        'type',
        (v) => (v as List<dynamic>?)
            ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      subType: $checkedConvert(
        'sub_type',
        (v) => (v as List<dynamic>?)
            ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      classification: $checkedConvert(
        'classification',
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
      grade: $checkedConvert(
        'grade',
        (v) => (v as List<dynamic>?)
            ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      class_: $checkedConvert(
        'class',
        (v) => (v as List<dynamic>?)
            ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => (v as List<dynamic>?)
            ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      rarity: $checkedConvert(
        'rarity',
        (v) => (v as List<dynamic>?)
            ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      eventSource: $checkedConvert(
        'event_source',
        (v) => (v as List<dynamic>?)
            ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'subType': 'sub_type',
    'class_': 'class',
    'eventSource': 'event_source',
  },
);

Map<String, dynamic> _$ListItemFilters200ResponseFiltersToJson(
  ListItemFilters200ResponseFilters instance,
) => <String, dynamic>{
  'type': ?instance.type?.map((e) => e.toJson()).toList(),
  'sub_type': ?instance.subType?.map((e) => e.toJson()).toList(),
  'classification': ?instance.classification?.map((e) => e.toJson()).toList(),
  'size': ?instance.size?.map((e) => e.toJson()).toList(),
  'grade': ?instance.grade?.map((e) => e.toJson()).toList(),
  'class': ?instance.class_?.map((e) => e.toJson()).toList(),
  'manufacturer': ?instance.manufacturer?.map((e) => e.toJson()).toList(),
  'rarity': ?instance.rarity?.map((e) => e.toJson()).toList(),
  'event_source': ?instance.eventSource?.map((e) => e.toJson()).toList(),
};
