# starcitizen_wiki_api.model.BlueprintRequirementChild

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | Internal key of the requirement child | [optional] 
**kind** | **String** | Type of requirement entry | [optional] 
**uuid** | **String** | UUID of the required resource type or item | [optional] 
**name** | **String** | Display name of the required resource or item | [optional] 
**requiredCount** | **int** | Number of this child required within its group | [optional] 
**quantity** | **double** | Discrete item count required | [optional] 
**quantityScu** | **double** | Quantity in Standard Cargo Units (for resources) | [optional] 
**minQuality** | **int** | Minimum quality tier required | [optional] 
**modifiers** | [**List&lt;BlueprintModifier&gt;**](BlueprintModifier.md) | Quality-dependent modifier effects for this child | [optional] 
**children** | [**List&lt;BlueprintRequirementChild&gt;**](BlueprintRequirementChild.md) | Nested children when kind is group | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


