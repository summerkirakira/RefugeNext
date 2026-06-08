# starcitizen_wiki_api.model.VehicleWeapon

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**class_** | **String** | Weapon class. | [optional] 
**type** | **String** | Item type. | [optional] 
**capacity** | **int** | Ammunition capacity. | [optional] 
**range** | **double** | Effective range in meters. | [optional] 
**rpm** | **double** | Primary mode rounds per minute. | [optional] 
**damage** | [**VehicleWeaponDamage**](VehicleWeaponDamage.md) | Damage summary and per-type alpha/dps. | [optional] 
**modes** | [**List&lt;VehicleWeaponMode&gt;**](VehicleWeaponMode.md) | Fire modes as provided by the game data. | [optional] 
**damagePerShot** | **double** | Deprecated. Use `damage.alpha_total` (and/or `damage.alpha.*` for per-type values). | [optional] 
**damages** | [**List&lt;VehicleWeaponDamageEntry&gt;**](VehicleWeaponDamageEntry.md) | Deprecated. Use `damage` (and its `alpha`/`dps` breakdown). | [optional] 
**regeneration** | **double** | Deprecated. Use `capacitor.regen_per_second`. | [optional] 
**ammunition** | **Object** | Deprecated: use ammunition from the root resource. | [optional] 
**spread** | [**VehicleWeaponSpread**](VehicleWeaponSpread.md) |  | [optional] 
**barrelSpinTime** | [**VehicleWeaponBarrelSpinTime**](VehicleWeaponBarrelSpinTime.md) |  | [optional] 
**heat** | [**VehicleWeaponHeat**](VehicleWeaponHeat.md) |  | [optional] 
**capacitor** | [**VehicleWeaponCapacitor**](VehicleWeaponCapacitor.md) |  | [optional] 
**charge** | [**VehicleWeaponCharge**](VehicleWeaponCharge.md) |  | [optional] 
**chargeModifier** | [**VehicleWeaponChargeModifier**](VehicleWeaponChargeModifier.md) |  | [optional] 
**magazineVolume** | [**VehicleWeaponMagazineVolume**](VehicleWeaponMagazineVolume.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


