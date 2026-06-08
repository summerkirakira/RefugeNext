# starcitizen_wiki_api.model.BlueprintRequirementNode

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | **String** | Node type in the requirement tree | [optional] 
**key** | **String** | Internal key of the requirement node | [optional] 
**name** | **String** | Display name of the requirement node | [optional] 
**uuid** | **String** | UUID of the required resource type or item | [optional] 
**requiredCount** | **int** | Number of children that must be fulfilled | [optional] 
**quantity** | **double** | Discrete item count required | [optional] 
**quantityScu** | **double** | Quantity in Standard Cargo Units (for resources) | [optional] 
**minQuality** | **int** | Minimum quality tier required | [optional] 
**modifiers** | [**List&lt;BlueprintModifier&gt;**](BlueprintModifier.md) | Quality-dependent modifier effects | [optional] 
**children** | [**List&lt;BlueprintRequirementNode&gt;**](BlueprintRequirementNode.md) | Nested child nodes in the requirement tree | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


