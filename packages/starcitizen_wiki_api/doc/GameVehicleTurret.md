# starcitizen_wiki_api.model.GameVehicleTurret

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**category** | **String** | Turret category (manned, remote, pdc). | [optional] 
**displayName** | **String** | Human-readable turret name. | [optional] 
**hardpointName** | **String** | Hardpoint name from ship data. | [optional] 
**partName** | **String** | Vehicle part this turret belongs to. | [optional] 
**turretType** | **String** | Full turret type string (e.g. TurretBase.MannedTurret). | [optional] 
**className** | **String** | SC class name of the turret component. | [optional] 
**size** | **int** | Turret hardpoint size. | [optional] 
**turret** | **bool** | Whether this entry is a turret. | [optional] 
**gimballed** | **bool** | Whether the turret uses gimbal mounting. | [optional] 
**fixed** | **bool** | Whether the turret is fixed. | [optional] 
**mountCount** | **int** | Number of weapon mounts on the turret. | [optional] 
**weaponSizes** | **List&lt;int&gt;** | Aggregated weapon sizes across all mounts. | [optional] 
**payloadSizes** | **List&lt;int&gt;** | Aggregated payload sizes across all mounts. | [optional] 
**payloadTypes** | **List&lt;String&gt;** | Aggregated payload types across all mounts. | [optional] 
**payloadClassNames** | **List&lt;String&gt;** | Aggregated payload class names across all mounts. | [optional] 
**mounts** | [**List&lt;GameVehicleTurretMountsInner&gt;**](GameVehicleTurretMountsInner.md) | Individual mount details for the turret. | [optional] 
**dpsTotal** | **num** | Aggregate DPS for the turret. | [optional] 
**sustainedDpsTotal** | **num** | Sustained DPS for the turret. | [optional] 
**alphaTotal** | **num** | Alpha (per-shot) damage for the turret. | [optional] 
**isPilotSlaveable** | **bool** | Whether the turret can be slaved to pilot control. | [optional] 
**weapons** | [**List&lt;GameVehicleTurretWeaponsInner&gt;**](GameVehicleTurretWeaponsInner.md) | Per-weapon breakdown with DPS and alpha data. | [optional] 
**version** | **String** | Game version code for this data. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


