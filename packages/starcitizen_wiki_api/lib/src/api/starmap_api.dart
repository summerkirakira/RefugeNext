//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_celestial_object200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_location200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_starsystem200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_celestial_objects200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_location_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_location_positions200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_locations200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_starsystem_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_starsystems200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_celestial_objects_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_celestial_objects_deprecated_request.dart';
import 'package:starcitizen_wiki_api/src/model/search_starsystems_deprecated200_response.dart';

class StarmapApi {

  final Dio _dio;

  const StarmapApi(this._dio);

  /// Celestial Object Detail
  /// Retrieve a celestial object by code, optionally including relations.
  ///
  /// Parameters:
  /// * [code] 
  /// * [include] - Include additional relationships (affiliation, starsystem, jumppoints).
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetCelestialObject200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetCelestialObject200Response>> getCelestialObject({ 
    required String code,
    String? include,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/celestial-objects/{code}'.replaceAll('{' r'code' '}', code.toString());
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

    GetCelestialObject200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetCelestialObject200Response, GetCelestialObject200Response>(rawData, 'GetCelestialObject200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetCelestialObject200Response>(
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

  /// Game Starmap Location Detail
  /// Retrieve a versioned starmap location by slug or UUID. Results are scoped to the requested or default game version. Use the &#x60;include&#x60; parameter to load additional relations: &#x60;children&#x60; (child locations with amenities and tags), &#x60;resources&#x60; (harvestable resource placements with commodity data), &#x60;missions&#x60; (available missions with faction data).
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetLocation200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetLocation200Response>> getLocation({ 
    required String identifier,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/locations/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (include != null) r'include': include,
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

    GetLocation200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetLocation200Response, GetLocation200Response>(rawData, 'GetLocation200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetLocation200Response>(
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

  /// Starsystem Detail
  /// Retrieve a starsystem by code or identifier, with optional includes.
  ///
  /// Parameters:
  /// * [code] 
  /// * [include] - Include additional relationships (affiliation, celestialObjects, jumppoints).
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetStarsystem200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetStarsystem200Response>> getStarsystem({ 
    required String code,
    String? include,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/starsystems/{code}'.replaceAll('{' r'code' '}', code.toString());
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

    GetStarsystem200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetStarsystem200Response, GetStarsystem200Response>(rawData, 'GetStarsystem200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetStarsystem200Response>(
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

  /// Starmap Celestial Objects Overview
  /// Returns paginated celestial objects with optional relationships.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [filterLeftSquareBracketStarsystemRightSquareBracket] 
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on celestial object name
  /// * [filterLeftSquareBracketDesignationRightSquareBracket] 
  /// * [filterLeftSquareBracketTypeRightSquareBracket] 
  /// * [sort] 
  /// * [include] - Include additional relationships (affiliation, starsystem, jumppoints).
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListCelestialObjects200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListCelestialObjects200Response>> listCelestialObjects({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? filterLeftSquareBracketStarsystemRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketDesignationRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? sort,
    String? include,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/celestial-objects';
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
      if (filterLeftSquareBracketStarsystemRightSquareBracket != null) r'filter[starsystem]': filterLeftSquareBracketStarsystemRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketDesignationRightSquareBracket != null) r'filter[designation]': filterLeftSquareBracketDesignationRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (sort != null) r'sort': sort,
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

    ListCelestialObjects200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListCelestialObjects200Response, ListCelestialObjects200Response>(rawData, 'ListCelestialObjects200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListCelestialObjects200Response>(
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

  /// Game Starmap Location Filters
  /// Return all available filter facet values for versioned starmap locations. Applies any provided filter parameters to scope the facet counts. Returns facets for: type_name, type_classification, respawn_location_type, jurisdiction_name, affiliation_name, system, parent_name, amenity, and resource.
  ///
  /// Parameters:
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on location name.
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search locations by name.
  /// * [filterLeftSquareBracketTypeNameRightSquareBracket] - Exact match on location type name (see response for valid values).
  /// * [filterLeftSquareBracketTypeClassificationRightSquareBracket] - Location type classification from JSON data (see response for valid values).
  /// * [filterLeftSquareBracketRespawnLocationTypeRightSquareBracket] - Respawn location type classification (see response for valid values).
  /// * [filterLeftSquareBracketJurisdictionNameRightSquareBracket] - Governing jurisdiction name (see response for valid values).
  /// * [filterLeftSquareBracketAffiliationNameRightSquareBracket] - Faction or organization affiliation display name (see response for valid values).
  /// * [filterLeftSquareBracketIsScannableRightSquareBracket] - When true, only show scannable locations; when false, only show non-scannable.
  /// * [filterLeftSquareBracketBlockTravelRightSquareBracket] - When true, only show locations where travel is blocked; when false, only show locations where travel is allowed.
  /// * [filterLeftSquareBracketAmenityRightSquareBracket] - Filter by amenity name, display name, or UUID. Accepts comma-separated values (see response for valid values).
  /// * [filterLeftSquareBracketTagRightSquareBracket] - Filter by hierarchy entity tag name or UUID. Accepts comma-separated values.
  /// * [filterLeftSquareBracketParentNameRightSquareBracket] - Partial match on parent location name.
  /// * [filterLeftSquareBracketParentUuidRightSquareBracket] - Exact match on parent location UUID.
  /// * [filterLeftSquareBracketSystemRightSquareBracket] - Partial match on star system name (see response for valid values).
  /// * [filterLeftSquareBracketHasResourcesRightSquareBracket] - When true, only locations with harvestable resources; when false, only locations without.
  /// * [filterLeftSquareBracketResourceRightSquareBracket] - Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values).
  /// * [filterLeftSquareBracketHideMinorLocationsRightSquareBracket] - When true, exclude minor locations that are only shown when their parent is selected.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListLocationFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListLocationFilters200Response>> listLocationFilters({ 
    String? version,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    String? filterLeftSquareBracketTypeNameRightSquareBracket,
    String? filterLeftSquareBracketTypeClassificationRightSquareBracket,
    String? filterLeftSquareBracketRespawnLocationTypeRightSquareBracket,
    String? filterLeftSquareBracketJurisdictionNameRightSquareBracket,
    String? filterLeftSquareBracketAffiliationNameRightSquareBracket,
    bool? filterLeftSquareBracketIsScannableRightSquareBracket,
    bool? filterLeftSquareBracketBlockTravelRightSquareBracket,
    String? filterLeftSquareBracketAmenityRightSquareBracket,
    String? filterLeftSquareBracketTagRightSquareBracket,
    String? filterLeftSquareBracketParentNameRightSquareBracket,
    String? filterLeftSquareBracketParentUuidRightSquareBracket,
    String? filterLeftSquareBracketSystemRightSquareBracket,
    bool? filterLeftSquareBracketHasResourcesRightSquareBracket,
    String? filterLeftSquareBracketResourceRightSquareBracket,
    bool? filterLeftSquareBracketHideMinorLocationsRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/locations/filters';
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
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketTypeNameRightSquareBracket != null) r'filter[type_name]': filterLeftSquareBracketTypeNameRightSquareBracket,
      if (filterLeftSquareBracketTypeClassificationRightSquareBracket != null) r'filter[type_classification]': filterLeftSquareBracketTypeClassificationRightSquareBracket,
      if (filterLeftSquareBracketRespawnLocationTypeRightSquareBracket != null) r'filter[respawn_location_type]': filterLeftSquareBracketRespawnLocationTypeRightSquareBracket,
      if (filterLeftSquareBracketJurisdictionNameRightSquareBracket != null) r'filter[jurisdiction_name]': filterLeftSquareBracketJurisdictionNameRightSquareBracket,
      if (filterLeftSquareBracketAffiliationNameRightSquareBracket != null) r'filter[affiliation_name]': filterLeftSquareBracketAffiliationNameRightSquareBracket,
      if (filterLeftSquareBracketIsScannableRightSquareBracket != null) r'filter[is_scannable]': filterLeftSquareBracketIsScannableRightSquareBracket,
      if (filterLeftSquareBracketBlockTravelRightSquareBracket != null) r'filter[block_travel]': filterLeftSquareBracketBlockTravelRightSquareBracket,
      if (filterLeftSquareBracketAmenityRightSquareBracket != null) r'filter[amenity]': filterLeftSquareBracketAmenityRightSquareBracket,
      if (filterLeftSquareBracketTagRightSquareBracket != null) r'filter[tag]': filterLeftSquareBracketTagRightSquareBracket,
      if (filterLeftSquareBracketParentNameRightSquareBracket != null) r'filter[parent_name]': filterLeftSquareBracketParentNameRightSquareBracket,
      if (filterLeftSquareBracketParentUuidRightSquareBracket != null) r'filter[parent_uuid]': filterLeftSquareBracketParentUuidRightSquareBracket,
      if (filterLeftSquareBracketSystemRightSquareBracket != null) r'filter[system]': filterLeftSquareBracketSystemRightSquareBracket,
      if (filterLeftSquareBracketHasResourcesRightSquareBracket != null) r'filter[has_resources]': filterLeftSquareBracketHasResourcesRightSquareBracket,
      if (filterLeftSquareBracketResourceRightSquareBracket != null) r'filter[resource]': filterLeftSquareBracketResourceRightSquareBracket,
      if (filterLeftSquareBracketHideMinorLocationsRightSquareBracket != null) r'filter[hide_minor_locations]': filterLeftSquareBracketHideMinorLocationsRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListLocationFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListLocationFilters200Response, ListLocationFilters200Response>(rawData, 'ListLocationFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListLocationFilters200Response>(
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

  /// Starmap Entity Positions
  /// Starmap entity world positions.
  ///
  /// Parameters:
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Exact match on entity type (Planet, Moon, Star, Manmade, Asteroid, Anomaly, JumpPoint, etc.)
  /// * [filterLeftSquareBracketSystemRightSquareBracket] - Exact match on system name (stanton, pyro, nyx)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListLocationPositions200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListLocationPositions200Response>> listLocationPositions({ 
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketSystemRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/locations/positions';
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
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketSystemRightSquareBracket != null) r'filter[system]': filterLeftSquareBracketSystemRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListLocationPositions200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListLocationPositions200Response, ListLocationPositions200Response>(rawData, 'ListLocationPositions200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListLocationPositions200Response>(
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

  /// Game Starmap Locations Overview
  /// Returns paginated versioned starmap locations with optional filters. Results are scoped to the requested or default game version. Each location includes amenities, hierarchy entity tags, parent and star relations, child count, mission count, and resource availability.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supported: name, type_name, size, child_count.
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on location name.
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search locations by name.
  /// * [filterLeftSquareBracketTypeNameRightSquareBracket] - Exact match on location type name (see GET /api/locations/filters for valid values).
  /// * [filterLeftSquareBracketTypeClassificationRightSquareBracket] - Location type classification from JSON data (see GET /api/locations/filters for valid values).
  /// * [filterLeftSquareBracketRespawnLocationTypeRightSquareBracket] - Respawn location type classification (see GET /api/locations/filters for valid values).
  /// * [filterLeftSquareBracketJurisdictionNameRightSquareBracket] - Governing jurisdiction name (see GET /api/locations/filters for valid values).
  /// * [filterLeftSquareBracketAffiliationNameRightSquareBracket] - Faction or organization affiliation display name (see GET /api/locations/filters for valid values).
  /// * [filterLeftSquareBracketIsScannableRightSquareBracket] - When true, only show scannable locations; when false, only show non-scannable.
  /// * [filterLeftSquareBracketBlockTravelRightSquareBracket] - When true, only show locations where travel is blocked; when false, only show locations where travel is allowed.
  /// * [filterLeftSquareBracketAmenityRightSquareBracket] - Filter by amenity name, display name, or UUID. Accepts comma-separated values (see GET /api/locations/filters for valid values).
  /// * [filterLeftSquareBracketTagRightSquareBracket] - Filter by hierarchy entity tag name or UUID. Accepts comma-separated values.
  /// * [filterLeftSquareBracketParentNameRightSquareBracket] - Partial match on parent location name.
  /// * [filterLeftSquareBracketParentUuidRightSquareBracket] - Exact match on parent location UUID.
  /// * [filterLeftSquareBracketSystemRightSquareBracket] - Partial match on star system name (see GET /api/locations/filters for valid values).
  /// * [filterLeftSquareBracketHasResourcesRightSquareBracket] - When true, only locations with harvestable resources; when false, only locations without.
  /// * [filterLeftSquareBracketResourceRightSquareBracket] - Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values).
  /// * [filterLeftSquareBracketHideMinorLocationsRightSquareBracket] - When true, exclude minor locations that are only shown when their parent is selected.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListLocations200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListLocations200Response>> listLocations({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? version,
    String? sort,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    String? filterLeftSquareBracketTypeNameRightSquareBracket,
    String? filterLeftSquareBracketTypeClassificationRightSquareBracket,
    String? filterLeftSquareBracketRespawnLocationTypeRightSquareBracket,
    String? filterLeftSquareBracketJurisdictionNameRightSquareBracket,
    String? filterLeftSquareBracketAffiliationNameRightSquareBracket,
    bool? filterLeftSquareBracketIsScannableRightSquareBracket,
    bool? filterLeftSquareBracketBlockTravelRightSquareBracket,
    String? filterLeftSquareBracketAmenityRightSquareBracket,
    String? filterLeftSquareBracketTagRightSquareBracket,
    String? filterLeftSquareBracketParentNameRightSquareBracket,
    String? filterLeftSquareBracketParentUuidRightSquareBracket,
    String? filterLeftSquareBracketSystemRightSquareBracket,
    bool? filterLeftSquareBracketHasResourcesRightSquareBracket,
    String? filterLeftSquareBracketResourceRightSquareBracket,
    bool? filterLeftSquareBracketHideMinorLocationsRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/locations';
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
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketTypeNameRightSquareBracket != null) r'filter[type_name]': filterLeftSquareBracketTypeNameRightSquareBracket,
      if (filterLeftSquareBracketTypeClassificationRightSquareBracket != null) r'filter[type_classification]': filterLeftSquareBracketTypeClassificationRightSquareBracket,
      if (filterLeftSquareBracketRespawnLocationTypeRightSquareBracket != null) r'filter[respawn_location_type]': filterLeftSquareBracketRespawnLocationTypeRightSquareBracket,
      if (filterLeftSquareBracketJurisdictionNameRightSquareBracket != null) r'filter[jurisdiction_name]': filterLeftSquareBracketJurisdictionNameRightSquareBracket,
      if (filterLeftSquareBracketAffiliationNameRightSquareBracket != null) r'filter[affiliation_name]': filterLeftSquareBracketAffiliationNameRightSquareBracket,
      if (filterLeftSquareBracketIsScannableRightSquareBracket != null) r'filter[is_scannable]': filterLeftSquareBracketIsScannableRightSquareBracket,
      if (filterLeftSquareBracketBlockTravelRightSquareBracket != null) r'filter[block_travel]': filterLeftSquareBracketBlockTravelRightSquareBracket,
      if (filterLeftSquareBracketAmenityRightSquareBracket != null) r'filter[amenity]': filterLeftSquareBracketAmenityRightSquareBracket,
      if (filterLeftSquareBracketTagRightSquareBracket != null) r'filter[tag]': filterLeftSquareBracketTagRightSquareBracket,
      if (filterLeftSquareBracketParentNameRightSquareBracket != null) r'filter[parent_name]': filterLeftSquareBracketParentNameRightSquareBracket,
      if (filterLeftSquareBracketParentUuidRightSquareBracket != null) r'filter[parent_uuid]': filterLeftSquareBracketParentUuidRightSquareBracket,
      if (filterLeftSquareBracketSystemRightSquareBracket != null) r'filter[system]': filterLeftSquareBracketSystemRightSquareBracket,
      if (filterLeftSquareBracketHasResourcesRightSquareBracket != null) r'filter[has_resources]': filterLeftSquareBracketHasResourcesRightSquareBracket,
      if (filterLeftSquareBracketResourceRightSquareBracket != null) r'filter[resource]': filterLeftSquareBracketResourceRightSquareBracket,
      if (filterLeftSquareBracketHideMinorLocationsRightSquareBracket != null) r'filter[hide_minor_locations]': filterLeftSquareBracketHideMinorLocationsRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListLocations200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListLocations200Response, ListLocations200Response>(rawData, 'ListLocations200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListLocations200Response>(
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

  /// Starsystem Filters
  /// Return all available filter values for starsystems.
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListStarsystemFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListStarsystemFilters200Response>> listStarsystemFilters({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/starsystems/filters';
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

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListStarsystemFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListStarsystemFilters200Response, ListStarsystemFilters200Response>(rawData, 'ListStarsystemFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListStarsystemFilters200Response>(
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

  /// Starmap Starsystems Overview
  /// Returns paginated starsystems, optionally including related resources.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [filterLeftSquareBracketAffiliationRightSquareBracket] 
  /// * [filterLeftSquareBracketCodeRightSquareBracket] 
  /// * [filterLeftSquareBracketNameRightSquareBracket] 
  /// * [filterLeftSquareBracketStatusRightSquareBracket] 
  /// * [filterLeftSquareBracketTypeRightSquareBracket] 
  /// * [filterLeftSquareBracketSizeRightSquareBracket] 
  /// * [sort] 
  /// * [include] - Include additional relationships (affiliation, celestialObjects, jumppoints).
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListStarsystems200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListStarsystems200Response>> listStarsystems({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? filterLeftSquareBracketAffiliationRightSquareBracket,
    String? filterLeftSquareBracketCodeRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketStatusRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    num? filterLeftSquareBracketSizeRightSquareBracket,
    String? sort,
    String? include,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/starsystems';
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
      if (filterLeftSquareBracketAffiliationRightSquareBracket != null) r'filter[affiliation]': filterLeftSquareBracketAffiliationRightSquareBracket,
      if (filterLeftSquareBracketCodeRightSquareBracket != null) r'filter[code]': filterLeftSquareBracketCodeRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketStatusRightSquareBracket != null) r'filter[status]': filterLeftSquareBracketStatusRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (sort != null) r'sort': sort,
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

    ListStarsystems200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListStarsystems200Response, ListStarsystems200Response>(rawData, 'ListStarsystems200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListStarsystems200Response>(
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

  /// Celestial Object Search (Deprecated)
  /// Deprecated. Use GET /api/celestial-objects?filter[name]&#x3D;{value} for name search. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [searchCelestialObjectsDeprecatedRequest] - Partial celestial object code or name to search for
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SearchCelestialObjectsDeprecated200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<SearchCelestialObjectsDeprecated200Response>> searchCelestialObjectsDeprecated({ 
    required SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest,
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/celestial-objects/search';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (page != null) r'page': page,
      if (pageLeftSquareBracketNumberRightSquareBracket != null) r'page[number]': pageLeftSquareBracketNumberRightSquareBracket,
      if (pageLeftSquareBracketSizeRightSquareBracket != null) r'page[size]': pageLeftSquareBracketSizeRightSquareBracket,
    };

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(searchCelestialObjectsDeprecatedRequest);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    SearchCelestialObjectsDeprecated200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SearchCelestialObjectsDeprecated200Response, SearchCelestialObjectsDeprecated200Response>(rawData, 'SearchCelestialObjectsDeprecated200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SearchCelestialObjectsDeprecated200Response>(
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

  /// Starsystem Search (Deprecated)
  /// Deprecated. Use GET /api/starsystems?filter[name]&#x3D;{value} for name search. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [searchCelestialObjectsDeprecatedRequest] - Partial starsystem code or name to search for
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SearchStarsystemsDeprecated200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<SearchStarsystemsDeprecated200Response>> searchStarsystemsDeprecated({ 
    required SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest,
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/starsystems/search';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (page != null) r'page': page,
      if (pageLeftSquareBracketNumberRightSquareBracket != null) r'page[number]': pageLeftSquareBracketNumberRightSquareBracket,
      if (pageLeftSquareBracketSizeRightSquareBracket != null) r'page[size]': pageLeftSquareBracketSizeRightSquareBracket,
    };

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(searchCelestialObjectsDeprecatedRequest);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    SearchStarsystemsDeprecated200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SearchStarsystemsDeprecated200Response, SearchStarsystemsDeprecated200Response>(rawData, 'SearchStarsystemsDeprecated200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SearchStarsystemsDeprecated200Response>(
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
