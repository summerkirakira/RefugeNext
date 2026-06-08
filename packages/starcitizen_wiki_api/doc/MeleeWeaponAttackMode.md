# starcitizen_wiki_api.model.MeleeWeaponAttackMode

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**category** | **String** | Attack animation category (e.g., BladeSlash, BladeStab, SyringeStab). | [optional] 
**damage** | **double** | Total damage value (DamageTotal). | [optional] 
**stunRecoveryModifier** | **double** | Modifier applied to stun recovery time. | [optional] 
**blockStunReductionModifier** | **double** | Modifier reducing stun duration when blocking. | [optional] 
**blockStunStaminaModifier** | **double** | Modifier applied to stamina cost of blocking a stun. | [optional] 
**attackImpulse** | **double** | Physical impulse applied to the target on hit. | [optional] 
**ignoreBodyPartImpulseScale** | **bool** | Whether impulse ignores body-part-specific scaling. | [optional] 
**forceKnockdown** | **String** | Knockdown behavior (e.g., None). | [optional] 
**damages** | [**MeleeWeaponAttackDamages**](MeleeWeaponAttackDamages.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


