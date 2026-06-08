# starcitizen_wiki_api.model.FactionReputationLadder

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique faction identifier. | [optional] 
**name** | **String** | Display name of the faction. | [optional] 
**factionType** | **String** | Category of the faction. One of: Lawful, Unlawful, LawEnforcement, PrivateSecurity. | [optional] 
**lawful** | **bool** | Whether the faction is considered lawful. | [optional] 
**isNpc** | **bool** | Whether the faction is NPC-controlled. | [optional] 
**hasReputation** | **bool** | Whether the faction tracks player reputation. | [optional] 
**link** | **String** | API URL for the full faction detail. | [optional] 
**scopeName** | **String** | Internal scope name for the reputation system. | [optional] 
**displayName** | **String** | Human-readable label for the reputation scope. | [optional] 
**reputationCeiling** | **int** | Maximum attainable reputation value. | [optional] 
**initialReputation** | **int** | Starting reputation value for new players. | [optional] 
**standings** | [**List&lt;FactionStanding&gt;**](FactionStanding.md) | Ordered list of reputation tiers from highest to lowest. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


