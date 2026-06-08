# starcitizen_wiki_api.model.VehicleLink

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**updatedAt** | [**DateTime**](DateTime.md) | Timestamp of the last vehicle data update. | [optional] 
**version** | **String** | Game version code this vehicle belongs to. | [optional] 
**deprecatedFields** | **String** | Deprecated fields that will be removed in future versions. | [optional] 
**resource** | [**CanonicalResourceMeta**](CanonicalResourceMeta.md) |  | [optional] 
**uuid** | **String** | Unique vehicle identifier. | [optional] 
**name** | **String** | Vehicle display name. | [optional] 
**className** | **String** | SC class name of the vehicle. | [optional] 
**career** | **String** | Vehicle career (e.g. Combat, Exploration, Transport). | [optional] 
**role** | **String** | Vehicle role (e.g. Stealth Fighter, Heavy Freight). | [optional] 
**sizeClass** | **int** | Vehicle size class (1-6). | [optional] 
**size** | **int** | Deprecated: Use size_class. | [optional] 
**isVehicle** | **bool** | Whether this is a ground vehicle. | [optional] 
**isGravlev** | **bool** | Whether this is a gravlev vehicle. | [optional] 
**isSpaceship** | **bool** | Whether this is a spaceship. | [optional] 
**manufacturer** | [**ManufacturerLink**](ManufacturerLink.md) |  | [optional] 
**link** | **String** | API URL for the full vehicle detail. | [optional] 
**webUrl** | **String** | Web URL for the vehicle detail page. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


