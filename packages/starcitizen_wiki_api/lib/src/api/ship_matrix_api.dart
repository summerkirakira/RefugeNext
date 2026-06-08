//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_ship_matrix_vehicle200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_ship_matrix_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_ship_matrix_vehicles200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_ship_matrix_vehicles_deprecated200_response.dart';

class ShipMatrixApi {

  final Dio _dio;

  const ShipMatrixApi(this._dio);

  /// Ship Matrix Vehicle Detail
  /// Retrieve a Ship Matrix vehicle by slug. Use the \&quot;include\&quot; query parameter to load additional relationships: components, loaner, skus.
  ///
  /// Parameters:
  /// * [slug] 
  /// * [include] - Include additional relationships (components, loaner, skus)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetShipMatrixVehicle200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetShipMatrixVehicle200Response>> getShipMatrixVehicle({ 
    required String slug,
    String? include,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/shipmatrix/vehicles/{slug}'.replaceAll('{' r'slug' '}', slug.toString());
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

    GetShipMatrixVehicle200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetShipMatrixVehicle200Response, GetShipMatrixVehicle200Response>(rawData, 'GetShipMatrixVehicle200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetShipMatrixVehicle200Response>(
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

  /// Ship Matrix Vehicle Filters
  /// Return all available filter values for Ship Matrix vehicles. Supports cross-filtering: pass filter parameters to get filtered facet counts.
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListShipMatrixFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListShipMatrixFilters200Response>> listShipMatrixFilters({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/shipmatrix/vehicles/filters';
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

    ListShipMatrixFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListShipMatrixFilters200Response, ListShipMatrixFilters200Response>(rawData, 'ListShipMatrixFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListShipMatrixFilters200Response>(
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

  /// Ship Matrix Vehicles Overview
  /// Returns paginated Ship Matrix vehicles with optional filters. SKU variants and loaner vehicles are included by default.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values)
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values)
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Filter by vehicle type slug
  /// * [filterLeftSquareBracketFocusRightSquareBracket] - Filter by vehicle focus slug (comma-separated for multiple)
  /// * [filterLeftSquareBracketProductionStatusRightSquareBracket] - Filter by production status slug
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on vehicle name
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supported: id, chassis_id, name, msrp, updated_at, length, width, height, cargo_capacity, min_crew, max_crew, manufacturer, focus, type, size
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListShipMatrixVehicles200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListShipMatrixVehicles200Response>> listShipMatrixVehicles({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketSizeRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketFocusRightSquareBracket,
    String? filterLeftSquareBracketProductionStatusRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? sort,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/shipmatrix/vehicles';
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
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketFocusRightSquareBracket != null) r'filter[focus]': filterLeftSquareBracketFocusRightSquareBracket,
      if (filterLeftSquareBracketProductionStatusRightSquareBracket != null) r'filter[production_status]': filterLeftSquareBracketProductionStatusRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (sort != null) r'sort': sort,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListShipMatrixVehicles200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListShipMatrixVehicles200Response, ListShipMatrixVehicles200Response>(rawData, 'ListShipMatrixVehicles200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListShipMatrixVehicles200Response>(
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

  /// Ship Matrix Vehicle Search (Deprecated)
  /// Deprecated. Use GET /api/shipmatrix/vehicles?filter[name]&#x3D;{value} for name search. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [body] - Vehicle name to search for
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values)
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values)
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Filter by vehicle type slug
  /// * [filterLeftSquareBracketFocusRightSquareBracket] - Filter by vehicle focus slug (comma-separated for multiple)
  /// * [filterLeftSquareBracketProductionStatusRightSquareBracket] - Filter by production status slug
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SearchShipMatrixVehiclesDeprecated200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<SearchShipMatrixVehiclesDeprecated200Response>> searchShipMatrixVehiclesDeprecated({ 
    required Object body,
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketSizeRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketFocusRightSquareBracket,
    String? filterLeftSquareBracketProductionStatusRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/shipmatrix/vehicles/search';
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
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketFocusRightSquareBracket != null) r'filter[focus]': filterLeftSquareBracketFocusRightSquareBracket,
      if (filterLeftSquareBracketProductionStatusRightSquareBracket != null) r'filter[production_status]': filterLeftSquareBracketProductionStatusRightSquareBracket,
    };

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(body);

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

    SearchShipMatrixVehiclesDeprecated200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SearchShipMatrixVehiclesDeprecated200Response, SearchShipMatrixVehiclesDeprecated200Response>(rawData, 'SearchShipMatrixVehiclesDeprecated200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SearchShipMatrixVehiclesDeprecated200Response>(
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
