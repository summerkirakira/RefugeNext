# starcitizen_wiki_api.model.CommodityIndexLocation

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Canonical location name. | [optional] 
**displayName** | **String** | Formatted display name including designation prefix (e.g. \"CRU-L1: Green Circle\"). | [optional] 
**system** | **String** | Star system name this location belongs to. | [optional] 
**type** | **String** | Location type classification (e.g. \"Moon\", \"Planet\", \"Outpost\"). | [optional] 
**parentName** | **String** | Name of the parent celestial body or location. | [optional] 
**parentType** | **String** | Type of the parent location. | [optional] 
**uuid** | **String** | UUID of the starmap location entity. | [optional] 
**link** | **String** | API link to the full location details. | [optional] 
**entries** | [**List&lt;CommodityIndexLocationEntry&gt;**](CommodityIndexLocationEntry.md) | Resource entries grouped by mining method. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


