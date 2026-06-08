# starcitizen_wiki_api.api.GalactapediaApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getGalactapediaArticle**](GalactapediaApi.md#getgalactapediaarticle) | **GET** /api/galactapedia/{id} | Galactapedia Article
[**listGalactapediaArticles**](GalactapediaApi.md#listgalactapediaarticles) | **GET** /api/galactapedia | Galactapedia Overview
[**listGalactapediaFilters**](GalactapediaApi.md#listgalactapediafilters) | **GET** /api/galactapedia/filters | Galactapedia Filters
[**searchGalactapediaDeprecated**](GalactapediaApi.md#searchgalactapediadeprecated) | **POST** /api/galactapedia/search | Galactapedia Article Search (Deprecated)


# **getGalactapediaArticle**
> GetGalactapediaArticle200Response getGalactapediaArticle(id, locale, include)

Galactapedia Article

Retrieve a Galactapedia article by ID with available includes and translations.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGalactapediaApi();
final String id = VyvYAGKxAz; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final List<String> include = ; // List<String> | 

try {
    final response = api.getGalactapediaArticle(id, locale, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GalactapediaApi->getGalactapediaArticle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | [**List&lt;String&gt;**](String.md)|  | [optional] 

### Return type

[**GetGalactapediaArticle200Response**](GetGalactapediaArticle200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGalactapediaArticles**
> ListGalactapediaArticles200Response listGalactapediaArticles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTagRightSquareBracket, filterLeftSquareBracketTemplateRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketCreatedAtRightSquareBracket, sort)

Galactapedia Overview

Returns paginated Galactapedia articles ordered by descending ID by default. Each article includes its templates, categories, and tags. Supports filtering by category, tag, template, title, and creation date. Results can be sorted by title, categories_count, tags_count, and related_articles_count.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGalactapediaApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketCategoryRightSquareBracket = Animals; // String | Exact match on category name (see GET /api/galactapedia/filters for valid values)
final String filterLeftSquareBracketTagRightSquareBracket = 100i; // String | Exact match on tag name (see GET /api/galactapedia/filters for valid values)
final String filterLeftSquareBracketTemplateRightSquareBracket = Civilization; // String | Exact match on template name (see GET /api/galactapedia/filters for valid values)
final String filterLeftSquareBracketTitleRightSquareBracket = Messer; // String | Partial match on the article title
final String filterLeftSquareBracketCreatedAtRightSquareBracket = 2025; // String | Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD)
final String sort = -id; // String | Sort field. Prefix with \"-\" for descending. Supported: title, categories_count, tags_count, related_articles_count.

try {
    final response = api.listGalactapediaArticles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTagRightSquareBracket, filterLeftSquareBracketTemplateRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketCreatedAtRightSquareBracket, sort);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GalactapediaApi->listGalactapediaArticles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Exact match on category name (see GET /api/galactapedia/filters for valid values) | [optional] 
 **filterLeftSquareBracketTagRightSquareBracket** | **String**| Exact match on tag name (see GET /api/galactapedia/filters for valid values) | [optional] 
 **filterLeftSquareBracketTemplateRightSquareBracket** | **String**| Exact match on template name (see GET /api/galactapedia/filters for valid values) | [optional] 
 **filterLeftSquareBracketTitleRightSquareBracket** | **String**| Partial match on the article title | [optional] 
 **filterLeftSquareBracketCreatedAtRightSquareBracket** | **String**| Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD) | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supported: title, categories_count, tags_count, related_articles_count. | [optional] 

### Return type

[**ListGalactapediaArticles200Response**](ListGalactapediaArticles200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGalactapediaFilters**
> ListGalactapediaFilters200Response listGalactapediaFilters(filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTagRightSquareBracket, filterLeftSquareBracketTemplateRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketCreatedAtRightSquareBracket)

Galactapedia Filters

Returns available category, tag, and template filter values for Galactapedia articles, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGalactapediaApi();
final String filterLeftSquareBracketCategoryRightSquareBracket = Animals; // String | Exact match on category name
final String filterLeftSquareBracketTagRightSquareBracket = 100i; // String | Exact match on tag name
final String filterLeftSquareBracketTemplateRightSquareBracket = Civilization; // String | Exact match on template name
final String filterLeftSquareBracketTitleRightSquareBracket = Messer; // String | Partial match on the article title
final String filterLeftSquareBracketCreatedAtRightSquareBracket = 2025; // String | Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD)

try {
    final response = api.listGalactapediaFilters(filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTagRightSquareBracket, filterLeftSquareBracketTemplateRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketCreatedAtRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GalactapediaApi->listGalactapediaFilters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Exact match on category name | [optional] 
 **filterLeftSquareBracketTagRightSquareBracket** | **String**| Exact match on tag name | [optional] 
 **filterLeftSquareBracketTemplateRightSquareBracket** | **String**| Exact match on template name | [optional] 
 **filterLeftSquareBracketTitleRightSquareBracket** | **String**| Partial match on the article title | [optional] 
 **filterLeftSquareBracketCreatedAtRightSquareBracket** | **String**| Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD) | [optional] 

### Return type

[**ListGalactapediaFilters200Response**](ListGalactapediaFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchGalactapediaDeprecated**
> SearchGalactapediaDeprecated200Response searchGalactapediaDeprecated(body)

Galactapedia Article Search (Deprecated)

Deprecated. Use GET /api/galactapedia?filter[title]={value} for title search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGalactapediaApi();
final Object body = {"query": "Banu"}; // Object | Article (partial) title, template or slug

try {
    final response = api.searchGalactapediaDeprecated(body);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GalactapediaApi->searchGalactapediaDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Article (partial) title, template or slug | 

### Return type

[**SearchGalactapediaDeprecated200Response**](SearchGalactapediaDeprecated200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

