# starcitizen_wiki_api.model.Shield

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**maxHealth** | **double** | Total shield hit points across all faces. | [optional] 
**regenRate** | **double** | Maximum shield regeneration per second. | [optional] 
**regenTime** | **double** | Shield regeneration time in seconds. | [optional] 
**decayRatio** | **double** | Portion of regeneration lost when shield is taking damage. | [optional] 
**reservePool** | [**ShieldReservePool**](ShieldReservePool.md) |  | [optional] 
**regenDelay** | [**ShieldRegenDelay**](ShieldRegenDelay.md) |  | [optional] 
**electricalChargeDamageResistance** | **double** | Additional resistance to electrical charge damage. | [optional] 
**absorption** | [**ShieldDamageMap**](ShieldDamageMap.md) | Absorption ranges by damage type. | [optional] 
**resistance** | [**ShieldDamageMap**](ShieldDamageMap.md) | Resistance ranges by damage type. | [optional] 
**maxShieldHealth** | **double** | Deprecated. Use `max_health`. | [optional] 
**maxShieldRegen** | **double** | Deprecated. Use `regen_rate`. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


