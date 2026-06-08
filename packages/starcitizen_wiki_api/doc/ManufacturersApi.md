# starcitizen_wiki_api.api.ManufacturersApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getManufacturer**](ManufacturersApi.md#getmanufacturer) | **GET** /api/manufacturers/{manufacturer} | In-Game Manufacturer Detail
[**listManufacturers**](ManufacturersApi.md#listmanufacturers) | **GET** /api/manufacturers | In-Game Manufacturers Overview
[**searchManufacturersDeprecated**](ManufacturersApi.md#searchmanufacturersdeprecated) | **POST** /api/manufacturers/search | In-Game Manufacturer Search (Deprecated)


# **getManufacturer**
> GetManufacturer200Response getManufacturer(manufacturer)

In-Game Manufacturer Detail

Retrieve a manufacturer by name, UUID, or code together with its products.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getManufacturersApi();
final String manufacturer = Anvil Aerospace; // String | 

try {
    final response = api.getManufacturer(manufacturer);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ManufacturersApi->getManufacturer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **manufacturer** | **String**|  | 

### Return type

[**GetManufacturer200Response**](GetManufacturer200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listManufacturers**
> ListManufacturers200Response listManufacturers(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket)

In-Game Manufacturers Overview

Returns paginated manufacturers grouped by name with optional pagination.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getManufacturersApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on manufacturer name

try {
    final response = api.listManufacturers(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ManufacturersApi->listManufacturers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on manufacturer name | [optional] 

### Return type

[**ListManufacturers200Response**](ListManufacturers200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchManufacturersDeprecated**
> ListManufacturers200Response searchManufacturersDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

In-Game Manufacturer Search (Deprecated)

Deprecated. Use GET /api/manufacturers?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getManufacturersApi();
final Object body = {"query": "Anvil"}; // Object | Manufacturer name, uuid, or code
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchManufacturersDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ManufacturersApi->searchManufacturersDeprecated: $e\n');
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

