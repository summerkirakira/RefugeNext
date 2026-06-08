# starcitizen_wiki_api.model.MiningLaser

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**laserPower** | [**MiningLaserPowerBand**](MiningLaserPowerBand.md) |  | [optional] 
**modifiers** | [**List&lt;MiningLaserModifier&gt;**](MiningLaserModifier.md) | Deprecated: Use modifier_map. List of non-null gameplay modifiers derived from stdItem.MiningLaser.Modifiers. | [optional] 
**moduleSlots** | **int** | Number of mining module/consumable slots (ModuleSlots). | [optional] 
**throttleLerpSpeed** | **double** | How quickly the throttle responds to input changes. | [optional] 
**throttleMinimum** | **double** | Minimum throttle value when firing. | [optional] 
**powerTransfer** | **double** | Deprecated. Use `laser_power.maximum`. | [optional] 
**miningLaserPower** | **String** | Deprecated. Use `laser_power.minimum` and `laser_power.maximum` (this is a formatted string range). | [optional] 
**modifierMap** | **Map&lt;String, num&gt;** | Key-value map of mining laser modifier names to their numeric values. | [optional] 
**extractionLaserPower** | **String** | Deprecated. Prefer `extraction_throughput` when available (this value is taken from description text). | [optional] 
**optimalRange** | **double** | Optimal mining distance in meters (OptimalRange). | [optional] 
**maximumRange** | **double** | Maximum effective range in meters (MaximumRange). | [optional] 
**extractionThroughput** | **double** | Rate at which ore is extracted from the target. | [optional] 
**collectionPointRadius** | **double** | Radius of the mining beam at the collection point. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


