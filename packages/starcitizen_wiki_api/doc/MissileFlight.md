# starcitizen_wiki_api.model.MissileFlight

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enableLifetime** | **bool** | Whether the maximum lifetime limit is enforced. | [optional] 
**maxLifetime** | **double** | Maximum flight time in seconds before missile self-destructs. | [optional] 
**range** | **double** | Maximum travel distance/range as provided by the source data. | [optional] 
**speed** | **double** | Linear cruise velocity in meters per second. | [optional] 
**boostSpeed** | **double** | Initial boost phase velocity in meters per second. | [optional] 
**interceptSpeed** | **double** | Intercept phase speed in meters per second. | [optional] 
**terminalSpeed** | **double** | Terminal phase speed in meters per second. | [optional] 
**boostPhaseDuration** | **double** | Duration of the boost phase in seconds. | [optional] 
**terminalPhaseEngagementTime** | **double** | Seconds before impact when terminal phase activates. | [optional] 
**terminalPhaseEngagementAngle** | **double** | Maximum engagement angle in degrees for terminal phase. | [optional] 
**fuelTankSize** | **double** | Fuel capacity in arbitrary units. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


