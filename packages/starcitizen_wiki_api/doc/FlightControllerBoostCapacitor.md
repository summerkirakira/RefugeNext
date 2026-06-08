# starcitizen_wiki_api.model.FlightControllerBoostCapacitor

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**capacity** | **double** | Total afterburner fuel pool. Combined with cost rates, determines total boost time available before depletion. | [optional] 
**thresholdRatio** | **double** | Minimum capacitor fraction required to engage afterburner (0-1). | [optional] 
**idleCost** | **double** | Capacitor drain per second while afterburner is armed but not thrusting. | [optional] 
**linearCost** | **double** | Capacitor drain per second for linear afterburner thrust. | [optional] 
**angularCost** | **double** | Capacitor drain per second for angular afterburner thrust. | [optional] 
**regenPerSec** | **double** | Capacitor regeneration rate per second. | [optional] 
**regenDelay** | **double** | Seconds of delay after disengaging before capacitor regen resumes. | [optional] 
**regenTime** | **double** | Seconds required to fully regenerate the capacitor from empty (if provided by data). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


