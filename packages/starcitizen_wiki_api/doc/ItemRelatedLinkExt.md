# starcitizen_wiki_api.model.ItemRelatedLinkExt

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique identifier of the related item. | [optional] 
**name** | **String** | Display name of the related item. | [optional] 
**className** | **String** | Internal class name of the related item. | [optional] 
**type** | **String** | Item type identifier. | [optional] 
**typeLabel** | **String** | Human-readable label for the item type | [optional] 
**subType** | **String** | Item sub-type identifier. | [optional] 
**subTypeLabel** | **String** | Human-readable label for the item sub-type | [optional] 
**classification** | **String** | Dot-separated classification path. | [optional] 
**classificationLabel** | **String** | Human-readable label for the item classification | [optional] 
**isBaseVariant** | **bool** | Whether this related item is the base variant. | [optional] 
**variantName** | **String** | Variant name if this is a variant item. | [optional] 
**manufacturer** | [**ItemRelatedLinkManufacturer**](ItemRelatedLinkManufacturer.md) |  | [optional] 
**version** | **String** | Game version code. | [optional] 
**link** | **String** | API URL for the related item. | [optional] 
**webUrl** | **String** | Web URL for the related item. | [optional] 
**size** | **int** | Item size. | [optional] 
**grade** | **String** | Item grade. | [optional] 
**gradeLabel** | **String** | Grade (A/B/C/D for Ship items) | [optional] 
**class_** | **String** | Item class. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


