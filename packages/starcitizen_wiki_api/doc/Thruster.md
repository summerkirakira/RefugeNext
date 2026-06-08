# starcitizen_wiki_api.model.Thruster

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**performance** | [**ThrusterPerformance**](ThrusterPerformance.md) |  | [optional] 
**fuel** | [**ThrusterFuel**](ThrusterFuel.md) |  | [optional] 
**role** | **String** | Thruster role within the ship: Main, Maneuver, or Retro. | [optional] 
**vtolOnly** | **bool** | True if the thruster only activates in VTOL mode. | [optional] 
**backwash** | [**ThrusterBackwash**](ThrusterBackwash.md) |  | [optional] 
**handling** | [**ThrusterHandling**](ThrusterHandling.md) |  | [optional] 
**thrustCapacity** | **double** | Deprecated. Use performance.thrust_capacity. | [optional] 
**minHealthThrustMultiplier** | **double** | Deprecated. Use performance.min_health_thrust_multiplier. | [optional] 
**fuelBurnPer10kNewton** | **double** | Deprecated. Use fuel.burn_rate_per_10k_newton. | [optional] 
**type** | **String** | Deprecated. Use role. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


