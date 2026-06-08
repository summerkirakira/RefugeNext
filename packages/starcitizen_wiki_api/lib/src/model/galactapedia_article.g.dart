// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galactapedia_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalactapediaArticle _$GalactapediaArticleFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GalactapediaArticle',
  json,
  ($checkedConvert) {
    final val = GalactapediaArticle(
      id: $checkedConvert('id', (v) => v as String?),
      title: $checkedConvert('title', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
      thumbnail: $checkedConvert('thumbnail', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      template: $checkedConvert('template', (v) => v as String?),
      category: $checkedConvert('category', (v) => v as String?),
      tag: $checkedConvert('tag', (v) => v as String?),
      rsiUrl: $checkedConvert('rsi_url', (v) => v as String?),
      apiUrl: $checkedConvert('api_url', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      createdAt: $checkedConvert('created_at', (v) => v as String?),
      categories: $checkedConvert(
        'categories',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GalactapediaCategory.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      categoriesCount: $checkedConvert(
        'categories_count',
        (v) => (v as num?)?.toInt(),
      ),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>?)
            ?.map((e) => GalactapediaTag.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      tagsCount: $checkedConvert('tags_count', (v) => (v as num?)?.toInt()),
      properties: $checkedConvert(
        'properties',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GalactapediaProperty.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      relatedArticles: $checkedConvert(
        'related_articles',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GalactapediaRelatedArticle.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      relatedArticlesCount: $checkedConvert(
        'related_articles_count',
        (v) => (v as num?)?.toInt(),
      ),
      translations: $checkedConvert(
        'translations',
        (v) => v == null
            ? null
            : GalactapediaArticleTranslations.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      createdAtHuman: $checkedConvert('created_at_human', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'rsiUrl': 'rsi_url',
    'apiUrl': 'api_url',
    'webUrl': 'web_url',
    'createdAt': 'created_at',
    'categoriesCount': 'categories_count',
    'tagsCount': 'tags_count',
    'relatedArticles': 'related_articles',
    'relatedArticlesCount': 'related_articles_count',
    'createdAtHuman': 'created_at_human',
  },
);

Map<String, dynamic> _$GalactapediaArticleToJson(
  GalactapediaArticle instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'title': ?instance.title,
  'slug': ?instance.slug,
  'thumbnail': ?instance.thumbnail,
  'type': ?instance.type,
  'template': ?instance.template,
  'category': ?instance.category,
  'tag': ?instance.tag,
  'rsi_url': ?instance.rsiUrl,
  'api_url': ?instance.apiUrl,
  'web_url': ?instance.webUrl,
  'created_at': ?instance.createdAt,
  'categories': ?instance.categories?.map((e) => e.toJson()).toList(),
  'categories_count': ?instance.categoriesCount,
  'tags': ?instance.tags?.map((e) => e.toJson()).toList(),
  'tags_count': ?instance.tagsCount,
  'properties': ?instance.properties?.map((e) => e.toJson()).toList(),
  'related_articles': ?instance.relatedArticles
      ?.map((e) => e.toJson())
      .toList(),
  'related_articles_count': ?instance.relatedArticlesCount,
  'translations': ?instance.translations?.toJson(),
  'created_at_human': ?instance.createdAtHuman,
};
