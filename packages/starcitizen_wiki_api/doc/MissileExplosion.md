# starcitizen_wiki_api.model.MissileExplosion

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**isCluster** | **bool** | Whether this missile splits into multiple submunitions during flight. | [optional] 
**clusterSize** | **num** | Number of submunitions released when the missile splits (when applicable). | [optional] 
**requiresLauncher** | **bool** | Whether the missile must be fired from a dedicated launcher/rack. | [optional] 
**allowDumbFiring** | **bool** | Whether the missile can be fired without a lock. | [optional] 
**radiusMin** | **double** | Minimum explosion damage radius in meters. | [optional] 
**radiusMax** | **double** | Maximum explosion damage radius in meters. | [optional] 
**safetyDistance** | **double** | Minimum safe distance in meters from the explosion center. | [optional] 
**proximity** | **double** | Proximity fuse / projectile proximity value (as provided by source data). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


