# starcitizen_wiki_api.model.ItemLink

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**updatedAt** | [**DateTime**](DateTime.md) | Timestamp this data was last updated. | [optional] 
**version** | **String** | The Game Version this item exists in. | [optional] 
**deprecatedFields** | **String** | Deprecated fields that will be removed in future versions. | [optional] 
**resource** | [**CanonicalResourceMeta**](CanonicalResourceMeta.md) |  | [optional] 
**uuid** | **String** | Unique identifier of the item. | [optional] 
**name** | **String** | Display name of the item. | [optional] 
**className** | **String** | Internal class name of the item definition. | [optional] 
**type** | **String** | Item type identifier (e.g. Weapon, Armor, Clothing). | [optional] 
**typeLabel** | **String** | Human-readable label for the item type. | [optional] 
**subType** | **String** | Item sub-type identifier. | [optional] 
**subTypeLabel** | **String** | Human-readable label for the item sub-type. | [optional] 
**classification** | **String** | Dot-separated classification path (e.g. FPS.Clothing.Torso). | [optional] 
**classificationLabel** | **String** | Human-readable label for the item classification. | [optional] 
**isBaseVariant** | **bool** | Whether this item is the base variant. | [optional] 
**variantName** | **String** | Extracted variant name, e.g. \"Executive Edition\" or \"Aqua\". | [optional] 
**manufacturer** | [**ManufacturerLink**](ManufacturerLink.md) |  | [optional] 
**link** | **String** | API URL for the full item resource. | [optional] 
**webUrl** | **String** | Web URL for the item detail page. | [optional] 
**size** | **int** | Item size (1-12 for vehicle items, smaller for FPS). | [optional] 
**baseVariant** | **String** | API URL of the base variant item. Only present for variant items. | [optional] 
**variants** | [**List&lt;ItemLink&gt;**](ItemLink.md) | List of variant items sharing the same base item. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


