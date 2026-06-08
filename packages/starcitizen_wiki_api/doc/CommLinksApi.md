# starcitizen_wiki_api.api.CommLinksApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findSimilarImages**](CommLinksApi.md#findsimilarimages) | **GET** /api/comm-link-images/{image}/similar | Comm-Link Reverse Image Similar Search
[**getCommLink**](CommLinksApi.md#getcommlink) | **GET** /api/comm-links/{id} | Comm-Link Detail
[**getCommLinkImage**](CommLinksApi.md#getcommlinkimage) | **GET** /api/comm-link-images/{image} | Comm-Link Image Detail
[**getRandomCommLinkImage**](CommLinksApi.md#getrandomcommlinkimage) | **GET** /api/comm-link-images/random | Comm-Link Images Random
[**listCommLinkFilters**](CommLinksApi.md#listcommlinkfilters) | **GET** /api/comm-links/filters | Comm-Link Filters
[**listCommLinkImages**](CommLinksApi.md#listcommlinkimages) | **GET** /api/comm-link-images | Comm-Link Images
[**listCommLinks**](CommLinksApi.md#listcommlinks) | **GET** /api/comm-links | Comm-Links Overview
[**reverseImageLinkSearch**](CommLinksApi.md#reverseimagelinksearch) | **POST** /api/comm-links/reverse-image-link-search | Comm-Link Reverse Image Link Search
[**reverseImageSearch**](CommLinksApi.md#reverseimagesearch) | **POST** /api/comm-links/reverse-image-search | Comm-Link Reverse Image Search
[**searchCommLinkImages**](CommLinksApi.md#searchcommlinkimages) | **POST** /api/comm-link-images/search | Comm-Link Image Search by filename
[**searchCommLinksDeprecated**](CommLinksApi.md#searchcommlinksdeprecated) | **POST** /api/comm-links/search | Comm-Link Search (Deprecated)


# **findSimilarImages**
> ReverseImageSearch200Response findSimilarImages(image, similarity)

Comm-Link Reverse Image Similar Search

Find Comm-Link images similar to an existing RSI-hosted image.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final int image = 44216; // int | Internal database ID of the image
final int similarity = 80; // int | Similarity threshold percentage (1-100). Defaults to 50.

try {
    final response = api.findSimilarImages(image, similarity);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->findSimilarImages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image** | **int**| Internal database ID of the image | 
 **similarity** | **int**| Similarity threshold percentage (1-100). Defaults to 50. | [optional] 

### Return type

[**ReverseImageSearch200Response**](ReverseImageSearch200Response.md)

### Authorization

[sanctum](../README.md#sanctum)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommLink**
> GetCommLink200Response getCommLink(id, include)

Comm-Link Detail

Retrieve a single Comm-Link by its CIG ID. Images with hash and metadata are always included. The response contains prev_id and next_id metadata for sequential navigation between Comm-Links.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final int id = 12663; // int | 
final List<String> include = ; // List<String> | 

try {
    final response = api.getCommLink(id, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->getCommLink: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **include** | [**List&lt;String&gt;**](String.md)|  | [optional] 

### Return type

[**GetCommLink200Response**](GetCommLink200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCommLinkImage**
> GetCommLinkImage200Response getCommLinkImage(image)

Comm-Link Image Detail

Retrieve a single comm-link image with its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final int image = 44216; // int | Internal database ID of the image

try {
    final response = api.getCommLinkImage(image);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->getCommLinkImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image** | **int**| Internal database ID of the image | 

### Return type

[**GetCommLinkImage200Response**](GetCommLinkImage200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRandomCommLinkImage**
> ReverseImageSearch200Response getRandomCommLinkImage(limit, filterLeftSquareBracketTagsRightSquareBracket)

Comm-Link Images Random

Retrieve random comm-link images (minimum 250 KB), optionally filtered by tag name. Only images without a base image are included.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final int limit = 5; // int | Number of random images to return
final String filterLeftSquareBracketTagsRightSquareBracket = concept; // String | Partial match on tag name

try {
    final response = api.getRandomCommLinkImage(limit, filterLeftSquareBracketTagsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->getRandomCommLinkImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Number of random images to return | [optional] 
 **filterLeftSquareBracketTagsRightSquareBracket** | **String**| Partial match on tag name | [optional] 

### Return type

[**ReverseImageSearch200Response**](ReverseImageSearch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCommLinkFilters**
> ListCommLinkFilters200Response listCommLinkFilters(filterLeftSquareBracketIdRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketContentRightSquareBracket, filterLeftSquareBracketChannelRightSquareBracket, filterLeftSquareBracketSeriesRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketCreatedAtRightSquareBracket)

Comm-Link Filters

Returns available category, channel, and series filter values for Comm-Links, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final int filterLeftSquareBracketIdRightSquareBracket = 12663; // int | Exact match on the Comm-Link CIG ID
final String filterLeftSquareBracketTitleRightSquareBracket = This Week in Star Citizen; // String | Partial match on the Comm-Link title
final String filterLeftSquareBracketContentRightSquareBracket = star citizen; // String | Full-text search within English Comm-Link translations
final String filterLeftSquareBracketChannelRightSquareBracket = Engineering; // String | Exact match on channel name
final String filterLeftSquareBracketSeriesRightSquareBracket = Around the Verse; // String | Exact match on series name
final String filterLeftSquareBracketCategoryRightSquareBracket = General; // String | Exact match on category name
final String filterLeftSquareBracketCreatedAtRightSquareBracket = 2025; // String | Filter by publication year (YYYY) or exact date (YYYY-MM-DD)

try {
    final response = api.listCommLinkFilters(filterLeftSquareBracketIdRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketContentRightSquareBracket, filterLeftSquareBracketChannelRightSquareBracket, filterLeftSquareBracketSeriesRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketCreatedAtRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->listCommLinkFilters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filterLeftSquareBracketIdRightSquareBracket** | **int**| Exact match on the Comm-Link CIG ID | [optional] 
 **filterLeftSquareBracketTitleRightSquareBracket** | **String**| Partial match on the Comm-Link title | [optional] 
 **filterLeftSquareBracketContentRightSquareBracket** | **String**| Full-text search within English Comm-Link translations | [optional] 
 **filterLeftSquareBracketChannelRightSquareBracket** | **String**| Exact match on channel name | [optional] 
 **filterLeftSquareBracketSeriesRightSquareBracket** | **String**| Exact match on series name | [optional] 
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Exact match on category name | [optional] 
 **filterLeftSquareBracketCreatedAtRightSquareBracket** | **String**| Filter by publication year (YYYY) or exact date (YYYY-MM-DD) | [optional] 

### Return type

[**ListCommLinkFilters200Response**](ListCommLinkFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCommLinkImages**
> ListCommLinkImages200Response listCommLinkImages(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTagsRightSquareBracket)

Comm-Link Images

List available comm-link images with pagination. Each image includes its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketTagsRightSquareBracket = concept; // String | Partial match on tag name. WARNING: Images have no tags currently.

try {
    final response = api.listCommLinkImages(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTagsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->listCommLinkImages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketTagsRightSquareBracket** | **String**| Partial match on tag name. WARNING: Images have no tags currently. | [optional] 

### Return type

[**ListCommLinkImages200Response**](ListCommLinkImages200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCommLinks**
> ListCommLinks200Response listCommLinks(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, filterLeftSquareBracketIdRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketContentRightSquareBracket, filterLeftSquareBracketChannelRightSquareBracket, filterLeftSquareBracketSeriesRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketCreatedAtRightSquareBracket, sort)

Comm-Links Overview

Returns paginated comm-links ordered by descending ID by default. Supports filtering by channel, category, series, title, content, and publication date. Results can be sorted by id, title, images_count, links_count, channel, category, series, and created_at. Use the include parameter to embed images or links.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final List<String> include = ; // List<String> | 
final int filterLeftSquareBracketIdRightSquareBracket = 12663; // int | Exact match on the Comm-Link CIG ID
final String filterLeftSquareBracketTitleRightSquareBracket = This Week in Star Citizen; // String | Partial match on the Comm-Link title
final String filterLeftSquareBracketContentRightSquareBracket = star citizen; // String | Full-text search within English Comm-Link translations
final String filterLeftSquareBracketChannelRightSquareBracket = Engineering; // String | Exact match on channel name (see GET /api/comm-links/filters for valid values)
final String filterLeftSquareBracketSeriesRightSquareBracket = Around the Verse; // String | Exact match on series name (see GET /api/comm-links/filters for valid values)
final String filterLeftSquareBracketCategoryRightSquareBracket = General; // String | Exact match on category name (see GET /api/comm-links/filters for valid values)
final String filterLeftSquareBracketCreatedAtRightSquareBracket = 2025; // String | Filter by publication year (YYYY) or exact date (YYYY-MM-DD)
final String sort = -id; // String | Sort field. Prefix with \"-\" for descending. Supported: id, title, images_count, links_count, channel, category, series, created_at.

try {
    final response = api.listCommLinks(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, filterLeftSquareBracketIdRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketContentRightSquareBracket, filterLeftSquareBracketChannelRightSquareBracket, filterLeftSquareBracketSeriesRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketCreatedAtRightSquareBracket, sort);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->listCommLinks: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | [**List&lt;String&gt;**](String.md)|  | [optional] 
 **filterLeftSquareBracketIdRightSquareBracket** | **int**| Exact match on the Comm-Link CIG ID | [optional] 
 **filterLeftSquareBracketTitleRightSquareBracket** | **String**| Partial match on the Comm-Link title | [optional] 
 **filterLeftSquareBracketContentRightSquareBracket** | **String**| Full-text search within English Comm-Link translations | [optional] 
 **filterLeftSquareBracketChannelRightSquareBracket** | **String**| Exact match on channel name (see GET /api/comm-links/filters for valid values) | [optional] 
 **filterLeftSquareBracketSeriesRightSquareBracket** | **String**| Exact match on series name (see GET /api/comm-links/filters for valid values) | [optional] 
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Exact match on category name (see GET /api/comm-links/filters for valid values) | [optional] 
 **filterLeftSquareBracketCreatedAtRightSquareBracket** | **String**| Filter by publication year (YYYY) or exact date (YYYY-MM-DD) | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supported: id, title, images_count, links_count, channel, category, series, created_at. | [optional] 

### Return type

[**ListCommLinks200Response**](ListCommLinks200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reverseImageLinkSearch**
> ReverseImageLinkSearch200Response reverseImageLinkSearch(reverseImageLinkSearchRequest)

Comm-Link Reverse Image Link Search

Return comm-links that reference the same RSI-hosted image URL.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final ReverseImageLinkSearchRequest reverseImageLinkSearchRequest = {"url": "https://robertsspaceindustries.com/i/cc75a45005a236c6e015dfc2782a2f55ed1e84a2/ADdPNihJzmPbNuTnFsH1DqUeqBRpXdSXVVtgJTyDDgscGKrzJuoFjResiiucPBBDeyrBscqRyZz4qxNsSbWvqUwdG/alien-week-2022-front.webp"}; // ReverseImageLinkSearchRequest | URL to an image hosted on (media.)robertsspaceindustries.com

try {
    final response = api.reverseImageLinkSearch(reverseImageLinkSearchRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->reverseImageLinkSearch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reverseImageLinkSearchRequest** | [**ReverseImageLinkSearchRequest**](ReverseImageLinkSearchRequest.md)| URL to an image hosted on (media.)robertsspaceindustries.com | 

### Return type

[**ReverseImageLinkSearch200Response**](ReverseImageLinkSearch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reverseImageSearch**
> ReverseImageSearch200Response reverseImageSearch(image, similarity)

Comm-Link Reverse Image Search

Search comm-links by uploading an image and specifying a similarity threshold. Requires the GD PHP extension.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | The image to reverse-search (max 5 MB)
final int similarity = 56; // int | Similarity threshold percentage (1-100). Defaults to 75.

try {
    final response = api.reverseImageSearch(image, similarity);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->reverseImageSearch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image** | **MultipartFile**| The image to reverse-search (max 5 MB) | 
 **similarity** | **int**| Similarity threshold percentage (1-100). Defaults to 75. | [optional] 

### Return type

[**ReverseImageSearch200Response**](ReverseImageSearch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchCommLinkImages**
> ReverseImageSearch200Response searchCommLinkImages(searchCommLinkImagesRequest, filterLeftSquareBracketTagsRightSquareBracket)

Comm-Link Image Search by filename

Search comm-link images by filename with optional tag filtering. Only images without a base image and with non-zero file size are returned.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final SearchCommLinkImagesRequest searchCommLinkImagesRequest = {"query": "Starshipbridge"}; // SearchCommLinkImagesRequest | 
final String filterLeftSquareBracketTagsRightSquareBracket = concept; // String | Partial match on tag name

try {
    final response = api.searchCommLinkImages(searchCommLinkImagesRequest, filterLeftSquareBracketTagsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->searchCommLinkImages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchCommLinkImagesRequest** | [**SearchCommLinkImagesRequest**](SearchCommLinkImagesRequest.md)|  | 
 **filterLeftSquareBracketTagsRightSquareBracket** | **String**| Partial match on tag name | [optional] 

### Return type

[**ReverseImageSearch200Response**](ReverseImageSearch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchCommLinksDeprecated**
> ListCommLinks200Response searchCommLinksDeprecated(searchCommLinksDeprecatedRequest, locale, include, filterLeftSquareBracketChannelRightSquareBracket, filterLeftSquareBracketSeriesRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket)

Comm-Link Search (Deprecated)

Deprecated. Use GET /api/comm-links?filter[title]={value} for title search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommLinksApi();
final SearchCommLinksDeprecatedRequest searchCommLinksDeprecatedRequest = {"query": "Banu Merchantman"}; // SearchCommLinksDeprecatedRequest | At least one of keyword or query is required.
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final List<String> include = ; // List<String> | 
final String filterLeftSquareBracketChannelRightSquareBracket = Engineering; // String | Exact match on channel name (see GET /api/comm-links/filters for valid values)
final String filterLeftSquareBracketSeriesRightSquareBracket = Around the Verse; // String | Exact match on series name (see GET /api/comm-links/filters for valid values)
final String filterLeftSquareBracketCategoryRightSquareBracket = General; // String | Exact match on category name (see GET /api/comm-links/filters for valid values)

try {
    final response = api.searchCommLinksDeprecated(searchCommLinksDeprecatedRequest, locale, include, filterLeftSquareBracketChannelRightSquareBracket, filterLeftSquareBracketSeriesRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommLinksApi->searchCommLinksDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchCommLinksDeprecatedRequest** | [**SearchCommLinksDeprecatedRequest**](SearchCommLinksDeprecatedRequest.md)| At least one of keyword or query is required. | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | [**List&lt;String&gt;**](String.md)|  | [optional] 
 **filterLeftSquareBracketChannelRightSquareBracket** | **String**| Exact match on channel name (see GET /api/comm-links/filters for valid values) | [optional] 
 **filterLeftSquareBracketSeriesRightSquareBracket** | **String**| Exact match on series name (see GET /api/comm-links/filters for valid values) | [optional] 
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Exact match on category name (see GET /api/comm-links/filters for valid values) | [optional] 

### Return type

[**ListCommLinks200Response**](ListCommLinks200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

