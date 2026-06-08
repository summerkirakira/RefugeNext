# starcitizen_wiki_api.model.ItemDurability

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**health** | **double** | Hit points of the item from SHealthComponentParams. | [optional] 
**lifetime** | **double** | Wear lifetime in hours from SDegradationParams.MaxLifetimeHours. | [optional] 
**maxLifetime** | **double** | Deprecated: Use lifetime. | [optional] 
**repairable** | **bool** | Whether the item can be repaired. | [optional] 
**salvageable** | **bool** | Whether the item can be salvaged. | [optional] 
**resistance** | [**ItemDurabilityResistance**](ItemDurabilityResistance.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


