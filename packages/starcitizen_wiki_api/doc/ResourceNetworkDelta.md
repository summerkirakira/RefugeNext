# starcitizen_wiki_api.model.ResourceNetworkDelta

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | Delta type (Consumption, Generation, Conversion, Storage, NetworkReflection). | [optional] 
**resource** | **String** | Target resource affected (Power, Fuel, Coolant, QuantumFuel, Shield, LifeSupport). | [optional] 
**rate** | **double** | Rate applied per tick (game native units). Typical power draw ~2-5; fuel draw often 0.01. | [optional] 
**minimumFraction** | **double** | Minimum fraction of the resource that must be available before the delta applies. | [optional] 
**generatedResource** | **String** | Resource produced by conversion/storage deltas. | [optional] 
**generatedRate** | **double** | Rate of the generated resource. | [optional] 
**discharge** | **double** | Whether stored resource is discharged (0/1 flag). | [optional] 
**noOverGeneration** | **double** | Prevents generating above capacity (0/1 flag). | [optional] 
**binaryEvaluation** | **double** | Binary reflection value for NetworkReflection deltas. | [optional] 
**composition** | [**List&lt;ResourceNetworkDeltaCompositionInner&gt;**](ResourceNetworkDeltaCompositionInner.md) | Optional composition entries describing how generated resource is assembled. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


