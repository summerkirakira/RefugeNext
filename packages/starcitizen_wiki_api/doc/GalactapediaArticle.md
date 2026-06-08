# starcitizen_wiki_api.model.GalactapediaArticle

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | CIG identifier | [optional] 
**title** | **String** |  | [optional] 
**slug** | **String** |  | [optional] 
**thumbnail** | **String** |  | [optional] 
**type** | **String** | Alias for template, the first template name | [optional] 
**template** | **String** |  | [optional] 
**category** | **String** | Comma-separated category names | [optional] 
**tag** | **String** | Comma-separated tag names | [optional] 
**rsiUrl** | **String** |  | [optional] 
**apiUrl** | **String** |  | [optional] 
**webUrl** | **String** |  | [optional] 
**createdAt** | **String** |  | [optional] 
**categories** | [**List&lt;GalactapediaCategory&gt;**](GalactapediaCategory.md) |  | [optional] 
**categoriesCount** | **int** | Number of categories (present when sorting by categories_count) | [optional] 
**tags** | [**List&lt;GalactapediaTag&gt;**](GalactapediaTag.md) |  | [optional] 
**tagsCount** | **int** | Number of tags (present when sorting by tags_count) | [optional] 
**properties** | [**List&lt;GalactapediaProperty&gt;**](GalactapediaProperty.md) |  | [optional] 
**relatedArticles** | [**List&lt;GalactapediaRelatedArticle&gt;**](GalactapediaRelatedArticle.md) |  | [optional] 
**relatedArticlesCount** | **int** | Number of related articles (present when sorting by related_articles_count) | [optional] 
**translations** | [**GalactapediaArticleTranslations**](GalactapediaArticleTranslations.md) |  | [optional] 
**createdAtHuman** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


