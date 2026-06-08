# starcitizen_wiki_api.model.SelfDestruct

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**damage** | **double** | Peak blast damage at the center of the explosion. | [optional] 
**radius** | **double** | Maximum damage radius in meters. | [optional] 
**minRadius** | **double** | Inner radius in meters that always receives full damage before falloff begins. | [optional] 
**physRadius** | **double** | Physical impact radius in meters. | [optional] 
**minPhysRadius** | **double** | Inner physical impact radius in meters. | [optional] 
**time** | **double** | Countdown duration in seconds before detonation once armed. | [optional] 
**countdown** | **double** | Countdown duration in seconds before detonation. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


