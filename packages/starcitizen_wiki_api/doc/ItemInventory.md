# starcitizen_wiki_api.model.ItemInventory

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique identifier of the referenced InventoryContainer. | [optional] 
**width** | **double** | Interior width in meters (interiorDimensions.x). | [optional] 
**height** | **double** | Interior height in meters (interiorDimensions.z). | [optional] 
**length** | **double** | Interior depth in meters (interiorDimensions.y). | [optional] 
**volume** | **double** | Interior volume in cubic meters (width * height * length). | [optional] 
**scu** | **double** | Raw SCU capacity as set in game data. | [optional] 
**scuConverted** | **double** | SCU capacity converted to the unit specified in the unit field (e.g. µSCU, cSCU, or SCU). | [optional] 
**unit** | **String** | Unit label displayed in the UI, e.g. \"µSCU\" or \"SCU\". | [optional] 
**microScu** | **double** | Capacity in µSCU. Only present when unit exponent is 0 (standard SCU). | [optional] 
**open** | **bool** | Whether this is an open container (e.g. a cargo grid). | [optional] 
**external_** | **bool** | Whether this container is externally accessible (e.g. a cargo pod). | [optional] 
**closed** | **bool** | Whether this is a closed container (e.g. a locker or personal storage). | [optional] 
**minSize** | [**ItemInventoryMinSize**](ItemInventoryMinSize.md) |  | [optional] 
**maxSize** | [**ItemInventoryMaxSize**](ItemInventoryMaxSize.md) |  | [optional] 
**minScuBox** | **num** | Smallest standard SCU box whose dimensions satisfy the min item size. Powers of two: 0.125, 1, 2, 4, 8, 16, 32. | [optional] 
**maxScuBox** | **num** | Largest standard SCU box that fits within the max item size and interior dimensions. Powers of two: 0.125, 1, 2, 4, 8, 16, 32. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


