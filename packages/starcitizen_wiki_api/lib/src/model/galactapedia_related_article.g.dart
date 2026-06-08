// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galactapedia_related_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalactapediaRelatedArticle _$GalactapediaRelatedArticleFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GalactapediaRelatedArticle', json, ($checkedConvert) {
  final val = GalactapediaRelatedArticle(
    id: $checkedConvert('id', (v) => v as String?),
    title: $checkedConvert('title', (v) => v as String?),
    url: $checkedConvert('url', (v) => v as String?),
    apiUrl: $checkedConvert('api_url', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'apiUrl': 'api_url'});

Map<String, dynamic> _$GalactapediaRelatedArticleToJson(
  GalactapediaRelatedArticle instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'title': ?instance.title,
  'url': ?instance.url,
  'api_url': ?instance.apiUrl,
};
