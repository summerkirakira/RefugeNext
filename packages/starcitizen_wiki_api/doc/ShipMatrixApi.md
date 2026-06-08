# starcitizen_wiki_api.api.ShipMatrixApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getShipMatrixVehicle**](ShipMatrixApi.md#getshipmatrixvehicle) | **GET** /api/shipmatrix/vehicles/{slug} | Ship Matrix Vehicle Detail
[**listShipMatrixFilters**](ShipMatrixApi.md#listshipmatrixfilters) | **GET** /api/shipmatrix/vehicles/filters | Ship Matrix Vehicle Filters
[**listShipMatrixVehicles**](ShipMatrixApi.md#listshipmatrixvehicles) | **GET** /api/shipmatrix/vehicles | Ship Matrix Vehicles Overview
[**searchShipMatrixVehiclesDeprecated**](ShipMatrixApi.md#searchshipmatrixvehiclesdeprecated) | **POST** /api/shipmatrix/vehicles/search | Ship Matrix Vehicle Search (Deprecated)


# **getShipMatrixVehicle**
> GetShipMatrixVehicle200Response getShipMatrixVehicle(slug, include)

Ship Matrix Vehicle Detail

Retrieve a Ship Matrix vehicle by slug. Use the \"include\" query parameter to load additional relationships: components, loaner, skus.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getShipMatrixApi();
final String slug = slug_example; // String | 
final String include = include_example; // String | Include additional relationships (components, loaner, skus)

try {
    final response = api.getShipMatrixVehicle(slug, include);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ShipMatrixApi->getShipMatrixVehicle: $e\n');
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

# **listShipMatrixFilters**
> ListShipMatrixFilters200Response listShipMatrixFilters()

Ship Matrix Vehicle Filters

Return all available filter values for Ship Matrix vehicles. Supports cross-filtering: pass filter parameters to get filtered facet counts.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getShipMatrixApi();

try {
    final response = api.listShipMatrixFilters();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ShipMatrixApi->listShipMatrixFilters: $e\n');
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

final api = StarcitizenWikiApi().getShipMatrixApi();
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
    print('Exception when calling ShipMatrixApi->listShipMatrixVehicles: $e\n');
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

# **searchShipMatrixVehiclesDeprecated**
> SearchShipMatrixVehiclesDeprecated200Response searchShipMatrixVehiclesDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketFocusRightSquareBracket, filterLeftSquareBracketProductionStatusRightSquareBracket)

Ship Matrix Vehicle Search (Deprecated)

Deprecated. Use GET /api/shipmatrix/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getShipMatrixApi();
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
    print('Exception when calling ShipMatrixApi->searchShipMatrixVehiclesDeprecated: $e\n');
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

