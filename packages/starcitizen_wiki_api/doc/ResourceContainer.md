# starcitizen_wiki_api.model.ResourceContainer

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**mass** | **double** | Container mass in kilograms. | [optional] 
**immutable** | **bool** | Whether the container contents cannot be changed. | [optional] 
**defaultFillFraction** | **double** | Initial fill fraction (0-1). | [optional] 
**capacity** | [**ResourceContainerCapacity**](ResourceContainerCapacity.md) |  | [optional] 
**inclusiveResources** | **List&lt;String&gt;** | UUIDs of resources allowed in this container. | [optional] 
**defaultComposition** | [**List&lt;ResourceContainerCompositionEntry&gt;**](ResourceContainerCompositionEntry.md) | Default composition entries and weights. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


