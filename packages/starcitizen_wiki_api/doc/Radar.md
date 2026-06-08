# starcitizen_wiki_api.model.Radar

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**detectionLifetime** | **double** | Deprecated legacy field. Always null in this resource output. | [optional] 
**altitudeCeiling** | **double** | Deprecated legacy field. Always null in this resource output. | [optional] 
**enableCrossSectionOcclusion** | **bool** | Deprecated legacy field. Always null in this resource output. | [optional] 
**cooldown** | **double** | Radar ping cooldown in seconds. | [optional] 
**sensitivity** | [**RadarSensitivityBlock**](RadarSensitivityBlock.md) | Detection sensitivity per signature type. | [optional] 
**groundVehicleSensitivity** | [**RadarSensitivityBlock**](RadarSensitivityBlock.md) | Detection sensitivity for ground vehicles, derived from sensitivity modifiers. | [optional] 
**piercing** | [**RadarSensitivityBlock**](RadarSensitivityBlock.md) | Signal piercing strength per signature type, controlling detection through occlusion. | [optional] 
**aimAssist** | [**RadarAimAssistBlock**](RadarAimAssistBlock.md) | Aim assist range parameters. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


