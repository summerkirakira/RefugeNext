# starcitizen_wiki_api.model.ItemEmission

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**ir** | **double** | Infrared (thermal) emission signature. Higher values make the item easier to detect. | [optional] 
**emMin** | **double** | Electromagnetic emission at idle/low power (Maximum * minConsumptionFraction * lowPowerRangeModifier). | [optional] 
**emMax** | **double** | Electromagnetic emission at full power from EMSignature.nominalSignature. | [optional] 
**emDecay** | **double** | Rate at which EM drops when the item powers down (typically 0.15). | [optional] 
**emPerSegment** | **double** | EM per power segment unit (PowerPlant only: Maximum / Generation.Power). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


