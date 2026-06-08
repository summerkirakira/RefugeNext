# starcitizen_wiki_api.model.Clustering

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | Internal clustering configuration key. | [optional] 
**minSize** | **num** | Minimum number of deposits in a cluster. | [optional] 
**maxSize** | **num** | Maximum number of deposits in a cluster. | [optional] 
**minProximity** | **num** | Minimum distance between clustered deposits. | [optional] 
**maxProximity** | **num** | Maximum distance between clustered deposits. | [optional] 
**probability** | **num** | Raw probability of clustering occurring (0-1). | [optional] 
**probabilityPercent** | **num** | Clustering probability expressed as a percentage (0-100). | [optional] 
**params** | [**List&lt;ClusteringParam&gt;**](ClusteringParam.md) | List of clustering variations with individual probability weights. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


