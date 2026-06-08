// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_locations200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLocations200Response _$ListLocations200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListLocations200Response', json, ($checkedConvert) {
  final val = ListLocations200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GameStarmapLocation.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListLocations200ResponseToJson(
  ListLocations200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
