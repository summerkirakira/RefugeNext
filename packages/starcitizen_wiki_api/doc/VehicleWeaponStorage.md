# starcitizen_wiki_api.model.VehicleWeaponStorage

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**lockers** | **int** | Number of weapon lockers. | [optional] 
**slotsTotal** | **int** | Total weapon slots across all lockers. | [optional] 
**slotsRifle** | **int** | Total rifle slots across all lockers. | [optional] 
**slotsPistol** | **int** | Total pistol slots across all lockers. | [optional] 
**byLocker** | [**List&lt;VehicleWeaponStorageByLockerInner&gt;**](VehicleWeaponStorageByLockerInner.md) | Per-locker breakdown, grouped by identical configuration. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


