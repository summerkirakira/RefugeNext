// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ship_matrix_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListShipMatrixFilters200Response _$ListShipMatrixFilters200ResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('ListShipMatrixFilters200Response', json, ($checkedConvert) {
      final val = ListShipMatrixFilters200Response(
        filters: $checkedConvert(
          'filters',
          (v) => v == null
              ? null
              : ListShipMatrixFilters200ResponseFilters.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListShipMatrixFilters200ResponseToJson(
  ListShipMatrixFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
