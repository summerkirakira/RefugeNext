# starcitizen_wiki_api.api.StatsApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getLatestStats**](StatsApi.md#getlateststats) | **GET** /api/stats/latest | Latest Crowdfunding Statistics
[**listStats**](StatsApi.md#liststats) | **GET** /api/stats | Paginated Historical Statistics


# **getLatestStats**
> GetLatestStats200Response getLatestStats()

Latest Crowdfunding Statistics

Get the most recent Star Citizen crowdfunding statistics snapshot, including funds raised (USD), fan count, and fleet size.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStatsApi();

try {
    final response = api.getLatestStats();
    print(response);
} on DioException catch (e) {
    print('Exception when calling StatsApi->getLatestStats: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetLatestStats200Response**](GetLatestStats200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStats**
> ListStats200Response listStats(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

Paginated Historical Statistics

Get paginated historical Star Citizen crowdfunding statistics, ordered by most recent first. Supports page-based pagination.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStatsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.listStats(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StatsApi->listStats: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]

### Return type

[**ListStats200Response**](ListStats200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

