# starcitizen_wiki_api.model.SuitArmor

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**slot** | **String** | Armor slot derived from the item classification (e.g. Arms, Core, Legs, Helmet). | [optional] 
**armorType** | **String** | Deprecated legacy field. Use `slot`. | [optional] 
**damageResistance** | [**SuitArmorDamageResistance**](SuitArmorDamageResistance.md) | Structured resistance values. | [optional] 
**damageResistanceMap** | [**SuitArmorDamageResistanceMap**](SuitArmorDamageResistanceMap.md) | Flattened resistance values and multiplier deltas. | [optional] 
**protectedBodyParts** | **List&lt;String&gt;** | UUIDs of body parts covered by this armor. | [optional] 
**signature** | **Map&lt;String, num&gt;** | Signature emissions produced by the armor (map form). | [optional] 
**tempResistanceMin** | **double** | Deprecated: Use temperature_resistance from root. | [optional] 
**tempResistanceMax** | **double** | Deprecated: Use temperature_resistance from root. | [optional] 
**radiationResistance** | [**RadiationResistance**](RadiationResistance.md) | Radiation protection values from RadiationResistance. | [optional] 
**gforceResistance** | **double** | G-force tolerance modifier from root. Positive increases tolerance, negative reduces it. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


