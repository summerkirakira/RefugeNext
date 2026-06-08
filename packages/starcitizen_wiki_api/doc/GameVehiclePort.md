# starcitizen_wiki_api.model.GameVehiclePort

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Hardpoint name from scunpacked ship data. | [optional] 
**position** | **String** | Positional label (e.g. left, right, nose). | [optional] 
**sizes** | [**GameVehiclePortSizes**](GameVehiclePortSizes.md) |  | [optional] 
**className** | **String** | SC class name of the port component. | [optional] 
**health** | **num** | Port health points. | [optional] 
**editable** | **bool** | Whether the port can be modified in-game. | [optional] 
**editableChildren** | **bool** | Whether child ports can be modified in-game. | [optional] 
**equippedItemUuid** | **String** | UUID of the item currently equipped in this port. | [optional] 
**type** | **String** | Port type (e.g. WeaponGun, Shield, PowerPlant). | [optional] 
**subType** | **String** | Port sub-type identifier. | [optional] 
**subtype** | **String** | Deprecated: Use sub_type. | [optional] 
**categoryLabel** | **String** | Human-readable category label. Only present on parent ports (e.g. Weapons, Shields, Thrusters). | [optional] 
**compatibleTypes** | [**List&lt;GameVehiclePortCompatibleTypesInner&gt;**](GameVehiclePortCompatibleTypesInner.md) | Port compatibility list from ship data. | [optional] 
**equippedItem** | [**GameVehiclePortEquippedItem**](GameVehiclePortEquippedItem.md) |  | [optional] 
**ports** | [**List&lt;GameVehiclePort&gt;**](GameVehiclePort.md) | Nested child ports (hardpoints). | [optional] 
**requiredTags** | **List&lt;String&gt;** | Tags that items must have to be equipped in this port. Pass individual values as filter[tags] to the items API. | [optional] 
**portTags** | **List&lt;String&gt;** | Identity tags this port provides. Used to filter items by RequiredTags compatibility - an item can attach if its RequiredTags is empty or fully contained in these tags. Pass as filter[port_tags] to the items API. | [optional] 
**version** | **String** | Game version code for this data. | [optional] 
**attachedVehicle** | [**GameVehiclePortAttachedVehicle**](GameVehiclePortAttachedVehicle.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


