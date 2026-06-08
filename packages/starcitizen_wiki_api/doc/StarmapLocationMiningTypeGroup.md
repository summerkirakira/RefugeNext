# starcitizen_wiki_api.model.StarmapLocationMiningTypeGroup

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**groupName** | **String** | Original group name from game data identifying the deposit group. | [optional] 
**miningType** | **String** | Extraction method label (e.g. Mining, Hand Mining, Salvage). | [optional] 
**miningTypeSortOrder** | **int** | Sort order for mining type display ordering. | [optional] 
**resourceKind** | **String** | Kind of resource (Mineable or Harvestable). | [optional] 
**groupProbabilityMin** | **num** | Lowest raw probability among deposits in this group (0-1). | [optional] 
**groupProbabilityMax** | **num** | Highest raw probability among deposits in this group (0-1). | [optional] 
**groupProbabilityMinPercent** | **num** | Lowest probability in this group as a percentage (0-100). | [optional] 
**groupProbabilityMaxPercent** | **num** | Highest probability in this group as a percentage (0-100). | [optional] 
**resources** | [**List&lt;StarmapLocationResource&gt;**](StarmapLocationResource.md) | Individual resource deposits within this group. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


