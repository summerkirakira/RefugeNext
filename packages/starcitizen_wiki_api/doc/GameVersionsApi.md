# starcitizen_wiki_api.api.GameVersionsApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDefaultGameVersion**](GameVersionsApi.md#getdefaultgameversion) | **GET** /api/game-versions/default | Get Default Game Version
[**getGameVersion**](GameVersionsApi.md#getgameversion) | **GET** /api/game-versions/{identifier} | Get Game Version
[**getVersionChangelog**](GameVersionsApi.md#getversionchangelog) | **GET** /api/game-versions/{version}/changelog | Get Version Changelog
[**listGameVersions**](GameVersionsApi.md#listgameversions) | **GET** /api/game-versions | List Game Versions
[**listVersionChangelogChanges**](GameVersionsApi.md#listversionchangelogchanges) | **GET** /api/game-versions/{version}/changelog/changes | Get Version Changelog Changes


# **getDefaultGameVersion**
> GetDefaultGameVersion200Response getDefaultGameVersion()

Get Default Game Version

Returns the current default game version. This is the version used by default in version-scoped API queries (see the version query parameter on other endpoints).

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGameVersionsApi();

try {
    final response = api.getDefaultGameVersion();
    print(response);
} on DioException catch (e) {
    print('Exception when calling GameVersionsApi->getDefaultGameVersion: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetDefaultGameVersion200Response**](GetDefaultGameVersion200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGameVersion**
> GetDefaultGameVersion200Response getGameVersion(identifier)

Get Game Version

Retrieve a specific game version by its code (case-insensitive). Game versions are used to scope version-aware data endpoints via the `version` query parameter.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGameVersionsApi();
final String identifier = 4.8.0-LIVE.11825000; // String | Game version code (case-insensitive).

try {
    final response = api.getGameVersion(identifier);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GameVersionsApi->getGameVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**| Game version code (case-insensitive). | 

### Return type

[**GetDefaultGameVersion200Response**](GetDefaultGameVersion200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVersionChangelog**
> GetVersionChangelog200Response getVersionChangelog(version)

Get Version Changelog

Returns the changelog summary between the specified version and its predecessor.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGameVersionsApi();
final String version = 4.7.0-LIVE.11518367; // String | Version code

try {
    final response = api.getVersionChangelog(version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GameVersionsApi->getVersionChangelog: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **version** | **String**| Version code | 

### Return type

[**GetVersionChangelog200Response**](GetVersionChangelog200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGameVersions**
> ListGameVersions200Response listGameVersions(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketCodeRightSquareBracket, filterLeftSquareBracketChannelRightSquareBracket, filterLeftSquareBracketIsDefaultRightSquareBracket, sort)

List Game Versions

Returns paginated game versions sorted by release date (newest first by default). Useful for discovering available game versions for version-scoped API queries.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGameVersionsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketCodeRightSquareBracket = filterLeftSquareBracketCodeRightSquareBracket_example; // String | Filter by exact version code. Example: `4.8.0-LIVE.11825000`
final String filterLeftSquareBracketChannelRightSquareBracket = filterLeftSquareBracketChannelRightSquareBracket_example; // String | Filter by release channel (live, ptu, eptu), lowercase. Example: `live`
final int filterLeftSquareBracketIsDefaultRightSquareBracket = 56; // int | Filter by default status. Example: `1`
final String sort = -released_at; // String | Sort by field. Prefix with - for descending. Supported: code, channel, released_at.

try {
    final response = api.listGameVersions(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketCodeRightSquareBracket, filterLeftSquareBracketChannelRightSquareBracket, filterLeftSquareBracketIsDefaultRightSquareBracket, sort);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GameVersionsApi->listGameVersions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketCodeRightSquareBracket** | **String**| Filter by exact version code. Example: `4.8.0-LIVE.11825000` | [optional] 
 **filterLeftSquareBracketChannelRightSquareBracket** | **String**| Filter by release channel (live, ptu, eptu), lowercase. Example: `live` | [optional] 
 **filterLeftSquareBracketIsDefaultRightSquareBracket** | **int**| Filter by default status. Example: `1` | [optional] 
 **sort** | **String**| Sort by field. Prefix with - for descending. Supported: code, channel, released_at. | [optional] 

### Return type

[**ListGameVersions200Response**](ListGameVersions200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVersionChangelogChanges**
> ListVersionChangelogChanges200Response listVersionChangelogChanges(version, filterLeftSquareBracketEntityTypeRightSquareBracket, filterLeftSquareBracketChangeTypeRightSquareBracket, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

Get Version Changelog Changes

Returns paginated diff entries for a version changelog. Filter by entity_type and change_type.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getGameVersionsApi();
final String version = 4.7.0-LIVE.11518367; // String | Version code
final String filterLeftSquareBracketEntityTypeRightSquareBracket = item; // String | Filter by entity type (item, vehicle)
final String filterLeftSquareBracketChangeTypeRightSquareBracket = modified; // String | Filter by change type (added, removed, modified)
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.listVersionChangelogChanges(version, filterLeftSquareBracketEntityTypeRightSquareBracket, filterLeftSquareBracketChangeTypeRightSquareBracket, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GameVersionsApi->listVersionChangelogChanges: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **version** | **String**| Version code | 
 **filterLeftSquareBracketEntityTypeRightSquareBracket** | **String**| Filter by entity type (item, vehicle) | [optional] 
 **filterLeftSquareBracketChangeTypeRightSquareBracket** | **String**| Filter by change type (added, removed, modified) | [optional] 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]

### Return type

[**ListVersionChangelogChanges200Response**](ListVersionChangelogChanges200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

