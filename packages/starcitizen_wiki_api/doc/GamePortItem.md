# starcitizen_wiki_api.model.GamePortItem

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
**uuid** | **String** | Unique identifier of the item. | [optional] 
**name** | **String** | Display name of the item. | [optional] 
**className** | **String** | Internal class name of the item definition. | [optional] 
**type** | **String** | AttachDef@Type (NOITEM_ prefix removed) | [optional] 
**typeLabel** | **String** | Human-readable label for the item type | [optional] 
**subType** | **String** | AttachDef@SubType | [optional] 
**subTypeLabel** | **String** | Human-readable label for the item sub-type | [optional] 
**classification** | **String** | Dot-separated classification path (e.g. FPS.Clothing.Torso). | [optional] 
**classificationLabel** | **String** | Human-readable label for the item classification | [optional] 
**isBaseVariant** | **bool** | Whether this item is the base variant (has no parent variant). | [optional] 
**variantName** | **String** | Extracted variant name, e.g. \"Executive Edition\" or \"Aqua\" | [optional] 
**link** | **String** | API URL for item detail endpoint | [optional] 
**webUrl** | **String** | Web URL for item detail page | [optional] 
**size** | **int** | AttachDef@Size | [optional] 
**mass** | **double** | Generated from SEntityRigidPhysicsControllerParams | [optional] 
**grade** | **String** | Derived formatting for ship grades (A, B, C, D) or extracted from DescriptionData.Grade | [optional] 
**class_** | **String** | From DescriptionData.Class if not set directly | [optional] 
**manufacturer** | [**ManufacturerLink**](ManufacturerLink.md) | Present when manufacturer is set | [optional] 
**resourceNetwork** | [**ResourceNetwork**](ResourceNetwork.md) | Present when stdItem.ResourceNetwork exists | [optional] 
**emission** | [**ItemEmission**](ItemEmission.md) | Present when stdItem.ResourceNetwork exists; calculated emission values | [optional] 
**version** | **String** | Game version code | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


