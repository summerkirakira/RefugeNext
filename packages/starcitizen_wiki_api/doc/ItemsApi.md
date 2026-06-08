# starcitizen_wiki_api.api.ItemsApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getArmor**](ItemsApi.md#getarmor) | **GET** /api/armor/{identifier} | In-Game Armor Detail
[**getClothingItem**](ItemsApi.md#getclothingitem) | **GET** /api/clothes/{identifier} | In-Game Clothing Detail
[**getFood**](ItemsApi.md#getfood) | **GET** /api/food/{identifier} | In-Game Food Detail
[**getItem**](ItemsApi.md#getitem) | **GET** /api/items/{identifier} | In-Game Item Detail
[**getVehicleItem**](ItemsApi.md#getvehicleitem) | **GET** /api/vehicle-items/{identifier} | In-Game Vehicle Item Detail
[**getVehicleWeapon**](ItemsApi.md#getvehicleweapon) | **GET** /api/vehicle-weapons/{identifier} | In-Game Vehicle Weapon Detail
[**getWeapon**](ItemsApi.md#getweapon) | **GET** /api/weapons/{identifier} | In-Game Weapon Detail
[**getWeaponAttachment**](ItemsApi.md#getweaponattachment) | **GET** /api/weapon-attachments/{identifier} | In-Game Weapon Attachment Detail
[**listArmor**](ItemsApi.md#listarmor) | **GET** /api/armor | In-Game Armor Overview
[**listClothes**](ItemsApi.md#listclothes) | **GET** /api/clothes | In-Game Clothes Overview
[**listFood**](ItemsApi.md#listfood) | **GET** /api/food | In-Game Food Overview
[**listItemFilters**](ItemsApi.md#listitemfilters) | **GET** /api/items/filters | In-Game Item Filters
[**listItems**](ItemsApi.md#listitems) | **GET** /api/items | In-Game Item Overview
[**listVehicleItems**](ItemsApi.md#listvehicleitems) | **GET** /api/vehicle-items | In-Game Vehicle Items Overview
[**listVehicleWeapons**](ItemsApi.md#listvehicleweapons) | **GET** /api/vehicle-weapons | In-Game Vehicle Weapons Overview
[**listWeaponAttachments**](ItemsApi.md#listweaponattachments) | **GET** /api/weapon-attachments | In-Game Weapon Attachments Overview
[**listWeapons**](ItemsApi.md#listweapons) | **GET** /api/weapons | In-Game Weapons Overview
[**searchItemsDeprecated**](ItemsApi.md#searchitemsdeprecated) | **POST** /api/items/search | In-Game Item Search (Deprecated)


# **getArmor**
> GetWeapon200Response getArmor(identifier, locale, include, version)

In-Game Armor Detail

Retrieve a specific armor item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to armor. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String identifier = Ace Interceptor Helmet; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getArmor(identifier, locale, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->getArmor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetWeapon200Response**](GetWeapon200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getClothingItem**
> GetWeapon200Response getClothingItem(identifier, locale, include, version)

In-Game Clothing Detail

Retrieve a specific clothing item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to clothing. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String identifier = Burgundy Paisley Bandana; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getClothingItem(identifier, locale, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->getClothingItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetWeapon200Response**](GetWeapon200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFood**
> GetWeapon200Response getFood(identifier, locale, include, version)

In-Game Food Detail

Retrieve a specific food or drink item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to food. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String identifier = Whamburger; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getFood(identifier, locale, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->getFood: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetWeapon200Response**](GetWeapon200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItem**
> GetWeapon200Response getItem(identifier, locale, include, version)

In-Game Item Detail

Retrieve a specific item by UUID, slug, name, or class name (case-insensitive). Results are scoped to the requested or default game version. Always includes manufacturer, game version, description data, entity tags, commodities, and variant group data. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items. Items with a matching vehicle record automatically redirect to GET /api/vehicles/{uuid}.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String identifier = Scourge Railgun; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = blueprints; // String | Comma-separated relationships to include. Available: blueprints (full crafting blueprint data including ingredients, missions, tiers), variants (item variants), related_items (related items from variant groups and sets), vehicles (vehicles this item is installed on), shops (shop availability data), shops.items (shop items).
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getItem(identifier, locale, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->getItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated relationships to include. Available: blueprints (full crafting blueprint data including ingredients, missions, tiers), variants (item variants), related_items (related items from variant groups and sets), vehicles (vehicles this item is installed on), shops (shop availability data), shops.items (shop items). | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetWeapon200Response**](GetWeapon200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVehicleItem**
> GetWeapon200Response getVehicleItem(identifier, locale, include, version)

In-Game Vehicle Item Detail

Retrieve a specific vehicle component by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle items. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String identifier = Frost-Star; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getVehicleItem(identifier, locale, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->getVehicleItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetWeapon200Response**](GetWeapon200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVehicleWeapon**
> GetWeapon200Response getVehicleWeapon(identifier, locale, include, version)

In-Game Vehicle Weapon Detail

Retrieve a specific vehicle weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String identifier = Predator Scattergun; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getVehicleWeapon(identifier, locale, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->getVehicleWeapon: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetWeapon200Response**](GetWeapon200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWeapon**
> GetWeapon200Response getWeapon(identifier, locale, include, version)

In-Game Weapon Detail

Retrieve a specific FPS weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String identifier = Scourge Railgun; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getWeapon(identifier, locale, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->getWeapon: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetWeapon200Response**](GetWeapon200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWeaponAttachment**
> GetWeapon200Response getWeaponAttachment(identifier, locale, include, version)

In-Game Weapon Attachment Detail

Retrieve a specific weapon attachment by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapon attachments. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String identifier = Quell Suppressor2; // String | 
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getWeaponAttachment(identifier, locale, include, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->getWeaponAttachment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **identifier** | **String**|  | 
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetWeapon200Response**](GetWeapon200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listArmor**
> ListWeapons200Response listArmor(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Armor Overview

Alias for /api/items scoped to armor (FPS.Armor.* classification). Results are scoped to the requested or default game version. Returns armor items with manufacturer, game version, and description data.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Clark Defense Systems`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Core`
final String filterLeftSquareBracketClassificationRightSquareBracket = filterLeftSquareBracketClassificationRightSquareBracket_example; // String | Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search items by name or class name. Example: `Core`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.listArmor(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listArmor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Clark Defense Systems` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Core` | [optional] 
 **filterLeftSquareBracketClassificationRightSquareBracket** | **String**| Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search items by name or class name. Example: `Core` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listClothes**
> ListWeapons200Response listClothes(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Clothes Overview

Alias for /api/items scoped to clothing (FPS.Clothing.* classification). Results are scoped to the requested or default game version. Returns clothing items with manufacturer, game version, and description data.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Fiore`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Jacket`
final String filterLeftSquareBracketClassificationRightSquareBracket = filterLeftSquareBracketClassificationRightSquareBracket_example; // String | Partial match on item classification (dot-notation, e.g. FPS.Clothing). (see GET /api/items/filters for valid values). Example: `FPS.Clothing.Torso`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search items by name or class name. Example: `Jacket`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.listClothes(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listClothes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Fiore` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Jacket` | [optional] 
 **filterLeftSquareBracketClassificationRightSquareBracket** | **String**| Partial match on item classification (dot-notation, e.g. FPS.Clothing). (see GET /api/items/filters for valid values). Example: `FPS.Clothing.Torso` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search items by name or class name. Example: `Jacket` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listFood**
> ListWeapons200Response listFood(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Food Overview

Alias for /api/items scoped to food and drink (Food, Bottle, Drink types). Results are scoped to the requested or default game version. Returns consumable items with manufacturer, game version, and description data.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Consumable`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Burger`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search items by name or class name. Example: `Burger`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.listFood(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listFood: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Consumable` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Burger` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search items by name or class name. Example: `Burger` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listItemFilters**
> ListItemFilters200Response listItemFilters(version, filterLeftSquareBracketVariantsRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketClassRightSquareBracket, filterLeftSquareBracketRarityRightSquareBracket, filterLeftSquareBracketEventSourceRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Item Filters

Returns available filter facet values for in-game items, grouped by field with occurrence counts. Applying other filters narrows the facet results. Use these values as filter[*] parameters on GET /api/items. Scoped to the default item category unless filter[category] is specified.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final bool filterLeftSquareBracketVariantsRightSquareBracket = true; // bool | When false, facets are computed excluding variant items. When true or omitted, all items are included.
final String filterLeftSquareBracketCategoryRightSquareBracket = filterLeftSquareBracketCategoryRightSquareBracket_example; // String | Item category to scope facets. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Narrow facets to items matching this type. Example: `WeaponPersonal`
final String filterLeftSquareBracketSubTypeRightSquareBracket = filterLeftSquareBracketSubTypeRightSquareBracket_example; // String | Narrow facets to items matching this sub-type. Example: `Barrel`
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Narrow facets to items from this manufacturer. Example: `KnightBridge Arms`
final String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket = filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket_example; // String | Same as filter[manufacturer]. Example: `Anvil Aerospace`
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | Narrow facets to items with matching class name. Example: `MGA_Assault`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Narrow facets to items with matching name. Example: `Arrow`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Narrow facets to items matching name or class name. Example: `Arrow`
final String filterLeftSquareBracketClassificationRightSquareBracket = filterLeftSquareBracketClassificationRightSquareBracket_example; // String | Narrow facets to items with matching classification. Example: `FPS.Armor.Torso`
final num filterLeftSquareBracketSizeRightSquareBracket = 8.14; // num | Narrow facets to items with this size. Example: `3`
final num filterLeftSquareBracketGradeRightSquareBracket = 8.14; // num | Narrow facets to items with this grade. Example: `3`
final String filterLeftSquareBracketClassRightSquareBracket = filterLeftSquareBracketClassRightSquareBracket_example; // String | Narrow facets to items with this class. Example: `Military`
final String filterLeftSquareBracketRarityRightSquareBracket = filterLeftSquareBracketRarityRightSquareBracket_example; // String | Narrow facets to items with this rarity. Example: `Rare`
final String filterLeftSquareBracketEventSourceRightSquareBracket = filterLeftSquareBracketEventSourceRightSquareBracket_example; // String | Narrow facets to items with this event or reward source. Example: `IAE`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.listItemFilters(version, filterLeftSquareBracketVariantsRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketClassRightSquareBracket, filterLeftSquareBracketRarityRightSquareBracket, filterLeftSquareBracketEventSourceRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listItemFilters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **filterLeftSquareBracketVariantsRightSquareBracket** | **bool**| When false, facets are computed excluding variant items. When true or omitted, all items are included. | [optional] 
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Item category to scope facets. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons` | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Narrow facets to items matching this type. Example: `WeaponPersonal` | [optional] 
 **filterLeftSquareBracketSubTypeRightSquareBracket** | **String**| Narrow facets to items matching this sub-type. Example: `Barrel` | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Narrow facets to items from this manufacturer. Example: `KnightBridge Arms` | [optional] 
 **filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket** | **String**| Same as filter[manufacturer]. Example: `Anvil Aerospace` | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**| Narrow facets to items with matching class name. Example: `MGA_Assault` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Narrow facets to items with matching name. Example: `Arrow` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Narrow facets to items matching name or class name. Example: `Arrow` | [optional] 
 **filterLeftSquareBracketClassificationRightSquareBracket** | **String**| Narrow facets to items with matching classification. Example: `FPS.Armor.Torso` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **num**| Narrow facets to items with this size. Example: `3` | [optional] 
 **filterLeftSquareBracketGradeRightSquareBracket** | **num**| Narrow facets to items with this grade. Example: `3` | [optional] 
 **filterLeftSquareBracketClassRightSquareBracket** | **String**| Narrow facets to items with this class. Example: `Military` | [optional] 
 **filterLeftSquareBracketRarityRightSquareBracket** | **String**| Narrow facets to items with this rarity. Example: `Rare` | [optional] 
 **filterLeftSquareBracketEventSourceRightSquareBracket** | **String**| Narrow facets to items with this event or reward source. Example: `IAE` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListItemFilters200Response**](ListItemFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listItems**
> ListWeapons200Response listItems(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketVariantsRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketClassRightSquareBracket, filterLeftSquareBracketRarityRightSquareBracket, filterLeftSquareBracketEventSourceRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket, filterLeftSquareBracketTagsRightSquareBracket, filterLeftSquareBracketPortTagsRightSquareBracket, filterLeftSquareBracketVehicleRightSquareBracket)

In-Game Item Overview

Returns paginated in-game items for the requested category and game version. Always includes manufacturer, game version, and description data. Crafting blueprints are loaded automatically. Supports filtering by type, classification, manufacturer, size, grade, and more. Available includes: shops, variants, related_items, blueprints, vehicles, shops.items. Supports 150+ JSON field sorts. (see GET /api/items/filters for valid filter values)

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = -weapon.damage.alpha_total; // String | Sort field. Prefix with \"-\" for descending. Supports 250+ JSON fields. Examples: name, -grade, weapon.damage.alpha_total, -shield_controller.face_type. Use comma for multiple: grade,-name
final bool filterLeftSquareBracketVariantsRightSquareBracket = true; // bool | When false, excludes variant items (base_id IS NOT NULL) and returns only base items. When true or omitted, returns all items including variants.
final String filterLeftSquareBracketCategoryRightSquareBracket = filterLeftSquareBracketCategoryRightSquareBracket_example; // String | Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
final String filterLeftSquareBracketSubTypeRightSquareBracket = filterLeftSquareBracketSubTypeRightSquareBracket_example; // String | Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
final String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket = filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket_example; // String | Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | Partial match on item class name. Example: `Controller_Comms`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Arrow`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search items by name or class name. Example: `helmet`
final String filterLeftSquareBracketClassificationRightSquareBracket = filterLeftSquareBracketClassificationRightSquareBracket_example; // String | Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
final num filterLeftSquareBracketSizeRightSquareBracket = 8.14; // num | Exact item size (0-12). Example: `3`
final num filterLeftSquareBracketGradeRightSquareBracket = 8.14; // num | Exact item grade (1-7, mapped to A-G). Example: `3`
final String filterLeftSquareBracketClassRightSquareBracket = filterLeftSquareBracketClassRightSquareBracket_example; // String | Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
final String filterLeftSquareBracketRarityRightSquareBracket = filterLeftSquareBracketRarityRightSquareBracket_example; // String | Item rarity. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Rare`
final String filterLeftSquareBracketEventSourceRightSquareBracket = filterLeftSquareBracketEventSourceRightSquareBracket_example; // String | Event or reward source label. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `IAE`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
final String filterLeftSquareBracketTagsRightSquareBracket = filterLeftSquareBracketTagsRightSquareBracket_example; // String | Filter by stdItem.RequiredTags array values. Use when a port has required_tags - matches items whose RequiredTags contain ALL specified values. Accepts comma-separated tags for AND matching. Example: `MISC_Fury_Miru`
final String filterLeftSquareBracketPortTagsRightSquareBracket = filterLeftSquareBracketPortTagsRightSquareBracket_example; // String | Filter items by RequiredTags compatibility with a port's tags. Accepts comma-separated port tag values. Returns items where any of their RequiredTags appear in the provided tags, OR items with no RequiredTags but whose Tags overlap with the provided tags (e.g. older paint system). Items with no RequiredTags and no overlapping Tags are excluded. Pass the port_tags value from a vehicle hardpoint port. Example: `flight_ready,Ship_Dock_Refuel`
final String filterLeftSquareBracketVehicleRightSquareBracket = filterLeftSquareBracketVehicleRightSquareBracket_example; // String | Scope items to a specific vehicle. Accepts one or more vehicle identity tags (from the vehicle's port_tags field). Returns: (1) universal items with no RequiredTags and not bespoke, (2) bespoke items whose RequiredTags match any provided tag, (3) bespoke items whose bespoke_vehicle_tags match any provided tag. Use on vehicle pages to show only items equippable on that vehicle. Example: `AEGS_Avenger_Base`

try {
    final response = api.listItems(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketVariantsRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketClassRightSquareBracket, filterLeftSquareBracketRarityRightSquareBracket, filterLeftSquareBracketEventSourceRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket, filterLeftSquareBracketTagsRightSquareBracket, filterLeftSquareBracketPortTagsRightSquareBracket, filterLeftSquareBracketVehicleRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listItems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supports 250+ JSON fields. Examples: name, -grade, weapon.damage.alpha_total, -shield_controller.face_type. Use comma for multiple: grade,-name | [optional] 
 **filterLeftSquareBracketVariantsRightSquareBracket** | **bool**| When false, excludes variant items (base_id IS NOT NULL) and returns only base items. When true or omitted, returns all items including variants. | [optional] 
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons` | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal` | [optional] 
 **filterLeftSquareBracketSubTypeRightSquareBracket** | **String**| Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel` | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms` | [optional] 
 **filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket** | **String**| Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace` | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**| Partial match on item class name. Example: `Controller_Comms` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Arrow` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search items by name or class name. Example: `helmet` | [optional] 
 **filterLeftSquareBracketClassificationRightSquareBracket** | **String**| Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **num**| Exact item size (0-12). Example: `3` | [optional] 
 **filterLeftSquareBracketGradeRightSquareBracket** | **num**| Exact item grade (1-7, mapped to A-G). Example: `3` | [optional] 
 **filterLeftSquareBracketClassRightSquareBracket** | **String**| Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military` | [optional] 
 **filterLeftSquareBracketRarityRightSquareBracket** | **String**| Item rarity. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Rare` | [optional] 
 **filterLeftSquareBracketEventSourceRightSquareBracket** | **String**| Event or reward source label. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `IAE` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 
 **filterLeftSquareBracketTagsRightSquareBracket** | **String**| Filter by stdItem.RequiredTags array values. Use when a port has required_tags - matches items whose RequiredTags contain ALL specified values. Accepts comma-separated tags for AND matching. Example: `MISC_Fury_Miru` | [optional] 
 **filterLeftSquareBracketPortTagsRightSquareBracket** | **String**| Filter items by RequiredTags compatibility with a port's tags. Accepts comma-separated port tag values. Returns items where any of their RequiredTags appear in the provided tags, OR items with no RequiredTags but whose Tags overlap with the provided tags (e.g. older paint system). Items with no RequiredTags and no overlapping Tags are excluded. Pass the port_tags value from a vehicle hardpoint port. Example: `flight_ready,Ship_Dock_Refuel` | [optional] 
 **filterLeftSquareBracketVehicleRightSquareBracket** | **String**| Scope items to a specific vehicle. Accepts one or more vehicle identity tags (from the vehicle's port_tags field). Returns: (1) universal items with no RequiredTags and not bespoke, (2) bespoke items whose RequiredTags match any provided tag, (3) bespoke items whose bespoke_vehicle_tags match any provided tag. Use on vehicle pages to show only items equippable on that vehicle. Example: `AEGS_Avenger_Base` | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVehicleItems**
> ListWeapons200Response listVehicleItems(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Vehicle Items Overview

Alias for /api/items scoped to vehicle components (coolers, shields, power plants, quantum drives, thrusters, etc.). Results are scoped to the requested or default game version. Returns component items with manufacturer, game version, and description data.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Aegis Dynamics`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Shield`
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Cooler`
final String filterLeftSquareBracketSubTypeRightSquareBracket = filterLeftSquareBracketSubTypeRightSquareBracket_example; // String | Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Default`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search items by name or class name. Example: `Shield`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.listVehicleItems(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listVehicleItems: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Aegis Dynamics` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Shield` | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Cooler` | [optional] 
 **filterLeftSquareBracketSubTypeRightSquareBracket** | **String**| Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Default` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search items by name or class name. Example: `Shield` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVehicleWeapons**
> ListWeapons200Response listVehicleWeapons(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Vehicle Weapons Overview

Alias for /api/items scoped to vehicle weapons (WeaponGun type). Results are scoped to the requested or default game version. Returns ship weapon items with manufacturer, game version, and description data.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Cannon`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search items by name or class name. Example: `Cannon`
final num filterLeftSquareBracketSizeRightSquareBracket = 8.14; // num | Exact item size (0-12). Example: `3`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.listVehicleWeapons(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listVehicleWeapons: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Cannon` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search items by name or class name. Example: `Cannon` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **num**| Exact item size (0-12). Example: `3` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listWeaponAttachments**
> ListWeapons200Response listWeaponAttachments(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Weapon Attachments Overview

Alias for /api/items scoped to weapon attachments (WeaponAttachment type, excluding magazines and missiles). Results are scoped to the requested or default game version. Returns attachment items with manufacturer, game version, and description data.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `ArmaMod`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Quell Suppressor2`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search items by name or class name. Example: `Quell Suppressor2`
final num filterLeftSquareBracketSizeRightSquareBracket = 8.14; // num | Exact item size (0-12). Example: `1`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.listWeaponAttachments(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listWeaponAttachments: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `ArmaMod` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Quell Suppressor2` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search items by name or class name. Example: `Quell Suppressor2` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **num**| Exact item size (0-12). Example: `1` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listWeapons**
> ListWeapons200Response listWeapons(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Weapons Overview

Alias for /api/items scoped to FPS weapons (WeaponPersonal type). Results are scoped to the requested or default game version. Returns weapon items with manufacturer, game version, and description data.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Klaus & Werner`
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | Partial match on item class name. Example: `behr_sniper_ballistic_01`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Arrow`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search items by name or class name. Example: `Arrow`
final num filterLeftSquareBracketSizeRightSquareBracket = 8.14; // num | Exact item size (0-12). Example: `3`
final num filterLeftSquareBracketGradeRightSquareBracket = 8.14; // num | Exact item grade (1-7, mapped to A-G). Example: `1`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.listWeapons(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, include, version, sort, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->listWeapons: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Klaus & Werner` | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**| Partial match on item class name. Example: `behr_sniper_ballistic_01` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Arrow` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search items by name or class name. Example: `Arrow` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **num**| Exact item size (0-12). Example: `3` | [optional] 
 **filterLeftSquareBracketGradeRightSquareBracket** | **num**| Exact item grade (1-7, mapped to A-G). Example: `1` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchItemsDeprecated**
> ListWeapons200Response searchItemsDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, locale, include, sort, filterLeftSquareBracketVariantsRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketClassRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket)

In-Game Item Search (Deprecated)

Deprecated. Use GET /api/items?filter[name]={value} for name search. Note: OR search across name/uuid/type is no longer supported. This endpoint will be removed in a future version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getItemsApi();
final Object body = {"query": "Arrow"}; // Object | Item Name or (sub)type
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String locale = locale_example; // String | Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
final String include = include_example; // String | Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
final String sort = sort_example; // String | Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
final bool filterLeftSquareBracketVariantsRightSquareBracket = true; // bool | When false, excludes variant items and returns only base items. When true or omitted, returns all items.
final String filterLeftSquareBracketCategoryRightSquareBracket = filterLeftSquareBracketCategoryRightSquareBracket_example; // String | Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
final String filterLeftSquareBracketTypeRightSquareBracket = filterLeftSquareBracketTypeRightSquareBracket_example; // String | Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
final String filterLeftSquareBracketSubTypeRightSquareBracket = filterLeftSquareBracketSubTypeRightSquareBracket_example; // String | Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
final String filterLeftSquareBracketManufacturerRightSquareBracket = filterLeftSquareBracketManufacturerRightSquareBracket_example; // String | Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
final String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket = filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket_example; // String | Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
final String filterLeftSquareBracketClassNameRightSquareBracket = filterLeftSquareBracketClassNameRightSquareBracket_example; // String | Partial match on item class name. Example: `MGA_Assault`
final String filterLeftSquareBracketNameRightSquareBracket = filterLeftSquareBracketNameRightSquareBracket_example; // String | Partial match on item display name. Example: `Arrow`
final String filterLeftSquareBracketClassificationRightSquareBracket = filterLeftSquareBracketClassificationRightSquareBracket_example; // String | Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
final num filterLeftSquareBracketSizeRightSquareBracket = 8.14; // num | Exact item size (0-12). Example: `3`
final num filterLeftSquareBracketGradeRightSquareBracket = 8.14; // num | Exact item grade (1-7, mapped to A-G). Example: `3`
final String filterLeftSquareBracketClassRightSquareBracket = filterLeftSquareBracketClassRightSquareBracket_example; // String | Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
final bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket = true; // bool | When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.

try {
    final response = api.searchItemsDeprecated(body, page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, locale, include, sort, filterLeftSquareBracketVariantsRightSquareBracket, filterLeftSquareBracketCategoryRightSquareBracket, filterLeftSquareBracketTypeRightSquareBracket, filterLeftSquareBracketSubTypeRightSquareBracket, filterLeftSquareBracketManufacturerRightSquareBracket, filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, filterLeftSquareBracketClassNameRightSquareBracket, filterLeftSquareBracketNameRightSquareBracket, filterLeftSquareBracketClassificationRightSquareBracket, filterLeftSquareBracketSizeRightSquareBracket, filterLeftSquareBracketGradeRightSquareBracket, filterLeftSquareBracketClassRightSquareBracket, filterLeftSquareBracketIncludeIrrelevantRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ItemsApi->searchItemsDeprecated: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Item Name or (sub)type | 
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **locale** | **String**| Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh). | [optional] 
 **include** | **String**| Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values. | [optional] 
 **sort** | **String**| Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint. | [optional] 
 **filterLeftSquareBracketVariantsRightSquareBracket** | **bool**| When false, excludes variant items and returns only base items. When true or omitted, returns all items. | [optional] 
 **filterLeftSquareBracketCategoryRightSquareBracket** | **String**| Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons` | [optional] 
 **filterLeftSquareBracketTypeRightSquareBracket** | **String**| Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal` | [optional] 
 **filterLeftSquareBracketSubTypeRightSquareBracket** | **String**| Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel` | [optional] 
 **filterLeftSquareBracketManufacturerRightSquareBracket** | **String**| Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms` | [optional] 
 **filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket** | **String**| Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace` | [optional] 
 **filterLeftSquareBracketClassNameRightSquareBracket** | **String**| Partial match on item class name. Example: `MGA_Assault` | [optional] 
 **filterLeftSquareBracketNameRightSquareBracket** | **String**| Partial match on item display name. Example: `Arrow` | [optional] 
 **filterLeftSquareBracketClassificationRightSquareBracket** | **String**| Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso` | [optional] 
 **filterLeftSquareBracketSizeRightSquareBracket** | **num**| Exact item size (0-12). Example: `3` | [optional] 
 **filterLeftSquareBracketGradeRightSquareBracket** | **num**| Exact item grade (1-7, mapped to A-G). Example: `3` | [optional] 
 **filterLeftSquareBracketClassRightSquareBracket** | **String**| Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military` | [optional] 
 **filterLeftSquareBracketIncludeIrrelevantRightSquareBracket** | **bool**| When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items. | [optional] 

### Return type

[**ListWeapons200Response**](ListWeapons200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

