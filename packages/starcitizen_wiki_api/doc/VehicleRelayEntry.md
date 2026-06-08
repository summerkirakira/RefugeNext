# starcitizen_wiki_api.model.VehicleRelayEntry

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**hardpoint** | **String** | Relay hardpoint name. | [optional] 
**className** | **String** | Relay entity class name. | [optional] 
**fuseSlots** | **int** | Number of fuse slots on this relay. | [optional] 
**room** | **String** | Room/bone name where the relay is located. | [optional] 
**connectionCount** | **int** | Total number of connected hardpoints. | [optional] 
**connectedHardpoints** | [**List&lt;VehicleRelayEntryConnectedHardpointsInner&gt;**](VehicleRelayEntryConnectedHardpointsInner.md) | Hardpoints powered by this relay, grouped by equipment category. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


