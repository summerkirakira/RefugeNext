# starcitizen_wiki_api.model.Faction

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
**link** | **String** | API URL for this faction. | [optional] 
**description** | **String** | Lore description of the faction. | [optional] 
**defaultReaction** | **String** | Default reaction towards the player. One of: Friendly, Hostile, Neutral. | [optional] 
**ableToArrest** | **bool** | Whether the faction can arrest players. | [optional] 
**policesLawfulTrespass** | **bool** | Whether the faction enforces trespass violations against lawful characters. | [optional] 
**policesCriminality** | **bool** | Whether the faction actively polices criminal activity. | [optional] 
**noLegalRights** | **bool** | Whether the faction operates without legal protections. | [optional] 
**headquarters** | **String** | Location of the faction's headquarters. | [optional] 
**founded** | **String** | Founding date or era of the faction. | [optional] 
**leadership** | **String** | Current leadership of the faction. | [optional] 
**area** | **String** | Primary area of operations. | [optional] 
**focus** | **String** | Primary focus or industry of the faction. | [optional] 
**sortOrderScope** | **String** | Scope key used for sort ordering within reputation tiers. | [optional] 
**reputationLadder** | [**FactionReputationLadder**](FactionReputationLadder.md) | Reputation ladder with standings. Requires ?include=reputationLadder. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


