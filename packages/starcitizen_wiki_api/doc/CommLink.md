# starcitizen_wiki_api.model.CommLink

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | CIG identifier for the Comm-Link | [optional] 
**title** | **String** | Title of the Comm-Link | [optional] 
**rsiUrl** | **String** | Link to the Comm-Link on the RSI website. | [optional] 
**apiUrl** | **String** | API URL for this Comm-Link resource. | [optional] 
**apiPublicUrl** | **String** | Public web URL for this Comm-Link on the API portal. | [optional] 
**channel** | **String** | Publishing channel, e.g. Engineering, Transmission. | [optional] 
**category** | **String** | Content category, e.g. General, Community, Lore, Development. | [optional] 
**series** | **String** | Series the Comm-Link belongs to, e.g. Around the Verse, 10 For the Chairman. | [optional] 
**images** | [**List&lt;CommLinkImage&gt;**](CommLinkImage.md) | Included images when the `images` relation is loaded. | [optional] 
**imagesCount** | **int** | Total number of images associated with this Comm-Link. | [optional] 
**links** | [**List&lt;CommLinkLink&gt;**](CommLinkLink.md) | Included links when the `links` relation is loaded. | [optional] 
**linksCount** | **int** | Total number of external links in the Comm-Link content. | [optional] 
**commentCount** | **int** | Number of comments on the original RSI post. | [optional] 
**createdAt** | [**DateTime**](DateTime.md) | ISO 8601 timestamp of when the Comm-Link was published. | [optional] 
**translations** | [**Translation**](Translation.md) |  | [optional] 
**createdAtHuman** | **String** | Human-readable relative time since publication. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


