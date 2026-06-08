// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_celestial_objects200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCelestialObjects200Response _$ListCelestialObjects200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListCelestialObjects200Response', json, ($checkedConvert) {
  final val = ListCelestialObjects200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => CelestialObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    links: $checkedConvert(
      'links',
      (v) => v == null
          ? null
          : PaginationLinks.fromJson(v as Map<String, dynamic>),
    ),
    meta: $checkedConvert(
      'meta',
      (v) =>
          v == null ? null : PaginationMeta.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListCelestialObjects200ResponseToJson(
  ListCelestialObjects200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
