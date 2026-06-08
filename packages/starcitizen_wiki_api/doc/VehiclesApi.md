# starcitizen_wiki_api.api.VehiclesApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getGravlevVehicle**](VehiclesApi.md#getgravlevvehicle) | **GET** /api/gravlev-vehicles/{identifier} | In-Game Gravlev Vehicle Detail
[**getGroundVehicle**](VehiclesApi.md#getgroundvehicle) | **GET** /api/ground-vehicles/{identifier} | In-Game Ground Vehicle Detail
[**getShipMatrixVehicle**](VehiclesApi.md#getshipmatrixvehicle) | **GET** /api/shipmatrix/vehicles/{slug} | Ship Matrix Vehicle Detail
[**getVehicle**](VehiclesApi.md#getvehicle) | **GET** /api/vehicles/{identifier} | In-Game Vehicle Detail
[**listGravlevVehicles**](VehiclesApi.md#listgravlevvehicles) | **GET** /api/gravlev-vehicles | In-Game Gravlev Vehicles Overview
[**listGroundVehicles**](VehiclesApi.md#listgroundvehicles) | **GET** /api/ground-vehicles | In-Game Ground Vehicles Overview
[**listShipMatrixFilters**](VehiclesApi.md#listshipmatrixfilters) | **GET** /api/shipmatrix/vehicles/filters | Ship Matrix Vehicle Filters
[**listShipMatrixVehicles**](VehiclesApi.md#listshipmatrixvehicles) | **GET** /api/shipmatrix/vehicles | Ship Matrix Vehicles Overview
[**listVehicleFilters**](VehiclesApi.md#listvehiclefilters) | **GET** /api/vehicles/filters | In-Game Vehicle Filters
[**listVehicles**](VehiclesApi.md#listvehicles) | **GET** /api/vehicles | In-Game Vehicles Overview
[**searchGravlevVehiclesDeprecated**](VehiclesApi.md#searchgravlevvehiclesdeprecated) | **POST** /api/gravlev-vehicles/search | In-Game Gravlev Vehicle Search (Deprecated)
[**searchGroundVehiclesDeprecated**](VehiclesApi.md#searchgroundvehiclesdeprecated) | **POST** /api/ground-vehicles/search | In-Game Ground Vehicle Search (Deprecated)
[**searchShipMatrixVehiclesDeprecated**](VehiclesApi.md#searchshipmatrixvehiclesdeprecated) | **POST** /api/shipmatrix/vehicles/search | Ship Matrix Vehicle Search (Deprecated)
[**searchVehiclesDeprecated**](VehiclesApi.md#searchvehiclesdeprecated) | **POST** /api/vehicles/search | In-Game Vehicle Search (Deprecated)


# **getGravlevVehicle**
> GetGroundVehicle200Response getGravlevVehicle(identifier, include, version)

In-Game Gravlev Vehicle Detail

Alias for /api/vehicles/{identifier} scoped to gravlev vehicles. Results are scoped to the requested or default game version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final String identifier = drak-dragonfly; // String | 
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getGravlevVehicle(identifier, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->getGravlevVehicle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetGroundVehicle200Response**](GetGroundVehicle200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGroundVehicle**
> GetGroundVehicle200Response getGroundVehicle(identifier, include, version)

In-Game Ground Vehicle Detail

Alias for /api/vehicles/{identifier} scoped to ground vehicles. Results are scoped to the requested or default game version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final String identifier = tmbl-nova; // String | 
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getGroundVehicle(identifier, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->getGroundVehicle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetGroundVehicle200Response**](GetGroundVehicle200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getShipMatrixVehicle**
> GetShipMatrixVehicle200Response getShipMatrixVehicle(slug, include)

Ship Matrix Vehicle Detail

Retrieve a Ship Matrix vehicle by slug. Use the \"include\" query parameter to load additional relationships: components, loaner, skus.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final String slug = slug_example; // String | 
final String include = include_example; // String | Include additional relationships (components, loaner, skus)

try {
    final response = api.getShipMatrixVehicle(slug, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->getShipMatrixVehicle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 
 **include** | **String**| Include additional relationships (components, loaner, skus) | [optional] 

### Return type

[**GetShipMatrixVehicle200Response**](GetShipMatrixVehicle200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVehicle**
> GetGroundVehicle200Response getVehicle(identifier, include, version)

In-Game Vehicle Detail

Retrieve a vehicle by name, class name, or UUID. Results are scoped to the requested or default game version. Loads manufacturer, gameVersion, shipMatrixVehicle (with foci, productionStatus, productionNote, type, size, loaner, skus, manufacturer, components), and port loadout items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final String identifier = Carrack; // String | 
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getVehicle(identifier, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->getVehicle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetGroundVehicle200Response**](GetGroundVehicle200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGravlevVehicles**
> ListGroundVehicles200Response listGravlevVehicles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket)

In-Game Gravlev Vehicles Overview

Alias for /api/vehicles scoped to gravlev vehicles (is_gravlev=true). Returns paginated in-game gravlev vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = -cargo_capacity; // String | Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Drake Interplanetary`
final String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket = filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket_example; // String | Alias for filter[manufacturer]. Example: `Origin Jumpworks`
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | Partial match on vehicle class name. Example: `Dragonfly`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on vehicle display name. Example: `Dragonfly`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search vehicles by name or class name. Example: `Dragonfly`
final int filterLeftSquareBracketSizeRightSquareBracket = 56; // int | Exact match on vehicle size (1-6). Example: `1`
final int filterLeftSquareBracketSizeClassRightSquareBracket = 56; // int | Alias for filter[size]. Example: `1`
final String filterLeftSquareBracketCareerRightSquareBracket = filterLeftSquareBracketCareerRightSquareBracket_example; // String | Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration`
final String filterLeftSquareBracketRoleRightSquareBracket = filterLeftSquareBracketRoleRightSquareBracket_example; // String | Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing`
final bool filterLeftSquareBracketIsVehicleRightSquareBracket = true; // bool | Filter to ground vehicles only.
final bool filterLeftSquareBracketIsGravlevRightSquareBracket = true; // bool | Filter to gravlev vehicles only.
final bool filterLeftSquareBracketIsSpaceshipRightSquareBracket = true; // bool | Filter to spaceships only.
final num filterLeftSquareBracketMassTotalRightSquareBracket = 8.14; // num | Numeric filter on total mass (kg). Supports range operators. Example: `2435`
final num filterLeftSquareBracketCargoCapacityRightSquareBracket = 8.14; // num | Numeric filter on cargo capacity (SCU). Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `0`
final num filterLeftSquareBracketVehicleInventoryRightSquareBracket = 8.14; // num | Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.39`
final int filterLeftSquareBracketCrewPeriodMinRightSquareBracket = 56; // int | Numeric filter on minimum crew count. Supports range operators. Example: `1`
final num filterLeftSquareBracketHealthRightSquareBracket = 8.14; // num | Numeric filter on vehicle health points. Supports range operators. Example: `1550`
final num filterLeftSquareBracketShieldPeriodHpRightSquareBracket = 8.14; // num | Numeric filter on total shield hit points. Supports range operators. Example: `720`
final String filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket = filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket_example; // String | Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
final num filterLeftSquareBracketSpeedPeriodScmRightSquareBracket = 8.14; // num | Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `200`
final num filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket = 8.14; // num | Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `1000`
final num filterLeftSquareBracketArmorPeriodHealthRightSquareBracket = 8.14; // num | Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `50000`
final num filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket = 8.14; // num | Numeric filter on cross-section length (X axis). Supports range operators. Example: `0.39`
final num filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket = 8.14; // num | Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
final num filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket = 8.14; // num | Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
final num filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket = 8.14; // num | Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
final num filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket = 8.14; // num | Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
final num filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket = 8.14; // num | Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
final num filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket = 8.14; // num | Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`

try {
    final response = api.listGravlevVehicles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->listGravlevVehicles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Drake Interplanetary` | [optional] 
 **filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket** | **String**| Alias for filter[manufacturer]. Example: `Origin Jumpworks` | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**| Partial match on vehicle class name. Example: `Dragonfly` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on vehicle display name. Example: `Dragonfly` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search vehicles by name or class name. Example: `Dragonfly` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **int**| Exact match on vehicle size (1-6). Example: `1` | [optional] 
 **filterLeftSquareBracketSizeClassRightSquareBracket** | **int**| Alias for filter[size]. Example: `1` | [optional] 
 **filterLeftSquareBracketCareerRightSquareBracket** | **String**| Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration` | [optional] 
 **filterLeftSquareBracketRoleRightSquareBracket** | **String**| Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing` | [optional] 
 **filterLeftSquareBracketIsVehicleRightSquareBracket** | **bool**| Filter to ground vehicles only. | [optional] 
 **filterLeftSquareBracketIsGravlevRightSquareBracket** | **bool**| Filter to gravlev vehicles only. | [optional] 
 **filterLeftSquareBracketIsSpaceshipRightSquareBracket** | **bool**| Filter to spaceships only. | [optional] 
 **filterLeftSquareBracketMassTotalRightSquareBracket** | **num**| Numeric filter on total mass (kg). Supports range operators. Example: `2435` | [optional] 
 **filterLeftSquareBracketCargoCapacityRightSquareBracket** | **num**| Numeric filter on cargo capacity (SCU). Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `0` | [optional] 
 **filterLeftSquareBracketVehicleInventoryRightSquareBracket** | **num**| Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.39` | [optional] 
 **filterLeftSquareBracketCrewPeriodMinRightSquareBracket** | **int**| Numeric filter on minimum crew count. Supports range operators. Example: `1` | [optional] 
 **filterLeftSquareBracketHealthRightSquareBracket** | **num**| Numeric filter on vehicle health points. Supports range operators. Example: `1550` | [optional] 
 **filterLeftSquareBracketShieldPeriodHpRightSquareBracket** | **num**| Numeric filter on total shield hit points. Supports range operators. Example: `720` | [optional] 
 **filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket** | **String**| Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble` | [optional] 
 **filterLeftSquareBracketSpeedPeriodScmRightSquareBracket** | **num**| Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `200` | [optional] 
 **filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket** | **num**| Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `1000` | [optional] 
 **filterLeftSquareBracketArmorPeriodHealthRightSquareBracket** | **num**| Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `50000` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket** | **num**| Numeric filter on cross-section length (X axis). Supports range operators. Example: `0.39` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket** | **num**| Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket** | **num**| Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30` | [optional] 
 **filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket** | **num**| Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100` | [optional] 
 **filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket** | **num**| Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100` | [optional] 
 **filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket** | **num**| Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100` | [optional] 
 **filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket** | **num**| Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100` | [optional] 

### Return type

[**ListGroundVehicles200Response**](ListGroundVehicles200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGroundVehicles**
> ListGroundVehicles200Response listGroundVehicles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket)

In-Game Ground Vehicles Overview

Alias for /api/vehicles scoped to ground vehicles (is_vehicle=true, is_gravlev=false, is_spaceship=false). Returns paginated in-game ground vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = -cargo_capacity; // String | Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Tumbril Land Systems`
final String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket = filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket_example; // String | Alias for filter[manufacturer]. Example: `Anvil Aerospace`
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | Partial match on vehicle class name. Example: `TMBL_Nova`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on vehicle display name. Example: `Nova`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search vehicles by name or class name. Example: `Nova`
final int filterLeftSquareBracketSizeRightSquareBracket = 56; // int | Exact match on vehicle size (1-6). Example: `3`
final int filterLeftSquareBracketSizeClassRightSquareBracket = 56; // int | Alias for filter[size]. Example: `3`
final String filterLeftSquareBracketCareerRightSquareBracket = filterLeftSquareBracketCareerRightSquareBracket_example; // String | Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Ground`
final String filterLeftSquareBracketRoleRightSquareBracket = filterLeftSquareBracketRoleRightSquareBracket_example; // String | Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Combat`
final bool filterLeftSquareBracketIsVehicleRightSquareBracket = true; // bool | Filter to ground vehicles only.
final bool filterLeftSquareBracketIsGravlevRightSquareBracket = true; // bool | Filter to gravlev vehicles only.
final bool filterLeftSquareBracketIsSpaceshipRightSquareBracket = true; // bool | Filter to spaceships only.
final num filterLeftSquareBracketMassTotalRightSquareBracket = 8.14; // num | Numeric filter on total mass (kg). Supports range operators. Example: `1521`
final num filterLeftSquareBracketCargoCapacityRightSquareBracket = 8.14; // num | Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1`
final num filterLeftSquareBracketVehicleInventoryRightSquareBracket = 8.14; // num | Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13`
final int filterLeftSquareBracketCrewPeriodMinRightSquareBracket = 56; // int | Numeric filter on minimum crew count. Supports range operators. Example: `2`
final num filterLeftSquareBracketHealthRightSquareBracket = 8.14; // num | Numeric filter on vehicle health points. Supports range operators. Example: `4250`
final num filterLeftSquareBracketShieldPeriodHpRightSquareBracket = 8.14; // num | Numeric filter on total shield hit points. Supports range operators. Example: `720`
final String filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket = filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket_example; // String | Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
final num filterLeftSquareBracketSpeedPeriodScmRightSquareBracket = 8.14; // num | Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `200`
final num filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket = 8.14; // num | Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `1000`
final num filterLeftSquareBracketArmorPeriodHealthRightSquareBracket = 8.14; // num | Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `50000`
final num filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket = 8.14; // num | Numeric filter on cross-section length (X axis). Supports range operators. Example: `100`
final num filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket = 8.14; // num | Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
final num filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket = 8.14; // num | Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
final num filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket = 8.14; // num | Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
final num filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket = 8.14; // num | Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
final num filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket = 8.14; // num | Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
final num filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket = 8.14; // num | Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`

try {
    final response = api.listGroundVehicles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->listGroundVehicles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Tumbril Land Systems` | [optional] 
 **filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket** | **String**| Alias for filter[manufacturer]. Example: `Anvil Aerospace` | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**| Partial match on vehicle class name. Example: `TMBL_Nova` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on vehicle display name. Example: `Nova` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search vehicles by name or class name. Example: `Nova` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **int**| Exact match on vehicle size (1-6). Example: `3` | [optional] 
 **filterLeftSquareBracketSizeClassRightSquareBracket** | **int**| Alias for filter[size]. Example: `3` | [optional] 
 **filterLeftSquareBracketCareerRightSquareBracket** | **String**| Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Ground` | [optional] 
 **filterLeftSquareBracketRoleRightSquareBracket** | **String**| Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Combat` | [optional] 
 **filterLeftSquareBracketIsVehicleRightSquareBracket** | **bool**| Filter to ground vehicles only. | [optional] 
 **filterLeftSquareBracketIsGravlevRightSquareBracket** | **bool**| Filter to gravlev vehicles only. | [optional] 
 **filterLeftSquareBracketIsSpaceshipRightSquareBracket** | **bool**| Filter to spaceships only. | [optional] 
 **filterLeftSquareBracketMassTotalRightSquareBracket** | **num**| Numeric filter on total mass (kg). Supports range operators. Example: `1521` | [optional] 
 **filterLeftSquareBracketCargoCapacityRightSquareBracket** | **num**| Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1` | [optional] 
 **filterLeftSquareBracketVehicleInventoryRightSquareBracket** | **num**| Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13` | [optional] 
 **filterLeftSquareBracketCrewPeriodMinRightSquareBracket** | **int**| Numeric filter on minimum crew count. Supports range operators. Example: `2` | [optional] 
 **filterLeftSquareBracketHealthRightSquareBracket** | **num**| Numeric filter on vehicle health points. Supports range operators. Example: `4250` | [optional] 
 **filterLeftSquareBracketShieldPeriodHpRightSquareBracket** | **num**| Numeric filter on total shield hit points. Supports range operators. Example: `720` | [optional] 
 **filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket** | **String**| Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble` | [optional] 
 **filterLeftSquareBracketSpeedPeriodScmRightSquareBracket** | **num**| Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `200` | [optional] 
 **filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket** | **num**| Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `1000` | [optional] 
 **filterLeftSquareBracketArmorPeriodHealthRightSquareBracket** | **num**| Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `50000` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket** | **num**| Numeric filter on cross-section length (X axis). Supports range operators. Example: `100` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket** | **num**| Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket** | **num**| Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30` | [optional] 
 **filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket** | **num**| Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100` | [optional] 
 **filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket** | **num**| Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100` | [optional] 
 **filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket** | **num**| Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100` | [optional] 
 **filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket** | **num**| Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100` | [optional] 

### Return type

[**ListGroundVehicles200Response**](ListGroundVehicles200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listShipMatrixFilters**
> ListShipMatrixFilters200Response listShipMatrixFilters()

Ship Matrix Vehicle Filters

Return all available filter values for Ship Matrix vehicles. Supports cross-filtering: pass filter parameters to get filtered facet counts.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();

try {
    final response = api.listShipMatrixFilters();
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->listShipMatrixFilters: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListShipMatrixFilters200Response**](ListShipMatrixFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listShipMatrixVehicles**
> ListShipMatrixVehicles200Response listShipMatrixVehicles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketFocusRightSquareBracket, filterLeftSquareBracketProductionStatusRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, sort)

Ship Matrix Vehicles Overview

Returns paginated Ship Matrix vehicles with optional filters. SKU variants and loaner vehicles are included by default.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketManufacturerRightSquareBracket = Anvil Aerospace; // String | Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values)
final String filterLeftSquareBracketSizeRightSquareBracket = medium; // String | Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values)
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Filter by vehicle type slug
final String filterLeftSquareBracketFocusRightSquareBracket = filterLeftSquareBracketFocusRightSquareBracket_example; // String | Filter by vehicle focus slug (comma-separated for multiple)
final String filterLeftSquareBracketProductionStatusRightSquareBracket = filterLeftSquareBracketProductionStatusRightSquareBracket_example; // String | Filter by production status slug
final String filterLeftSquareBracketNameRightSquareBracket = Avenger; // String | Partial match on vehicle name
final String sort = -name; // String | Sort field. Prefix with \"-\" for descending. Supported: id, chassis_id, name, msrp, updated_at, length, width, height, cargo_capacity, min_crew, max_crew, manufacturer, focus, type, size

try {
    final response = api.listShipMatrixVehicles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketFocusRightSquareBracket, filterLeftSquareBracketProductionStatusRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, sort);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->listShipMatrixVehicles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values) | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **String**| Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values) | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Filter by vehicle type slug | [optional] 
 **filterLeftSquareBracketFocusRightSquareBracket** | **String**| Filter by vehicle focus slug (comma-separated for multiple) | [optional] 
 **filterLeftSquareBracketProductionStatusRightSquareBracket** | **String**| Filter by production status slug | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on vehicle name | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supported: id, chassis_id, name, msrp, updated_at, length, width, height, cargo_capacity, min_crew, max_crew, manufacturer, focus, type, size | [optional] 

### Return type

[**ListShipMatrixVehicles200Response**](ListShipMatrixVehicles200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVehicleFilters**
> ListVehicleFilters200Response listVehicleFilters(version)

In-Game Vehicle Filters

Return all available filter values for in-game vehicles.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.listVehicleFilters(version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->listVehicleFilters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**ListVehicleFilters200Response**](ListVehicleFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVehicles**
> ListGroundVehicles200Response listVehicles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket)

In-Game Vehicles Overview

Returns paginated in-game vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus. Optional includes: shipMatrixVehicle, components, shipmatrixvehicle.components, hardpoints, ports.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = -cargo_capacity; // String | Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Aegis Dynamics`
final String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket = filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket_example; // String | Alias for filter[manufacturer]. Example: `Anvil Aerospace`
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | Partial match on vehicle class name. Example: `TMBL_Nova`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on vehicle display name. Example: `Nova`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search vehicles by name or class name. Example: `Carrack`
final int filterLeftSquareBracketSizeRightSquareBracket = 56; // int | Exact match on vehicle size (1-6). Example: `3`
final int filterLeftSquareBracketSizeClassRightSquareBracket = 56; // int | Alias for filter[size]. Example: `3`
final String filterLeftSquareBracketCareerRightSquareBracket = filterLeftSquareBracketCareerRightSquareBracket_example; // String | Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration`
final String filterLeftSquareBracketRoleRightSquareBracket = filterLeftSquareBracketRoleRightSquareBracket_example; // String | Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing`
final bool filterLeftSquareBracketIsVehicleRightSquareBracket = true; // bool | Filter to ground vehicles only.
final bool filterLeftSquareBracketIsGravlevRightSquareBracket = true; // bool | Filter to gravlev vehicles only.
final bool filterLeftSquareBracketIsSpaceshipRightSquareBracket = true; // bool | Filter to spaceships only.
final num filterLeftSquareBracketMassTotalRightSquareBracket = 8.14; // num | Numeric filter on total mass (kg). Supports range operators. Example: `1521`
final num filterLeftSquareBracketCargoCapacityRightSquareBracket = 8.14; // num | Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1`
final num filterLeftSquareBracketVehicleInventoryRightSquareBracket = 8.14; // num | Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13`
final int filterLeftSquareBracketCrewPeriodMinRightSquareBracket = 56; // int | Numeric filter on minimum crew count. Supports range operators. Example: `2`
final num filterLeftSquareBracketHealthRightSquareBracket = 8.14; // num | Numeric filter on vehicle health points. Supports range operators. Example: `1550`
final num filterLeftSquareBracketShieldPeriodHpRightSquareBracket = 8.14; // num | Numeric filter on total shield hit points. Supports range operators. Example: `720`
final String filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket = filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket_example; // String | Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
final num filterLeftSquareBracketSpeedPeriodScmRightSquareBracket = 8.14; // num | Numeric filter on SCM speed. Supports range operators. Example: `220`
final num filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket = 8.14; // num | Numeric filter on maximum speed. Supports range operators. Example: `1150`
final num filterLeftSquareBracketArmorPeriodHealthRightSquareBracket = 8.14; // num | Numeric filter on armor health points. Supports range operators. Example: `10890`
final num filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket = 8.14; // num | Numeric filter on cross-section length (X axis). Supports range operators. Example: `100`
final num filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket = 8.14; // num | Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
final num filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket = 8.14; // num | Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
final num filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket = 8.14; // num | Numeric filter on infrared quantum signature emission. Supports range operators. Example: `10882`
final num filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket = 8.14; // num | Numeric filter on infrared shield signature emission. Supports range operators. Example: `10267`
final num filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket = 8.14; // num | Numeric filter on electromagnetic quantum signature emission. Supports range operators. Example: `53959`
final num filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket = 8.14; // num | Numeric filter on electromagnetic shield signature emission. Supports range operators. Example: `17643`

try {
    final response = api.listVehicles(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->listVehicles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Aegis Dynamics` | [optional] 
 **filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket** | **String**| Alias for filter[manufacturer]. Example: `Anvil Aerospace` | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**| Partial match on vehicle class name. Example: `TMBL_Nova` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on vehicle display name. Example: `Nova` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search vehicles by name or class name. Example: `Carrack` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **int**| Exact match on vehicle size (1-6). Example: `3` | [optional] 
 **filterLeftSquareBracketSizeClassRightSquareBracket** | **int**| Alias for filter[size]. Example: `3` | [optional] 
 **filterLeftSquareBracketCareerRightSquareBracket** | **String**| Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration` | [optional] 
 **filterLeftSquareBracketRoleRightSquareBracket** | **String**| Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing` | [optional] 
 **filterLeftSquareBracketIsVehicleRightSquareBracket** | **bool**| Filter to ground vehicles only. | [optional] 
 **filterLeftSquareBracketIsGravlevRightSquareBracket** | **bool**| Filter to gravlev vehicles only. | [optional] 
 **filterLeftSquareBracketIsSpaceshipRightSquareBracket** | **bool**| Filter to spaceships only. | [optional] 
 **filterLeftSquareBracketMassTotalRightSquareBracket** | **num**| Numeric filter on total mass (kg). Supports range operators. Example: `1521` | [optional] 
 **filterLeftSquareBracketCargoCapacityRightSquareBracket** | **num**| Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1` | [optional] 
 **filterLeftSquareBracketVehicleInventoryRightSquareBracket** | **num**| Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13` | [optional] 
 **filterLeftSquareBracketCrewPeriodMinRightSquareBracket** | **int**| Numeric filter on minimum crew count. Supports range operators. Example: `2` | [optional] 
 **filterLeftSquareBracketHealthRightSquareBracket** | **num**| Numeric filter on vehicle health points. Supports range operators. Example: `1550` | [optional] 
 **filterLeftSquareBracketShieldPeriodHpRightSquareBracket** | **num**| Numeric filter on total shield hit points. Supports range operators. Example: `720` | [optional] 
 **filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket** | **String**| Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble` | [optional] 
 **filterLeftSquareBracketSpeedPeriodScmRightSquareBracket** | **num**| Numeric filter on SCM speed. Supports range operators. Example: `220` | [optional] 
 **filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket** | **num**| Numeric filter on maximum speed. Supports range operators. Example: `1150` | [optional] 
 **filterLeftSquareBracketArmorPeriodHealthRightSquareBracket** | **num**| Numeric filter on armor health points. Supports range operators. Example: `10890` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket** | **num**| Numeric filter on cross-section length (X axis). Supports range operators. Example: `100` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket** | **num**| Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50` | [optional] 
 **filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket** | **num**| Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30` | [optional] 
 **filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket** | **num**| Numeric filter on infrared quantum signature emission. Supports range operators. Example: `10882` | [optional] 
 **filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket** | **num**| Numeric filter on infrared shield signature emission. Supports range operators. Example: `10267` | [optional] 
 **filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket** | **num**| Numeric filter on electromagnetic quantum signature emission. Supports range operators. Example: `53959` | [optional] 
 **filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket** | **num**| Numeric filter on electromagnetic shield signature emission. Supports range operators. Example: `17643` | [optional] 

### Return type

[**ListGroundVehicles200Response**](ListGroundVehicles200Response.md)

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

final api = StarcitizenWikiApi().getVehiclesApi();
final Object body = {"query": "Dragonfly"}; // Object | Vehicle name, class_name, or UUID
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchGravlevVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->searchGravlevVehiclesDeprecated: $e\n');
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

final api = StarcitizenWikiApi().getVehiclesApi();
final Object body = {"query": "Nova"}; // Object | Vehicle name, class_name, or UUID
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchGroundVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VehiclesApi->searchGroundVehiclesDeprecated: $e\n');
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

# **searchShipMatrixVehiclesDeprecated**
> SearchShipMatrixVehiclesDeprecated200Response searchShipMatrixVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketFocusRightSquareBracket, filterLeftSquareBracketProductionStatusRightSquareBracket)

Ship Matrix Vehicle Search (Deprecated)

Deprecated. Use GET /api/shipmatrix/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
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
    print('Exception when calling VehiclesApi->searchShipMatrixVehiclesDeprecated: $e\n');
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

# **searchVehiclesDeprecated**
> ListGroundVehicles200Response searchVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketSizeClassRightSquareBracket, filterLeftSquareBracketCareerRightSquareBracket, filterLeftSquareBracketRoleRightSquareBracket, filterLeftSquareBracketIsVehicleRightSquareBracket, filterLeftSquareBracketIsGravlevRightSquareBracket, filterLeftSquareBracketIsSpaceshipRightSquareBracket, filterLeftSquareBracketMassTotalRightSquareBracket, filterLeftSquareBracketCargoCapacityRightSquareBracket, filterLeftSquareBracketVehicleInventoryRightSquareBracket, filterLeftSquareBracketCrewPeriodMinRightSquareBracket, filterLeftSquareBracketHealthRightSquareBracket, filterLeftSquareBracketShieldPeriodHpRightSquareBracket, filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket)

In-Game Vehicle Search (Deprecated)

Deprecated. Use GET /api/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getVehiclesApi();
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
    print('Exception when calling VehiclesApi->searchVehiclesDeprecated: $e\n');
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

