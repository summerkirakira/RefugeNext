// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_commodity_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommodityFilters200ResponseFilters
_$ListCommodityFilters200ResponseFiltersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListCommodityFilters200ResponseFilters',
      json,
      ($checkedConvert) {
        final val = ListCommodityFilters200ResponseFilters(
          system: $checkedConvert(
            'system',
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
          rarity: $checkedConvert(
            'rarity',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          kind: $checkedConvert(
            'kind',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          refinedVersion: $checkedConvert(
            'refined_version',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          group: $checkedConvert(
            'group',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          location: $checkedConvert(
            'location',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'refinedVersion': 'refined_version'},
    );

Map<String, dynamic> _$ListCommodityFilters200ResponseFiltersToJson(
  ListCommodityFilters200ResponseFilters instance,
) => <String, dynamic>{
  'system': ?instance.system?.map((e) => e.toJson()).toList(),
  'type': ?instance.type?.map((e) => e.toJson()).toList(),
  'rarity': ?instance.rarity?.map((e) => e.toJson()).toList(),
  'kind': ?instance.kind?.map((e) => e.toJson()).toList(),
  'refined_version': ?instance.refinedVersion?.map((e) => e.toJson()).toList(),
  'group': ?instance.group?.map((e) => e.toJson()).toList(),
  'location': ?instance.location?.map((e) => e.toJson()).toList(),
};
