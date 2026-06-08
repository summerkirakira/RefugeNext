# starcitizen_wiki_api.api.CommoditiesApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCommodity**](CommoditiesApi.md#getcommodity) | **GET** /api/commodities/{commodity} | Show Game Commodity
[**listCommodities**](CommoditiesApi.md#listcommodities) | **GET** /api/commodities | List Game Commodities
[**listCommodityFilters**](CommoditiesApi.md#listcommodityfilters) | **GET** /api/commodities/filters | Game Commodity Filters


# **getCommodity**
> GetCommodity200Response getCommodity(commodity, version, include)

Show Game Commodity

Returns full details for a single game commodity including detailed location entries with starmap data, resource composition, areas, clustering data, and raw/refined version info. Results are scoped to the requested or default game version. Optionally include related blueprints and items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommoditiesApi();
final String commodity = agricium; // String | 
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String include = blueprints,items; // String | Comma-separated relationships to include. Available: blueprints (crafting blueprints that use this commodity), items (items that produce or require this commodity).

try {
    final response = api.getCommodity(commodity, version, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommoditiesApi->getCommodity: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **commodity** | **String**|  | 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **include** | **String**| Comma-separated relationships to include. Available: blueprints (crafting blueprints that use this commodity), items (items that produce or require this commodity). | [optional] 

### Return type

[**GetCommodity200Response**](GetCommodity200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCommodities**
> ListCommodities200Response listCommodities(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, version, sort, filterLeftSquareBracketUsedRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketRarityRightSquareBracket, filterLeftSquareBracketKindRightSquareBracket, filterLeftSquareBracketGroupRightSquareBracket, filterLeftSquareBracketRefinedVersionRightSquareBracket, filterLeftSquareBracketLocationRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketShipRightSquareBracket, filterLeftSquareBracketGroundVehicleRightSquareBracket, filterLeftSquareBracketFpsRightSquareBracket, filterLeftSquareBracketHarvestableRightSquareBracket, filterLeftSquareBracketSalvageRightSquareBracket, filterLeftSquareBracketMineableRightSquareBracket)

List Game Commodities

Returns paginated game commodities with location data and resource metadata, optionally filtered to only those consumed by blueprints. Results include refined version info and starmap location data scoped to the requested or default game version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommoditiesApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = -rarity; // String | Sort field. Prefix with \"-\" for descending. Supported: key, name, rarity, density, instability, resistance, signature.
final bool filterLeftSquareBracketUsedRightSquareBracket = true; // bool | When true, only commodities used by blueprint ingredients in the requested or default game version are returned. Example: `true`
final String filterLeftSquareBracketSystemRightSquareBracket = filterLeftSquareBracketSystemRightSquareBracket_example; // String | Star system where the commodity can be found (see GET /api/commodities/filters for valid values). Example: `Stanton System`
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Location type name (see GET /api/commodities/filters for valid values). Example: `Planet`
final String filterLeftSquareBracketRarityRightSquareBracket = filterLeftSquareBracketRarityRightSquareBracket_example; // String | Commodity tier/rarity level, lowercase (see GET /api/commodities/filters for valid values). Example: `epic`
final String filterLeftSquareBracketKindRightSquareBracket = filterLeftSquareBracketKindRightSquareBracket_example; // String | Resource kind (see GET /api/commodities/filters for valid values). Example: `mineable`
final String filterLeftSquareBracketGroupRightSquareBracket = filterLeftSquareBracketGroupRightSquareBracket_example; // String | Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food`
final String filterLeftSquareBracketRefinedVersionRightSquareBracket = filterLeftSquareBracketRefinedVersionRightSquareBracket_example; // String | Refined version name (see GET /api/commodities/filters for valid values). Example: `Agricium`
final String filterLeftSquareBracketLocationRightSquareBracket = filterLeftSquareBracketLocationRightSquareBracket_example; // String | Partial match on starmap location name. Example: `ArcCorp`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search commodities by name or key. Example: `Agricium`
final bool filterLeftSquareBracketShipRightSquareBracket = true; // bool | When true, only show commodities mineable by ships. Example: `true`
final bool filterLeftSquareBracketGroundVehicleRightSquareBracket = true; // bool | When true, only show commodities mineable by ground vehicles. Example: `true`
final bool filterLeftSquareBracketFpsRightSquareBracket = true; // bool | When true, only show commodities mineable on foot (FPS). Example: `true`
final bool filterLeftSquareBracketHarvestableRightSquareBracket = true; // bool | When true, only show commodities collectible from harvestable or plant deposits. Example: `true`
final bool filterLeftSquareBracketSalvageRightSquareBracket = true; // bool | When true, only show commodities obtainable through salvage. Example: `false`
final bool filterLeftSquareBracketMineableRightSquareBracket = true; // bool | When true, only show mineable commodities; when false, only show non-mineable. Example: `true`

try {
    final response = api.listCommodities(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, version, sort, filterLeftSquareBracketUsedRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketRarityRightSquareBracket, filterLeftSquareBracketKindRightSquareBracket, filterLeftSquareBracketGroupRightSquareBracket, filterLeftSquareBracketRefinedVersionRightSquareBracket, filterLeftSquareBracketLocationRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketShipRightSquareBracket, filterLeftSquareBracketGroundVehicleRightSquareBracket, filterLeftSquareBracketFpsRightSquareBracket, filterLeftSquareBracketHarvestableRightSquareBracket, filterLeftSquareBracketSalvageRightSquareBracket, filterLeftSquareBracketMineableRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommoditiesApi->listCommodities: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supported: key, name, rarity, density, instability, resistance, signature. | [optional] 
 **filterLeftSquareBracketUsedRightSquareBracket** | **bool**| When true, only commodities used by blueprint ingredients in the requested or default game version are returned. Example: `true` | [optional] 
 **filterLeftSquareBracketSystemRightSquareBracket** | **String**| Star system where the commodity can be found (see GET /api/commodities/filters for valid values). Example: `Stanton System` | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Location type name (see GET /api/commodities/filters for valid values). Example: `Planet` | [optional] 
 **filterLeftSquareBracketRarityRightSquareBracket** | **String**| Commodity tier/rarity level, lowercase (see GET /api/commodities/filters for valid values). Example: `epic` | [optional] 
 **filterLeftSquareBracketKindRightSquareBracket** | **String**| Resource kind (see GET /api/commodities/filters for valid values). Example: `mineable` | [optional] 
 **filterLeftSquareBracketGroupRightSquareBracket** | **String**| Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food` | [optional] 
 **filterLeftSquareBracketRefinedVersionRightSquareBracket** | **String**| Refined version name (see GET /api/commodities/filters for valid values). Example: `Agricium` | [optional] 
 **filterLeftSquareBracketLocationRightSquareBracket** | **String**| Partial match on starmap location name. Example: `ArcCorp` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search commodities by name or key. Example: `Agricium` | [optional] 
 **filterLeftSquareBracketShipRightSquareBracket** | **bool**| When true, only show commodities mineable by ships. Example: `true` | [optional] 
 **filterLeftSquareBracketGroundVehicleRightSquareBracket** | **bool**| When true, only show commodities mineable by ground vehicles. Example: `true` | [optional] 
 **filterLeftSquareBracketFpsRightSquareBracket** | **bool**| When true, only show commodities mineable on foot (FPS). Example: `true` | [optional] 
 **filterLeftSquareBracketHarvestableRightSquareBracket** | **bool**| When true, only show commodities collectible from harvestable or plant deposits. Example: `true` | [optional] 
 **filterLeftSquareBracketSalvageRightSquareBracket** | **bool**| When true, only show commodities obtainable through salvage. Example: `false` | [optional] 
 **filterLeftSquareBracketMineableRightSquareBracket** | **bool**| When true, only show mineable commodities; when false, only show non-mineable. Example: `true` | [optional] 

### Return type

[**ListCommodities200Response**](ListCommodities200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCommodityFilters**
> ListCommodityFilters200Response listCommodityFilters(version, filterLeftSquareBracketUsedRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketRarityRightSquareBracket, filterLeftSquareBracketKindRightSquareBracket, filterLeftSquareBracketGroupRightSquareBracket, filterLeftSquareBracketRefinedVersionRightSquareBracket, filterLeftSquareBracketLocationRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketShipRightSquareBracket, filterLeftSquareBracketGroundVehicleRightSquareBracket, filterLeftSquareBracketFpsRightSquareBracket, filterLeftSquareBracketHarvestableRightSquareBracket, filterLeftSquareBracketSalvageRightSquareBracket, filterLeftSquareBracketMineableRightSquareBracket)

Game Commodity Filters

Returns all available filter values for game commodities, scoped to the requested or default game version. Filter values can be combined; providing a system filter will narrow the location facet to that system only.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getCommoditiesApi();
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final bool filterLeftSquareBracketUsedRightSquareBracket = true; // bool | When true, filter facets to only commodities used by blueprint ingredients. Example: `true`
final String filterLeftSquareBracketSystemRightSquareBracket = filterLeftSquareBracketSystemRightSquareBracket_example; // String | Star system where the commodity can be found. Example: `Stanton System`
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Location type name. Example: `Planet`
final String filterLeftSquareBracketRarityRightSquareBracket = filterLeftSquareBracketRarityRightSquareBracket_example; // String | Commodity tier/rarity level, lowercase. Example: `epic`
final String filterLeftSquareBracketKindRightSquareBracket = filterLeftSquareBracketKindRightSquareBracket_example; // String | Resource kind. Example: `mineable`
final String filterLeftSquareBracketGroupRightSquareBracket = filterLeftSquareBracketGroupRightSquareBracket_example; // String | Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food`
final String filterLeftSquareBracketRefinedVersionRightSquareBracket = filterLeftSquareBracketRefinedVersionRightSquareBracket_example; // String | Refined version name. Example: `Agricium`
final String filterLeftSquareBracketLocationRightSquareBracket = filterLeftSquareBracketLocationRightSquareBracket_example; // String | Partial match on starmap location name. Example: `ArcCorp`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search commodities by name or key. Example: `Agricium`
final bool filterLeftSquareBracketShipRightSquareBracket = true; // bool | When true, only show commodities mineable by ships. Example: `true`
final bool filterLeftSquareBracketGroundVehicleRightSquareBracket = true; // bool | When true, only show commodities mineable by ground vehicles. Example: `true`
final bool filterLeftSquareBracketFpsRightSquareBracket = true; // bool | When true, only show commodities mineable on foot (FPS). Example: `true`
final bool filterLeftSquareBracketHarvestableRightSquareBracket = true; // bool | When true, only show commodities collectible from harvestable or plant deposits. Example: `true`
final bool filterLeftSquareBracketSalvageRightSquareBracket = true; // bool | When true, only show commodities obtainable through salvage. Example: `false`
final bool filterLeftSquareBracketMineableRightSquareBracket = true; // bool | When true, only show mineable commodities; when false, only show non-mineable. Example: `true`

try {
    final response = api.listCommodityFilters(version, filterLeftSquareBracketUsedRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketRarityRightSquareBracket, filterLeftSquareBracketKindRightSquareBracket, filterLeftSquareBracketGroupRightSquareBracket, filterLeftSquareBracketRefinedVersionRightSquareBracket, filterLeftSquareBracketLocationRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketShipRightSquareBracket, filterLeftSquareBracketGroundVehicleRightSquareBracket, filterLeftSquareBracketFpsRightSquareBracket, filterLeftSquareBracketHarvestableRightSquareBracket, filterLeftSquareBracketSalvageRightSquareBracket, filterLeftSquareBracketMineableRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommoditiesApi->listCommodityFilters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **filterLeftSquareBracketUsedRightSquareBracket** | **bool**| When true, filter facets to only commodities used by blueprint ingredients. Example: `true` | [optional] 
 **filterLeftSquareBracketSystemRightSquareBracket** | **String**| Star system where the commodity can be found. Example: `Stanton System` | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Location type name. Example: `Planet` | [optional] 
 **filterLeftSquareBracketRarityRightSquareBracket** | **String**| Commodity tier/rarity level, lowercase. Example: `epic` | [optional] 
 **filterLeftSquareBracketKindRightSquareBracket** | **String**| Resource kind. Example: `mineable` | [optional] 
 **filterLeftSquareBracketGroupRightSquareBracket** | **String**| Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food` | [optional] 
 **filterLeftSquareBracketRefinedVersionRightSquareBracket** | **String**| Refined version name. Example: `Agricium` | [optional] 
 **filterLeftSquareBracketLocationRightSquareBracket** | **String**| Partial match on starmap location name. Example: `ArcCorp` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search commodities by name or key. Example: `Agricium` | [optional] 
 **filterLeftSquareBracketShipRightSquareBracket** | **bool**| When true, only show commodities mineable by ships. Example: `true` | [optional] 
 **filterLeftSquareBracketGroundVehicleRightSquareBracket** | **bool**| When true, only show commodities mineable by ground vehicles. Example: `true` | [optional] 
 **filterLeftSquareBracketFpsRightSquareBracket** | **bool**| When true, only show commodities mineable on foot (FPS). Example: `true` | [optional] 
 **filterLeftSquareBracketHarvestableRightSquareBracket** | **bool**| When true, only show commodities collectible from harvestable or plant deposits. Example: `true` | [optional] 
 **filterLeftSquareBracketSalvageRightSquareBracket** | **bool**| When true, only show commodities obtainable through salvage. Example: `false` | [optional] 
 **filterLeftSquareBracketMineableRightSquareBracket** | **bool**| When true, only show mineable commodities; when false, only show non-mineable. Example: `true` | [optional] 

### Return type

[**ListCommodityFilters200Response**](ListCommodityFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

