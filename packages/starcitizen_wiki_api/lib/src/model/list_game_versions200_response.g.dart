// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_game_versions200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListGameVersions200Response _$ListGameVersions200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListGameVersions200Response', json, ($checkedConvert) {
  final val = ListGameVersions200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GameVersion.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListGameVersions200ResponseToJson(
  ListGameVersions200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
