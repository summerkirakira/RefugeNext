# starcitizen_wiki_api.model.ItemDistortion

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**decayRate** | **double** | Rate at which distortion damage recovers per second. Higher values mean faster recovery. | [optional] 
**decayDelay** | **double** | Delay in seconds before distortion recovery begins after taking damage. | [optional] 
**max** | **double** | Maximum distortion pool capacity, total distortion damage the item can absorb before shutting down. | [optional] 
**maximum** | **double** | Deprecated: Use max. | [optional] 
**overloadRatio** | **double** | Deprecated: Does not exist in game data. | [optional] 
**warningRatio** | **double** | Ratio of max at which a distortion warning indicator triggers (e.g. 0.75 = warning at 75%). | [optional] 
**recoveryRatio** | **double** | Threshold below which distortion must fall before the item reactivates after overload. 0 = immediate recovery. | [optional] 
**recoveryTime** | **double** | Deprecated: Does not exist in game data. | [optional] 
**powerRatioAtMaxDistortion** | **double** | Power output ratio at maximum distortion. Currently always 0 (reserved for future use). | [optional] 
**powerChangeOnlyAtMaxDistortion** | **int** | Whether power output only changes when distortion reaches maximum (1 = yes, 0 = gradual). | [optional] 
**shutdownTime** | **double** | Computed duration in seconds the item remains shut down (Maximum / DecayRate + DecayDelay). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


