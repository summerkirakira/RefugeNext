# starcitizen_wiki_api.model.VehicleArmor

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Armor item UUID. | [optional] 
**health** | **double** | Armor health points from Durability system. | [optional] 
**signalInfrared** | **double** | Deprecated: Use signal_multiplier.infrared instead. Infrared signature multiplier. Lower values make the ship harder to detect via heat signature. | [optional] 
**signalElectromagnetic** | **double** | Deprecated: Use signal_multiplier.electromagnetic instead. Electromagnetic signature multiplier. Lower values provide better EM stealth. | [optional] 
**signalCrossSection** | **double** | Deprecated: Use signal_multiplier.cross_section instead. Radar cross-section multiplier. Affects radar detectability. | [optional] 
**damagePhysical** | **double** | Deprecated: Use damage_multiplier.physical instead. Physical damage multiplier. Typically 0.62, providing 38% damage reduction. | [optional] 
**damageEnergy** | **double** | Deprecated: Use damage_multiplier.energy instead. Energy weapon damage multiplier. Values around 1.0 are neutral. | [optional] 
**damageDistortion** | **double** | Deprecated: Use damage_multiplier.distortion instead. Distortion damage multiplier. Typically around 1.0. | [optional] 
**damageThermal** | **double** | Deprecated: Use damage_multiplier.thermal instead. Thermal damage multiplier. Typically 1.0 (neutral, no resistance). | [optional] 
**damageBiochemical** | **double** | Deprecated: Use damage_multiplier.biochemical instead. Biochemical damage multiplier. Typically 1.0 (neutral, no resistance). | [optional] 
**damageStun** | **double** | Deprecated: Use damage_multiplier.stun instead. Stun damage multiplier. Typically 0 (complete immunity to stun). | [optional] 
**signalMultiplier** | [**VehicleArmorSignalMultiplier**](VehicleArmorSignalMultiplier.md) |  | [optional] 
**damageMultiplier** | [**VehicleArmorDamageMultiplier**](VehicleArmorDamageMultiplier.md) |  | [optional] 
**resistanceMultiplier** | [**VehicleArmorResistanceMultiplier**](VehicleArmorResistanceMultiplier.md) |  | [optional] 
**deflection** | [**VehicleArmorDeflection**](VehicleArmorDeflection.md) |  | [optional] 
**penetrationResistance** | [**VehicleArmorPenetrationResistance**](VehicleArmorPenetrationResistance.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


