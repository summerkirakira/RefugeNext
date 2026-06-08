// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_celestial_objects_deprecated_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCelestialObjectsDeprecatedRequest
_$SearchCelestialObjectsDeprecatedRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SearchCelestialObjectsDeprecatedRequest', json, (
      $checkedConvert,
    ) {
      final val = SearchCelestialObjectsDeprecatedRequest(
        query: $checkedConvert('query', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SearchCelestialObjectsDeprecatedRequestToJson(
  SearchCelestialObjectsDeprecatedRequest instance,
) => <String, dynamic>{'query': ?instance.query};
