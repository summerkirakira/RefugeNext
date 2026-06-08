# starcitizen_wiki_api.model.VehicleWeaponMode

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**mode** | **String** | Mode name. | [optional] 
**localised** | **String** | Localized label. | [optional] 
**type** | **String** | Fire type. | [optional] 
**rpm** | **double** | Rounds per minute. | [optional] 
**roundsPerMinute** | **double** | Deprecated: Use rpm. | [optional] 
**ammoPerShot** | **int** | Ammo consumed per shot. | [optional] 
**pelletsPerShot** | **int** | Pellets per shot. | [optional] 
**damagePerSecond** | **double** | Damage per second. | [optional] 
**heatPerShot** | **double** | Heat generated per shot (projectile modes). | [optional] 
**wearPerShot** | **double** | Durability lost per shot (projectile modes). | [optional] 
**heatPerSecond** | **double** | Heat generated per second (beam / continuous-fire modes). | [optional] 
**wearPerSecond** | **double** | Durability lost per second (beam / continuous-fire modes). | [optional] 
**fireDuringSpinUp** | **bool** | Whether the weapon fires during barrel spin-up (rapid mode). | [optional] 
**shotCount** | **int** | Number of shots per burst (burst mode). | [optional] 
**cooldownTime** | **double** | Cooldown time between bursts in seconds (burst mode). | [optional] 
**sequenceMode** | **String** | Sequence mode identifier (sequence mode). | [optional] 
**chargeUpTime** | **double** | Beam spool-up time in seconds (beam mode). | [optional] 
**chargeDownTime** | **double** | Beam spool-down time in seconds (beam mode). | [optional] 
**fullDamageRange** | **double** | Range at which full damage is applied (beam mode). | [optional] 
**zeroDamageRange** | **double** | Range at which damage drops to zero (beam mode). | [optional] 
**hitType** | **String** | Beam hit registration type (beam mode). | [optional] 
**hitRadius** | **double** | Beam impact radius (beam / salvage mode). | [optional] 
**minEnergyDraw** | **double** | Minimum power draw (beam / salvage mode). | [optional] 
**maxEnergyDraw** | **double** | Maximum power draw (beam / salvage mode). | [optional] 
**healingMode** | **String** | Healing mode identifier (healingbeam mode). | [optional] 
**healingPerSecond** | **double** | SCU healed per second (healingbeam mode). | [optional] 
**ammoPerMscu** | **double** | Ammo consumed per medical SCU (healingbeam mode). | [optional] 
**medicalAmmoType** | **String** | Medical ammo type tag (healingbeam mode). | [optional] 
**externalHealing** | **String** | External healing mode (healingbeam mode). | [optional] 
**toggle** | **bool** | Toggle mode flag (healingbeam mode). | [optional] 
**maxDistance** | **double** | Maximum healing distance (healingbeam mode). | [optional] 
**maxSensorDistance** | **double** | Maximum sensor range for target detection (healingbeam mode). | [optional] 
**autoDosageModifier** | **double** | Auto-dosage BDL modifier (healingbeam mode). | [optional] 
**healingBreakTime** | **double** | Time before healing breaks in seconds (healingbeam mode). | [optional] 
**maxDoseForAutoAdjustment** | **double** | Max dose for auto-adjustment (healingbeam mode). | [optional] 
**batteryDrainPerSecond** | **double** | Battery drain per second (healingbeam mode). | [optional] 
**materialEfficiency** | **double** | Material recovery rate (salvage mode). | [optional] 
**maxHealthRepairRate** | **double** | Max hull repair rate (salvage mode). | [optional] 
**maxDamageMapRepairRate** | **double** | Max damage-map repair rate (salvage mode). | [optional] 
**healthToAmmoRatio** | **double** | Health restored per ammo unit (salvage mode). | [optional] 
**rampUpTime** | **double** | Beam ramp-up time in seconds (salvage mode). | [optional] 
**rampDownTime** | **double** | Beam ramp-down time in seconds (salvage mode). | [optional] 
**maxVehicleDamageRatio** | **double** | Max vehicle damage ratio (salvage mode). | [optional] 
**repairedMaterialRatio** | **double** | Ratio of repaired material (salvage mode). | [optional] 
**salvageCanFireOnFull** | **bool** | Can fire when target is at full health (salvage mode). | [optional] 
**damageThreshold** | **double** | Damage threshold for salvage operations (salvage mode). | [optional] 
**minimumDistance** | **double** | Minimum mining distance (collectionbeam mode). | [optional] 
**maximumDistance** | **double** | Maximum mining distance (collectionbeam mode). | [optional] 
**beamRadius** | **double** | Collection beam radius (collectionbeam mode). | [optional] 
**collectionRate** | **double** | Ore collection rate (collectionbeam mode). | [optional] 
**energyDraw** | **double** | Power consumption (collectionbeam mode). | [optional] 
**miningExtractorTag** | **String** | Extractor classification tag (collectionbeam mode). | [optional] 
**toggleMode** | **bool** | Toggle mode flag (tractorbeam mode). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


