//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_mission200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_mission_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_missions200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';

class MissionsApi {

  final Dio _dio;

  const MissionsApi(this._dio);

  /// Get Mission Detail
  /// Returns full details for a single mission, including chain relationships and associated items. Results are scoped to the requested or default game version.
  ///
  /// Parameters:
  /// * [mission] 
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetMission200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetMission200Response>> getMission({ 
    required String mission,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/missions/{mission}'.replaceAll('{' r'mission' '}', mission.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (version != null) r'version': version,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetMission200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetMission200Response, GetMission200Response>(rawData, 'GetMission200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetMission200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get Mission Filter Options
  /// Returns available filter facets for missions, scoped to the requested or default game version.
  ///
  /// Parameters:
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [filterLeftSquareBracketIncludeUnreleasedRightSquareBracket] - Include unreleased and work-in-progress missions
  /// * [filterLeftSquareBracketMissionGiverRightSquareBracket] - Exact match on the mission giver NPC name. (see GET /api/missions/filters for valid values)
  /// * [filterLeftSquareBracketFactionRightSquareBracket] - Filter by faction name. Accepts comma-separated values. (see GET /api/missions/filters for valid values)
  /// * [filterLeftSquareBracketStarSystemRightSquareBracket] - Filter by star system name. (see GET /api/missions/filters for valid values)
  /// * [filterLeftSquareBracketIllegalRightSquareBracket] - Filter for missions marked as illegal
  /// * [filterLeftSquareBracketShareableRightSquareBracket] - Filter for shareable missions
  /// * [filterLeftSquareBracketOnceOnlyRightSquareBracket] - Filter for one-time-only missions
  /// * [filterLeftSquareBracketAvailableInPrisonRightSquareBracket] - Filter for missions available while in prison
  /// * [filterLeftSquareBracketHasCombatRightSquareBracket] - Filter for missions involving combat encounters
  /// * [filterLeftSquareBracketHasDefendObjectiveRightSquareBracket] - Filter for missions with a defend objective
  /// * [filterLeftSquareBracketRankIndexRightSquareBracket] - Filter by mission difficulty rank
  /// * [filterLeftSquareBracketHasPrerequisitesRightSquareBracket] - Filter for missions that have prerequisite requirements
  /// * [filterLeftSquareBracketMinEnemiesRightSquareBracket] - Minimum enemy count threshold
  /// * [filterLeftSquareBracketMaxEnemiesRightSquareBracket] - Maximum enemy count threshold
  /// * [filterLeftSquareBracketRewardMinRightSquareBracket] - Minimum reward in aUEC
  /// * [filterLeftSquareBracketRewardMaxRightSquareBracket] - Maximum reward in aUEC
  /// * [filterLeftSquareBracketTitleRightSquareBracket] - Partial match on mission title
  /// * [filterLeftSquareBracketDescriptionRightSquareBracket] - Partial match on mission description
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search across title, description, and debug name
  /// * [filterLeftSquareBracketRewardScopeRightSquareBracket] - Mission category scope. (see GET /api/missions/filters for valid values)
  /// * [filterLeftSquareBracketHasBlueprintsRightSquareBracket] - Filter for missions that reward blueprints
  /// * [filterLeftSquareBracketBlueprintNameRightSquareBracket] - Filter by crafted item name from mission blueprint rewards. (see GET /api/missions/filters for valid values)
  /// * [filterLeftSquareBracketReputationScopeRightSquareBracket] - Reputation reward scope from ReputationGained data. (see GET /api/missions/filters for valid values)
  /// * [filterLeftSquareBracketLocationRightSquareBracket] - Filter by starmap location UUID
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListMissionFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListMissionFilters200Response>> listMissionFilters({ 
    String? version,
    bool? filterLeftSquareBracketIncludeUnreleasedRightSquareBracket,
    String? filterLeftSquareBracketMissionGiverRightSquareBracket,
    String? filterLeftSquareBracketFactionRightSquareBracket,
    String? filterLeftSquareBracketStarSystemRightSquareBracket,
    bool? filterLeftSquareBracketIllegalRightSquareBracket,
    bool? filterLeftSquareBracketShareableRightSquareBracket,
    bool? filterLeftSquareBracketOnceOnlyRightSquareBracket,
    bool? filterLeftSquareBracketAvailableInPrisonRightSquareBracket,
    bool? filterLeftSquareBracketHasCombatRightSquareBracket,
    bool? filterLeftSquareBracketHasDefendObjectiveRightSquareBracket,
    int? filterLeftSquareBracketRankIndexRightSquareBracket,
    bool? filterLeftSquareBracketHasPrerequisitesRightSquareBracket,
    int? filterLeftSquareBracketMinEnemiesRightSquareBracket,
    int? filterLeftSquareBracketMaxEnemiesRightSquareBracket,
    int? filterLeftSquareBracketRewardMinRightSquareBracket,
    int? filterLeftSquareBracketRewardMaxRightSquareBracket,
    String? filterLeftSquareBracketTitleRightSquareBracket,
    String? filterLeftSquareBracketDescriptionRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    String? filterLeftSquareBracketRewardScopeRightSquareBracket,
    bool? filterLeftSquareBracketHasBlueprintsRightSquareBracket,
    String? filterLeftSquareBracketBlueprintNameRightSquareBracket,
    String? filterLeftSquareBracketReputationScopeRightSquareBracket,
    String? filterLeftSquareBracketLocationRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/missions/filters';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (version != null) r'version': version,
      if (filterLeftSquareBracketIncludeUnreleasedRightSquareBracket != null) r'filter[include_unreleased]': filterLeftSquareBracketIncludeUnreleasedRightSquareBracket,
      if (filterLeftSquareBracketMissionGiverRightSquareBracket != null) r'filter[mission_giver]': filterLeftSquareBracketMissionGiverRightSquareBracket,
      if (filterLeftSquareBracketFactionRightSquareBracket != null) r'filter[faction]': filterLeftSquareBracketFactionRightSquareBracket,
      if (filterLeftSquareBracketStarSystemRightSquareBracket != null) r'filter[star_system]': filterLeftSquareBracketStarSystemRightSquareBracket,
      if (filterLeftSquareBracketIllegalRightSquareBracket != null) r'filter[illegal]': filterLeftSquareBracketIllegalRightSquareBracket,
      if (filterLeftSquareBracketShareableRightSquareBracket != null) r'filter[shareable]': filterLeftSquareBracketShareableRightSquareBracket,
      if (filterLeftSquareBracketOnceOnlyRightSquareBracket != null) r'filter[once_only]': filterLeftSquareBracketOnceOnlyRightSquareBracket,
      if (filterLeftSquareBracketAvailableInPrisonRightSquareBracket != null) r'filter[available_in_prison]': filterLeftSquareBracketAvailableInPrisonRightSquareBracket,
      if (filterLeftSquareBracketHasCombatRightSquareBracket != null) r'filter[has_combat]': filterLeftSquareBracketHasCombatRightSquareBracket,
      if (filterLeftSquareBracketHasDefendObjectiveRightSquareBracket != null) r'filter[has_defend_objective]': filterLeftSquareBracketHasDefendObjectiveRightSquareBracket,
      if (filterLeftSquareBracketRankIndexRightSquareBracket != null) r'filter[rank_index]': filterLeftSquareBracketRankIndexRightSquareBracket,
      if (filterLeftSquareBracketHasPrerequisitesRightSquareBracket != null) r'filter[has_prerequisites]': filterLeftSquareBracketHasPrerequisitesRightSquareBracket,
      if (filterLeftSquareBracketMinEnemiesRightSquareBracket != null) r'filter[min_enemies]': filterLeftSquareBracketMinEnemiesRightSquareBracket,
      if (filterLeftSquareBracketMaxEnemiesRightSquareBracket != null) r'filter[max_enemies]': filterLeftSquareBracketMaxEnemiesRightSquareBracket,
      if (filterLeftSquareBracketRewardMinRightSquareBracket != null) r'filter[reward_min]': filterLeftSquareBracketRewardMinRightSquareBracket,
      if (filterLeftSquareBracketRewardMaxRightSquareBracket != null) r'filter[reward_max]': filterLeftSquareBracketRewardMaxRightSquareBracket,
      if (filterLeftSquareBracketTitleRightSquareBracket != null) r'filter[title]': filterLeftSquareBracketTitleRightSquareBracket,
      if (filterLeftSquareBracketDescriptionRightSquareBracket != null) r'filter[description]': filterLeftSquareBracketDescriptionRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketRewardScopeRightSquareBracket != null) r'filter[reward_scope]': filterLeftSquareBracketRewardScopeRightSquareBracket,
      if (filterLeftSquareBracketHasBlueprintsRightSquareBracket != null) r'filter[has_blueprints]': filterLeftSquareBracketHasBlueprintsRightSquareBracket,
      if (filterLeftSquareBracketBlueprintNameRightSquareBracket != null) r'filter[blueprint_name]': filterLeftSquareBracketBlueprintNameRightSquareBracket,
      if (filterLeftSquareBracketReputationScopeRightSquareBracket != null) r'filter[reputation_scope]': filterLeftSquareBracketReputationScopeRightSquareBracket,
      if (filterLeftSquareBracketLocationRightSquareBracket != null) r'filter[location]': filterLeftSquareBracketLocationRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListMissionFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListMissionFilters200Response, ListMissionFilters200Response>(rawData, 'ListMissionFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListMissionFilters200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// List Game Missions
  /// Returns paginated missions for the requested or default game version. Results are grouped by mission variant key by default. Grouping is automatically disabled when filters are active unless filter[grouped]&#x3D;true is set explicitly. Includes mission, game version, faction, and blueprint relationships.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supported: title, mission_giver, rank_index, reward_min, reward_max, time_to_complete_minutes, max_players_per_instance, reputation_amount.
  /// * [filterLeftSquareBracketMissionGiverRightSquareBracket] - Exact match on the mission giver NPC name. Example: `Citizens for Prosperity`
  /// * [filterLeftSquareBracketFactionRightSquareBracket] - Filter by faction name. Accepts comma-separated values. Example: `Headhunters`
  /// * [filterLeftSquareBracketStarSystemRightSquareBracket] - Filter by star system name. Example: `Stanton`
  /// * [filterLeftSquareBracketIllegalRightSquareBracket] - Filter for missions marked as illegal. Example: `true`
  /// * [filterLeftSquareBracketShareableRightSquareBracket] - Filter for shareable missions. Example: `true`
  /// * [filterLeftSquareBracketOnceOnlyRightSquareBracket] - Filter for one-time-only missions. Example: `true`
  /// * [filterLeftSquareBracketAvailableInPrisonRightSquareBracket] - Filter for missions available while in prison. Example: `true`
  /// * [filterLeftSquareBracketHasCombatRightSquareBracket] - Filter for missions involving combat encounters. Example: `true`
  /// * [filterLeftSquareBracketHasDefendObjectiveRightSquareBracket] - Filter for missions with a defend objective. Example: `true`
  /// * [filterLeftSquareBracketRankIndexRightSquareBracket] - Filter by mission difficulty rank. Example: `1`
  /// * [filterLeftSquareBracketHasPrerequisitesRightSquareBracket] - Filter for missions that have prerequisite requirements. Example: `true`
  /// * [filterLeftSquareBracketMinEnemiesRightSquareBracket] - Minimum enemy count threshold. Example: `3`
  /// * [filterLeftSquareBracketMaxEnemiesRightSquareBracket] - Maximum enemy count threshold. Example: `10`
  /// * [filterLeftSquareBracketRewardMinRightSquareBracket] - Minimum reward in aUEC. Example: `5000`
  /// * [filterLeftSquareBracketRewardMaxRightSquareBracket] - Maximum reward in aUEC. Example: `50000`
  /// * [filterLeftSquareBracketTitleRightSquareBracket] - Partial match on mission title. Example: `Delivery`
  /// * [filterLeftSquareBracketDescriptionRightSquareBracket] - Partial match on mission description. Example: `combat`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search across title, description, and debug name. Example: `delivery`
  /// * [filterLeftSquareBracketRewardScopeRightSquareBracket] - Mission category scope. Example: `Bounty Hunter`
  /// * [filterLeftSquareBracketHasBlueprintsRightSquareBracket] - Filter for missions that reward blueprints. Example: `true`
  /// * [filterLeftSquareBracketReputationScopeRightSquareBracket] - Reputation reward scope from ReputationGained data. Example: `FactionReputation`
  /// * [filterLeftSquareBracketBlueprintNameRightSquareBracket] - Filter by crafted item name from mission blueprint rewards. Example: `Arclight Pistol`
  /// * [filterLeftSquareBracketLocationRightSquareBracket] - Filter by starmap location UUID. Example: `2bf56608-62ea-4d1a-9e9b-38377004dc1b`
  /// * [filterLeftSquareBracketGroupedRightSquareBracket] - Control mission variant grouping. Defaults to true (grouped) when no filters are active, false (ungrouped) when filters are active. Set explicitly to true to keep grouping with filters, or false to always ungroup.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListMissions200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListMissions200Response>> listMissions({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? version,
    String? sort,
    String? filterLeftSquareBracketMissionGiverRightSquareBracket,
    String? filterLeftSquareBracketFactionRightSquareBracket,
    String? filterLeftSquareBracketStarSystemRightSquareBracket,
    bool? filterLeftSquareBracketIllegalRightSquareBracket,
    bool? filterLeftSquareBracketShareableRightSquareBracket,
    bool? filterLeftSquareBracketOnceOnlyRightSquareBracket,
    bool? filterLeftSquareBracketAvailableInPrisonRightSquareBracket,
    bool? filterLeftSquareBracketHasCombatRightSquareBracket,
    bool? filterLeftSquareBracketHasDefendObjectiveRightSquareBracket,
    int? filterLeftSquareBracketRankIndexRightSquareBracket,
    bool? filterLeftSquareBracketHasPrerequisitesRightSquareBracket,
    int? filterLeftSquareBracketMinEnemiesRightSquareBracket,
    int? filterLeftSquareBracketMaxEnemiesRightSquareBracket,
    int? filterLeftSquareBracketRewardMinRightSquareBracket,
    int? filterLeftSquareBracketRewardMaxRightSquareBracket,
    String? filterLeftSquareBracketTitleRightSquareBracket,
    String? filterLeftSquareBracketDescriptionRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    String? filterLeftSquareBracketRewardScopeRightSquareBracket,
    bool? filterLeftSquareBracketHasBlueprintsRightSquareBracket,
    String? filterLeftSquareBracketReputationScopeRightSquareBracket,
    String? filterLeftSquareBracketBlueprintNameRightSquareBracket,
    String? filterLeftSquareBracketLocationRightSquareBracket,
    bool? filterLeftSquareBracketGroupedRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/missions';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (page != null) r'page': page,
      if (pageLeftSquareBracketNumberRightSquareBracket != null) r'page[number]': pageLeftSquareBracketNumberRightSquareBracket,
      if (pageLeftSquareBracketSizeRightSquareBracket != null) r'page[size]': pageLeftSquareBracketSizeRightSquareBracket,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketMissionGiverRightSquareBracket != null) r'filter[mission_giver]': filterLeftSquareBracketMissionGiverRightSquareBracket,
      if (filterLeftSquareBracketFactionRightSquareBracket != null) r'filter[faction]': filterLeftSquareBracketFactionRightSquareBracket,
      if (filterLeftSquareBracketStarSystemRightSquareBracket != null) r'filter[star_system]': filterLeftSquareBracketStarSystemRightSquareBracket,
      if (filterLeftSquareBracketIllegalRightSquareBracket != null) r'filter[illegal]': filterLeftSquareBracketIllegalRightSquareBracket,
      if (filterLeftSquareBracketShareableRightSquareBracket != null) r'filter[shareable]': filterLeftSquareBracketShareableRightSquareBracket,
      if (filterLeftSquareBracketOnceOnlyRightSquareBracket != null) r'filter[once_only]': filterLeftSquareBracketOnceOnlyRightSquareBracket,
      if (filterLeftSquareBracketAvailableInPrisonRightSquareBracket != null) r'filter[available_in_prison]': filterLeftSquareBracketAvailableInPrisonRightSquareBracket,
      if (filterLeftSquareBracketHasCombatRightSquareBracket != null) r'filter[has_combat]': filterLeftSquareBracketHasCombatRightSquareBracket,
      if (filterLeftSquareBracketHasDefendObjectiveRightSquareBracket != null) r'filter[has_defend_objective]': filterLeftSquareBracketHasDefendObjectiveRightSquareBracket,
      if (filterLeftSquareBracketRankIndexRightSquareBracket != null) r'filter[rank_index]': filterLeftSquareBracketRankIndexRightSquareBracket,
      if (filterLeftSquareBracketHasPrerequisitesRightSquareBracket != null) r'filter[has_prerequisites]': filterLeftSquareBracketHasPrerequisitesRightSquareBracket,
      if (filterLeftSquareBracketMinEnemiesRightSquareBracket != null) r'filter[min_enemies]': filterLeftSquareBracketMinEnemiesRightSquareBracket,
      if (filterLeftSquareBracketMaxEnemiesRightSquareBracket != null) r'filter[max_enemies]': filterLeftSquareBracketMaxEnemiesRightSquareBracket,
      if (filterLeftSquareBracketRewardMinRightSquareBracket != null) r'filter[reward_min]': filterLeftSquareBracketRewardMinRightSquareBracket,
      if (filterLeftSquareBracketRewardMaxRightSquareBracket != null) r'filter[reward_max]': filterLeftSquareBracketRewardMaxRightSquareBracket,
      if (filterLeftSquareBracketTitleRightSquareBracket != null) r'filter[title]': filterLeftSquareBracketTitleRightSquareBracket,
      if (filterLeftSquareBracketDescriptionRightSquareBracket != null) r'filter[description]': filterLeftSquareBracketDescriptionRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketRewardScopeRightSquareBracket != null) r'filter[reward_scope]': filterLeftSquareBracketRewardScopeRightSquareBracket,
      if (filterLeftSquareBracketHasBlueprintsRightSquareBracket != null) r'filter[has_blueprints]': filterLeftSquareBracketHasBlueprintsRightSquareBracket,
      if (filterLeftSquareBracketReputationScopeRightSquareBracket != null) r'filter[reputation_scope]': filterLeftSquareBracketReputationScopeRightSquareBracket,
      if (filterLeftSquareBracketBlueprintNameRightSquareBracket != null) r'filter[blueprint_name]': filterLeftSquareBracketBlueprintNameRightSquareBracket,
      if (filterLeftSquareBracketLocationRightSquareBracket != null) r'filter[location]': filterLeftSquareBracketLocationRightSquareBracket,
      if (filterLeftSquareBracketGroupedRightSquareBracket != null) r'filter[grouped]': filterLeftSquareBracketGroupedRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListMissions200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListMissions200Response, ListMissions200Response>(rawData, 'ListMissions200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListMissions200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
