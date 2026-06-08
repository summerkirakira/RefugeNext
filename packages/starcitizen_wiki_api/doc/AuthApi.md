# starcitizen_wiki_api.api.AuthApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAuthenticatedUser**](AuthApi.md#getauthenticateduser) | **GET** /api/user | Get Authenticated User


# **getAuthenticatedUser**
> GetAuthenticatedUser200Response getAuthenticatedUser()

Get Authenticated User

Returns the currently authenticated user. Requires a valid Sanctum bearer token.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getAuthApi();

try {
    final response = api.getAuthenticatedUser();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->getAuthenticatedUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetAuthenticatedUser200Response**](GetAuthenticatedUser200Response.md)

### Authorization

[sanctum](../README.md#sanctum)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

