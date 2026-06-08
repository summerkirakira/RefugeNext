# starcitizen_wiki_api.model.MiningModuleModifiers

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**miningLaserPowerPercent** | **double** | Multiplicative change to mining laser power. 150 boosts power by 50%; 85 lowers by 15%. | [optional] 
**extractionLaserPowerPercent** | **double** | Multiplier on extraction beam power. Lower values mean slower extraction but often reduce inert material. | [optional] 
**optimalChargeWindowPercent** | **double** | Change to the size of the optimal (green) window. Positive widens, negative shrinks. Range seen: -10 to +40. | [optional] 
**optimalChargeRatePercent** | **double** | Change to the ideal charge rate speed. Higher values speed charging; negatives slow it. Range seen: -20 to +60. | [optional] 
**allChargeRatesPercent** | **double** | Flat multiplier to all charge-rate bands when present. Range seen: +5 to +24. | [optional] 
**inertMaterialModifierPercent** | **double** | Reduction to inert material collected. Positive values in data mean less inert material (e.g., 6, 24). | [optional] 
**resistancePercent** | **double** | Change to deposit resistance (hardness). Positive makes rock more resistant; negative softens. Range seen: -24.8 to +15.5. | [optional] 
**instabilityPercent** | **double** | Change to laser instability. Negative stabilizes, positive increases jitter. Range seen: -20 to +10. | [optional] 
**shatterDamagePercent** | **double** | Change to damage taken when the rock shatters. Negative reduces hazard; positive increases. Range seen: -30 to +40. | [optional] 
**overchargeRatePercent** | **double** | Change to catastrophic/overcharge rate. Negative lowers risk, positive increases. Range seen: -80 to +60. | [optional] 
**clusterFactor** | **double** | Scaling applied to cluster-related calculations for fracture/extraction when present. | [optional] 
**damageMultiplier** | **double** | General damage multiplier used by modules. Observed range: 0.85-1.50. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


