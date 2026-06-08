# starcitizen_wiki_api.model.Cooler

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**coolingRate** | **double** | Maximum heat removal capacity (heat units per second). Higher numbers indicate stronger cooling performance. Size 1 military coolers like the Aegis Glacier are around 290,000 while heavy industrial units reach into the tens of millions. | [optional] 
**suppressionIrFactor** | **double** | Infrared signature multiplier applied while the cooler is operating. Values below 1.0 lower IR output; most production coolers use 0.1 (90% reduction). | [optional] 
**suppressionHeatFactor** | **double** | Overall heat signature multiplier contributed by the cooler. Commonly 0.1, indicating a significant reduction in emitted heat. | [optional] 
**coolantSegmentGeneration** | **double** | Coolant segment generation rate from resource network. Use this for actual cooling segment generation. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


