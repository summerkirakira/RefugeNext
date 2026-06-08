# starcitizen_wiki_api.model.ItemDimension

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**width** | **double** | Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Width in meters, either from UIDimensions or Dimensions. | [optional] 
**height** | **double** | Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Height in meters, either from UIDimensions or Dimensions. | [optional] 
**length** | **double** | Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Length in meters, either from UIDimensions or Dimensions. | [optional] 
**volume** | **double** | Cubic volume derived from the dimensions (SCU). | [optional] 
**volumeConverted** | **num** | Converted volume value from game data (e.g. in µSCU). | [optional] 
**volumeConvertedUnit** | **String** | Unit of the converted volume (e.g. \"µSCU\", \"SCU\"). | [optional] 
**trueDimension** | [**ItemDimensionTrueDimension**](ItemDimensionTrueDimension.md) |  | [optional] 
**dimensions** | [**ItemDimensionBlock**](ItemDimensionBlock.md) | True 3D model bounding box dimensions in meters (from InventoryOccupancy.Dimensions). | [optional] 
**cargoDimension** | [**ItemDimensionBlock**](ItemDimensionBlock.md) | Cargo grid occupancy dimensions in meters (from InventoryOccupancy.CargoGrid). | [optional] 
**uiDimension** | [**ItemDimensionBlock**](ItemDimensionBlock.md) | UI display dimensions shown in the in-game inventory in meters (from InventoryOccupancy.UIDimensions). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


