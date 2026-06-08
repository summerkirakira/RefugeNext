# starcitizen_wiki_api.model.FlightControllerRecallParams

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**hoverHeightAtDestination** | **double** | Target hover height in meters when arriving at the recall destination. | [optional] 
**forwardOffset** | **double** | Forward offset in meters from the destination point where the ship stages before final landing. | [optional] 
**obstructionDetectionRange** | **double** | Range in meters to scan for obstacles while recalling. | [optional] 
**defaultPlatformDetectionRange** | **double** | Detection radius in meters to locate a viable landing platform. | [optional] 
**minimumRecallDistance** | **double** | Minimum distance in meters from the player before recall engages. | [optional] 
**brakingDistanceOffset** | **double** | Extra buffer distance in meters used to start braking during recall approach. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


