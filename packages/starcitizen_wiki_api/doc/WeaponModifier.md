# starcitizen_wiki_api.model.WeaponModifier

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**activateOnAttach** | **bool** | Whether the modifier becomes active as soon as it is attached. | [optional] 
**ignoreWear** | **bool** | If true, the modifier ignores item wear/maintenance effects. | [optional] 
**base_** | [**WeaponModifierBase**](WeaponModifierBase.md) |  | [optional] 
**recoil** | [**WeaponModifierRecoil**](WeaponModifierRecoil.md) |  | [optional] 
**spread** | [**WeaponModifierSpread**](WeaponModifierSpread.md) |  | [optional] 
**aim** | [**WeaponModifierAim**](WeaponModifierAim.md) |  | [optional] 
**regen** | [**WeaponModifierRegen**](WeaponModifierRegen.md) |  | [optional] 
**salvage** | [**WeaponModifierSalvage**](WeaponModifierSalvage.md) |  | [optional] 
**zeroing** | [**WeaponModifierZeroing**](WeaponModifierZeroing.md) |  | [optional] 
**fireRateMultiplier** | **double** | Deprecated: Use `base.fire_rate_multiplier`. | [optional] 
**damageMultiplier** | **double** | Deprecated: Use `base.damage_multiplier`. | [optional] 
**damageOverTimeMultiplier** | **double** | Deprecated: v2 compatibility field. No non-deprecated replacement is currently returned by this resource. | [optional] 
**projectileSpeedMultiplier** | **double** | Deprecated: Use `base.projectile_speed_multiplier`. | [optional] 
**ammoCostMultiplier** | **double** | Deprecated: Use `base.ammo_cost_multiplier`. | [optional] 
**heatGenerationMultiplier** | **double** | Deprecated: Use `base.heat_generation_multiplier`. | [optional] 
**soundRadiusMultiplier** | **double** | Deprecated: Use `base.sound_radius_multiplier`. | [optional] 
**chargeTimeMultiplier** | **double** | Deprecated: Use `base.charge_time_multiplier`. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


