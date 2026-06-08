# starcitizen_wiki_api.model.MissionIndex

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** |  | [optional] 
**title** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**missionGiver** | **String** |  | [optional] 
**debugName** | **String** |  | [optional] 
**faction** | [**MissionIndexFaction**](MissionIndexFaction.md) |  | [optional] 
**rankIndex** | **int** |  | [optional] 
**illegal** | **bool** |  | [optional] 
**legalityLabel** | **String** |  | [optional] 
**shareable** | **bool** |  | [optional] 
**onceOnly** | **bool** |  | [optional] 
**hasCombat** | **bool** |  | [optional] 
**hasDefendObjective** | **bool** |  | [optional] 
**enemyCountMin** | **int** |  | [optional] 
**enemyCountMax** | **int** |  | [optional] 
**rewardMin** | **int** |  | [optional] 
**rewardMax** | **int** |  | [optional] 
**rewardCurrency** | **String** |  | [optional] 
**timeToCompleteMinutes** | **double** |  | [optional] 
**starSystems** | **List&lt;String&gt;** |  | [optional] 
**variantCount** | **int** |  | [optional] 
**variants** | [**List&lt;MissionIndexVariantsInner&gt;**](MissionIndexVariantsInner.md) |  | [optional] 
**hasBlueprints** | **bool** |  | [optional] 
**blueprints** | [**List&lt;MissionIndexBlueprint&gt;**](MissionIndexBlueprint.md) |  | [optional] 
**hasChain** | **bool** |  | [optional] 
**hasPrerequisites** | **bool** | Deprecated: Use has_chain. | [optional] 
**hasHauling** | **bool** |  | [optional] 
**minStanding** | [**MissionIndexMinStanding**](MissionIndexMinStanding.md) |  | [optional] 
**maxStanding** | [**MissionIndexMinStanding**](MissionIndexMinStanding.md) |  | [optional] 
**minStandingName** | **String** | Deprecated: Use min_standing.name. | [optional] 
**maxStandingName** | **String** | Deprecated: Use max_standing.name. | [optional] 
**cost** | **int** |  | [optional] 
**minCrimeStat** | **int** |  | [optional] 
**maxCrimeStat** | **int** |  | [optional] 
**availableInPrison** | **bool** |  | [optional] 
**notForRelease** | **bool** |  | [optional] 
**workInProgress** | **bool** |  | [optional] 
**reputationGained** | [**List&lt;MissionIndexReputationGainedInner&gt;**](MissionIndexReputationGainedInner.md) |  | [optional] 
**maxPlayersPerInstance** | **int** |  | [optional] 
**maxInstancesPerPlayer** | **int** |  | [optional] 
**cooldown** | [**MissionCooldown**](MissionCooldown.md) |  | [optional] 
**cooldownSeconds** | **int** | Deprecated: Use cooldown.personal_seconds. | [optional] 
**cooldownLabel** | **String** | Deprecated: Use cooldown.label. | [optional] 
**reacceptAfterAbandoning** | **bool** |  | [optional] 
**reacceptAfterFailing** | **bool** |  | [optional] 
**failIfBecameCriminal** | **bool** |  | [optional] 
**haulingSummary** | [**List&lt;MissionIndexHaulingSummaryInner&gt;**](MissionIndexHaulingSummaryInner.md) |  | [optional] 
**rewardScope** | **String** |  | [optional] 
**reputationAmount** | **int** |  | [optional] 
**gameVersion** | **String** |  | [optional] 
**link** | **String** |  | [optional] 
**webUrl** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


