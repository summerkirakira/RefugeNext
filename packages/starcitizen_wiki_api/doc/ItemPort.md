# starcitizen_wiki_api.model.ItemPort

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Internal port identifier (e.g. hardpoint_weapon_wing_right). | [optional] 
**displayName** | **String** | Human-readable port name, resolved from localization key. | [optional] 
**position** | **String** | Derived position label (e.g. magazine_well, optics, underbarrel, barrel). | [optional] 
**size** | **int** | Maximum item size this port accepts (same as sizes.max). | [optional] 
**sizes** | [**ItemPortSizes**](ItemPortSizes.md) |  | [optional] 
**compatibleTypes** | [**List&lt;ItemPortType&gt;**](ItemPortType.md) |  | [optional] 
**types** | **List&lt;String&gt;** | Structured compatible type entries with type and sub-types. | [optional] 
**tags** | **List&lt;String&gt;** | Tags provided by this port to attached items (from PortTags attribute). | [optional] 
**requiredTags** | **List&lt;String&gt;** | Tags an item must have to attach to this port (from RequiredPortTags, $ prefix stripped). | [optional] 
**flags** | **List&lt;String&gt;** | Port flags controlling behavior (e.g. editable, uneditable, invisible, select). | [optional] 
**editable** | **bool** | Whether the port can be modified in-game. | [optional] 
**uneditable** | **bool** | Deprecated: Use editable (inverted value). | [optional] 
**equippedItemUuid** | **String** | UUID of the equipped item | [optional] 
**type** | **String** | Port type derived from CompatibleTypes (e.g. WeaponGun, MissileLauncher). | [optional] 
**subType** | **String** | Port sub-type derived from CompatibleTypes. | [optional] 
**portTags** | **List&lt;String&gt;** | Tags provided by this port. Same as tags field, for vehicle port_tags compat. | [optional] 
**ports** | [**List&lt;ItemPort&gt;**](ItemPort.md) | Sub-ports from the equipped item. | [optional] 
**equippedItem** | [**GamePortItem**](GamePortItem.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


