# starcitizen_wiki_api.api.SearchApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findSimilarImages**](SearchApi.md#findsimilarimages) | **GET** /api/comm-link-images/{image}/similar | Comm-Link Reverse Image Similar Search
[**resolveSearchQuery**](SearchApi.md#resolvesearchquery) | **GET** /api/search/{query} | Resolve Search Query
[**reverseImageLinkSearch**](SearchApi.md#reverseimagelinksearch) | **POST** /api/comm-links/reverse-image-link-search | Comm-Link Reverse Image Link Search
[**reverseImageSearch**](SearchApi.md#reverseimagesearch) | **POST** /api/comm-links/reverse-image-search | Comm-Link Reverse Image Search
[**searchCelestialObjectsDeprecated**](SearchApi.md#searchcelestialobjectsdeprecated) | **POST** /api/celestial-objects/search | Celestial Object Search (Deprecated)
[**searchCommLinkImages**](SearchApi.md#searchcommlinkimages) | **POST** /api/comm-link-images/search | Comm-Link Image Search by filename
[**searchGalactapediaDeprecated**](SearchApi.md#searchgalactapediadeprecated) | **POST** /api/galactapedia/search | Galactapedia Article Search (Deprecated)
[**searchGameData**](SearchApi.md#searchgamedata) | **GET** /api/search | Unified Search Across All Game Data
[**searchGravlevVehiclesDeprecated**](SearchApi.md#searchgravlevvehiclesdeprecated) | **POST** /api/gravlev-vehicles/search | In-Game Gravlev Vehicle Search (Deprecated)
[**searchGroundVehiclesDeprecated**](SearchApi.md#searchgroundvehiclesdeprecated) | **POST** /api/ground-vehicles/search | In-Game Ground Vehicle Search (Deprecated)
[**searchItemsDeprecated**](SearchApi.md#searchitemsdeprecated) | **POST** /api/items/search | In-Game Item Search (Deprecated)
[**searchManufacturersDeprecated**](SearchApi.md#searchmanufacturersdeprecated) | **POST** /api/manufacturers/search | In-Game Manufacturer Search (Deprecated)
[**searchShipMatrixVehiclesDeprecated**](SearchApi.md#searchshipmatrixvehiclesdeprecated) | **POST** /api/shipmatrix/vehicles/search | Ship Matrix Vehicle Search (Deprecated)
[**searchStarsystemsDeprecated**](SearchApi.md#searchstarsystemsdeprecated) | **POST** /api/starsystems/search | Starsystem Search (Deprecated)
[**searchVehiclesDeprecated**](SearchApi.md#searchvehiclesdeprecated) | **POST** /api/vehicles/search | In-Game Vehicle Search (Deprecated)


# **findSimilarImages**
> ReverseImageSearch200Response findSimilarImages(image, similarity)

Comm-Link Reverse Image Similar Search

Find Comm-Link images similar to an existing RSI-hosted image.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final int image = 44216; // int | Internal database ID of the image
final int similarity = 80; // int | Similarity threshold percentage (1-100). Defaults to 50.

try {
    final response = api.findSimilarImages(image, similarity);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->findSimilarImages: $e\n');
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

# **resolveSearchQuery**
> resolveSearchQuery(query, version)

Resolve Search Query

Resolve a search query to the best-matching entity and redirect to its API URL, preserving query parameters such as locale, include, and version. Useful for quick lookups where you know the exact name.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final String query = Carrack; // String | Entity name, class name, or UUID to resolve.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    api.resolveSearchQuery(query, version);
} on DioException catch (e) {
    print('Exception when calling SearchApi->resolveSearchQuery: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| Entity name, class name, or UUID to resolve. | 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

void (empty response body)

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

final api = StarcitizenWikiApi().getSearchApi();
final ReverseImageLinkSearchRequest reverseImageLinkSearchRequest = {"url": "https://robertsspaceindustries.com/i/cc75a45005a236c6e015dfc2782a2f55ed1e84a2/ADdPNihJzmPbNuTnFsH1DqUeqBRpXdSXVVtgJTyDDgscGKrzJuoFjResiiucPBBDeyrBscqRyZz4qxNsSbWvqUwdG/alien-week-2022-front.webp"}; // ReverseImageLinkSearchRequest | URL to an image hosted on (media.)robertsspaceindustries.com

try {
    final response = api.reverseImageLinkSearch(reverseImageLinkSearchRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->reverseImageLinkSearch: $e\n');
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

final api = StarcitizenWikiApi().getSearchApi();
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | The image to reverse-search (max 5 MB)
final int similarity = 56; // int | Similarity threshold percentage (1-100). Defaults to 75.

try {
    final response = api.reverseImageSearch(image, similarity);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->reverseImageSearch: $e\n');
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

# **searchCelestialObjectsDeprecated**
> SearchCelestialObjectsDeprecated200Response searchCelestialObjectsDeprecated(searchCelestialObjectsDeprecatedRequest, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

Celestial Object Search (Deprecated)

Deprecated. Use GET /api/celestial-objects?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest = {"query": "Pleiades"}; // SearchCelestialObjectsDeprecatedRequest | Partial celestial object code or name to search for
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchCelestialObjectsDeprecated(searchCelestialObjectsDeprecatedRequest, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchCelestialObjectsDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchCelestialObjectsDeprecatedRequest** | [**SearchCelestialObjectsDeprecatedRequest**](SearchCelestialObjectsDeprecatedRequest.md)| Partial celestial object code or name to search for | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]

### Return type

[**SearchCelestialObjectsDeprecated200Response**](SearchCelestialObjectsDeprecated200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchCommLinkImages**
> ReverseImageSearch200Response searchCommLinkImages(searchCommLinkImagesRequest, filterLeftSquareBracketTagsRightSquareBracket)

Comm-Link Image Search by filename

Search comm-link images by filename with optional tag filtering. Only images without a base image and with non-zero file size are returned.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final SearchCommLinkImagesRequest searchCommLinkImagesRequest = {"query": "Starshipbridge"}; // SearchCommLinkImagesRequest | 
final String filterLeftSquareBracketTagsRightSquareBracket = concept; // String | Partial match on tag name

try {
    final response = api.searchCommLinkImages(searchCommLinkImagesRequest, filterLeftSquareBracketTagsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchCommLinkImages: $e\n');
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

# **searchGalactapediaDeprecated**
> SearchGalactapediaDeprecated200Response searchGalactapediaDeprecated(body)

Galactapedia Article Search (Deprecated)

Deprecated. Use GET /api/galactapedia?filter[title]={value} for title search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final Object body = {"query": "Banu"}; // Object | Article (partial) title, template or slug

try {
    final response = api.searchGalactapediaDeprecated(body);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchGalactapediaDeprecated: $e\n');
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

# **searchGameData**
> SearchGameData200Response searchGameData(filterLeftSquareBracketQueryRightSquareBracket, version)

Unified Search Across All Game Data

Search across items, vehicles, starmap locations, commodities, blueprints, and missions simultaneously. Returns results grouped by type, limited to 5 results per group.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final String filterLeftSquareBracketQueryRightSquareBracket = carrack; // String | Search query (minimum 2 characters). Searches names, class names, and other identifiers.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.searchGameData(filterLeftSquareBracketQueryRightSquareBracket, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchGameData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search query (minimum 2 characters). Searches names, class names, and other identifiers. | 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**SearchGameData200Response**](SearchGameData200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchGravlevVehiclesDeprecated**
> ListGroundVehicles200Response searchGravlevVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

In-Game Gravlev Vehicle Search (Deprecated)

Deprecated. Use GET /api/gravlev-vehicles?filter[name]={value} for name search. Scoped to gravlev vehicles. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final Object body = {"query": "Dragonfly"}; // Object | Vehicle name, class_name, or UUID
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchGravlevVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchGravlevVehiclesDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Vehicle name, class_name, or UUID | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]

### Return type

[**ListGroundVehicles200Response**](ListGroundVehicles200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchGroundVehiclesDeprecated**
> ListGroundVehicles200Response searchGroundVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

In-Game Ground Vehicle Search (Deprecated)

Deprecated. Use GET /api/ground-vehicles?filter[name]={value} for name search. Scoped to ground vehicles. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final Object body = {"query": "Nova"}; // Object | Vehicle name, class_name, or UUID
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchGroundVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchGroundVehiclesDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Vehicle name, class_name, or UUID | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]

### Return type

[**ListGroundVehicles200Response**](ListGroundVehicles200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchItemsDeprecated**
> ListWeapons200Response searchItemsDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, locale, include, sort, filterLeftSquareBracketVariantsRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketClassRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Item Search (Deprecated)

Deprecated. Use GET /api/items?filter[name]={value} for name search. Note: OR search across name/uuid/type is no longer supported. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final Object body = {"query": "Arrow"}; // Object | Item Name or (sub)type
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final bool filterLeftSquareBracketVariantsRightSquareBracket = true; // bool | When false, excludes variant items and returns only base items. When true or omitted, returns all items.
final String filterLeftSquareBracketCategoryRightSquareBracket = filterLeftSquareBracketCategoryRightSquareBracket_example; // String | Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
final String filterLeftSquareBracketSubTypeRightSquareBracket = filterLeftSquareBracketSubTypeRightSquareBracket_example; // String | Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
final String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket = filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket_example; // String | Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | Partial match on item class name. Example: `MGA_Assault`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Arrow`
final String filterLeftSquareBracketClassificationRightSquareBracket = filterLeftSquareBracketClassificationRightSquareBracket_example; // String | Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
final num filterLeftSquareBracketSizeRightSquareBracket = 8.14; // num | Exact item size (0-12). Example: `3`
final num filterLeftSquareBracketGradeRightSquareBracket = 8.14; // num | Exact item grade (1-7, mapped to A-G). Example: `3`
final String filterLeftSquareBracketClassRightSquareBracket = filterLeftSquareBracketClassRightSquareBracket_example; // String | Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.searchItemsDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, locale, include, sort, filterLeftSquareBracketVariantsRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketClassRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchItemsDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Item Name or (sub)type | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketVariantsRightSquareBracket** | **bool**| When false, excludes variant items and returns only base items. When true or omitted, returns all items. | [optional] 
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons` | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal` | [optional] 
 **filterLeftSquareBracketSubTypeRightSquareBracket** | **String**| Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel` | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms` | [optional] 
 **filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket** | **String**| Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace` | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**| Partial match on item class name. Example: `MGA_Assault` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Arrow` | [optional] 
 **filterLeftSquareBracketClassificationRightSquareBracket** | **String**| Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **num**| Exact item size (0-12). Example: `3` | [optional] 
 **filterLeftSquareBracketGradeRightSquareBracket** | **num**| Exact item grade (1-7, mapped to A-G). Example: `3` | [optional] 
 **filterLeftSquareBracketClassRightSquareBracket** | **String**| Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchManufacturersDeprecated**
> ListManufacturers200Response searchManufacturersDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

In-Game Manufacturer Search (Deprecated)

Deprecated. Use GET /api/manufacturers?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final Object body = {"query": "Anvil"}; // Object | Manufacturer name, uuid, or code
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchManufacturersDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchManufacturersDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Manufacturer name, uuid, or code | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]

### Return type

[**ListManufacturers200Response**](ListManufacturers200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchShipMatrixVehiclesDeprecated**
> SearchShipMatrixVehiclesDeprecated200Response searchShipMatrixVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketFocusRightSquareBracket, filterLeftSquareBracketProductionStatusRightSquareBracket)

Ship Matrix Vehicle Search (Deprecated)

Deprecated. Use GET /api/shipmatrix/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final Object body = {"query": "Avenger"}; // Object | Vehicle name to search for
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketManufacturerRightSquareBracket = Anvil Aerospace; // String | Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values)
final String filterLeftSquareBracketSizeRightSquareBracket = medium; // String | Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values)
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Filter by vehicle type slug
final String filterLeftSquareBracketFocusRightSquareBracket = filterLeftSquareBracketFocusRightSquareBracket_example; // String | Filter by vehicle focus slug (comma-separated for multiple)
final String filterLeftSquareBracketProductionStatusRightSquareBracket = filterLeftSquareBracketProductionStatusRightSquareBracket_example; // String | Filter by production status slug

try {
    final response = api.searchShipMatrixVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketFocusRightSquareBracket, filterLeftSquareBracketProductionStatusRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchShipMatrixVehiclesDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Vehicle name to search for | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values) | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **String**| Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values) | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Filter by vehicle type slug | [optional] 
 **filterLeftSquareBracketFocusRightSquareBracket** | **String**| Filter by vehicle focus slug (comma-separated for multiple) | [optional] 
 **filterLeftSquareBracketProductionStatusRightSquareBracket** | **String**| Filter by production status slug | [optional] 

### Return type

[**SearchShipMatrixVehiclesDeprecated200Response**](SearchShipMatrixVehiclesDeprecated200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchStarsystemsDeprecated**
> SearchStarsystemsDeprecated200Response searchStarsystemsDeprecated(searchCelestialObjectsDeprecatedRequest, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

Starsystem Search (Deprecated)

Deprecated. Use GET /api/starsystems?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest = {"query": "Sol"}; // SearchCelestialObjectsDeprecatedRequest | Partial starsystem code or name to search for
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchStarsystemsDeprecated(searchCelestialObjectsDeprecatedRequest, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchStarsystemsDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchCelestialObjectsDeprecatedRequest** | [**SearchCelestialObjectsDeprecatedRequest**](SearchCelestialObjectsDeprecatedRequest.md)| Partial starsystem code or name to search for | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]

### Return type

[**SearchStarsystemsDeprecated200Response**](SearchStarsystemsDeprecated200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchVehiclesDeprecated**
> ListGroundVehicles200Response searchVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket)

In-Game Vehicle Search (Deprecated)

Deprecated. Use GET /api/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getSearchApi();
final Object body = {"query": "Avenger"}; // Object | Vehicle name, class_name, career, or UUID
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | 
final String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket = filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket_example; // String | 
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | 
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | 
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search vehicles by name or class name.
final int filterLeftSquareBracketSizeRightSquareBracket = 56; // int | 
final int filterLeftSquareBracketSizeClassRightSquareBracket = 56; // int | 
final String filterLeftSquareBracketCareerRightSquareBracket = filterLeftSquareBracketCareerRightSquareBracket_example; // String | 
final String filterLeftSquareBracketRoleRightSquareBracket = filterLeftSquareBracketRoleRightSquareBracket_example; // String | 
final bool filterLeftSquareBracketIsVehicleRightSquareBracket = true; // bool | 
final bool filterLeftSquareBracketIsGravlevRightSquareBracket = true; // bool | 
final bool filterLeftSquareBracketIsSpaceshipRightSquareBracket = true; // bool | 
final num filterLeftSquareBracketMassTotalRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketCargoCapacityRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketVehicleInventoryRightSquareBracket = 8.14; // num | 
final int filterLeftSquareBracketCrewPeriodMinRightSquareBracket = 56; // int | 
final num filterLeftSquareBracketHealthRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketShieldPeriodHpRightSquareBracket = 8.14; // num | 
final String filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket = filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket_example; // String | 
final num filterLeftSquareBracketSpeedPeriodScmRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketArmorPeriodHealthRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket = 8.14; // num | 
final num filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket = 8.14; // num | 

try {
    final response = api.searchVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchVehiclesDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Vehicle name, class_name, career, or UUID | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search vehicles by name or class name. | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **int**|  | [optional] 
 **filterLeftSquareBracketSizeClassRightSquareBracket** | **int**|  | [optional] 
 **filterLeftSquareBracketCareerRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketRoleRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketIsVehicleRightSquareBracket** | **bool**|  | [optional] 
 **filterLeftSquareBracketIsGravlevRightSquareBracket** | **bool**|  | [optional] 
 **filterLeftSquareBracketIsSpaceshipRightSquareBracket** | **bool**|  | [optional] 
 **filterLeftSquareBracketMassTotalRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketCargoCapacityRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketVehicleInventoryRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketCrewPeriodMinRightSquareBracket** | **int**|  | [optional] 
 **filterLeftSquareBracketHealthRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketShieldPeriodHpRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketSpeedPeriodScmRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketArmorPeriodHealthRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket** | **num**|  | [optional] 
 **filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket** | **num**|  | [optional] 

### Return type

[**ListGroundVehicles200Response**](ListGroundVehicles200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

