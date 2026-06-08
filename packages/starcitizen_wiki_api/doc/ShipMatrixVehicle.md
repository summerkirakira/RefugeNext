# starcitizen_wiki_api.model.ShipMatrixVehicle

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] 
**chassisId** | **int** |  | [optional] 
**name** | **String** |  | [optional] 
**slug** | **String** |  | [optional] 
**sizes** | [**ShipMatrixVehicleSizes**](ShipMatrixVehicleSizes.md) |  | [optional] 
**dimension** | [**ShipMatrixVehicleDimension**](ShipMatrixVehicleDimension.md) |  | [optional] 
**mass** | **double** |  | [optional] 
**cargoCapacity** | **double** | Cargo Capacity in SCU | [optional] 
**crew** | [**MissionCombatSummaryTotal**](MissionCombatSummaryTotal.md) |  | [optional] 
**speed** | [**ShipMatrixVehicleSpeed**](ShipMatrixVehicleSpeed.md) |  | [optional] 
**agility** | [**ShipMatrixVehicleAgility**](ShipMatrixVehicleAgility.md) |  | [optional] 
**foci** | [**List&lt;Translation&gt;**](Translation.md) |  | [optional] 
**productionStatus** | [**Translation**](Translation.md) |  | [optional] 
**productionNote** | [**Translation**](Translation.md) |  | [optional] 
**type** | [**Translation**](Translation.md) |  | [optional] 
**description** | [**Translation**](Translation.md) |  | [optional] 
**size** | [**Translation**](Translation.md) |  | [optional] 
**msrp** | **double** | MSRP imported from the Ship Upgrade tool. | [optional] 
**pledgeUrl** | **String** | Link to RSI Pledge Store | [optional] 
**skus** | [**List&lt;VehicleSku&gt;**](VehicleSku.md) |  | [optional] 
**manufacturer** | [**ShipMatrixVehicleManufacturer**](ShipMatrixVehicleManufacturer.md) |  | [optional] 
**updatedAt** | **String** |  | [optional] 
**components** | [**List&lt;VehicleComponent&gt;**](VehicleComponent.md) | Components imported from the Ship-Matrix | [optional] 
**loaner** | [**List&lt;VehicleLoaner&gt;**](VehicleLoaner.md) |  | [optional] 
**link** | **String** | Link to detail endpoint | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


