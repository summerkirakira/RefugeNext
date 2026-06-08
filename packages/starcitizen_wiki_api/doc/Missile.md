# starcitizen_wiki_api.model.Missile

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**clusterSize** | **num** | Deprecated. Use `explosion.cluster_size`. | [optional] 
**signalType** | **String** | Type of tracking signal used for target acquisition. | [optional] 
**trackingSignalMin** | **double** | Minimum target signal strength required for tracking. | [optional] 
**lockTime** | **double** | Deprecated. Use `delays.lock_time`. | [optional] 
**lockRangeMax** | **double** | Deprecated. Use `target_lock.range_max`. | [optional] 
**lockRangeMin** | **double** | Deprecated. Use `target_lock.range_min`. | [optional] 
**lockAngle** | **double** | Deprecated. Use `target_lock.angle`. | [optional] 
**speed** | **double** | Deprecated. Use `flight.speed`. | [optional] 
**fuelTankSize** | **double** | Deprecated. Use `flight.fuel_tank_size`. | [optional] 
**explosionRadiusMin** | **double** | Deprecated. Use `explosion.radius_min`. | [optional] 
**explosionRadiusMax** | **double** | Deprecated. Use `explosion.radius_max`. | [optional] 
**flight** | [**MissileFlight**](MissileFlight.md) |  | [optional] 
**targetLock** | [**MissileTargetLock**](MissileTargetLock.md) |  | [optional] 
**explosion** | [**MissileExplosion**](MissileExplosion.md) |  | [optional] 
**delays** | [**MissileDelays**](MissileDelays.md) |  | [optional] 
**damageTotal** | **double** | Total combined damage from all damage types. | [optional] 
**damages** | [**List&lt;WeaponDamage&gt;**](WeaponDamage.md) | Deprecated. Use `damage_map`. | [optional] 
**damageMap** | **Map&lt;String, num&gt;** | Map of damage types to values (preferred representation). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


