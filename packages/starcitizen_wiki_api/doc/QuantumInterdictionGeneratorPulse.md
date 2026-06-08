# starcitizen_wiki_api.model.QuantumInterdictionGeneratorPulse

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**chargeTime** | **double** | Seconds to charge the pulse. | [optional] 
**dischargeTime** | **double** | Duration of the active pulse. | [optional] 
**cooldownTime** | **double** | Cooldown before the next charge cycle. | [optional] 
**radius** | **double** | Pulse radius in meters. | [optional] 
**decreaseChargeRateTime** | **double** | Seconds to ramp down charging rate. | [optional] 
**increaseChargeRateTime** | **double** | Seconds to ramp up charging rate. | [optional] 
**activationPhaseDuration** | **double** | Activation animation/FX phase length. | [optional] 
**disperseChargeTime** | **double** | Time to disperse the pulse if cancelled. | [optional] 
**maxPowerDraw** | **double** | Maximum power draw during pulse operations. | [optional] 
**stopChargingPowerFraction** | **double** | Power fraction at which charging halts. | [optional] 
**maxChargeRatePowerFraction** | **double** | Peak charge-rate power fraction. | [optional] 
**activePowerFraction** | **double** | Power fraction while pulse is active. | [optional] 
**tetheringPowerFraction** | **double** | Power fraction while maintaining tether. | [optional] 
**greenZoneCheckRange** | **double** | Safety buffer used for pulse firing checks. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


