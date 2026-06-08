# starcitizen_wiki_api.api.BlueprintsApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBlueprint**](BlueprintsApi.md#getblueprint) | **GET** /api/blueprints/{blueprint} | Get Game Blueprint Detail
[**listBlueprintFilters**](BlueprintsApi.md#listblueprintfilters) | **GET** /api/blueprints/filters | Get Blueprint Filter Options
[**listBlueprints**](BlueprintsApi.md#listblueprints) | **GET** /api/blueprints | List Game Blueprints


# **getBlueprint**
> GetBlueprint200Response getBlueprint(blueprint, version)

Get Game Blueprint Detail

Returns full detail for a single crafting blueprint, including ingredients, crafted item, dismantle returns, and associated missions. Scoped to the requested or default game version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getBlueprintsApi();
final String blueprint = 280f47b7-8434-410c-b854-380768fdccec; // String | 
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getBlueprint(blueprint, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BlueprintsApi->getBlueprint: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprint** | **String**|  | 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetBlueprint200Response**](GetBlueprint200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listBlueprintFilters**
> ListBlueprintFilters200Response listBlueprintFilters(version)

Get Blueprint Filter Options

Returns available filter facets for blueprints (crafted item types, ingredient and resource UUIDs), optionally scoped to the requested or default game version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getBlueprintsApi();
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.listBlueprintFilters(version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BlueprintsApi->listBlueprintFilters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**ListBlueprintFilters200Response**](ListBlueprintFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listBlueprints**
> ListBlueprints200Response listBlueprints(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, version, sort, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketOutputPeriodUuidRightSquareBracket, filterLeftSquareBracketOutputPeriodNameRightSquareBracket, filterLeftSquareBracketOutputPeriodClassRightSquareBracket, filterLeftSquareBracketOutputPeriodTypeRightSquareBracket, filterLeftSquareBracketDefaultRightSquareBracket, filterLeftSquareBracketIngredientRightSquareBracket, filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket, filterLeftSquareBracketResourcePeriodUuidRightSquareBracket)

List Game Blueprints

Returns paginated crafting blueprints, including ingredients, crafted items, and dismantle returns. Results are scoped to the requested or default game version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getBlueprintsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = -craft_time_seconds; // String | Sort field. Prefix with \"-\" for descending. Supported: craft_time_seconds, ingredient_count, unlocking_missions_count.
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search blueprints by crafted item name. Example: `Shotgun`
final String filterLeftSquareBracketOutputPeriodUuidRightSquareBracket = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by crafted item UUID (see GET /api/items). Example: `02d4cd2e-fa98-4086-aee1-6b2dfce8ea27`
final String filterLeftSquareBracketOutputPeriodNameRightSquareBracket = filterLeftSquareBracketOutputPeriodNameRightSquareBracket_example; // String | Filter by crafted item name. Example: `P4-AR Magazine (40 cap)`
final String filterLeftSquareBracketOutputPeriodClassRightSquareBracket = filterLeftSquareBracketOutputPeriodClassRightSquareBracket_example; // String | Filter by crafted item class. Example: `ksar_smg_energy_01_gold01`
final String filterLeftSquareBracketOutputPeriodTypeRightSquareBracket = filterLeftSquareBracketOutputPeriodTypeRightSquareBracket_example; // String | Filter by crafted item type (see GET /api/blueprints/filters for valid values). Example: `WeaponPersonal`
final bool filterLeftSquareBracketDefaultRightSquareBracket = true; // bool | Filter by default availability (true/false). Example: `true`
final String filterLeftSquareBracketIngredientRightSquareBracket = filterLeftSquareBracketIngredientRightSquareBracket_example; // String | Matches ingredient resource type by name, key, or UUID before filtering blueprints. Example: `Aluminum`
final String filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by ingredient commodity UUID. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac`
final String filterLeftSquareBracketResourcePeriodUuidRightSquareBracket = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Filter by resource commodity UUID, matching ingredients and dismantle returns. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac`

try {
    final response = api.listBlueprints(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, version, sort, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketOutputPeriodUuidRightSquareBracket, filterLeftSquareBracketOutputPeriodNameRightSquareBracket, filterLeftSquareBracketOutputPeriodClassRightSquareBracket, filterLeftSquareBracketOutputPeriodTypeRightSquareBracket, filterLeftSquareBracketDefaultRightSquareBracket, filterLeftSquareBracketIngredientRightSquareBracket, filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket, filterLeftSquareBracketResourcePeriodUuidRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BlueprintsApi->listBlueprints: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supported: craft_time_seconds, ingredient_count, unlocking_missions_count. | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search blueprints by crafted item name. Example: `Shotgun` | [optional] 
 **filterLeftSquareBracketOutputPeriodUuidRightSquareBracket** | **String**| Filter by crafted item UUID (see GET /api/items). Example: `02d4cd2e-fa98-4086-aee1-6b2dfce8ea27` | [optional] 
 **filterLeftSquareBracketOutputPeriodNameRightSquareBracket** | **String**| Filter by crafted item name. Example: `P4-AR Magazine (40 cap)` | [optional] 
 **filterLeftSquareBracketOutputPeriodClassRightSquareBracket** | **String**| Filter by crafted item class. Example: `ksar_smg_energy_01_gold01` | [optional] 
 **filterLeftSquareBracketOutputPeriodTypeRightSquareBracket** | **String**| Filter by crafted item type (see GET /api/blueprints/filters for valid values). Example: `WeaponPersonal` | [optional] 
 **filterLeftSquareBracketDefaultRightSquareBracket** | **bool**| Filter by default availability (true/false). Example: `true` | [optional] 
 **filterLeftSquareBracketIngredientRightSquareBracket** | **String**| Matches ingredient resource type by name, key, or UUID before filtering blueprints. Example: `Aluminum` | [optional] 
 **filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket** | **String**| Filter by ingredient commodity UUID. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac` | [optional] 
 **filterLeftSquareBracketResourcePeriodUuidRightSquareBracket** | **String**| Filter by resource commodity UUID, matching ingredients and dismantle returns. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac` | [optional] 

### Return type

[**ListBlueprints200Response**](ListBlueprints200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

