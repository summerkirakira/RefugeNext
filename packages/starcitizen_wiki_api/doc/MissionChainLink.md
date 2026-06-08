# starcitizen_wiki_api.model.MissionChainLink

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** |  | [optional] 
**title** | **String** |  | [optional] 
**missionType** | **String** |  | [optional] 
**variantCount** | **int** | Number of mission variants with the same title. Only present when greater than 1. | [optional] 
**variants** | [**List&lt;MissionChainVariant&gt;**](MissionChainVariant.md) | Additional mission variants sharing the same title. Only present when variant_count > 1. | [optional] 
**link** | **String** |  | [optional] 
**webUrl** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


