# starcitizen_wiki_api.model.ResourceNetwork

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**isNetworked** | **bool** | Whether the item participates in the ship/station resource network. | [optional] 
**isRelay** | **bool** | True when the item acts as a relay node. | [optional] 
**defaultPriority** | **int** | Processing priority within the network (higher runs earlier). Commonly 50; fuel tanks use 100. | [optional] 
**states** | [**List&lt;ResourceNetworkState&gt;**](ResourceNetworkState.md) | List of available network states and their resource deltas. | [optional] 
**repair** | [**ResourceNetworkRepair**](ResourceNetworkRepair.md) |  | [optional] 
**usage** | [**ResourceNetworkUsage**](ResourceNetworkUsage.md) |  | [optional] 
**generation** | [**ResourceNetworkGeneration**](ResourceNetworkGeneration.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


