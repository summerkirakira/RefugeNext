# starcitizen_wiki_api.model.BlueprintRequirementGroup

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | Internal key of the requirement group | [optional] 
**name** | **String** | Display name of the requirement group | [optional] 
**kind** | **String** | Always \"group\" | [optional] 
**requiredCount** | **int** | Number of children that must be fulfilled within this group | [optional] 
**modifiers** | [**List&lt;BlueprintModifier&gt;**](BlueprintModifier.md) | Quality-dependent modifier effects applied at the group level | [optional] 
**children** | [**List&lt;BlueprintRequirementChild&gt;**](BlueprintRequirementChild.md) | Individual resources or items within this group | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


