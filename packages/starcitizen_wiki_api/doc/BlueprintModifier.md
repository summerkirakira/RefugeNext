# starcitizen_wiki_api.model.BlueprintModifier

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**propertyKey** | **String** | Internal key identifying the modifier property | [optional] 
**propertyUuid** | **String** | UUID of the property definition, if available | [optional] 
**label** | **String** | Human-readable label for the modifier | [optional] 
**betterWhen** | **String** | Indicates whether a higher or lower value is desirable | [optional] 
**qualityRange** | [**BlueprintModifierQualityRange**](BlueprintModifierQualityRange.md) |  | [optional] 
**modifierRange** | [**BlueprintModifierRange**](BlueprintModifierRange.md) |  | [optional] 
**valueRangeType** | **String** | Interpolation type for the modifier value range. When present, value_segments should be used for interpolation instead of the simple quality_range/modifier_range pair. | [optional] 
**valueSegments** | [**List&lt;BlueprintModifierValueSegmentsInner&gt;**](BlueprintModifierValueSegmentsInner.md) | Multi-step interpolation segments. Each segment defines its own quality range and modifier start/end values. When present, use these for interpolation instead of quality_range/modifier_range. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


