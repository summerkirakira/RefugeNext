//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_commodity200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_commodities200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_commodity_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';

class CommoditiesApi {

  final Dio _dio;

  const CommoditiesApi(this._dio);

  /// Show Game Commodity
  /// Returns full details for a single game commodity including detailed location entries with starmap data, resource composition, areas, clustering data, and raw/refined version info. Results are scoped to the requested or default game version. Optionally include related blueprints and items.
  ///
  /// Parameters:
  /// * [commodity] 
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [include] - Comma-separated relationships to include. Available: blueprints (crafting blueprints that use this commodity), items (items that produce or require this commodity).
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetCommodity200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetCommodity200Response>> getCommodity({ 
    required String commodity,
    String? version,
    String? include,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/commodities/{commodity}'.replaceAll('{' r'commodity' '}', commodity.toString());
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
      if (include != null) r'include': include,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetCommodity200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetCommodity200Response, GetCommodity200Response>(rawData, 'GetCommodity200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetCommodity200Response>(
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

  /// List Game Commodities
  /// Returns paginated game commodities with location data and resource metadata, optionally filtered to only those consumed by blueprints. Results include refined version info and starmap location data scoped to the requested or default game version.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supported: key, name, rarity, density, instability, resistance, signature.
  /// * [filterLeftSquareBracketUsedRightSquareBracket] - When true, only commodities used by blueprint ingredients in the requested or default game version are returned. Example: `true`
  /// * [filterLeftSquareBracketSystemRightSquareBracket] - Star system where the commodity can be found (see GET /api/commodities/filters for valid values). Example: `Stanton System`
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Location type name (see GET /api/commodities/filters for valid values). Example: `Planet`
  /// * [filterLeftSquareBracketRarityRightSquareBracket] - Commodity tier/rarity level, lowercase (see GET /api/commodities/filters for valid values). Example: `epic`
  /// * [filterLeftSquareBracketKindRightSquareBracket] - Resource kind (see GET /api/commodities/filters for valid values). Example: `mineable`
  /// * [filterLeftSquareBracketGroupRightSquareBracket] - Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food`
  /// * [filterLeftSquareBracketRefinedVersionRightSquareBracket] - Refined version name (see GET /api/commodities/filters for valid values). Example: `Agricium`
  /// * [filterLeftSquareBracketLocationRightSquareBracket] - Partial match on starmap location name. Example: `ArcCorp`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search commodities by name or key. Example: `Agricium`
  /// * [filterLeftSquareBracketShipRightSquareBracket] - When true, only show commodities mineable by ships. Example: `true`
  /// * [filterLeftSquareBracketGroundVehicleRightSquareBracket] - When true, only show commodities mineable by ground vehicles. Example: `true`
  /// * [filterLeftSquareBracketFpsRightSquareBracket] - When true, only show commodities mineable on foot (FPS). Example: `true`
  /// * [filterLeftSquareBracketHarvestableRightSquareBracket] - When true, only show commodities collectible from harvestable or plant deposits. Example: `true`
  /// * [filterLeftSquareBracketSalvageRightSquareBracket] - When true, only show commodities obtainable through salvage. Example: `false`
  /// * [filterLeftSquareBracketMineableRightSquareBracket] - When true, only show mineable commodities; when false, only show non-mineable. Example: `true`
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListCommodities200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListCommodities200Response>> listCommodities({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? version,
    String? sort,
    bool? filterLeftSquareBracketUsedRightSquareBracket,
    String? filterLeftSquareBracketSystemRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketRarityRightSquareBracket,
    String? filterLeftSquareBracketKindRightSquareBracket,
    String? filterLeftSquareBracketGroupRightSquareBracket,
    String? filterLeftSquareBracketRefinedVersionRightSquareBracket,
    String? filterLeftSquareBracketLocationRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    bool? filterLeftSquareBracketShipRightSquareBracket,
    bool? filterLeftSquareBracketGroundVehicleRightSquareBracket,
    bool? filterLeftSquareBracketFpsRightSquareBracket,
    bool? filterLeftSquareBracketHarvestableRightSquareBracket,
    bool? filterLeftSquareBracketSalvageRightSquareBracket,
    bool? filterLeftSquareBracketMineableRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/commodities';
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
      if (filterLeftSquareBracketUsedRightSquareBracket != null) r'filter[used]': filterLeftSquareBracketUsedRightSquareBracket,
      if (filterLeftSquareBracketSystemRightSquareBracket != null) r'filter[system]': filterLeftSquareBracketSystemRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketRarityRightSquareBracket != null) r'filter[rarity]': filterLeftSquareBracketRarityRightSquareBracket,
      if (filterLeftSquareBracketKindRightSquareBracket != null) r'filter[kind]': filterLeftSquareBracketKindRightSquareBracket,
      if (filterLeftSquareBracketGroupRightSquareBracket != null) r'filter[group]': filterLeftSquareBracketGroupRightSquareBracket,
      if (filterLeftSquareBracketRefinedVersionRightSquareBracket != null) r'filter[refined_version]': filterLeftSquareBracketRefinedVersionRightSquareBracket,
      if (filterLeftSquareBracketLocationRightSquareBracket != null) r'filter[location]': filterLeftSquareBracketLocationRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketShipRightSquareBracket != null) r'filter[ship]': filterLeftSquareBracketShipRightSquareBracket,
      if (filterLeftSquareBracketGroundVehicleRightSquareBracket != null) r'filter[ground_vehicle]': filterLeftSquareBracketGroundVehicleRightSquareBracket,
      if (filterLeftSquareBracketFpsRightSquareBracket != null) r'filter[fps]': filterLeftSquareBracketFpsRightSquareBracket,
      if (filterLeftSquareBracketHarvestableRightSquareBracket != null) r'filter[harvestable]': filterLeftSquareBracketHarvestableRightSquareBracket,
      if (filterLeftSquareBracketSalvageRightSquareBracket != null) r'filter[salvage]': filterLeftSquareBracketSalvageRightSquareBracket,
      if (filterLeftSquareBracketMineableRightSquareBracket != null) r'filter[mineable]': filterLeftSquareBracketMineableRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListCommodities200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListCommodities200Response, ListCommodities200Response>(rawData, 'ListCommodities200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListCommodities200Response>(
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

  /// Game Commodity Filters
  /// Returns all available filter values for game commodities, scoped to the requested or default game version. Filter values can be combined; providing a system filter will narrow the location facet to that system only.
  ///
  /// Parameters:
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [filterLeftSquareBracketUsedRightSquareBracket] - When true, filter facets to only commodities used by blueprint ingredients. Example: `true`
  /// * [filterLeftSquareBracketSystemRightSquareBracket] - Star system where the commodity can be found. Example: `Stanton System`
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Location type name. Example: `Planet`
  /// * [filterLeftSquareBracketRarityRightSquareBracket] - Commodity tier/rarity level, lowercase. Example: `epic`
  /// * [filterLeftSquareBracketKindRightSquareBracket] - Resource kind. Example: `mineable`
  /// * [filterLeftSquareBracketGroupRightSquareBracket] - Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food`
  /// * [filterLeftSquareBracketRefinedVersionRightSquareBracket] - Refined version name. Example: `Agricium`
  /// * [filterLeftSquareBracketLocationRightSquareBracket] - Partial match on starmap location name. Example: `ArcCorp`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search commodities by name or key. Example: `Agricium`
  /// * [filterLeftSquareBracketShipRightSquareBracket] - When true, only show commodities mineable by ships. Example: `true`
  /// * [filterLeftSquareBracketGroundVehicleRightSquareBracket] - When true, only show commodities mineable by ground vehicles. Example: `true`
  /// * [filterLeftSquareBracketFpsRightSquareBracket] - When true, only show commodities mineable on foot (FPS). Example: `true`
  /// * [filterLeftSquareBracketHarvestableRightSquareBracket] - When true, only show commodities collectible from harvestable or plant deposits. Example: `true`
  /// * [filterLeftSquareBracketSalvageRightSquareBracket] - When true, only show commodities obtainable through salvage. Example: `false`
  /// * [filterLeftSquareBracketMineableRightSquareBracket] - When true, only show mineable commodities; when false, only show non-mineable. Example: `true`
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListCommodityFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListCommodityFilters200Response>> listCommodityFilters({ 
    String? version,
    bool? filterLeftSquareBracketUsedRightSquareBracket,
    String? filterLeftSquareBracketSystemRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketRarityRightSquareBracket,
    String? filterLeftSquareBracketKindRightSquareBracket,
    String? filterLeftSquareBracketGroupRightSquareBracket,
    String? filterLeftSquareBracketRefinedVersionRightSquareBracket,
    String? filterLeftSquareBracketLocationRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    bool? filterLeftSquareBracketShipRightSquareBracket,
    bool? filterLeftSquareBracketGroundVehicleRightSquareBracket,
    bool? filterLeftSquareBracketFpsRightSquareBracket,
    bool? filterLeftSquareBracketHarvestableRightSquareBracket,
    bool? filterLeftSquareBracketSalvageRightSquareBracket,
    bool? filterLeftSquareBracketMineableRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/commodities/filters';
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
      if (filterLeftSquareBracketUsedRightSquareBracket != null) r'filter[used]': filterLeftSquareBracketUsedRightSquareBracket,
      if (filterLeftSquareBracketSystemRightSquareBracket != null) r'filter[system]': filterLeftSquareBracketSystemRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketRarityRightSquareBracket != null) r'filter[rarity]': filterLeftSquareBracketRarityRightSquareBracket,
      if (filterLeftSquareBracketKindRightSquareBracket != null) r'filter[kind]': filterLeftSquareBracketKindRightSquareBracket,
      if (filterLeftSquareBracketGroupRightSquareBracket != null) r'filter[group]': filterLeftSquareBracketGroupRightSquareBracket,
      if (filterLeftSquareBracketRefinedVersionRightSquareBracket != null) r'filter[refined_version]': filterLeftSquareBracketRefinedVersionRightSquareBracket,
      if (filterLeftSquareBracketLocationRightSquareBracket != null) r'filter[location]': filterLeftSquareBracketLocationRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketShipRightSquareBracket != null) r'filter[ship]': filterLeftSquareBracketShipRightSquareBracket,
      if (filterLeftSquareBracketGroundVehicleRightSquareBracket != null) r'filter[ground_vehicle]': filterLeftSquareBracketGroundVehicleRightSquareBracket,
      if (filterLeftSquareBracketFpsRightSquareBracket != null) r'filter[fps]': filterLeftSquareBracketFpsRightSquareBracket,
      if (filterLeftSquareBracketHarvestableRightSquareBracket != null) r'filter[harvestable]': filterLeftSquareBracketHarvestableRightSquareBracket,
      if (filterLeftSquareBracketSalvageRightSquareBracket != null) r'filter[salvage]': filterLeftSquareBracketSalvageRightSquareBracket,
      if (filterLeftSquareBracketMineableRightSquareBracket != null) r'filter[mineable]': filterLeftSquareBracketMineableRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListCommodityFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListCommodityFilters200Response, ListCommodityFilters200Response>(rawData, 'ListCommodityFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListCommodityFilters200Response>(
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
