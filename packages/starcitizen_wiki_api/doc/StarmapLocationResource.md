# starcitizen_wiki_api.model.StarmapLocationResource

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | Unique deposit key identifier. | [optional] 
**label** | **String** | Human-readable deposit name derived from the key. | [optional] 
**signature** | **int** | Electromagnetic signature strength of the deposit. | [optional] 
**areaExceptions** | [**List&lt;AreaException&gt;**](AreaException.md) | Area-specific probability modifiers that override the default for this deposit. | [optional] 
**clustering** | [**Clustering**](Clustering.md) | Clustering configuration for deposit groupings, if applicable. | [optional] 
**harvestableSetup** | [**HarvestableSetup**](HarvestableSetup.md) | Respawn and despawn timing data for harvestable deposits. | [optional] 
**providerNames** | **List&lt;String&gt;** | List of unique provider names that generate this deposit. | [optional] 
**materials** | [**List&lt;MaterialEntry&gt;**](MaterialEntry.md) | List of materials (commodities) found in this deposit with their quality and probability data. | [optional] 
**qualityMin** | **int** | Minimum quality across all instances of this deposit. | [optional] 
**qualityMax** | **int** | Maximum quality across all instances of this deposit. | [optional] 
**relativeProbabilityMin** | **num** | Lowest relative probability among deposit instances (0-1). | [optional] 
**relativeProbabilityMax** | **num** | Highest relative probability among deposit instances (0-1). | [optional] 
**relativeProbabilityMinPercent** | **num** | Lowest relative probability as a percentage (0-100). | [optional] 
**relativeProbabilityMaxPercent** | **num** | Highest relative probability as a percentage (0-100). | [optional] 
**name** | **String** | Commodity name of the resource deposit. | [optional] 
**uuid** | **String** | UUID of the commodity, null for non-commodity deposits. | [optional] 
**tier** | **String** | Rarity tier of the commodity. | [optional] 
**link** | **String** | API URL for the commodity detail endpoint. | [optional] 
**webUrl** | **String** | Web frontend URL for the commodity detail page. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


