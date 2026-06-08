# starcitizen_wiki_api.api.MetaApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getOpenApiSpec**](MetaApi.md#getopenapispec) | **GET** /api/openapi | OpenAPI Specification


# **getOpenApiSpec**
> Uint8List getOpenApiSpec()

OpenAPI Specification

Returns the OpenAPI 3.0 specification as YAML. This spec describes all documented API endpoints, parameters, request bodies, and response schemas.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getMetaApi();

try {
    final response = api.getOpenApiSpec();
    print(response);
} on DioException catch (e) {
    print('Exception when calling MetaApi->getOpenApiSpec: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/yaml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

