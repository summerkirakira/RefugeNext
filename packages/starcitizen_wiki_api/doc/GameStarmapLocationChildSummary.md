# starcitizen_wiki_api.model.GameStarmapLocationChildSummary

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique identifier of the child location. | [optional] 
**name** | **String** | Display name of the child location. | [optional] 
**designation** | **String** | Official designation code for the child location. | [optional] 
**webUrl** | **String** | Web frontend URL for the child location. | [optional] 
**typeName** | **String** | Location type name (e.g. Outpost, Asteroid). | [optional] 
**typeClassification** | **String** | Sub-classification of the location type. | [optional] 
**respawnLocationType** | **String** | Type of respawn facility available, if any. | [optional] 
**amenities** | [**List&lt;GameStarmapLocationAmenity&gt;**](GameStarmapLocationAmenity.md) | Amenities available at this child location. | [optional] 
**amenityLabels** | **List&lt;String&gt;** | Simplified list of amenity display names or internal names. | [optional] 
**hasResources** | **bool** | Whether this child location has harvestable resource deposits. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


