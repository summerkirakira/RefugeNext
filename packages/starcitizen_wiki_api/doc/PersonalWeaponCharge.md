# starcitizen_wiki_api.model.PersonalWeaponCharge

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**time** | **double** | Time to reach full charge in seconds. | [optional] 
**overchargeTime** | **double** | Time window for overcharge in seconds. | [optional] 
**overchargedTime** | **double** | Duration of overcharged state in seconds. | [optional] 
**cooldownTime** | **double** | Cooldown after firing in seconds. | [optional] 
**autoFire** | **bool** | Auto-fire when fully charged. | [optional] 
**requireFullCharge** | **bool** | Must be fully charged before firing. | [optional] 
**autoCharge** | **bool** | Auto-charges when held. | [optional] 
**interpolateBonus** | **bool** | Interpolates charge bonus linearly. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


