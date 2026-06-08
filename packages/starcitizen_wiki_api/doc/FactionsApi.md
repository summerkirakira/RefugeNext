# starcitizen_wiki_api.api.FactionsApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getFaction**](FactionsApi.md#getfaction) | **GET** /api/factions/{faction} | Get Faction Detail
[**listFactions**](FactionsApi.md#listfactions) | **GET** /api/factions | List Factions


# **getFaction**
> GetFaction200Response getFaction(faction)

Get Faction Detail

Returns full details for a single faction, including reputation ladder with standings when the faction has a reputation system. Factions hidden from the Delphi app are excluded.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getFactionsApi();
final String faction = 4e429470-4d4e-4c2b-a4ac-4de42ada16e0; // String | 

try {
    final response = api.getFaction(faction);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FactionsApi->getFaction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **faction** | **String**|  | 

### Return type

[**GetFaction200Response**](GetFaction200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listFactions**
> ListFactions200Response listFactions(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketFactionTypeRightSquareBracket, filterLeftSquareBracketHasReputationRightSquareBracket, filterLeftSquareBracketLawfulRightSquareBracket, filterLeftSquareBracketIsNpcRightSquareBracket, filterLeftSquareBracketHideInDelphiAppRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, sort)

List Factions

Returns paginated factions sorted by name by default. Factions hidden from the Delphi app are excluded.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getFactionsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketFactionTypeRightSquareBracket = filterLeftSquareBracketFactionTypeRightSquareBracket_example; // String | Category of faction. Example: `Lawful`
final bool filterLeftSquareBracketHasReputationRightSquareBracket = true; // bool | When true, only factions with a reputation system are returned. Example: `true`
final bool filterLeftSquareBracketLawfulRightSquareBracket = true; // bool | When true, only lawful factions are returned. Example: `true`
final bool filterLeftSquareBracketIsNpcRightSquareBracket = true; // bool | When true, only NPC-controlled factions are returned. Example: `false`
final bool filterLeftSquareBracketHideInDelphiAppRightSquareBracket = true; // bool | When true, only factions hidden from the Delphi app are returned. Note: the index endpoint excludes hidden factions by default. Example: `false`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search factions by name or description. Example: `ArcCorp`
final String sort = -name; // String | Sort field. Prefix with \"-\" for descending. Supported: name, faction_type.

try {
    final response = api.listFactions(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketFactionTypeRightSquareBracket, filterLeftSquareBracketHasReputationRightSquareBracket, filterLeftSquareBracketLawfulRightSquareBracket, filterLeftSquareBracketIsNpcRightSquareBracket, filterLeftSquareBracketHideInDelphiAppRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, sort);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FactionsApi->listFactions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketFactionTypeRightSquareBracket** | **String**| Category of faction. Example: `Lawful` | [optional] 
 **filterLeftSquareBracketHasReputationRightSquareBracket** | **bool**| When true, only factions with a reputation system are returned. Example: `true` | [optional] 
 **filterLeftSquareBracketLawfulRightSquareBracket** | **bool**| When true, only lawful factions are returned. Example: `true` | [optional] 
 **filterLeftSquareBracketIsNpcRightSquareBracket** | **bool**| When true, only NPC-controlled factions are returned. Example: `false` | [optional] 
 **filterLeftSquareBracketHideInDelphiAppRightSquareBracket** | **bool**| When true, only factions hidden from the Delphi app are returned. Note: the index endpoint excludes hidden factions by default. Example: `false` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search factions by name or description. Example: `ArcCorp` | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supported: name, faction_type. | [optional] 

### Return type

[**ListFactions200Response**](ListFactions200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

