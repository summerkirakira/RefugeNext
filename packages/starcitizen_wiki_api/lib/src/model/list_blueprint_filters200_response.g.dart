// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_blueprint_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBlueprintFilters200Response _$ListBlueprintFilters200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListBlueprintFilters200Response', json, ($checkedConvert) {
  final val = ListBlueprintFilters200Response(
    filters: $checkedConvert(
      'filters',
      (v) => v == null
          ? null
          : ListBlueprintFilters200ResponseFilters.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListBlueprintFilters200ResponseToJson(
  ListBlueprintFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
