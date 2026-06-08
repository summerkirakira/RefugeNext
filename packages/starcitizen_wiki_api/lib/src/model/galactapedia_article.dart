//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/galactapedia_related_article.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_article_translations.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_property.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_category.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'galactapedia_article.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GalactapediaArticle {
  /// Returns a new [GalactapediaArticle] instance.
  GalactapediaArticle({

     this.id,

     this.title,

     this.slug,

     this.thumbnail,

     this.type,

     this.template,

     this.category,

     this.tag,

     this.rsiUrl,

     this.apiUrl,

     this.webUrl,

     this.createdAt,

     this.categories,

     this.categoriesCount,

     this.tags,

     this.tagsCount,

     this.properties,

     this.relatedArticles,

     this.relatedArticlesCount,

     this.translations,

     this.createdAtHuman,
  });

      /// CIG identifier
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



  @JsonKey(
    
    name: r'thumbnail',
    required: false,
    includeIfNull: false,
  )


  final String? thumbnail;



      /// Alias for template, the first template name
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'template',
    required: false,
    includeIfNull: false,
  )


  final String? template;



      /// Comma-separated category names
  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final String? category;



      /// Comma-separated tag names
  @JsonKey(
    
    name: r'tag',
    required: false,
    includeIfNull: false,
  )


  final String? tag;



  @JsonKey(
    
    name: r'rsi_url',
    required: false,
    includeIfNull: false,
  )


  final String? rsiUrl;



  @JsonKey(
    
    name: r'api_url',
    required: false,
    includeIfNull: false,
  )


  final String? apiUrl;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final String? createdAt;



  @JsonKey(
    
    name: r'categories',
    required: false,
    includeIfNull: false,
  )


  final List<GalactapediaCategory>? categories;



      /// Number of categories (present when sorting by categories_count)
  @JsonKey(
    
    name: r'categories_count',
    required: false,
    includeIfNull: false,
  )


  final int? categoriesCount;



  @JsonKey(
    
    name: r'tags',
    required: false,
    includeIfNull: false,
  )


  final List<GalactapediaTag>? tags;



      /// Number of tags (present when sorting by tags_count)
  @JsonKey(
    
    name: r'tags_count',
    required: false,
    includeIfNull: false,
  )


  final int? tagsCount;



  @JsonKey(
    
    name: r'properties',
    required: false,
    includeIfNull: false,
  )


  final List<GalactapediaProperty>? properties;



  @JsonKey(
    
    name: r'related_articles',
    required: false,
    includeIfNull: false,
  )


  final List<GalactapediaRelatedArticle>? relatedArticles;



      /// Number of related articles (present when sorting by related_articles_count)
  @JsonKey(
    
    name: r'related_articles_count',
    required: false,
    includeIfNull: false,
  )


  final int? relatedArticlesCount;



  @JsonKey(
    
    name: r'translations',
    required: false,
    includeIfNull: false,
  )


  final GalactapediaArticleTranslations? translations;



  @JsonKey(
    
    name: r'created_at_human',
    required: false,
    includeIfNull: false,
  )


  final String? createdAtHuman;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GalactapediaArticle &&
      other.id == id &&
      other.title == title &&
      other.slug == slug &&
      other.thumbnail == thumbnail &&
      other.type == type &&
      other.template == template &&
      other.category == category &&
      other.tag == tag &&
      other.rsiUrl == rsiUrl &&
      other.apiUrl == apiUrl &&
      other.webUrl == webUrl &&
      other.createdAt == createdAt &&
      other.categories == categories &&
      other.categoriesCount == categoriesCount &&
      other.tags == tags &&
      other.tagsCount == tagsCount &&
      other.properties == properties &&
      other.relatedArticles == relatedArticles &&
      other.relatedArticlesCount == relatedArticlesCount &&
      other.translations == translations &&
      other.createdAtHuman == createdAtHuman;

    @override
    int get hashCode =>
        id.hashCode +
        title.hashCode +
        slug.hashCode +
        (thumbnail == null ? 0 : thumbnail.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (template == null ? 0 : template.hashCode) +
        (category == null ? 0 : category.hashCode) +
        (tag == null ? 0 : tag.hashCode) +
        rsiUrl.hashCode +
        apiUrl.hashCode +
        webUrl.hashCode +
        createdAt.hashCode +
        categories.hashCode +
        (categoriesCount == null ? 0 : categoriesCount.hashCode) +
        tags.hashCode +
        (tagsCount == null ? 0 : tagsCount.hashCode) +
        properties.hashCode +
        relatedArticles.hashCode +
        (relatedArticlesCount == null ? 0 : relatedArticlesCount.hashCode) +
        translations.hashCode +
        createdAtHuman.hashCode;

  factory GalactapediaArticle.fromJson(Map<String, dynamic> json) => _$GalactapediaArticleFromJson(json);

  Map<String, dynamic> toJson() => _$GalactapediaArticleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

