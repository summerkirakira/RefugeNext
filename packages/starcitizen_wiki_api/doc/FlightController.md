# starcitizen_wiki_api.model.FlightController

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**scmSpeed** | **double** | Space Combat Maneuvering (cruise) speed in meters per second. | [optional] 
**boostSpeedForward** | **double** | Forward boost speed cap in m/s. | [optional] 
**boostSpeedBackward** | **double** | Reverse boost speed cap in m/s. | [optional] 
**maxSpeed** | **double** | Absolute flight envelope speed cap in m/s. | [optional] 
**pitch** | **double** | Maximum pitch rate in degrees per second. | [optional] 
**yaw** | **double** | Maximum yaw rate in degrees per second. | [optional] 
**roll** | **double** | Maximum roll rate in degrees per second. | [optional] 
**pitchBoosted** | **int** | Derived boosted pitch rate (rounded): pitch * boost_multiplier.pitch (defaults to 1 if missing). | [optional] 
**yawBoosted** | **int** | Derived boosted yaw rate (rounded): yaw * boost_multiplier.yaw (defaults to 1 if missing). | [optional] 
**rollBoosted** | **int** | Derived boosted roll rate (rounded): roll * boost_multiplier.roll (defaults to 1 if missing). | [optional] 
**boostCapacitor** | [**FlightControllerBoostCapacitor**](FlightControllerBoostCapacitor.md) |  | [optional] 
**boostActivation** | [**FlightControllerBoostActivation**](FlightControllerBoostActivation.md) |  | [optional] 
**thrusterDecay** | [**FlightControllerThrusterDecay**](FlightControllerThrusterDecay.md) |  | [optional] 
**multiplier** | [**FlightControllerMultiplier**](FlightControllerMultiplier.md) |  | [optional] 
**boostMultiplier** | [**FlightControllerBoostMultiplier**](FlightControllerBoostMultiplier.md) |  | [optional] 
**precisionMode** | [**FlightControllerPrecisionMode**](FlightControllerPrecisionMode.md) |  | [optional] 
**recallParams** | [**FlightControllerRecallParams**](FlightControllerRecallParams.md) | Ship recall approach parameters. | [optional] 
**collisionDetection** | [**FlightControllerCollisionDetection**](FlightControllerCollisionDetection.md) | Collision warning thresholds. | [optional] 
**gravlev** | [**FlightControllerGravlev**](FlightControllerGravlev.md) |  | [optional] 
**noFuelParams** | [**FlightNoFuelParams**](FlightNoFuelParams.md) | Flight parameters when the ship has no fuel. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


