// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_celestial_objects_deprecated200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCelestialObjectsDeprecated200Response
_$SearchCelestialObjectsDeprecated200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchCelestialObjectsDeprecated200Response', json, (
  $checkedConvert,
) {
  final val = SearchCelestialObjectsDeprecated200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => CelestialObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SearchCelestialObjectsDeprecated200ResponseToJson(
  SearchCelestialObjectsDeprecated200Response instance,
) => <String, dynamic>{'data': ?instance.data?.map((e) => e.toJson()).toList()};
