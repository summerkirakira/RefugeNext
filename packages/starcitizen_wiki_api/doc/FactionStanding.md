# starcitizen_wiki_api.model.FactionStanding

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique standing identifier. | [optional] 
**name** | **String** | Internal standing name. | [optional] 
**factionType** | **String** | Category of the faction. One of: Lawful, Unlawful, LawEnforcement, PrivateSecurity. | [optional] 
**lawful** | **bool** | Whether the faction is considered lawful. | [optional] 
**isNpc** | **bool** | Whether the faction is NPC-controlled. | [optional] 
**hasReputation** | **bool** | Whether the faction tracks player reputation. | [optional] 
**link** | **String** | API URL for the full faction detail. | [optional] 
**displayName** | **String** | Human-readable standing name. | [optional] 
**minReputation** | **int** | Minimum reputation required for this standing. | [optional] 
**driftReputation** | **int** | Reputation change applied per drift cycle. | [optional] 
**driftTimeHours** | **int** | Hours between drift cycles. | [optional] 
**gated** | **bool** | Whether this standing is gated and cannot be reached through normal progression. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


