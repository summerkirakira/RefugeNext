# starcitizen_wiki_api.model.FlightControllerMultiplier

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**torqueImbalance** | **double** | Multiplier applied when torque imbalance is detected to stabilize rotation. | [optional] 
**lift** | **double** | Vertical thrust multiplier affecting VTOL and hover authority. Higher values increase upward thrust strength. | [optional] 
**drag** | **double** | Drag multiplier scaling atmospheric drag calculations. | [optional] 
**scmMaxDrag** | **double** | Drag multiplier applied specifically while in SCM flight. | [optional] 
**precisionLanding** | **double** | Multiplier applied to maneuvering inputs during precision landing to soften responses. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


