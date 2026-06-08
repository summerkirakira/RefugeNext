# starcitizen_wiki_api.model.BlueprintAspectGroup

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | Internal key of the aspect group | [optional] 
**name** | **String** | Display name of the aspect group | [optional] 
**displayName** | **String** | User-facing display name, null if generic | [optional] 
**requiredCount** | **int** | Number of aspects that must be selected | [optional] 
**optionCount** | **int** | Total number of aspect options | [optional] 
**isChoiceGroup** | **bool** | Whether this is a choice group (required < options) | [optional] 
**selectedCount** | **int** | Number of aspects selected by default | [optional] 
**aspectIndexes** | **List&lt;int&gt;** | Indexes into the aspects array for this group | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


