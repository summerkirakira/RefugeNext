# starcitizen_wiki_api.model.BlueprintAspect

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | Internal key of the aspect | [optional] 
**name** | **String** | Display name of the aspect | [optional] 
**requiredCount** | **int** | Required count from parent group | [optional] 
**selectionGroup** | [**BlueprintAspectSelectionGroup**](BlueprintAspectSelectionGroup.md) |  | [optional] 
**input** | [**BlueprintAspectInput**](BlueprintAspectInput.md) |  | [optional] 
**modifiers** | [**List&lt;BlueprintModifier&gt;**](BlueprintModifier.md) | Quality-dependent modifier effects | [optional] 
**initialQuality** | **int** | Default quality slider position | [optional] 
**sliderMin** | **int** | Minimum quality slider value | [optional] 
**sliderMax** | **int** | Maximum quality slider value | [optional] 
**hasModifiers** | **bool** | Whether this aspect has any modifiers | [optional] 
**hasDynamicModifiers** | **bool** | Whether modifiers change with quality | [optional] 
**isSelected** | **bool** | Whether this aspect is selected by default | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


