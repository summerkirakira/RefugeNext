# starcitizen_wiki_api.model.Medicine

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**nutrition** | **Map&lt;String, num&gt;** | Dynamic map of nutrient name (snake_case) to total amount. | [optional] 
**buffs** | **Map&lt;String, num&gt;** | Dynamic map of effect/buff type (snake_case) to duration in seconds. | [optional] 
**debuffs** | **Map&lt;String, num&gt;** | Dynamic map of debuff type (snake_case) to duration in seconds. | [optional] 
**container** | [**MedicineAllOfContainer**](MedicineAllOfContainer.md) |  | [optional] 
**consumption** | [**MedicineAllOfConsumption**](MedicineAllOfConsumption.md) |  | [optional] 
**nutritionalDensityRating** | **String** | Nutritional density rating (NDR) from food data or description. | [optional] 
**hydrationEfficacyIndex** | **String** | Hydration efficacy index (HEI) from food data or description. | [optional] 
**containerType** | **String** | Deprecated. Use `container.type`. | [optional] 
**oneShotConsume** | **bool** | Deprecated. Use `consumption.one_shot_consume`. | [optional] 
**canBeReclosed** | **bool** | Deprecated. Use `container.can_be_reclosed`. | [optional] 
**discardWhenConsumed** | **bool** | Deprecated. Use `container.discard_when_consumed`. | [optional] 
**effects** | **List&lt;String&gt;** | List of effect strings (parsed from food data or description). Null when no effects are present. | [optional] 
**combatBuffs** | **Map&lt;String, bool&gt;** | Dynamic map of combat buff flags (derived from MedicalEffects.CombatBuffs). Keys are normalized (snake_case, without `_mask`). Values are boolean flags. | [optional] 
**impactResistances** | **Map&lt;String, bool&gt;** | Dynamic map of impact resistance flags (derived from MedicalEffects.ImpactResistance). Keys are normalized (snake_case, without `impact_resistance_` or `_mask`). Values are boolean flags. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


