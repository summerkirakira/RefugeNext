// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_location_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLocationFilters200ResponseFilters
_$ListLocationFilters200ResponseFiltersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListLocationFilters200ResponseFilters',
      json,
      ($checkedConvert) {
        final val = ListLocationFilters200ResponseFilters(
          typeName: $checkedConvert(
            'type_name',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          typeClassification: $checkedConvert(
            'type_classification',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          respawnLocationType: $checkedConvert(
            'respawn_location_type',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          jurisdictionName: $checkedConvert(
            'jurisdiction_name',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          affiliationName: $checkedConvert(
            'affiliation_name',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          system: $checkedConvert(
            'system',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          parentName: $checkedConvert(
            'parent_name',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          amenity: $checkedConvert(
            'amenity',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          resource: $checkedConvert(
            'resource',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'typeName': 'type_name',
        'typeClassification': 'type_classification',
        'respawnLocationType': 'respawn_location_type',
        'jurisdictionName': 'jurisdiction_name',
        'affiliationName': 'affiliation_name',
        'parentName': 'parent_name',
      },
    );

Map<String, dynamic> _$ListLocationFilters200ResponseFiltersToJson(
  ListLocationFilters200ResponseFilters instance,
) => <String, dynamic>{
  'type_name': ?instance.typeName?.map((e) => e.toJson()).toList(),
  'type_classification': ?instance.typeClassification
      ?.map((e) => e.toJson())
      .toList(),
  'respawn_location_type': ?instance.respawnLocationType
      ?.map((e) => e.toJson())
      .toList(),
  'jurisdiction_name': ?instance.jurisdictionName
      ?.map((e) => e.toJson())
      .toList(),
  'affiliation_name': ?instance.affiliationName
      ?.map((e) => e.toJson())
      .toList(),
  'system': ?instance.system?.map((e) => e.toJson()).toList(),
  'parent_name': ?instance.parentName?.map((e) => e.toJson()).toList(),
  'amenity': ?instance.amenity?.map((e) => e.toJson()).toList(),
  'resource': ?instance.resource?.map((e) => e.toJson()).toList(),
};
