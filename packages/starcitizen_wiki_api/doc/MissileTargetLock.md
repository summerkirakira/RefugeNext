# starcitizen_wiki_api.model.MissileTargetLock

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**signalResilienceMin** | **double** | Minimum countermeasure resistance factor. | [optional] 
**signalResilienceMax** | **double** | Maximum countermeasure resistance factor. | [optional] 
**rangeMax** | **double** | Maximum lock acquisition range in meters. | [optional] 
**rangeMin** | **double** | Minimum lock acquisition range in meters. | [optional] 
**angle** | **double** | Maximum lock acquisition angle in degrees (cone of acquisition). | [optional] 
**signalAmplifier** | **double** | Signal amplification factor applied during lock acquisition. | [optional] 
**increaseRate** | **double** | Rate at which lock strength increases per second. | [optional] 
**allowDumbFiring** | **bool** | Whether the missile can be manually fired without a target lock. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


