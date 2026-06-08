# starcitizen_wiki_api.api.MissionsApi

## Load the API package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

All URIs are relative to *https://api.star-citizen.wiki*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMission**](MissionsApi.md#getmission) | **GET** /api/missions/{mission} | Get Mission Detail
[**listMissionFilters**](MissionsApi.md#listmissionfilters) | **GET** /api/missions/filters | Get Mission Filter Options
[**listMissions**](MissionsApi.md#listmissions) | **GET** /api/missions | List Game Missions


# **getMission**
> GetMission200Response getMission(mission, version)

Get Mission Detail

Returns full details for a single mission, including chain relationships and associated items. Results are scoped to the requested or default game version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getMissionsApi();
final String mission = finishing-the-job-4; // String | 
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.

try {
    final response = api.getMission(mission, version);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MissionsApi->getMission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mission** | **String**|  | 
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 

### Return type

[**GetMission200Response**](GetMission200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMissionFilters**
> ListMissionFilters200Response listMissionFilters(version, filterLeftSquareBracketIncludeUnreleasedRightSquareBracket, filterLeftSquareBracketMissionGiverRightSquareBracket, filterLeftSquareBracketFactionRightSquareBracket, filterLeftSquareBracketStarSystemRightSquareBracket, filterLeftSquareBracketIllegalRightSquareBracket, filterLeftSquareBracketShareableRightSquareBracket, filterLeftSquareBracketOnceOnlyRightSquareBracket, filterLeftSquareBracketAvailableInPrisonRightSquareBracket, filterLeftSquareBracketHasCombatRightSquareBracket, filterLeftSquareBracketHasDefendObjectiveRightSquareBracket, filterLeftSquareBracketRankIndexRightSquareBracket, filterLeftSquareBracketHasPrerequisitesRightSquareBracket, filterLeftSquareBracketMinEnemiesRightSquareBracket, filterLeftSquareBracketMaxEnemiesRightSquareBracket, filterLeftSquareBracketRewardMinRightSquareBracket, filterLeftSquareBracketRewardMaxRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketDescriptionRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketRewardScopeRightSquareBracket, filterLeftSquareBracketHasBlueprintsRightSquareBracket, filterLeftSquareBracketBlueprintNameRightSquareBracket, filterLeftSquareBracketReputationScopeRightSquareBracket, filterLeftSquareBracketLocationRightSquareBracket)

Get Mission Filter Options

Returns available filter facets for missions, scoped to the requested or default game version.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getMissionsApi();
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final bool filterLeftSquareBracketIncludeUnreleasedRightSquareBracket = true; // bool | Include unreleased and work-in-progress missions
final String filterLeftSquareBracketMissionGiverRightSquareBracket = filterLeftSquareBracketMissionGiverRightSquareBracket_example; // String | Exact match on the mission giver NPC name. (see GET /api/missions/filters for valid values)
final String filterLeftSquareBracketFactionRightSquareBracket = filterLeftSquareBracketFactionRightSquareBracket_example; // String | Filter by faction name. Accepts comma-separated values. (see GET /api/missions/filters for valid values)
final String filterLeftSquareBracketStarSystemRightSquareBracket = filterLeftSquareBracketStarSystemRightSquareBracket_example; // String | Filter by star system name. (see GET /api/missions/filters for valid values)
final bool filterLeftSquareBracketIllegalRightSquareBracket = true; // bool | Filter for missions marked as illegal
final bool filterLeftSquareBracketShareableRightSquareBracket = true; // bool | Filter for shareable missions
final bool filterLeftSquareBracketOnceOnlyRightSquareBracket = true; // bool | Filter for one-time-only missions
final bool filterLeftSquareBracketAvailableInPrisonRightSquareBracket = true; // bool | Filter for missions available while in prison
final bool filterLeftSquareBracketHasCombatRightSquareBracket = true; // bool | Filter for missions involving combat encounters
final bool filterLeftSquareBracketHasDefendObjectiveRightSquareBracket = true; // bool | Filter for missions with a defend objective
final int filterLeftSquareBracketRankIndexRightSquareBracket = 56; // int | Filter by mission difficulty rank
final bool filterLeftSquareBracketHasPrerequisitesRightSquareBracket = true; // bool | Filter for missions that have prerequisite requirements
final int filterLeftSquareBracketMinEnemiesRightSquareBracket = 56; // int | Minimum enemy count threshold
final int filterLeftSquareBracketMaxEnemiesRightSquareBracket = 56; // int | Maximum enemy count threshold
final int filterLeftSquareBracketRewardMinRightSquareBracket = 56; // int | Minimum reward in aUEC
final int filterLeftSquareBracketRewardMaxRightSquareBracket = 56; // int | Maximum reward in aUEC
final String filterLeftSquareBracketTitleRightSquareBracket = filterLeftSquareBracketTitleRightSquareBracket_example; // String | Partial match on mission title
final String filterLeftSquareBracketDescriptionRightSquareBracket = filterLeftSquareBracketDescriptionRightSquareBracket_example; // String | Partial match on mission description
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search across title, description, and debug name
final String filterLeftSquareBracketRewardScopeRightSquareBracket = filterLeftSquareBracketRewardScopeRightSquareBracket_example; // String | Mission category scope. (see GET /api/missions/filters for valid values)
final bool filterLeftSquareBracketHasBlueprintsRightSquareBracket = true; // bool | Filter for missions that reward blueprints
final String filterLeftSquareBracketBlueprintNameRightSquareBracket = filterLeftSquareBracketBlueprintNameRightSquareBracket_example; // String | Filter by crafted item name from mission blueprint rewards. (see GET /api/missions/filters for valid values)
final String filterLeftSquareBracketReputationScopeRightSquareBracket = filterLeftSquareBracketReputationScopeRightSquareBracket_example; // String | Reputation reward scope from ReputationGained data. (see GET /api/missions/filters for valid values)
final String filterLeftSquareBracketLocationRightSquareBracket = filterLeftSquareBracketLocationRightSquareBracket_example; // String | Filter by starmap location UUID

try {
    final response = api.listMissionFilters(version, filterLeftSquareBracketIncludeUnreleasedRightSquareBracket, filterLeftSquareBracketMissionGiverRightSquareBracket, filterLeftSquareBracketFactionRightSquareBracket, filterLeftSquareBracketStarSystemRightSquareBracket, filterLeftSquareBracketIllegalRightSquareBracket, filterLeftSquareBracketShareableRightSquareBracket, filterLeftSquareBracketOnceOnlyRightSquareBracket, filterLeftSquareBracketAvailableInPrisonRightSquareBracket, filterLeftSquareBracketHasCombatRightSquareBracket, filterLeftSquareBracketHasDefendObjectiveRightSquareBracket, filterLeftSquareBracketRankIndexRightSquareBracket, filterLeftSquareBracketHasPrerequisitesRightSquareBracket, filterLeftSquareBracketMinEnemiesRightSquareBracket, filterLeftSquareBracketMaxEnemiesRightSquareBracket, filterLeftSquareBracketRewardMinRightSquareBracket, filterLeftSquareBracketRewardMaxRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketDescriptionRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketRewardScopeRightSquareBracket, filterLeftSquareBracketHasBlueprintsRightSquareBracket, filterLeftSquareBracketBlueprintNameRightSquareBracket, filterLeftSquareBracketReputationScopeRightSquareBracket, filterLeftSquareBracketLocationRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MissionsApi->listMissionFilters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **filterLeftSquareBracketIncludeUnreleasedRightSquareBracket** | **bool**| Include unreleased and work-in-progress missions | [optional] 
 **filterLeftSquareBracketMissionGiverRightSquareBracket** | **String**| Exact match on the mission giver NPC name. (see GET /api/missions/filters for valid values) | [optional] 
 **filterLeftSquareBracketFactionRightSquareBracket** | **String**| Filter by faction name. Accepts comma-separated values. (see GET /api/missions/filters for valid values) | [optional] 
 **filterLeftSquareBracketStarSystemRightSquareBracket** | **String**| Filter by star system name. (see GET /api/missions/filters for valid values) | [optional] 
 **filterLeftSquareBracketIllegalRightSquareBracket** | **bool**| Filter for missions marked as illegal | [optional] 
 **filterLeftSquareBracketShareableRightSquareBracket** | **bool**| Filter for shareable missions | [optional] 
 **filterLeftSquareBracketOnceOnlyRightSquareBracket** | **bool**| Filter for one-time-only missions | [optional] 
 **filterLeftSquareBracketAvailableInPrisonRightSquareBracket** | **bool**| Filter for missions available while in prison | [optional] 
 **filterLeftSquareBracketHasCombatRightSquareBracket** | **bool**| Filter for missions involving combat encounters | [optional] 
 **filterLeftSquareBracketHasDefendObjectiveRightSquareBracket** | **bool**| Filter for missions with a defend objective | [optional] 
 **filterLeftSquareBracketRankIndexRightSquareBracket** | **int**| Filter by mission difficulty rank | [optional] 
 **filterLeftSquareBracketHasPrerequisitesRightSquareBracket** | **bool**| Filter for missions that have prerequisite requirements | [optional] 
 **filterLeftSquareBracketMinEnemiesRightSquareBracket** | **int**| Minimum enemy count threshold | [optional] 
 **filterLeftSquareBracketMaxEnemiesRightSquareBracket** | **int**| Maximum enemy count threshold | [optional] 
 **filterLeftSquareBracketRewardMinRightSquareBracket** | **int**| Minimum reward in aUEC | [optional] 
 **filterLeftSquareBracketRewardMaxRightSquareBracket** | **int**| Maximum reward in aUEC | [optional] 
 **filterLeftSquareBracketTitleRightSquareBracket** | **String**| Partial match on mission title | [optional] 
 **filterLeftSquareBracketDescriptionRightSquareBracket** | **String**| Partial match on mission description | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search across title, description, and debug name | [optional] 
 **filterLeftSquareBracketRewardScopeRightSquareBracket** | **String**| Mission category scope. (see GET /api/missions/filters for valid values) | [optional] 
 **filterLeftSquareBracketHasBlueprintsRightSquareBracket** | **bool**| Filter for missions that reward blueprints | [optional] 
 **filterLeftSquareBracketBlueprintNameRightSquareBracket** | **String**| Filter by crafted item name from mission blueprint rewards. (see GET /api/missions/filters for valid values) | [optional] 
 **filterLeftSquareBracketReputationScopeRightSquareBracket** | **String**| Reputation reward scope from ReputationGained data. (see GET /api/missions/filters for valid values) | [optional] 
 **filterLeftSquareBracketLocationRightSquareBracket** | **String**| Filter by starmap location UUID | [optional] 

### Return type

[**ListMissionFilters200Response**](ListMissionFilters200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMissions**
> ListMissions200Response listMissions(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, version, sort, filterLeftSquareBracketMissionGiverRightSquareBracket, filterLeftSquareBracketFactionRightSquareBracket, filterLeftSquareBracketStarSystemRightSquareBracket, filterLeftSquareBracketIllegalRightSquareBracket, filterLeftSquareBracketShareableRightSquareBracket, filterLeftSquareBracketOnceOnlyRightSquareBracket, filterLeftSquareBracketAvailableInPrisonRightSquareBracket, filterLeftSquareBracketHasCombatRightSquareBracket, filterLeftSquareBracketHasDefendObjectiveRightSquareBracket, filterLeftSquareBracketRankIndexRightSquareBracket, filterLeftSquareBracketHasPrerequisitesRightSquareBracket, filterLeftSquareBracketMinEnemiesRightSquareBracket, filterLeftSquareBracketMaxEnemiesRightSquareBracket, filterLeftSquareBracketRewardMinRightSquareBracket, filterLeftSquareBracketRewardMaxRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketDescriptionRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketRewardScopeRightSquareBracket, filterLeftSquareBracketHasBlueprintsRightSquareBracket, filterLeftSquareBracketReputationScopeRightSquareBracket, filterLeftSquareBracketBlueprintNameRightSquareBracket, filterLeftSquareBracketLocationRightSquareBracket, filterLeftSquareBracketGroupedRightSquareBracket)

List Game Missions

Returns paginated missions for the requested or default game version. Results are grouped by mission variant key by default. Grouping is automatically disabled when filters are active unless filter[grouped]=true is set explicitly. Includes mission, game version, faction, and blueprint relationships.

### Example
```dart
import 'package:starcitizen_wiki_api/api.dart';

final api = StarcitizenWikiApi().getMissionsApi();
final int page = 56; // int | Page number for pagination (starts at 1). Prefer using `page[number]` instead.
final int pageLeftSquareBracketNumberRightSquareBracket = 56; // int | Page number for pagination (starts at 1).
final int pageLeftSquareBracketSizeRightSquareBracket = 56; // int | Number of results per page. Maximum 200.
final String version = version_example; // String | Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
final String sort = title; // String | Sort field. Prefix with \"-\" for descending. Supported: title, mission_giver, rank_index, reward_min, reward_max, time_to_complete_minutes, max_players_per_instance, reputation_amount.
final String filterLeftSquareBracketMissionGiverRightSquareBracket = filterLeftSquareBracketMissionGiverRightSquareBracket_example; // String | Exact match on the mission giver NPC name. Example: `Citizens for Prosperity`
final String filterLeftSquareBracketFactionRightSquareBracket = filterLeftSquareBracketFactionRightSquareBracket_example; // String | Filter by faction name. Accepts comma-separated values. Example: `Headhunters`
final String filterLeftSquareBracketStarSystemRightSquareBracket = filterLeftSquareBracketStarSystemRightSquareBracket_example; // String | Filter by star system name. Example: `Stanton`
final bool filterLeftSquareBracketIllegalRightSquareBracket = true; // bool | Filter for missions marked as illegal. Example: `true`
final bool filterLeftSquareBracketShareableRightSquareBracket = true; // bool | Filter for shareable missions. Example: `true`
final bool filterLeftSquareBracketOnceOnlyRightSquareBracket = true; // bool | Filter for one-time-only missions. Example: `true`
final bool filterLeftSquareBracketAvailableInPrisonRightSquareBracket = true; // bool | Filter for missions available while in prison. Example: `true`
final bool filterLeftSquareBracketHasCombatRightSquareBracket = true; // bool | Filter for missions involving combat encounters. Example: `true`
final bool filterLeftSquareBracketHasDefendObjectiveRightSquareBracket = true; // bool | Filter for missions with a defend objective. Example: `true`
final int filterLeftSquareBracketRankIndexRightSquareBracket = 56; // int | Filter by mission difficulty rank. Example: `1`
final bool filterLeftSquareBracketHasPrerequisitesRightSquareBracket = true; // bool | Filter for missions that have prerequisite requirements. Example: `true`
final int filterLeftSquareBracketMinEnemiesRightSquareBracket = 56; // int | Minimum enemy count threshold. Example: `3`
final int filterLeftSquareBracketMaxEnemiesRightSquareBracket = 56; // int | Maximum enemy count threshold. Example: `10`
final int filterLeftSquareBracketRewardMinRightSquareBracket = 56; // int | Minimum reward in aUEC. Example: `5000`
final int filterLeftSquareBracketRewardMaxRightSquareBracket = 56; // int | Maximum reward in aUEC. Example: `50000`
final String filterLeftSquareBracketTitleRightSquareBracket = filterLeftSquareBracketTitleRightSquareBracket_example; // String | Partial match on mission title. Example: `Delivery`
final String filterLeftSquareBracketDescriptionRightSquareBracket = filterLeftSquareBracketDescriptionRightSquareBracket_example; // String | Partial match on mission description. Example: `combat`
final String filterLeftSquareBracketQueryRightSquareBracket = filterLeftSquareBracketQueryRightSquareBracket_example; // String | Search across title, description, and debug name. Example: `delivery`
final String filterLeftSquareBracketRewardScopeRightSquareBracket = filterLeftSquareBracketRewardScopeRightSquareBracket_example; // String | Mission category scope. Example: `Bounty Hunter`
final bool filterLeftSquareBracketHasBlueprintsRightSquareBracket = true; // bool | Filter for missions that reward blueprints. Example: `true`
final String filterLeftSquareBracketReputationScopeRightSquareBracket = filterLeftSquareBracketReputationScopeRightSquareBracket_example; // String | Reputation reward scope from ReputationGained data. Example: `FactionReputation`
final String filterLeftSquareBracketBlueprintNameRightSquareBracket = filterLeftSquareBracketBlueprintNameRightSquareBracket_example; // String | Filter by crafted item name from mission blueprint rewards. Example: `Arclight Pistol`
final String filterLeftSquareBracketLocationRightSquareBracket = filterLeftSquareBracketLocationRightSquareBracket_example; // String | Filter by starmap location UUID. Example: `2bf56608-62ea-4d1a-9e9b-38377004dc1b`
final bool filterLeftSquareBracketGroupedRightSquareBracket = true; // bool | Control mission variant grouping. Defaults to true (grouped) when no filters are active, false (ungrouped) when filters are active. Set explicitly to true to keep grouping with filters, or false to always ungroup.

try {
    final response = api.listMissions(page, pageLeftSquareBracketNumberRightSquareBracket, pageLeftSquareBracketSizeRightSquareBracket, version, sort, filterLeftSquareBracketMissionGiverRightSquareBracket, filterLeftSquareBracketFactionRightSquareBracket, filterLeftSquareBracketStarSystemRightSquareBracket, filterLeftSquareBracketIllegalRightSquareBracket, filterLeftSquareBracketShareableRightSquareBracket, filterLeftSquareBracketOnceOnlyRightSquareBracket, filterLeftSquareBracketAvailableInPrisonRightSquareBracket, filterLeftSquareBracketHasCombatRightSquareBracket, filterLeftSquareBracketHasDefendObjectiveRightSquareBracket, filterLeftSquareBracketRankIndexRightSquareBracket, filterLeftSquareBracketHasPrerequisitesRightSquareBracket, filterLeftSquareBracketMinEnemiesRightSquareBracket, filterLeftSquareBracketMaxEnemiesRightSquareBracket, filterLeftSquareBracketRewardMinRightSquareBracket, filterLeftSquareBracketRewardMaxRightSquareBracket, filterLeftSquareBracketTitleRightSquareBracket, filterLeftSquareBracketDescriptionRightSquareBracket, filterLeftSquareBracketQueryRightSquareBracket, filterLeftSquareBracketRewardScopeRightSquareBracket, filterLeftSquareBracketHasBlueprintsRightSquareBracket, filterLeftSquareBracketReputationScopeRightSquareBracket, filterLeftSquareBracketBlueprintNameRightSquareBracket, filterLeftSquareBracketLocationRightSquareBracket, filterLeftSquareBracketGroupedRightSquareBracket);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MissionsApi->listMissions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number for pagination (starts at 1). Prefer using `page[number]` instead. | [optional] [default to 1]
 **pageLeftSquareBracketNumberRightSquareBracket** | **int**| Page number for pagination (starts at 1). | [optional] [default to 1]
 **pageLeftSquareBracketSizeRightSquareBracket** | **int**| Number of results per page. Maximum 200. | [optional] [default to 30]
 **version** | **String**| Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default. | [optional] 
 **sort** | **String**| Sort field. Prefix with \"-\" for descending. Supported: title, mission_giver, rank_index, reward_min, reward_max, time_to_complete_minutes, max_players_per_instance, reputation_amount. | [optional] 
 **filterLeftSquareBracketMissionGiverRightSquareBracket** | **String**| Exact match on the mission giver NPC name. Example: `Citizens for Prosperity` | [optional] 
 **filterLeftSquareBracketFactionRightSquareBracket** | **String**| Filter by faction name. Accepts comma-separated values. Example: `Headhunters` | [optional] 
 **filterLeftSquareBracketStarSystemRightSquareBracket** | **String**| Filter by star system name. Example: `Stanton` | [optional] 
 **filterLeftSquareBracketIllegalRightSquareBracket** | **bool**| Filter for missions marked as illegal. Example: `true` | [optional] 
 **filterLeftSquareBracketShareableRightSquareBracket** | **bool**| Filter for shareable missions. Example: `true` | [optional] 
 **filterLeftSquareBracketOnceOnlyRightSquareBracket** | **bool**| Filter for one-time-only missions. Example: `true` | [optional] 
 **filterLeftSquareBracketAvailableInPrisonRightSquareBracket** | **bool**| Filter for missions available while in prison. Example: `true` | [optional] 
 **filterLeftSquareBracketHasCombatRightSquareBracket** | **bool**| Filter for missions involving combat encounters. Example: `true` | [optional] 
 **filterLeftSquareBracketHasDefendObjectiveRightSquareBracket** | **bool**| Filter for missions with a defend objective. Example: `true` | [optional] 
 **filterLeftSquareBracketRankIndexRightSquareBracket** | **int**| Filter by mission difficulty rank. Example: `1` | [optional] 
 **filterLeftSquareBracketHasPrerequisitesRightSquareBracket** | **bool**| Filter for missions that have prerequisite requirements. Example: `true` | [optional] 
 **filterLeftSquareBracketMinEnemiesRightSquareBracket** | **int**| Minimum enemy count threshold. Example: `3` | [optional] 
 **filterLeftSquareBracketMaxEnemiesRightSquareBracket** | **int**| Maximum enemy count threshold. Example: `10` | [optional] 
 **filterLeftSquareBracketRewardMinRightSquareBracket** | **int**| Minimum reward in aUEC. Example: `5000` | [optional] 
 **filterLeftSquareBracketRewardMaxRightSquareBracket** | **int**| Maximum reward in aUEC. Example: `50000` | [optional] 
 **filterLeftSquareBracketTitleRightSquareBracket** | **String**| Partial match on mission title. Example: `Delivery` | [optional] 
 **filterLeftSquareBracketDescriptionRightSquareBracket** | **String**| Partial match on mission description. Example: `combat` | [optional] 
 **filterLeftSquareBracketQueryRightSquareBracket** | **String**| Search across title, description, and debug name. Example: `delivery` | [optional] 
 **filterLeftSquareBracketRewardScopeRightSquareBracket** | **String**| Mission category scope. Example: `Bounty Hunter` | [optional] 
 **filterLeftSquareBracketHasBlueprintsRightSquareBracket** | **bool**| Filter for missions that reward blueprints. Example: `true` | [optional] 
 **filterLeftSquareBracketReputationScopeRightSquareBracket** | **String**| Reputation reward scope from ReputationGained data. Example: `FactionReputation` | [optional] 
 **filterLeftSquareBracketBlueprintNameRightSquareBracket** | **String**| Filter by crafted item name from mission blueprint rewards. Example: `Arclight Pistol` | [optional] 
 **filterLeftSquareBracketLocationRightSquareBracket** | **String**| Filter by starmap location UUID. Example: `2bf56608-62ea-4d1a-9e9b-38377004dc1b` | [optional] 
 **filterLeftSquareBracketGroupedRightSquareBracket** | **bool**| Control mission variant grouping. Defaults to true (grouped) when no filters are active, false (ungrouped) when filters are active. Set explicitly to true to keep grouping with filters, or false to always ungroup. | [optional] 

### Return type

[**ListMissions200Response**](ListMissions200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

