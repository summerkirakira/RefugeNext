# starcitizen_wiki_api.model.Clothing

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**clothingType** | **String** | Property is set if resource is of type \"clothing\". Superseded by type. | [optional] 
**slot** | **String** | Clothing slot derived from the item classification (e.g. Torso, Legs, Arms, Head). | [optional] 
**type** | **String** | Clothing type, not actually set in the game data but derived from the item name. | [optional] 
**resistances** | [**List&lt;ClothingResistancesInner&gt;**](ClothingResistancesInner.md) | Array of damage resistance entries for this clothing. Each entry includes damage type (physical, energy, distortion, thermal, biochemical, stun), damage multiplier (lower = more resistant), and damage threshold. Only damage types with defined multipliers are included. | [optional] 
**tempResistanceMin** | **double** | Deprecated: Use temperature_resistance from root. | [optional] 
**tempResistanceMax** | **double** | Deprecated: Use temperature_resistance from root. | [optional] 
**radiationResistance** | [**RadiationResistance**](RadiationResistance.md) |  | [optional] 
**gforceResistance** | **double** | G-force tolerance modifier from root. Positive increases tolerance, negative reduces it. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


