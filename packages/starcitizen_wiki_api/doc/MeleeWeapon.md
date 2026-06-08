# starcitizen_wiki_api.model.MeleeWeapon

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**canBeUsedForTakeDown** | **bool** | Whether this weapon can be used for takedown attacks. | [optional] 
**canBlock** | **bool** | Whether the wielder can block incoming attacks. | [optional] 
**canBeUsedInProne** | **bool** | Whether the weapon can be used while prone. | [optional] 
**canDodge** | **bool** | Whether the wielder can dodge while equipped. | [optional] 
**stanceTransitionMeleeDelay** | **double** | Delay in seconds when transitioning to a melee stance. | [optional] 
**meleeCombatConfig** | **String** | UUID reference to the melee combat config record. | [optional] 
**attackModes** | [**List&lt;MeleeWeaponAttackMode&gt;**](MeleeWeaponAttackMode.md) | Attack configurations as returned by the resource. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


