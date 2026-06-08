# starcitizen_wiki_api.model.HackingChip

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**maxCharges** | **int** | Number of uses before the chip depletes. | [optional] 
**durationMultiplier** | **double** | Multiplier applied to the base hack duration. Values below 1.0 speed the hack up; values above 1.0 slow it down. Example 0.5 halves the required time. | [optional] 
**errorChance** | **double** | Probability (0-1) that a hack attempt fails or produces an error. Higher values indicate more risk. Example 0.9 = 90% error chance. | [optional] 
**accessTag** | **String** | Gameplay access tag required/assigned when the chip is used (e.g., MissionQuestItem to mark mission-only keys). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


