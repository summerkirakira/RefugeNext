//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_blueprint200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_blueprint_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_blueprints200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';

class BlueprintsApi {

  final Dio _dio;

  const BlueprintsApi(this._dio);

  /// Get Game Blueprint Detail
  /// Returns full detail for a single crafting blueprint, including ingredients, crafted item, dismantle returns, and associated missions. Scoped to the requested or default game version.
  ///
  /// Parameters:
  /// * [blueprint] 
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetBlueprint200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetBlueprint200Response>> getBlueprint({ 
    required String blueprint,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/blueprints/{blueprint}'.replaceAll('{' r'blueprint' '}', blueprint.toString());
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

    GetBlueprint200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetBlueprint200Response, GetBlueprint200Response>(rawData, 'GetBlueprint200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetBlueprint200Response>(
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

  /// Get Blueprint Filter Options
  /// Returns available filter facets for blueprints (crafted item types, ingredient and resource UUIDs), optionally scoped to the requested or default game version.
  ///
  /// Parameters:
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListBlueprintFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListBlueprintFilters200Response>> listBlueprintFilters({ 
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/blueprints/filters';
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

    ListBlueprintFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListBlueprintFilters200Response, ListBlueprintFilters200Response>(rawData, 'ListBlueprintFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListBlueprintFilters200Response>(
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

  /// List Game Blueprints
  /// Returns paginated crafting blueprints, including ingredients, crafted items, and dismantle returns. Results are scoped to the requested or default game version.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supported: craft_time_seconds, ingredient_count, unlocking_missions_count.
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search blueprints by crafted item name. Example: `Shotgun`
  /// * [filterLeftSquareBracketOutputPeriodUuidRightSquareBracket] - Filter by crafted item UUID (see GET /api/items). Example: `02d4cd2e-fa98-4086-aee1-6b2dfce8ea27`
  /// * [filterLeftSquareBracketOutputPeriodNameRightSquareBracket] - Filter by crafted item name. Example: `P4-AR Magazine (40 cap)`
  /// * [filterLeftSquareBracketOutputPeriodClassRightSquareBracket] - Filter by crafted item class. Example: `ksar_smg_energy_01_gold01`
  /// * [filterLeftSquareBracketOutputPeriodTypeRightSquareBracket] - Filter by crafted item type (see GET /api/blueprints/filters for valid values). Example: `WeaponPersonal`
  /// * [filterLeftSquareBracketDefaultRightSquareBracket] - Filter by default availability (true/false). Example: `true`
  /// * [filterLeftSquareBracketIngredientRightSquareBracket] - Matches ingredient resource type by name, key, or UUID before filtering blueprints. Example: `Aluminum`
  /// * [filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket] - Filter by ingredient commodity UUID. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac`
  /// * [filterLeftSquareBracketResourcePeriodUuidRightSquareBracket] - Filter by resource commodity UUID, matching ingredients and dismantle returns. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac`
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListBlueprints200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListBlueprints200Response>> listBlueprints({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? version,
    String? sort,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    String? filterLeftSquareBracketOutputPeriodUuidRightSquareBracket,
    String? filterLeftSquareBracketOutputPeriodNameRightSquareBracket,
    String? filterLeftSquareBracketOutputPeriodClassRightSquareBracket,
    String? filterLeftSquareBracketOutputPeriodTypeRightSquareBracket,
    bool? filterLeftSquareBracketDefaultRightSquareBracket,
    String? filterLeftSquareBracketIngredientRightSquareBracket,
    String? filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket,
    String? filterLeftSquareBracketResourcePeriodUuidRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/blueprints';
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
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketOutputPeriodUuidRightSquareBracket != null) r'filter[output.uuid]': filterLeftSquareBracketOutputPeriodUuidRightSquareBracket,
      if (filterLeftSquareBracketOutputPeriodNameRightSquareBracket != null) r'filter[output.name]': filterLeftSquareBracketOutputPeriodNameRightSquareBracket,
      if (filterLeftSquareBracketOutputPeriodClassRightSquareBracket != null) r'filter[output.class]': filterLeftSquareBracketOutputPeriodClassRightSquareBracket,
      if (filterLeftSquareBracketOutputPeriodTypeRightSquareBracket != null) r'filter[output.type]': filterLeftSquareBracketOutputPeriodTypeRightSquareBracket,
      if (filterLeftSquareBracketDefaultRightSquareBracket != null) r'filter[default]': filterLeftSquareBracketDefaultRightSquareBracket,
      if (filterLeftSquareBracketIngredientRightSquareBracket != null) r'filter[ingredient]': filterLeftSquareBracketIngredientRightSquareBracket,
      if (filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket != null) r'filter[ingredient.uuid]': filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket,
      if (filterLeftSquareBracketResourcePeriodUuidRightSquareBracket != null) r'filter[resource.uuid]': filterLeftSquareBracketResourcePeriodUuidRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListBlueprints200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListBlueprints200Response, ListBlueprints200Response>(rawData, 'ListBlueprints200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListBlueprints200Response>(
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
