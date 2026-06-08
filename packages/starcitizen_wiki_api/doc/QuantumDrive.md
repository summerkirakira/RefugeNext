# starcitizen_wiki_api.model.QuantumDrive

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**quantumFuelRequirement** | **double** | Total quantum fuel consumed to complete a spool (QuantumFuelRequirement). | [optional] 
**fuelRate** | **double** | Continuous quantum fuel burn per meter travelled (FuelRate). | [optional] 
**jumpRange** | **double** | Maximum permitted quantum jump distance in meters (JumpRange). | [optional] 
**jumpRangeFormatted** | **String** | Jump range formatted as human-readable distance (e.g. \"~56 GM\"). Null when jump_range is null. | [optional] 
**disconnectRange** | **double** | Automatic disengage distance when approaching destination in meters (DisconnectRange). | [optional] 
**disconnectRangeFormatted** | **String** | Disconnect range formatted as human-readable distance (e.g. \"35 km\"). Null when disconnect_range is null. | [optional] 
**thermalEnergyDraw** | [**QuantumDriveThermalEnergyDraw**](QuantumDriveThermalEnergyDraw.md) |  | [optional] 
**standardJump** | [**QuantumDriveJumpProfile**](QuantumDriveJumpProfile.md) |  | [optional] 
**splineJump** | [**QuantumDriveJumpProfile**](QuantumDriveJumpProfile.md) |  | [optional] 
**modes** | [**List&lt;QuantumDriveJumpProfile&gt;**](QuantumDriveJumpProfile.md) | List of jump profiles with an explicit mode identifier. | [optional] 
**fuelConsumptionScuPerGm** | **double** | Fuel consumption in SCU per GM (FuelConsumptionSCUPerGM). | [optional] 
**fuelEfficiency** | **double** | Fuel efficiency in GM per SCU (FuelEfficiencyGMPerSCU). | [optional] 
**travelTime10gm** | [**QuantumDriveTravelTime10gm**](QuantumDriveTravelTime10gm.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


