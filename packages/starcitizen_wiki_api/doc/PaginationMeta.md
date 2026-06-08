# starcitizen_wiki_api.model.PaginationMeta

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**currentPage** | **int** | Current page number. | [optional] 
**from** | **int** | Index of the first item in this page. | [optional] 
**lastPage** | **int** | Last available page number. | [optional] 
**perPage** | **int** | Number of items per page. | [optional] 
**to** | **int** | Index of the last item in this page. | [optional] 
**total** | **int** | Total number of items across all pages. | [optional] 
**links** | [**List&lt;PaginationMetaLinksInner&gt;**](PaginationMetaLinksInner.md) | Pagination navigation links with page URLs. | [optional] 
**path** | **String** | Base URL path for pagination. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


