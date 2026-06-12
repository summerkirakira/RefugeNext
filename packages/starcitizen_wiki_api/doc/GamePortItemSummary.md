# starcitizen_wiki_api.model.GamePortItemSummary

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique identifier of the equipped item. | [optional] 
**name** | **String** | Item name from loadout data. | [optional] 
**className** | **String** | SC class name of the item. | [optional] 
**type** | **String** | Item type (NOITEM_ prefix removed, before dot). | [optional] 
**subType** | **String** | Item sub-type (after dot). | [optional] 
**size** | **int** | Maximum port size as proxy for item size. | [optional] 
**grade** | **String** | Grade from loadout data. | [optional] 
**manufacturer** | [**GamePortItemSummaryManufacturer**](GamePortItemSummaryManufacturer.md) |  | [optional] 
**link** | **String** | API URL for item detail endpoint. | [optional] 
**webUrl** | **String** | Web URL for item detail page. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


