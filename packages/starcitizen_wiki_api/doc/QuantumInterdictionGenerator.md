# starcitizen_wiki_api.model.QuantumInterdictionGenerator

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**powerFractions** | [**QuantumInterdictionGeneratorPowerFractions**](QuantumInterdictionGeneratorPowerFractions.md) | Fractions of the generator total power budget reserved for base/idle, pulse, and jammer phases. | [optional] 
**jamming** | [**QuantumInterdictionGeneratorJamming**](QuantumInterdictionGeneratorJamming.md) | Continuous interdiction field used to yank ships out of quantum travel. | [optional] 
**pulse** | [**QuantumInterdictionGeneratorPulse**](QuantumInterdictionGeneratorPulse.md) | Quantum interdiction pulse (QIP) burst stats. | [optional] 
**interdictionRange** | **double** | Deprecated. Use `pulse.radius`. | [optional] 
**jammerRange** | **double** | Deprecated. Use `jamming.range`. | [optional] 
**chargeDuration** | **double** | Deprecated. Use `pulse.charge_time`. | [optional] 
**activationDuration** | **double** | Deprecated. Use `pulse.activation_phase_duration`. | [optional] 
**dischargeDuration** | **double** | Deprecated. Use `pulse.discharge_time`. | [optional] 
**cooldownDuration** | **double** | Deprecated. Use `pulse.cooldown_time`. | [optional] 
**disperseChargeDuration** | **double** | Deprecated. Use `pulse.disperse_charge_time`. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


