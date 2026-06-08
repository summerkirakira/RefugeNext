# starcitizen_wiki_api.model.GameVehicleHardpointItem

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**setName** | **String** |  | [optional] 
**baseItem** | [**ItemRelatedLink**](ItemRelatedLink.md) |  | [optional] 
**variantItems** | [**List&lt;ItemRelatedLink&gt;**](ItemRelatedLink.md) |  | [optional] 
**setItems** | [**List&lt;ItemRelatedLinkExt&gt;**](ItemRelatedLinkExt.md) |  | [optional] 
**uuid** | **String** | Unique item identifier. | [optional] 
**name** | **String** | Display name of the equipped item. | [optional] 
**className** | **String** | SC item class name (e.g. BEHR_LaserCannon_S4). | [optional] 
**link** | **String** | API URL for the full item detail. | [optional] 
**size** | **int** | Item size as integer. | [optional] 
**mass** | **double** | Item mass in kg. | [optional] 
**grade** | **String** | Item grade letter (A-D). | [optional] 
**class_** | **String** | Item class name from game data. | [optional] 
**manufacturer** | [**ManufacturerLink**](ManufacturerLink.md) |  | [optional] 
**type** | **String** | Item type with NOITEM_ prefix stripped. | [optional] 
**typeLabel** | **String** | Human-readable label for the item type. | [optional] 
**subType** | **String** | Item sub-type identifier. | [optional] 
**subTypeLabel** | **String** | Human-readable label for the item sub-type. | [optional] 
**inventory** | [**ItemInventory**](ItemInventory.md) | Inventory container data, if the item has one. | [optional] 
**ports** | [**List&lt;ItemPort&gt;**](ItemPort.md) | Sub-ports available on this item. | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) | Timestamp of the last update. | [optional] 
**version** | **String** | Game version code this item belongs to. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


