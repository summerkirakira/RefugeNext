# starcitizen_wiki_api.model.BlueprintIngredient

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Display name of the ingredient | [optional] 
**kind** | **String** | Ingredient kind | [optional] 
**resourceTypeUuid** | **String** | UUID of the ingredient resource type (see GET /api/commodities) | [optional] 
**itemUuid** | **String** | UUID of the ingredient item (see GET /api/items) | [optional] 
**quantityScu** | **double** | Quantity in Standard Cargo Units (for resources) | [optional] 
**quantity** | **double** | Discrete count (for items) | [optional] 
**link** | **String** | API URL for the ingredient | [optional] 
**webUrl** | **String** | Web URL for the ingredient detail page | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


