# starcitizen_wiki_api.model.HarvestableSetup

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**respawnSeconds** | **int** | Time in seconds before a harvested instance respawns. | [optional] 
**respawnFormatted** | **String** | Human-readable respawn duration (e.g. \"5m 30s\"). | [optional] 
**despawnSeconds** | **int** | Time in seconds before an uncollected instance despawns. | [optional] 
**despawnFormatted** | **String** | Human-readable despawn duration (e.g. \"10m\"). | [optional] 
**relativeProbability** | **num** | Raw relative spawn probability for this harvestable (0-1). | [optional] 
**relativeProbabilityPercent** | **num** | Relative spawn probability expressed as a percentage (0-100). | [optional] 
**respawnMultiplier** | **num** | Multiplier applied to the base respawn time. | [optional] 
**additionalWaitSeconds** | **int** | Extra wait time in seconds added when nearby players are present. | [optional] 
**additionalWaitFormatted** | **String** | Human-readable additional wait duration (e.g. \"2m\"). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


