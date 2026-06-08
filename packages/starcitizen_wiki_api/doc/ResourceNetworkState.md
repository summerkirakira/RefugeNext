# starcitizen_wiki_api.model.ResourceNetworkState

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | State name (e.g. Online). Can be empty on some items. | [optional] 
**signature** | [**ResourceNetworkStateSignature**](ResourceNetworkStateSignature.md) |  | [optional] 
**deltas** | [**List&lt;ResourceNetworkDelta&gt;**](ResourceNetworkDelta.md) |  | [optional] 
**powerRanges** | [**List&lt;ResourceNetworkStatePowerRangesInner&gt;**](ResourceNetworkStatePowerRangesInner.md) | Power range modifiers applied when this state is active. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


