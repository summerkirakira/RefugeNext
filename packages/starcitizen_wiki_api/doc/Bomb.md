# starcitizen_wiki_api.model.Bomb

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**armTime** | **double** | Time in seconds after release before the bomb is armed and can detonate. Scales with bomb size (0.5s for S3, 5.0s for S10). | [optional] 
**igniteTime** | **double** | Time in seconds between arming and detonation. | [optional] 
**collisionDelayTime** | **double** | Delay in seconds before collision detection becomes active after release. | [optional] 
**explosionSafetyDistance** | **double** | Deprecated: Use explosion.safety_distance instead. Minimum safe distance in meters from the explosion. Typically 50m for all bomb sizes. | [optional] 
**explosionRadiusMin** | **double** | Deprecated: Use explosion.radius_min instead. Minimum explosion radius in meters. Scales with bomb size (40m for S3, 100m for S5, 250m for S10). | [optional] 
**explosionRadiusMax** | **double** | Deprecated: Use explosion.radius_max instead. Maximum explosion radius in meters. Typically equal to minimum radius for uniform blast. | [optional] 
**maximumDropAngle** | **double** | Maximum angle in degrees from level flight at which the bomb can be deployed. Typically 90 degrees. | [optional] 
**damage** | **double** | Deprecated: use damage_total. | [optional] 
**damageTotal** | **double** | Total combined damage from all damage types. Scales dramatically with bomb size (27,000 for S3, 568,297 for S10). | [optional] 
**damages** | [**List&lt;WeaponDamage&gt;**](WeaponDamage.md) | Deprecated: use damage_map. | [optional] 
**explosion** | [**BombExplosion**](BombExplosion.md) |  | [optional] 
**delays** | [**BombDelays**](BombDelays.md) |  | [optional] 
**damageMap** | [**BombDamageMap**](BombDamageMap.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


