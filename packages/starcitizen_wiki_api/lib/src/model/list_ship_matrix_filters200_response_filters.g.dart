// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ship_matrix_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListShipMatrixFilters200ResponseFilters
_$ListShipMatrixFilters200ResponseFiltersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListShipMatrixFilters200ResponseFilters',
      json,
      ($checkedConvert) {
        final val = ListShipMatrixFilters200ResponseFilters(
          manufacturer: $checkedConvert(
            'manufacturer',
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
          type: $checkedConvert(
            'type',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          focus: $checkedConvert(
            'focus',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          productionStatus: $checkedConvert(
            'production_status',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'productionStatus': 'production_status'},
    );

Map<String, dynamic> _$ListShipMatrixFilters200ResponseFiltersToJson(
  ListShipMatrixFilters200ResponseFilters instance,
) => <String, dynamic>{
  'manufacturer': ?instance.manufacturer?.map((e) => e.toJson()).toList(),
  'size': ?instance.size?.map((e) => e.toJson()).toList(),
  'type': ?instance.type?.map((e) => e.toJson()).toList(),
  'focus': ?instance.focus?.map((e) => e.toJson()).toList(),
  'production_status': ?instance.productionStatus
      ?.map((e) => e.toJson())
      .toList(),
};
