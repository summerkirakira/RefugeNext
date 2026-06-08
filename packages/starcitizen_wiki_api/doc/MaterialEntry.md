# starcitizen_wiki_api.model.MaterialEntry

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | Unique material key identifier. | [optional] 
**name** | **String** | Display name of the material. | [optional] 
**uuid** | **String** | UUID of the commodity this material represents. | [optional] 
**isCurrent** | **bool** | Whether this material is the primary commodity being viewed. | [optional] 
**qualityMin** | **int** | Minimum quality value of this material in the deposit. | [optional] 
**qualityMax** | **int** | Maximum quality value of this material in the deposit. | [optional] 
**qualityMean** | **int** | Average quality value of this material. | [optional] 
**qualityStddev** | **int** | Standard deviation of the quality distribution. | [optional] 
**minPercentage** | **num** | Minimum composition percentage of this material (0-100). | [optional] 
**maxPercentage** | **num** | Maximum composition percentage of this material (0-100). | [optional] 
**instability** | **num** | Instability rating of this material, affecting mining difficulty. | [optional] 
**resistance** | **num** | Resistance rating of this material, affecting mining difficulty. | [optional] 
**groupProbability** | **num** | Raw probability of this material occurring in the deposit group (0-1). | [optional] 
**groupProbabilityPercent** | **num** | Group probability expressed as a percentage (0-100). | [optional] 
**relativeProbability** | **num** | Raw relative probability compared to other materials in the deposit (0-1). | [optional] 
**relativeProbabilityPercent** | **num** | Relative probability expressed as a percentage (0-100). | [optional] 
**qualityQuantizedValues** | **List&lt;int&gt;** | The discrete set of quantized quality values a player can actually receive, filtered by the material's quality range. Each value corresponds to one reachable quantization band. | [optional] 
**qualityQuantization** | **List&lt;int&gt;** | All possible quantized quality values for this material from the source data. Use quality_quantized_values for the filtered set reachable on this specific deposit. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


