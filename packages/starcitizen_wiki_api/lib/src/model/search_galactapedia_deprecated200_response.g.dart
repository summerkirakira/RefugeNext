// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_galactapedia_deprecated200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchGalactapediaDeprecated200Response
_$SearchGalactapediaDeprecated200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SearchGalactapediaDeprecated200Response', json, (
      $checkedConvert,
    ) {
      final val = SearchGalactapediaDeprecated200Response(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => GalactapediaArticle.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SearchGalactapediaDeprecated200ResponseToJson(
  SearchGalactapediaDeprecated200Response instance,
) => <String, dynamic>{'data': ?instance.data?.map((e) => e.toJson()).toList()};
