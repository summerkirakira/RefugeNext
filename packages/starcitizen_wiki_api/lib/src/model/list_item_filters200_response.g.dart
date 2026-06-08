// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemFilters200Response _$ListItemFilters200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListItemFilters200Response', json, ($checkedConvert) {
  final val = ListItemFilters200Response(
    filters: $checkedConvert(
      'filters',
      (v) => v == null
          ? null
          : ListItemFilters200ResponseFilters.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListItemFilters200ResponseToJson(
  ListItemFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
