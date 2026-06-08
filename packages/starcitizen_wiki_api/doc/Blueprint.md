# starcitizen_wiki_api.model.Blueprint

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique blueprint identifier | [optional] 
**key** | **String** | Internal blueprint key (e.g. BP_CRAFT_behr_pistol_ballistic_01) | [optional] 
**categoryUuid** | **String** | UUID of the blueprint category | [optional] 
**outputItemUuid** | **String** | UUID of the item this blueprint crafts | [optional] 
**outputName** | **String** | Display name of the crafted item | [optional] 
**outputClass** | **String** | Internal class identifier of the crafted item | [optional] 
**craftTimeSeconds** | **int** | Crafting duration in seconds | [optional] 
**craftTimeLabel** | **String** | Human-readable crafting duration | [optional] 
**isAvailableByDefault** | **bool** | Whether this blueprint is available without unlocking | [optional] 
**gameVersion** | **String** | Game version code this data applies to | [optional] 
**ingredientCount** | **int** | Total number of distinct ingredients across all requirement groups | [optional] 
**unlockingMissionsCount** | **int** | Number of missions that can unlock this blueprint | [optional] 
**ingredients** | [**List&lt;BlueprintIngredient&gt;**](BlueprintIngredient.md) | Ingredients required to craft the item | [optional] 
**dismantleReturns** | [**List&lt;BlueprintDismantleReturnSummary&gt;**](BlueprintDismantleReturnSummary.md) | Resources returned when dismantling the crafted item | [optional] 
**output** | [**BlueprintOutput**](BlueprintOutput.md) |  | [optional] 
**dismantle** | [**BlueprintDismantle**](BlueprintDismantle.md) |  | [optional] 
**requirementGroups** | [**List&lt;BlueprintRequirementGroup&gt;**](BlueprintRequirementGroup.md) | Only included on blueprint detail responses. | [optional] 
**summaryProperties** | [**List&lt;BlueprintSummaryProperty&gt;**](BlueprintSummaryProperty.md) | Only included on blueprint detail responses. | [optional] 
**unlockingMissions** | [**List&lt;BlueprintUnlockingMission&gt;**](BlueprintUnlockingMission.md) | Only included on blueprint detail responses. | [optional] 
**unlockingMissionsGrouped** | [**List&lt;BlueprintUnlockingMissionsGrouped&gt;**](BlueprintUnlockingMissionsGrouped.md) | Only included on blueprint detail responses. | [optional] 
**aspects** | [**BlueprintAspects**](BlueprintAspects.md) |  | [optional] 
**tiers** | [**List&lt;BlueprintTier&gt;**](BlueprintTier.md) | Only included on blueprint detail responses. | [optional] 
**link** | **String** | API URL for this blueprint | [optional] 
**webUrl** | **String** | Web URL for the blueprint detail page | [optional] 
**outputItemWebUrl** | **String** | Web URL for the crafted item detail page | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


