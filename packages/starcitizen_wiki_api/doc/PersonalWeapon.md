# starcitizen_wiki_api.model.PersonalWeapon

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**class_** | **String** | Class as provided by DescriptionData.Class. | [optional] 
**type** | **String** | Type as provided by DescriptionData.Item Type. | [optional] 
**magazineType** | **String** | Deprecated: legacy field, currently returned as an empty string; do not use. | [optional] 
**magazineSize** | **int** | Deprecated: use `capacity`. | [optional] 
**effectiveRange** | **double** | Deprecated: use `range`. | [optional] 
**capacity** | **int** | Weapon magazine capacity. | [optional] 
**range** | **double** | Effective range in meters. | [optional] 
**damagePerShot** | **double** | Deprecated: use `damage.alpha_total` (or per-type `damage.alpha.*`) instead. | [optional] 
**pelletsPerShot** | **int** | Pellets per shot. | [optional] 
**rof** | **double** | Deprecated: use `rpm`. | [optional] 
**rpm** | **double** | Rounds per minute for the first fire mode. | [optional] 
**damages** | [**List&lt;WeaponDamageEntry&gt;**](WeaponDamageEntry.md) | Deprecated: legacy ammunition-derived entries. Prefer `damage` for weapon damage totals/breakdowns. | [optional] 
**modes** | [**List&lt;PersonalWeaponMode&gt;**](PersonalWeaponMode.md) | Fire modes returned from Weapon.Modes. | [optional] 
**fireMode** | **String** | Weapon fire mode. | [optional] 
**damage** | [**PersonalWeaponDamage**](PersonalWeaponDamage.md) |  | [optional] 
**spread** | [**PersonalWeaponSpread**](PersonalWeaponSpread.md) |  | [optional] 
**adsSpread** | [**PersonalWeaponSpread**](PersonalWeaponSpread.md) |  | [optional] 
**charge** | [**PersonalWeaponCharge**](PersonalWeaponCharge.md) |  | [optional] 
**chargeModifier** | [**PersonalWeaponChargeModifier**](PersonalWeaponChargeModifier.md) |  | [optional] 
**ammunition** | **Object** | Deprecated: use the root-level ammunition resource (outside this specification payload) where available. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


