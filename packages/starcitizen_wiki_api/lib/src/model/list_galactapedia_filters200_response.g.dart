// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_galactapedia_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListGalactapediaFilters200Response _$ListGalactapediaFilters200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListGalactapediaFilters200Response', json, (
  $checkedConvert,
) {
  final val = ListGalactapediaFilters200Response(
    filters: $checkedConvert(
      'filters',
      (v) => v == null
          ? null
          : ListGalactapediaFilters200ResponseFilters.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListGalactapediaFilters200ResponseToJson(
  ListGalactapediaFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
