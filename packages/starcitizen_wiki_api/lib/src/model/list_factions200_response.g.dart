// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_factions200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFactions200Response _$ListFactions200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListFactions200Response', json, ($checkedConvert) {
  final val = ListFactions200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => FactionIndex.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListFactions200ResponseToJson(
  ListFactions200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
