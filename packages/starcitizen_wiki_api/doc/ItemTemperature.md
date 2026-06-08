# starcitizen_wiki_api.model.ItemTemperature

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**unit** | **String** | Temperature unit (always \"C\" for Celsius). | [optional] 
**coolingThreshold** | **double** | Temperature in Celsius at which active cooling begins. | [optional] 
**irThreshold** | **double** | Temperature in Celsius above which IR emission becomes detectable. | [optional] 
**overheatThreshold** | **double** | Temperature in Celsius at which the overheat warning triggers (before full overheat). | [optional] 
**overheatTemperature** | **double** | Deprecated: Use overheat_threshold. | [optional] 
**maxTemperature** | **double** | Temperature in Celsius at which the item fully overheats and shuts down. | [optional] 
**recoveryTemperature** | **double** | Temperature in Celsius the item must cool to before recovering from overheat. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


