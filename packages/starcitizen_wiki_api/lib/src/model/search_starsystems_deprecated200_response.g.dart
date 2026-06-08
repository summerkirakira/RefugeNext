// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_starsystems_deprecated200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchStarsystemsDeprecated200Response
_$SearchStarsystemsDeprecated200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SearchStarsystemsDeprecated200Response', json, (
      $checkedConvert,
    ) {
      final val = SearchStarsystemsDeprecated200Response(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)
              ?.map((e) => Starsystem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SearchStarsystemsDeprecated200ResponseToJson(
  SearchStarsystemsDeprecated200Response instance,
) => <String, dynamic>{'data': ?instance.data?.map((e) => e.toJson()).toList()};
