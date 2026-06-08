# starcitizen_wiki_api.api.StarmapApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCelestialObject**](StarmapApi.md#getcelestialobject) | **GET** /api/celestial-objects/{code} | Celestial Object Detail
[**getLocation**](StarmapApi.md#getlocation) | **GET** /api/locations/{identifier} | Game Starmap Location Detail
[**getStarsystem**](StarmapApi.md#getstarsystem) | **GET** /api/starsystems/{code} | Starsystem Detail
[**listCelestialObjects**](StarmapApi.md#listcelestialobjects) | **GET** /api/celestial-objects | Starmap Celestial Objects Overview
[**listLocationFilters**](StarmapApi.md#listlocationfilters) | **GET** /api/locations/filters | Game Starmap Location Filters
[**listLocationPositions**](StarmapApi.md#listlocationpositions) | **GET** /api/locations/positions | Starmap Entity Positions
[**listLocations**](StarmapApi.md#listlocations) | **GET** /api/locations | Game Starmap Locations Overview
[**listStarsystemFilters**](StarmapApi.md#liststarsystemfilters) | **GET** /api/starsystems/filters | Starsystem Filters
[**listStarsystems**](StarmapApi.md#liststarsystems) | **GET** /api/starsystems | Starmap Starsystems Overview
[**searchCelestialObjectsDeprecated**](StarmapApi.md#searchcelestialobjectsdeprecated) | **POST** /api/celestial-objects/search | Celestial Object Search (Deprecated)
[**searchStarsystemsDeprecated**](StarmapApi.md#searchstarsystemsdeprecated) | **POST** /api/starsystems/search | Starsystem Search (Deprecated)


# **getCelestialObject**
> GetCelestialObject200Response getCelestialObject(code, include)

Celestial Object Detail

Retrieve a celestial object by code, optionally including relations.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final String code = code_example; // String | 
final String include = include_example; // String | Include additional relationships (affiliation, starsystem, jumppoints).

try {
    final response = api.getCelestialObject(code, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->getCelestialObject: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | 
 **include** | **String**| Include additional relationships (affiliation, starsystem, jumppoints). | [optional] 

### Return type

[**GetCelestialObject200Response**](GetCelestialObject200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLocation**
> GetLocation200Response getLocation(identifier, include, version)

Game Starmap Location Detail

Retrieve a versioned starmap location by slug or UUID. Results are scoped to the requested or default game version. Use the `include` parameter to load additional relations: `children` (child locations with amenities and tags), `resources` (harvestable resource placements with commodity data), `missions` (available missions with faction data).

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final String identifier = aberdeen; // String | 
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getLocation(identifier, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->getLocation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetLocation200Response**](GetLocation200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStarsystem**
> GetStarsystem200Response getStarsystem(code, include)

Starsystem Detail

Retrieve a starsystem by code or identifier, with optional includes.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final String code = code_example; // String | 
final String include = include_example; // String | Include additional relationships (affiliation, celestialObjects, jumppoints).

try {
    final response = api.getStarsystem(code, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->getStarsystem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | 
 **include** | **String**| Include additional relationships (affiliation, celestialObjects, jumppoints). | [optional] 

### Return type

[**GetStarsystem200Response**](GetStarsystem200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCelestialObjects**
> ListCelestialObjects200Response listCelestialObjects(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketStarsystemRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketDesignationRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, sort, include)

Starmap Celestial Objects Overview

Returns paginated celestial objects with optional relationships.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketStarsystemRightSquareBracket = filterLeftSquareBracketStarsystemRightSquareBracket_example; // String | 
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on celestial object name
final String filterLeftSquareBracketDesignationRightSquareBracket = filterLeftSquareBracketDesignationRightSquareBracket_example; // String | 
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | 
final String sort = sort_example; // String | 
final String include = include_example; // String | Include additional relationships (affiliation, starsystem, jumppoints).

try {
    final response = api.listCelestialObjects(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketStarsystemRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketDesignationRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, sort, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->listCelestialObjects: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketStarsystemRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on celestial object name | [optional] 
 **filterLeftSquareBracketDesignationRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**|  | [optional] 
 **sort** | **String**|  | [optional] 
 **include** | **String**| Include additional relationships (affiliation, starsystem, jumppoints). | [optional] 

### Return type

[**ListCelestialObjects200Response**](ListCelestialObjects200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listLocationFilters**
> ListLocationFilters200Response listLocationFilters(version, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketTypeNameRightSquareBracket, filterLeftSquareBracketTypeClassificationRightSquareBracket, filterLeftSquareBracketRespawnLocationTypeRightSquareBracket, filterLeftSquareBracketJurisdictionNameRightSquareBracket, filterLeftSquareBracketAffiliationNameRightSquareBracket, filterLeftSquareBracketIsScannableRightSquareBracket, filterLeftSquareBracketBlockTravelRightSquareBracket, filterLeftSquareBracketAmenityRightSquareBracket, filterLeftSquareBracketTagRightSquareBracket, filterLeftSquareBracketParentNameRightSquareBracket, filterLeftSquareBracketParentUuidRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket, filterLeftSquareBracketHasResourcesRightSquareBracket, filterLeftSquareBracketResourceRightSquareBracket, filterLeftSquareBracketHideMinorLocationsRightSquareBracket)

Game Starmap Location Filters

Return all available filter facet values for versioned starmap locations. Applies any provided filter parameters to scope the facet counts. Returns facets for: type_name, type_classification, respawn_location_type, jurisdiction_name, affiliation_name, system, parent_name, amenity, and resource.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String filterLeftSquareBracketNameRightSquareBracket = Aberdeen; // String | Partial match on location name.
final String filterLeftSquareBracketQueryRightSquareBracket = ArcCorp; // String | Search locations by name.
final String filterLeftSquareBracketTypeNameRightSquareBracket = Planet; // String | Exact match on location type name (see response for valid values).
final String filterLeftSquareBracketTypeClassificationRightSquareBracket = Outpost; // String | Location type classification from JSON data (see response for valid values).
final String filterLeftSquareBracketRespawnLocationTypeRightSquareBracket = Hospital; // String | Respawn location type classification (see response for valid values).
final String filterLeftSquareBracketJurisdictionNameRightSquareBracket = UEE; // String | Governing jurisdiction name (see response for valid values).
final String filterLeftSquareBracketAffiliationNameRightSquareBracket = Private Security; // String | Faction or organization affiliation display name (see response for valid values).
final bool filterLeftSquareBracketIsScannableRightSquareBracket = true; // bool | When true, only show scannable locations; when false, only show non-scannable.
final bool filterLeftSquareBracketBlockTravelRightSquareBracket = false; // bool | When true, only show locations where travel is blocked; when false, only show locations where travel is allowed.
final String filterLeftSquareBracketAmenityRightSquareBracket = Commodity Trading; // String | Filter by amenity name, display name, or UUID. Accepts comma-separated values (see response for valid values).
final String filterLeftSquareBracketTagRightSquareBracket = HUR_L1; // String | Filter by hierarchy entity tag name or UUID. Accepts comma-separated values.
final String filterLeftSquareBracketParentNameRightSquareBracket = ArcCorp; // String | Partial match on parent location name.
final String filterLeftSquareBracketParentUuidRightSquareBracket = f8f07f5b-1c0e-47c9-aa50-46963065bf18; // String | Exact match on parent location UUID.
final String filterLeftSquareBracketSystemRightSquareBracket = Stanton System; // String | Partial match on star system name (see response for valid values).
final bool filterLeftSquareBracketHasResourcesRightSquareBracket = true; // bool | When true, only locations with harvestable resources; when false, only locations without.
final String filterLeftSquareBracketResourceRightSquareBracket = Agricium; // String | Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values).
final bool filterLeftSquareBracketHideMinorLocationsRightSquareBracket = true; // bool | When true, exclude minor locations that are only shown when their parent is selected.

try {
    final response = api.listLocationFilters(version, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketTypeNameRightSquareBracket, filterLeftSquareBracketTypeClassificationRightSquareBracket, filterLeftSquareBracketRespawnLocationTypeRightSquareBracket, filterLeftSquareBracketJurisdictionNameRightSquareBracket, filterLeftSquareBracketAffiliationNameRightSquareBracket, filterLeftSquareBracketIsScannableRightSquareBracket, filterLeftSquareBracketBlockTravelRightSquareBracket, filterLeftSquareBracketAmenityRightSquareBracket, filterLeftSquareBracketTagRightSquareBracket, filterLeftSquareBracketParentNameRightSquareBracket, filterLeftSquareBracketParentUuidRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket, filterLeftSquareBracketHasResourcesRightSquareBracket, filterLeftSquareBracketResourceRightSquareBracket, filterLeftSquareBracketHideMinorLocationsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->listLocationFilters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on location name. | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search locations by name. | [optional] 
 **filterLeftSquareBracketTypeNameRightSquareBracket** | **String**| Exact match on location type name (see response for valid values). | [optional] 
 **filterLeftSquareBracketTypeClassificationRightSquareBracket** | **String**| Location type classification from JSON data (see response for valid values). | [optional] 
 **filterLeftSquareBracketRespawnLocationTypeRightSquareBracket** | **String**| Respawn location type classification (see response for valid values). | [optional] 
 **filterLeftSquareBracketJurisdictionNameRightSquareBracket** | **String**| Governing jurisdiction name (see response for valid values). | [optional] 
 **filterLeftSquareBracketAffiliationNameRightSquareBracket** | **String**| Faction or organization affiliation display name (see response for valid values). | [optional] 
 **filterLeftSquareBracketIsScannableRightSquareBracket** | **bool**| When true, only show scannable locations; when false, only show non-scannable. | [optional] 
 **filterLeftSquareBracketBlockTravelRightSquareBracket** | **bool**| When true, only show locations where travel is blocked; when false, only show locations where travel is allowed. | [optional] 
 **filterLeftSquareBracketAmenityRightSquareBracket** | **String**| Filter by amenity name, display name, or UUID. Accepts comma-separated values (see response for valid values). | [optional] 
 **filterLeftSquareBracketTagRightSquareBracket** | **String**| Filter by hierarchy entity tag name or UUID. Accepts comma-separated values. | [optional] 
 **filterLeftSquareBracketParentNameRightSquareBracket** | **String**| Partial match on parent location name. | [optional] 
 **filterLeftSquareBracketParentUuidRightSquareBracket** | **String**| Exact match on parent location UUID. | [optional] 
 **filterLeftSquareBracketSystemRightSquareBracket** | **String**| Partial match on star system name (see response for valid values). | [optional] 
 **filterLeftSquareBracketHasResourcesRightSquareBracket** | **bool**| When true, only locations with harvestable resources; when false, only locations without. | [optional] 
 **filterLeftSquareBracketResourceRightSquareBracket** | **String**| Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values). | [optional] 
 **filterLeftSquareBracketHideMinorLocationsRightSquareBracket** | **bool**| When true, exclude minor locations that are only shown when their parent is selected. | [optional] 

### Return type

[**ListLocationFilters200Response**](ListLocationFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listLocationPositions**
> ListLocationPositions200Response listLocationPositions(filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket)

Starmap Entity Positions

Starmap entity world positions.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final String filterLeftSquareBracketTypeRightSquareBracket = Planet; // String | Exact match on entity type (Planet, Moon, Star, Manmade, Asteroid, Anomaly, JumpPoint, etc.)
final String filterLeftSquareBracketSystemRightSquareBracket = stanton; // String | Exact match on system name (stanton, pyro, nyx)

try {
    final response = api.listLocationPositions(filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->listLocationPositions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Exact match on entity type (Planet, Moon, Star, Manmade, Asteroid, Anomaly, JumpPoint, etc.) | [optional] 
 **filterLeftSquareBracketSystemRightSquareBracket** | **String**| Exact match on system name (stanton, pyro, nyx) | [optional] 

### Return type

[**ListLocationPositions200Response**](ListLocationPositions200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listLocations**
> ListLocations200Response listLocations(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, version, sort, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketTypeNameRightSquareBracket, filterLeftSquareBracketTypeClassificationRightSquareBracket, filterLeftSquareBracketRespawnLocationTypeRightSquareBracket, filterLeftSquareBracketJurisdictionNameRightSquareBracket, filterLeftSquareBracketAffiliationNameRightSquareBracket, filterLeftSquareBracketIsScannableRightSquareBracket, filterLeftSquareBracketBlockTravelRightSquareBracket, filterLeftSquareBracketAmenityRightSquareBracket, filterLeftSquareBracketTagRightSquareBracket, filterLeftSquareBracketParentNameRightSquareBracket, filterLeftSquareBracketParentUuidRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket, filterLeftSquareBracketHasResourcesRightSquareBracket, filterLeftSquareBracketResourceRightSquareBracket, filterLeftSquareBracketHideMinorLocationsRightSquareBracket)

Game Starmap Locations Overview

Returns paginated versioned starmap locations with optional filters. Results are scoped to the requested or default game version. Each location includes amenities, hierarchy entity tags, parent and star relations, child count, mission count, and resource availability.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = -size,name; // String | Sort field. Prefix with \"-\" for descending. Supported: name, type_name, size, child_count.
final String filterLeftSquareBracketNameRightSquareBracket = Aberdeen; // String | Partial match on location name.
final String filterLeftSquareBracketQueryRightSquareBracket = ArcCorp; // String | Search locations by name.
final String filterLeftSquareBracketTypeNameRightSquareBracket = Planet; // String | Exact match on location type name (see GET /api/locations/filters for valid values).
final String filterLeftSquareBracketTypeClassificationRightSquareBracket = Outpost; // String | Location type classification from JSON data (see GET /api/locations/filters for valid values).
final String filterLeftSquareBracketRespawnLocationTypeRightSquareBracket = Hospital; // String | Respawn location type classification (see GET /api/locations/filters for valid values).
final String filterLeftSquareBracketJurisdictionNameRightSquareBracket = UEE; // String | Governing jurisdiction name (see GET /api/locations/filters for valid values).
final String filterLeftSquareBracketAffiliationNameRightSquareBracket = Private Security; // String | Faction or organization affiliation display name (see GET /api/locations/filters for valid values).
final bool filterLeftSquareBracketIsScannableRightSquareBracket = true; // bool | When true, only show scannable locations; when false, only show non-scannable.
final bool filterLeftSquareBracketBlockTravelRightSquareBracket = false; // bool | When true, only show locations where travel is blocked; when false, only show locations where travel is allowed.
final String filterLeftSquareBracketAmenityRightSquareBracket = Commodity Trading; // String | Filter by amenity name, display name, or UUID. Accepts comma-separated values (see GET /api/locations/filters for valid values).
final String filterLeftSquareBracketTagRightSquareBracket = HUR_L1; // String | Filter by hierarchy entity tag name or UUID. Accepts comma-separated values.
final String filterLeftSquareBracketParentNameRightSquareBracket = ArcCorp; // String | Partial match on parent location name.
final String filterLeftSquareBracketParentUuidRightSquareBracket = f8f07f5b-1c0e-47c9-aa50-46963065bf18; // String | Exact match on parent location UUID.
final String filterLeftSquareBracketSystemRightSquareBracket = Stanton System; // String | Partial match on star system name (see GET /api/locations/filters for valid values).
final bool filterLeftSquareBracketHasResourcesRightSquareBracket = true; // bool | When true, only locations with harvestable resources; when false, only locations without.
final String filterLeftSquareBracketResourceRightSquareBracket = Agricium; // String | Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values).
final bool filterLeftSquareBracketHideMinorLocationsRightSquareBracket = true; // bool | When true, exclude minor locations that are only shown when their parent is selected.

try {
    final response = api.listLocations(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, version, sort, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketTypeNameRightSquareBracket, filterLeftSquareBracketTypeClassificationRightSquareBracket, filterLeftSquareBracketRespawnLocationTypeRightSquareBracket, filterLeftSquareBracketJurisdictionNameRightSquareBracket, filterLeftSquareBracketAffiliationNameRightSquareBracket, filterLeftSquareBracketIsScannableRightSquareBracket, filterLeftSquareBracketBlockTravelRightSquareBracket, filterLeftSquareBracketAmenityRightSquareBracket, filterLeftSquareBracketTagRightSquareBracket, filterLeftSquareBracketParentNameRightSquareBracket, filterLeftSquareBracketParentUuidRightSquareBracket, filterLeftSquareBracketSystemRightSquareBracket, filterLeftSquareBracketHasResourcesRightSquareBracket, filterLeftSquareBracketResourceRightSquareBracket, filterLeftSquareBracketHideMinorLocationsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->listLocations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supported: name, type_name, size, child_count. | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on location name. | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search locations by name. | [optional] 
 **filterLeftSquareBracketTypeNameRightSquareBracket** | **String**| Exact match on location type name (see GET /api/locations/filters for valid values). | [optional] 
 **filterLeftSquareBracketTypeClassificationRightSquareBracket** | **String**| Location type classification from JSON data (see GET /api/locations/filters for valid values). | [optional] 
 **filterLeftSquareBracketRespawnLocationTypeRightSquareBracket** | **String**| Respawn location type classification (see GET /api/locations/filters for valid values). | [optional] 
 **filterLeftSquareBracketJurisdictionNameRightSquareBracket** | **String**| Governing jurisdiction name (see GET /api/locations/filters for valid values). | [optional] 
 **filterLeftSquareBracketAffiliationNameRightSquareBracket** | **String**| Faction or organization affiliation display name (see GET /api/locations/filters for valid values). | [optional] 
 **filterLeftSquareBracketIsScannableRightSquareBracket** | **bool**| When true, only show scannable locations; when false, only show non-scannable. | [optional] 
 **filterLeftSquareBracketBlockTravelRightSquareBracket** | **bool**| When true, only show locations where travel is blocked; when false, only show locations where travel is allowed. | [optional] 
 **filterLeftSquareBracketAmenityRightSquareBracket** | **String**| Filter by amenity name, display name, or UUID. Accepts comma-separated values (see GET /api/locations/filters for valid values). | [optional] 
 **filterLeftSquareBracketTagRightSquareBracket** | **String**| Filter by hierarchy entity tag name or UUID. Accepts comma-separated values. | [optional] 
 **filterLeftSquareBracketParentNameRightSquareBracket** | **String**| Partial match on parent location name. | [optional] 
 **filterLeftSquareBracketParentUuidRightSquareBracket** | **String**| Exact match on parent location UUID. | [optional] 
 **filterLeftSquareBracketSystemRightSquareBracket** | **String**| Partial match on star system name (see GET /api/locations/filters for valid values). | [optional] 
 **filterLeftSquareBracketHasResourcesRightSquareBracket** | **bool**| When true, only locations with harvestable resources; when false, only locations without. | [optional] 
 **filterLeftSquareBracketResourceRightSquareBracket** | **String**| Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values). | [optional] 
 **filterLeftSquareBracketHideMinorLocationsRightSquareBracket** | **bool**| When true, exclude minor locations that are only shown when their parent is selected. | [optional] 

### Return type

[**ListLocations200Response**](ListLocations200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStarsystemFilters**
> ListStarsystemFilters200Response listStarsystemFilters()

Starsystem Filters

Return all available filter values for starsystems.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();

try {
    final response = api.listStarsystemFilters();
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->listStarsystemFilters: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListStarsystemFilters200Response**](ListStarsystemFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStarsystems**
> ListStarsystems200Response listStarsystems(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketAffiliationRightSquareBracket, filterLeftSquareBracketCodeRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketStatusRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, sort, include)

Starmap Starsystems Overview

Returns paginated starsystems, optionally including related resources.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketAffiliationRightSquareBracket = filterLeftSquareBracketAffiliationRightSquareBracket_example; // String | 
final String filterLeftSquareBracketCodeRightSquareBracket = filterLeftSquareBracketCodeRightSquareBracket_example; // String | 
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | 
final String filterLeftSquareBracketStatusRightSquareBracket = filterLeftSquareBracketStatusRightSquareBracket_example; // String | 
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | 
final num filterLeftSquareBracketSizeRightSquareBracket = 8.14; // num | 
final String sort = sort_example; // String | 
final String include = include_example; // String | Include additional relationships (affiliation, celestialObjects, jumppoints).

try {
    final response = api.listStarsystems(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketAffiliationRightSquareBracket, filterLeftSquareBracketCodeRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketStatusRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, sort, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->listStarsystems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketAffiliationRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketCodeRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketStatusRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**|  | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **num**|  | [optional] 
 **sort** | **String**|  | [optional] 
 **include** | **String**| Include additional relationships (affiliation, celestialObjects, jumppoints). | [optional] 

### Return type

[**ListStarsystems200Response**](ListStarsystems200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchCelestialObjectsDeprecated**
> SearchCelestialObjectsDeprecated200Response searchCelestialObjectsDeprecated(searchCelestialObjectsDeprecatedRequest, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

Celestial Object Search (Deprecated)

Deprecated. Use GET /api/celestial-objects?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest = {"query": "Pleiades"}; // SearchCelestialObjectsDeprecatedRequest | Partial celestial object code or name to search for
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchCelestialObjectsDeprecated(searchCelestialObjectsDeprecatedRequest, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->searchCelestialObjectsDeprecated: $e\n');
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

# **searchStarsystemsDeprecated**
> SearchStarsystemsDeprecated200Response searchStarsystemsDeprecated(searchCelestialObjectsDeprecatedRequest, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket)

Starsystem Search (Deprecated)

Deprecated. Use GET /api/starsystems?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getStarmapApi();
final SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest = {"query": "Sol"}; // SearchCelestialObjectsDeprecatedRequest | Partial starsystem code or name to search for
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.

try {
    final response = api.searchStarsystemsDeprecated(searchCelestialObjectsDeprecatedRequest, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StarmapApi->searchStarsystemsDeprecated: $e\n');
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

