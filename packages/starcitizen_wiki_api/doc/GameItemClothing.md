# starcitizen_wiki_api.model.GameItemClothing

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**clothingType** | **String** | Property is set if resource is of type \"clothing\". Superseded by type. | [optional] 
**slot** | **String** | Armor slot derived from the item classification (e.g. Arms, Core, Legs, Helmet). | [optional] 
**type** | **String** | Clothing type, not actually set in the game data but derived from the item name. | [optional] 
**resistances** | [**List&lt;ClothingResistancesInner&gt;**](ClothingResistancesInner.md) | Array of damage resistance entries for this clothing. Each entry includes damage type (physical, energy, distortion, thermal, biochemical, stun), damage multiplier (lower = more resistant), and damage threshold. Only damage types with defined multipliers are included. | [optional] 
**tempResistanceMin** | **double** | Deprecated: Use temperature_resistance from root. | [optional] 
**tempResistanceMax** | **double** | Deprecated: Use temperature_resistance from root. | [optional] 
**radiationResistance** | [**RadiationResistance**](RadiationResistance.md) | Radiation protection values from RadiationResistance. | [optional] 
**gforceResistance** | **double** | G-force tolerance modifier from root. Positive increases tolerance, negative reduces it. | [optional] 
**armorType** | **String** | Deprecated legacy field. Use `slot`. | [optional] 
**damageResistance** | [**SuitArmorDamageResistance**](SuitArmorDamageResistance.md) | Structured resistance values. | [optional] 
**damageResistanceMap** | [**SuitArmorDamageResistanceMap**](SuitArmorDamageResistanceMap.md) | Flattened resistance values and multiplier deltas. | [optional] 
**protectedBodyParts** | **List&lt;String&gt;** | UUIDs of body parts covered by this armor. | [optional] 
**signature** | **Map&lt;String, num&gt;** | Signature emissions produced by the armor (map form). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


