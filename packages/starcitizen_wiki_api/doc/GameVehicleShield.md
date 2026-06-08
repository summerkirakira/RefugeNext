# starcitizen_wiki_api.model.GameVehicleShield

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**hp** | **num** | Total shield hit points. | [optional] 
**regeneration** | **num** | Shield regeneration rate per second. | [optional] 
**regenerationTime** | **num** | Shield regeneration time from empty. Assuming full power segments assigned to shields. | [optional] 
**faceType** | **String** | Shield face configuration (e.g., Bubble, Quadrant). | [optional] 
**maxReallocation** | **num** | Maximum shield reallocation ratio (0-1). | [optional] 
**reconfigurationCooldown** | **num** | Cooldown time for shield reconfiguration in seconds. | [optional] 
**maxElectricalChargeDamageRate** | **num** | Maximum electrical charge damage rate. | [optional] 
**resistance** | [**GameVehicleShieldResistance**](GameVehicleShieldResistance.md) |  | [optional] 
**absorption** | [**GameVehicleShieldAbsorption**](GameVehicleShieldAbsorption.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


