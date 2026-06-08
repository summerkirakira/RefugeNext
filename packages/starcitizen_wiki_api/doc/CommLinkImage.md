# starcitizen_wiki_api.model.CommLinkImage

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Internal database identifier. | [optional] 
**name** | **String** | File name or path segment of the image. | [optional] 
**rsiUrl** | **String** | Full URL to the image on the RSI media CDN. | [optional] 
**apiUrl** | **String** | API URL for this image resource. | [optional] 
**alt** | **String** | Alternative text for the image. | [optional] 
**size** | **int** | File size in bytes. | [optional] 
**mimeType** | **String** | MIME type of the image file. | [optional] 
**lastModified** | [**DateTime**](DateTime.md) | ISO 8601 timestamp of when the image was last modified on the CDN. | [optional] 
**tags** | [**List&lt;CommLinkImageTagsInner&gt;**](CommLinkImageTagsInner.md) | Tags associated with the image when the `tags` relation is loaded. | [optional] 
**similarUrl** | **String** | API URL to find visually similar images. | [optional] 
**commLinks** | [**List&lt;CommLinkImageCommLinksInner&gt;**](CommLinkImageCommLinksInner.md) | Comm-Links that reference this image, included when the `commLinks` relation is loaded. | [optional] 
**duplicates** | [**List&lt;CommLinkImageDuplicatesInner&gt;**](CommLinkImageDuplicatesInner.md) | Duplicate images that share the same base image, included when the `duplicates` relation is loaded. | [optional] 
**baseImage** | [**CommLinkImageBaseImage**](CommLinkImageBaseImage.md) |  | [optional] 
**similarity** | **int** | Similarity percentage to the search image. Only present in reverse image search results. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


