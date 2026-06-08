// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_starsystem_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListStarsystemFilters200Response _$ListStarsystemFilters200ResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('ListStarsystemFilters200Response', json, ($checkedConvert) {
      final val = ListStarsystemFilters200Response(
        filters: $checkedConvert(
          'filters',
          (v) => v == null
              ? null
              : ListStarsystemFilters200ResponseFilters.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListStarsystemFilters200ResponseToJson(
  ListStarsystemFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
