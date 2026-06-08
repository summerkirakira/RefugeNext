# starcitizen_wiki_api.api.ImagesApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCommLinkImage**](ImagesApi.md#getcommlinkimage) | **GET** /api/comm-link-images/{image} | Comm-Link Image Detail
[**getRandomCommLinkImage**](ImagesApi.md#getrandomcommlinkimage) | **GET** /api/comm-link-images/random | Comm-Link Images Random
[**listCommLinkImages**](ImagesApi.md#listcommlinkimages) | **GET** /api/comm-link-images | Comm-Link Images
[**searchCommLinkImages**](ImagesApi.md#searchcommlinkimages) | **POST** /api/comm-link-images/search | Comm-Link Image Search by filename


# **getCommLinkImage**
> GetCommLinkImage200Response getCommLinkImage(image)

Comm-Link Image Detail

Retrieve a single comm-link image with its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getImagesApi();
final int image = 44216; // int | Internal database ID of the image

try {
    final response = api.getCommLinkImage(image);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ImagesApi->getCommLinkImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image** | **int**| Internal database ID of the image | 

### Return type

[**GetCommLinkImage200Response**](GetCommLinkImage200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRandomCommLinkImage**
> ReverseImageSearch200Response getRandomCommLinkImage(limit, filterLeftSquareBracketTagsRightSquareBracket)

Comm-Link Images Random

Retrieve random comm-link images (minimum 250 KB), optionally filtered by tag name. Only images without a base image are included.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getImagesApi();
final int limit = 5; // int | Number of random images to return
final String filterLeftSquareBracketTagsRightSquareBracket = concept; // String | Partial match on tag name

try {
    final response = api.getRandomCommLinkImage(limit, filterLeftSquareBracketTagsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ImagesApi->getRandomCommLinkImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Number of random images to return | [optional] 
 **filterLeftSquareBracketTagsRightSquareBracket** | **String**| Partial match on tag name | [optional] 

### Return type

[**ReverseImageSearch200Response**](ReverseImageSearch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCommLinkImages**
> ListCommLinkImages200Response listCommLinkImages(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTagsRightSquareBracket)

Comm-Link Images

List available comm-link images with pagination. Each image includes its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getImagesApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String filterLeftSquareBracketTagsRightSquareBracket = concept; // String | Partial match on tag name. WARNING: Images have no tags currently.

try {
    final response = api.listCommLinkImages(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketTagsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ImagesApi->listCommLinkImages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **filterLeftSquareBracketTagsRightSquareBracket** | **String**| Partial match on tag name. WARNING: Images have no tags currently. | [optional] 

### Return type

[**ListCommLinkImages200Response**](ListCommLinkImages200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchCommLinkImages**
> ReverseImageSearch200Response searchCommLinkImages(searchCommLinkImagesRequest, filterLeftSquareBracketTagsRightSquareBracket)

Comm-Link Image Search by filename

Search comm-link images by filename with optional tag filtering. Only images without a base image and with non-zero file size are returned.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getImagesApi();
final SearchCommLinkImagesRequest searchCommLinkImagesRequest = {"query": "Starshipbridge"}; // SearchCommLinkImagesRequest | 
final String filterLeftSquareBracketTagsRightSquareBracket = concept; // String | Partial match on tag name

try {
    final response = api.searchCommLinkImages(searchCommLinkImagesRequest, filterLeftSquareBracketTagsRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ImagesApi->searchCommLinkImages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchCommLinkImagesRequest** | [**SearchCommLinkImagesRequest**](SearchCommLinkImagesRequest.md)|  | 
 **filterLeftSquareBracketTagsRightSquareBracket** | **String**| Partial match on tag name | [optional] 

### Return type

[**ReverseImageSearch200Response**](ReverseImageSearch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

