# starcitizen_wiki_api.model.MiningModifier

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | Modifier type (from MiningModule.Type). | [optional] 
**itemType** | **String** | Derived from classification: `Gadget` when classification is `Mining.Gadget`, otherwise `Module`. | [optional] 
**charges** | **int** | Remaining charges (MiningModule.Charges). `null` when the source value is -1 (unlimited). | [optional] 
**duration** | **double** | Lifetime/duration in seconds (MiningModule.Lifetime). | [optional] 
**powerModifier** | [**MiningModifierPowerModifier**](MiningModifierPowerModifier.md) |  | [optional] 
**modifierMap** | [**Map&lt;String, MiningModifierValue&gt;**](MiningModifierValue.md) | Map of modifier keys to values. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


