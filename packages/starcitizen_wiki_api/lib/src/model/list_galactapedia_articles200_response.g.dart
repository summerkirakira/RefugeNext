// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_galactapedia_articles200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListGalactapediaArticles200Response
_$ListGalactapediaArticles200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListGalactapediaArticles200Response', json, (
  $checkedConvert,
) {
  final val = ListGalactapediaArticles200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GalactapediaArticle.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListGalactapediaArticles200ResponseToJson(
  ListGalactapediaArticles200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
