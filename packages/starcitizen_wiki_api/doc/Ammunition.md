# starcitizen_wiki_api.model.Ammunition

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique identifier for this ammunition type. | [optional] 
**speed** | **double** | Projectile speed in m/s. | [optional] 
**lifetime** | **double** | Lifetime in seconds before the projectile despawns. | [optional] 
**range** | **double** | Effective range in meters (speed × lifetime when provided by the game). | [optional] 
**size** | **int** | Projectile size used by the game for collision/damage logic. | [optional] 
**capacity** | **int** | Maximum ammo or charge stored in the weapon battery/magazine for this ammo definition. | [optional] 
**initialCapacity** | **int** | Starting ammo or charge loaded when the item spawns. | [optional] 
**damageFalloffLevel1** | **double** | Damage retention percentage at penetration level 1. | [optional] 
**damageFalloffLevel2** | **double** | Damage retention percentage at penetration level 2. | [optional] 
**damageFalloffLevel3** | **double** | Damage retention percentage at penetration level 3. | [optional] 
**maxPenetrationThickness** | **double** | Maximum armor or material thickness (m) this round can pierce. | [optional] 
**penetration** | [**AmmunitionPenetration**](AmmunitionPenetration.md) |  | [optional] 
**impactDamage** | [**List&lt;WeaponDamageEntry&gt;**](WeaponDamageEntry.md) | Deprecated: Use impact_damage_map instead. Direct hit damage per projectile, split by damage type. Zero values are omitted. | [optional] 
**detonationDamage** | [**List&lt;WeaponDamageEntry&gt;**](WeaponDamageEntry.md) | Deprecated: Use detonation_damage_map instead. Explosion damage applied on detonation-capable projectiles. | [optional] 
**impactDamageMap** | [**AmmunitionImpactDamageMap**](AmmunitionImpactDamageMap.md) |  | [optional] 
**detonationDamageMap** | [**AmmunitionDetonationDamageMap**](AmmunitionDetonationDamageMap.md) |  | [optional] 
**explosionRadius** | [**AmmunitionExplosionRadius**](AmmunitionExplosionRadius.md) |  | [optional] 
**impulseScale** | **double** | Impulse multiplier applied on impact. Typically always 1. | [optional] 
**bulletType** | **int** | Projectile type: 2 = ballistic, -1 = energy/laser. | [optional] 
**damageDropMinDistance** | [**AmmunitionDamageDropMinDistance**](AmmunitionDamageDropMinDistance.md) |  | [optional] 
**damageDropPerMeter** | [**AmmunitionDamageDropPerMeter**](AmmunitionDamageDropPerMeter.md) |  | [optional] 
**damageDropMinDamage** | [**AmmunitionDamageDropMinDamage**](AmmunitionDamageDropMinDamage.md) |  | [optional] 
**bulletImpulseFalloff** | [**AmmunitionBulletImpulseFalloff**](AmmunitionBulletImpulseFalloff.md) |  | [optional] 
**bulletElectron** | [**AmmunitionBulletElectron**](AmmunitionBulletElectron.md) |  | [optional] 
**conversionRate** | **int** | Cargo volume consumed per round in microSCU. | [optional] 
**damageFalloffs** | [**AmmunitionDamageFalloffs**](AmmunitionDamageFalloffs.md) |  | [optional] 
**piercability** | **Object** | Deprecated: use damage_falloff_level_* and max_penetration_thickness when present. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


