# starcitizen_wiki_api.model.Emp

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**distortionDamage** | **double** | Peak distortion damage applied at the center of the blast. Observed values: 1000 (S1), 1800-2475 (S2-S3), 2750-3300 (S4 variants). | [optional] 
**empRadius** | **double** | Maximum effective distortion radius in meters. Current items range from 400m (S1) up to 1100m (large ship EMPs). | [optional] 
**minEmpRadius** | **double** | Inner radius (m) guaranteed to receive full EMP effect before falloff begins. Presently 150m-250m. | [optional] 
**chargeDuration** | **double** | Seconds required to fully charge before firing. Current game data ranges 12-26 seconds across EMP sizes. | [optional] 
**unleashDuration** | **double** | Duration in seconds the pulse is actively released after charging completes. Values are either 0.75s (small) or 1.5s (large). | [optional] 
**cooldownDuration** | **double** | Cooldown in seconds before charging can restart. Current data spans 6-40 seconds depending on size and variant. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


