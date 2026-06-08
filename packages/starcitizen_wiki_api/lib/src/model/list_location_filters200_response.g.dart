// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_location_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLocationFilters200Response _$ListLocationFilters200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListLocationFilters200Response', json, ($checkedConvert) {
  final val = ListLocationFilters200Response(
    filters: $checkedConvert(
      'filters',
      (v) => v == null
          ? null
          : ListLocationFilters200ResponseFilters.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListLocationFilters200ResponseToJson(
  ListLocationFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
