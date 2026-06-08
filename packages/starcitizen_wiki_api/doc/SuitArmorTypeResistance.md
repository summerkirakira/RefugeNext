# starcitizen_wiki_api.model.SuitArmorTypeResistance

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | Damage type identifier (lowercase). | [optional] 
**multiplier** | **double** | Damage multiplier. Incoming damage is scaled by this value (1.0 = no resistance, <1.0 = reduced damage). | [optional] 
**threshold** | **double** | Damage threshold before resistance applies. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


