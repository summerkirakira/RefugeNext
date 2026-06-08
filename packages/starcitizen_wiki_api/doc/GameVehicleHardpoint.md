# starcitizen_wiki_api.model.GameVehicleHardpoint

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Hardpoint name from scunpacked data. | [optional] 
**position** | **String** | Positional label (e.g. left, right, nose). | [optional] 
**minSize** | **int** | Minimum item size the port accepts. | [optional] 
**maxSize** | **int** | Maximum item size the port accepts. | [optional] 
**className** | **String** | SC class name of the port component. | [optional] 
**health** | **num** | Port health points. | [optional] 
**type** | **String** | Port type (e.g. WeaponGun, Shield, PowerPlant). | [optional] 
**subType** | **String** | Port sub-type identifier. | [optional] 
**pilotSlaveable** | **bool** | Whether the port can be slaved to a pilot. | [optional] 
**item** | [**GameVehicleHardpointItem**](GameVehicleHardpointItem.md) | Equipped item details, resolved from the game database. | [optional] 
**children** | [**List&lt;GameVehicleHardpoint&gt;**](GameVehicleHardpoint.md) | Nested child hardpoints. | [optional] 
**version** | **String** | Game version code for this data. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


