# starcitizen_wiki_api.model.ItemPowerConnection

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**powerBase** | **double** |  | [optional] 
**powerDraw** | **double** |  | [optional] 
**throttleable** | **bool** | IsThrottleable | [optional] 
**overclockable** | **bool** | IsOverclockable | [optional] 
**overclockThresholdMin** | **double** |  | [optional] 
**overclockThresholdMax** | **double** |  | [optional] 
**overclockPerformance** | **double** |  | [optional] 
**overpowerPerformance** | **double** |  | [optional] 
**powerToEm** | **double** |  | [optional] 
**decayRateEm** | **double** |  | [optional] 
**emMin** | **double** | PowerBase * PowerToEm. Use ResourceNetwork data instead. | [optional] 
**emMax** | **double** | PowerDraw * PowerToEm. Use ResourceNetwork data instead. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


