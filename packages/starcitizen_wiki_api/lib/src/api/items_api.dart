//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_weapon200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_item_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_weapons200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';

class ItemsApi {

  final Dio _dio;

  const ItemsApi(this._dio);

  /// In-Game Armor Detail
  /// Retrieve a specific armor item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to armor. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetWeapon200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetWeapon200Response>> getArmor({ 
    required String identifier,
    String? locale,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/armor/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (locale != null) r'locale': locale,
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

    GetWeapon200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetWeapon200Response, GetWeapon200Response>(rawData, 'GetWeapon200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetWeapon200Response>(
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

  /// In-Game Clothing Detail
  /// Retrieve a specific clothing item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to clothing. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetWeapon200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetWeapon200Response>> getClothingItem({ 
    required String identifier,
    String? locale,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/clothes/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (locale != null) r'locale': locale,
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

    GetWeapon200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetWeapon200Response, GetWeapon200Response>(rawData, 'GetWeapon200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetWeapon200Response>(
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

  /// In-Game Food Detail
  /// Retrieve a specific food or drink item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to food. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetWeapon200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetWeapon200Response>> getFood({ 
    required String identifier,
    String? locale,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/food/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (locale != null) r'locale': locale,
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

    GetWeapon200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetWeapon200Response, GetWeapon200Response>(rawData, 'GetWeapon200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetWeapon200Response>(
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

  /// In-Game Item Detail
  /// Retrieve a specific item by UUID, slug, name, or class name (case-insensitive). Results are scoped to the requested or default game version. Always includes manufacturer, game version, description data, entity tags, commodities, and variant group data. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items. Items with a matching vehicle record automatically redirect to GET /api/vehicles/{uuid}.
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated relationships to include. Available: blueprints (full crafting blueprint data including ingredients, missions, tiers), variants (item variants), related_items (related items from variant groups and sets), vehicles (vehicles this item is installed on), shops (shop availability data), shops.items (shop items).
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetWeapon200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetWeapon200Response>> getItem({ 
    required String identifier,
    String? locale,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/items/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (locale != null) r'locale': locale,
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

    GetWeapon200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetWeapon200Response, GetWeapon200Response>(rawData, 'GetWeapon200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetWeapon200Response>(
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

  /// In-Game Vehicle Item Detail
  /// Retrieve a specific vehicle component by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle items. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetWeapon200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetWeapon200Response>> getVehicleItem({ 
    required String identifier,
    String? locale,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/vehicle-items/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (locale != null) r'locale': locale,
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

    GetWeapon200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetWeapon200Response, GetWeapon200Response>(rawData, 'GetWeapon200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetWeapon200Response>(
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

  /// In-Game Vehicle Weapon Detail
  /// Retrieve a specific vehicle weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetWeapon200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetWeapon200Response>> getVehicleWeapon({ 
    required String identifier,
    String? locale,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/vehicle-weapons/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (locale != null) r'locale': locale,
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

    GetWeapon200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetWeapon200Response, GetWeapon200Response>(rawData, 'GetWeapon200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetWeapon200Response>(
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

  /// In-Game Weapon Detail
  /// Retrieve a specific FPS weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetWeapon200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetWeapon200Response>> getWeapon({ 
    required String identifier,
    String? locale,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/weapons/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (locale != null) r'locale': locale,
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

    GetWeapon200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetWeapon200Response, GetWeapon200Response>(rawData, 'GetWeapon200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetWeapon200Response>(
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

  /// In-Game Weapon Attachment Detail
  /// Retrieve a specific weapon attachment by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapon attachments. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.
  ///
  /// Parameters:
  /// * [identifier] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetWeapon200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetWeapon200Response>> getWeaponAttachment({ 
    required String identifier,
    String? locale,
    String? include,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/weapon-attachments/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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
      if (locale != null) r'locale': locale,
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

    GetWeapon200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetWeapon200Response, GetWeapon200Response>(rawData, 'GetWeapon200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetWeapon200Response>(
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

  /// In-Game Armor Overview
  /// Alias for /api/items scoped to armor (FPS.Armor.* classification). Results are scoped to the requested or default game version. Returns armor items with manufacturer, game version, and description data.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Clark Defense Systems`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Core`
  /// * [filterLeftSquareBracketClassificationRightSquareBracket] - Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search items by name or class name. Example: `Core`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListWeapons200Response>> listArmor({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
    String? sort,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketClassificationRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/armor';
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
      if (include != null) r'include': include,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketClassificationRightSquareBracket != null) r'filter[classification]': filterLeftSquareBracketClassificationRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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

  /// In-Game Clothes Overview
  /// Alias for /api/items scoped to clothing (FPS.Clothing.* classification). Results are scoped to the requested or default game version. Returns clothing items with manufacturer, game version, and description data.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Fiore`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Jacket`
  /// * [filterLeftSquareBracketClassificationRightSquareBracket] - Partial match on item classification (dot-notation, e.g. FPS.Clothing). (see GET /api/items/filters for valid values). Example: `FPS.Clothing.Torso`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search items by name or class name. Example: `Jacket`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListWeapons200Response>> listClothes({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
    String? sort,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketClassificationRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/clothes';
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
      if (include != null) r'include': include,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketClassificationRightSquareBracket != null) r'filter[classification]': filterLeftSquareBracketClassificationRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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

  /// In-Game Food Overview
  /// Alias for /api/items scoped to food and drink (Food, Bottle, Drink types). Results are scoped to the requested or default game version. Returns consumable items with manufacturer, game version, and description data.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Consumable`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Burger`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search items by name or class name. Example: `Burger`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListWeapons200Response>> listFood({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
    String? sort,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/food';
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
      if (include != null) r'include': include,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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

  /// In-Game Item Filters
  /// Returns available filter facet values for in-game items, grouped by field with occurrence counts. Applying other filters narrows the facet results. Use these values as filter[*] parameters on GET /api/items. Scoped to the default item category unless filter[category] is specified.
  ///
  /// Parameters:
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [filterLeftSquareBracketVariantsRightSquareBracket] - When false, facets are computed excluding variant items. When true or omitted, all items are included.
  /// * [filterLeftSquareBracketCategoryRightSquareBracket] - Item category to scope facets. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Narrow facets to items matching this type. Example: `WeaponPersonal`
  /// * [filterLeftSquareBracketSubTypeRightSquareBracket] - Narrow facets to items matching this sub-type. Example: `Barrel`
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Narrow facets to items from this manufacturer. Example: `KnightBridge Arms`
  /// * [filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket] - Same as filter[manufacturer]. Example: `Anvil Aerospace`
  /// * [filterLeftSquareBracketClassNameRightSquareBracket] - Narrow facets to items with matching class name. Example: `MGA_Assault`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Narrow facets to items with matching name. Example: `Arrow`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Narrow facets to items matching name or class name. Example: `Arrow`
  /// * [filterLeftSquareBracketClassificationRightSquareBracket] - Narrow facets to items with matching classification. Example: `FPS.Armor.Torso`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Narrow facets to items with this size. Example: `3`
  /// * [filterLeftSquareBracketGradeRightSquareBracket] - Narrow facets to items with this grade. Example: `3`
  /// * [filterLeftSquareBracketClassRightSquareBracket] - Narrow facets to items with this class. Example: `Military`
  /// * [filterLeftSquareBracketRarityRightSquareBracket] - Narrow facets to items with this rarity. Example: `Rare`
  /// * [filterLeftSquareBracketEventSourceRightSquareBracket] - Narrow facets to items with this event or reward source. Example: `IAE`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListItemFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListItemFilters200Response>> listItemFilters({ 
    String? version,
    bool? filterLeftSquareBracketVariantsRightSquareBracket,
    String? filterLeftSquareBracketCategoryRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketSubTypeRightSquareBracket,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket,
    String? filterLeftSquareBracketClassNameRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    String? filterLeftSquareBracketClassificationRightSquareBracket,
    num? filterLeftSquareBracketSizeRightSquareBracket,
    num? filterLeftSquareBracketGradeRightSquareBracket,
    String? filterLeftSquareBracketClassRightSquareBracket,
    String? filterLeftSquareBracketRarityRightSquareBracket,
    String? filterLeftSquareBracketEventSourceRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/items/filters';
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
      if (filterLeftSquareBracketVariantsRightSquareBracket != null) r'filter[variants]': filterLeftSquareBracketVariantsRightSquareBracket,
      if (filterLeftSquareBracketCategoryRightSquareBracket != null) r'filter[category]': filterLeftSquareBracketCategoryRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketSubTypeRightSquareBracket != null) r'filter[sub_type]': filterLeftSquareBracketSubTypeRightSquareBracket,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket != null) r'filter[manufacturer.name]': filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket,
      if (filterLeftSquareBracketClassNameRightSquareBracket != null) r'filter[class_name]': filterLeftSquareBracketClassNameRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketClassificationRightSquareBracket != null) r'filter[classification]': filterLeftSquareBracketClassificationRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketGradeRightSquareBracket != null) r'filter[grade]': filterLeftSquareBracketGradeRightSquareBracket,
      if (filterLeftSquareBracketClassRightSquareBracket != null) r'filter[class]': filterLeftSquareBracketClassRightSquareBracket,
      if (filterLeftSquareBracketRarityRightSquareBracket != null) r'filter[rarity]': filterLeftSquareBracketRarityRightSquareBracket,
      if (filterLeftSquareBracketEventSourceRightSquareBracket != null) r'filter[event_source]': filterLeftSquareBracketEventSourceRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListItemFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListItemFilters200Response, ListItemFilters200Response>(rawData, 'ListItemFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListItemFilters200Response>(
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

  /// In-Game Item Overview
  /// Returns paginated in-game items for the requested category and game version. Always includes manufacturer, game version, and description data. Crafting blueprints are loaded automatically. Supports filtering by type, classification, manufacturer, size, grade, and more. Available includes: shops, variants, related_items, blueprints, vehicles, shops.items. Supports 150+ JSON field sorts. (see GET /api/items/filters for valid filter values)
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supports 250+ JSON fields. Examples: name, -grade, weapon.damage.alpha_total, -shield_controller.face_type. Use comma for multiple: grade,-name
  /// * [filterLeftSquareBracketVariantsRightSquareBracket] - When false, excludes variant items (base_id IS NOT NULL) and returns only base items. When true or omitted, returns all items including variants.
  /// * [filterLeftSquareBracketCategoryRightSquareBracket] - Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
  /// * [filterLeftSquareBracketSubTypeRightSquareBracket] - Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  /// * [filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket] - Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
  /// * [filterLeftSquareBracketClassNameRightSquareBracket] - Partial match on item class name. Example: `Controller_Comms`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Arrow`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search items by name or class name. Example: `helmet`
  /// * [filterLeftSquareBracketClassificationRightSquareBracket] - Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact item size (0-12). Example: `3`
  /// * [filterLeftSquareBracketGradeRightSquareBracket] - Exact item grade (1-7, mapped to A-G). Example: `3`
  /// * [filterLeftSquareBracketClassRightSquareBracket] - Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
  /// * [filterLeftSquareBracketRarityRightSquareBracket] - Item rarity. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Rare`
  /// * [filterLeftSquareBracketEventSourceRightSquareBracket] - Event or reward source label. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `IAE`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [filterLeftSquareBracketTagsRightSquareBracket] - Filter by stdItem.RequiredTags array values. Use when a port has required_tags - matches items whose RequiredTags contain ALL specified values. Accepts comma-separated tags for AND matching. Example: `MISC_Fury_Miru`
  /// * [filterLeftSquareBracketPortTagsRightSquareBracket] - Filter items by RequiredTags compatibility with a port's tags. Accepts comma-separated port tag values. Returns items where any of their RequiredTags appear in the provided tags, OR items with no RequiredTags but whose Tags overlap with the provided tags (e.g. older paint system). Items with no RequiredTags and no overlapping Tags are excluded. Pass the port_tags value from a vehicle hardpoint port. Example: `flight_ready,Ship_Dock_Refuel`
  /// * [filterLeftSquareBracketVehicleRightSquareBracket] - Scope items to a specific vehicle. Accepts one or more vehicle identity tags (from the vehicle's port_tags field). Returns: (1) universal items with no RequiredTags and not bespoke, (2) bespoke items whose RequiredTags match any provided tag, (3) bespoke items whose bespoke_vehicle_tags match any provided tag. Use on vehicle pages to show only items equippable on that vehicle. Example: `AEGS_Avenger_Base`
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListWeapons200Response>> listItems({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
    String? sort,
    bool? filterLeftSquareBracketVariantsRightSquareBracket,
    String? filterLeftSquareBracketCategoryRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketSubTypeRightSquareBracket,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket,
    String? filterLeftSquareBracketClassNameRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    String? filterLeftSquareBracketClassificationRightSquareBracket,
    num? filterLeftSquareBracketSizeRightSquareBracket,
    num? filterLeftSquareBracketGradeRightSquareBracket,
    String? filterLeftSquareBracketClassRightSquareBracket,
    String? filterLeftSquareBracketRarityRightSquareBracket,
    String? filterLeftSquareBracketEventSourceRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    String? filterLeftSquareBracketTagsRightSquareBracket,
    String? filterLeftSquareBracketPortTagsRightSquareBracket,
    String? filterLeftSquareBracketVehicleRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/items';
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
      if (include != null) r'include': include,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketVariantsRightSquareBracket != null) r'filter[variants]': filterLeftSquareBracketVariantsRightSquareBracket,
      if (filterLeftSquareBracketCategoryRightSquareBracket != null) r'filter[category]': filterLeftSquareBracketCategoryRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketSubTypeRightSquareBracket != null) r'filter[sub_type]': filterLeftSquareBracketSubTypeRightSquareBracket,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket != null) r'filter[manufacturer.name]': filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket,
      if (filterLeftSquareBracketClassNameRightSquareBracket != null) r'filter[class_name]': filterLeftSquareBracketClassNameRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketClassificationRightSquareBracket != null) r'filter[classification]': filterLeftSquareBracketClassificationRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketGradeRightSquareBracket != null) r'filter[grade]': filterLeftSquareBracketGradeRightSquareBracket,
      if (filterLeftSquareBracketClassRightSquareBracket != null) r'filter[class]': filterLeftSquareBracketClassRightSquareBracket,
      if (filterLeftSquareBracketRarityRightSquareBracket != null) r'filter[rarity]': filterLeftSquareBracketRarityRightSquareBracket,
      if (filterLeftSquareBracketEventSourceRightSquareBracket != null) r'filter[event_source]': filterLeftSquareBracketEventSourceRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
      if (filterLeftSquareBracketTagsRightSquareBracket != null) r'filter[tags]': filterLeftSquareBracketTagsRightSquareBracket,
      if (filterLeftSquareBracketPortTagsRightSquareBracket != null) r'filter[port_tags]': filterLeftSquareBracketPortTagsRightSquareBracket,
      if (filterLeftSquareBracketVehicleRightSquareBracket != null) r'filter[vehicle]': filterLeftSquareBracketVehicleRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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

  /// In-Game Vehicle Items Overview
  /// Alias for /api/items scoped to vehicle components (coolers, shields, power plants, quantum drives, thrusters, etc.). Results are scoped to the requested or default game version. Returns component items with manufacturer, game version, and description data.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Aegis Dynamics`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Shield`
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Cooler`
  /// * [filterLeftSquareBracketSubTypeRightSquareBracket] - Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Default`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search items by name or class name. Example: `Shield`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListWeapons200Response>> listVehicleItems({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
    String? sort,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketSubTypeRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/vehicle-items';
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
      if (include != null) r'include': include,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketSubTypeRightSquareBracket != null) r'filter[sub_type]': filterLeftSquareBracketSubTypeRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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

  /// In-Game Vehicle Weapons Overview
  /// Alias for /api/items scoped to vehicle weapons (WeaponGun type). Results are scoped to the requested or default game version. Returns ship weapon items with manufacturer, game version, and description data.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Cannon`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search items by name or class name. Example: `Cannon`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact item size (0-12). Example: `3`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListWeapons200Response>> listVehicleWeapons({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
    String? sort,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    num? filterLeftSquareBracketSizeRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/vehicle-weapons';
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
      if (include != null) r'include': include,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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

  /// In-Game Weapon Attachments Overview
  /// Alias for /api/items scoped to weapon attachments (WeaponAttachment type, excluding magazines and missiles). Results are scoped to the requested or default game version. Returns attachment items with manufacturer, game version, and description data.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `ArmaMod`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Quell Suppressor2`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search items by name or class name. Example: `Quell Suppressor2`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact item size (0-12). Example: `1`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListWeapons200Response>> listWeaponAttachments({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
    String? sort,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    num? filterLeftSquareBracketSizeRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/weapon-attachments';
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
      if (include != null) r'include': include,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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

  /// In-Game Weapons Overview
  /// Alias for /api/items scoped to FPS weapons (WeaponPersonal type). Results are scoped to the requested or default game version. Returns weapon items with manufacturer, game version, and description data.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Klaus & Werner`
  /// * [filterLeftSquareBracketClassNameRightSquareBracket] - Partial match on item class name. Example: `behr_sniper_ballistic_01`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Arrow`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search items by name or class name. Example: `Arrow`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact item size (0-12). Example: `3`
  /// * [filterLeftSquareBracketGradeRightSquareBracket] - Exact item grade (1-7, mapped to A-G). Example: `1`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListWeapons200Response>> listWeapons({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
    String? sort,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketClassNameRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    num? filterLeftSquareBracketSizeRightSquareBracket,
    num? filterLeftSquareBracketGradeRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/weapons';
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
      if (include != null) r'include': include,
      if (version != null) r'version': version,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketClassNameRightSquareBracket != null) r'filter[class_name]': filterLeftSquareBracketClassNameRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketGradeRightSquareBracket != null) r'filter[grade]': filterLeftSquareBracketGradeRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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

  /// In-Game Item Search (Deprecated)
  /// Deprecated. Use GET /api/items?filter[name]&#x3D;{value} for name search. Note: OR search across name/uuid/type is no longer supported. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [body] - Item Name or (sub)type
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketVariantsRightSquareBracket] - When false, excludes variant items and returns only base items. When true or omitted, returns all items.
  /// * [filterLeftSquareBracketCategoryRightSquareBracket] - Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  /// * [filterLeftSquareBracketTypeRightSquareBracket] - Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
  /// * [filterLeftSquareBracketSubTypeRightSquareBracket] - Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  /// * [filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket] - Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
  /// * [filterLeftSquareBracketClassNameRightSquareBracket] - Partial match on item class name. Example: `MGA_Assault`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on item display name. Example: `Arrow`
  /// * [filterLeftSquareBracketClassificationRightSquareBracket] - Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact item size (0-12). Example: `3`
  /// * [filterLeftSquareBracketGradeRightSquareBracket] - Exact item grade (1-7, mapped to A-G). Example: `3`
  /// * [filterLeftSquareBracketClassRightSquareBracket] - Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
  /// * [filterLeftSquareBracketIncludeIrrelevantRightSquareBracket] - When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListWeapons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<ListWeapons200Response>> searchItemsDeprecated({ 
    required Object body,
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? locale,
    String? include,
    String? sort,
    bool? filterLeftSquareBracketVariantsRightSquareBracket,
    String? filterLeftSquareBracketCategoryRightSquareBracket,
    String? filterLeftSquareBracketTypeRightSquareBracket,
    String? filterLeftSquareBracketSubTypeRightSquareBracket,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket,
    String? filterLeftSquareBracketClassNameRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketClassificationRightSquareBracket,
    num? filterLeftSquareBracketSizeRightSquareBracket,
    num? filterLeftSquareBracketGradeRightSquareBracket,
    String? filterLeftSquareBracketClassRightSquareBracket,
    bool? filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/items/search';
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
      if (locale != null) r'locale': locale,
      if (include != null) r'include': include,
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketVariantsRightSquareBracket != null) r'filter[variants]': filterLeftSquareBracketVariantsRightSquareBracket,
      if (filterLeftSquareBracketCategoryRightSquareBracket != null) r'filter[category]': filterLeftSquareBracketCategoryRightSquareBracket,
      if (filterLeftSquareBracketTypeRightSquareBracket != null) r'filter[type]': filterLeftSquareBracketTypeRightSquareBracket,
      if (filterLeftSquareBracketSubTypeRightSquareBracket != null) r'filter[sub_type]': filterLeftSquareBracketSubTypeRightSquareBracket,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket != null) r'filter[manufacturer.name]': filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket,
      if (filterLeftSquareBracketClassNameRightSquareBracket != null) r'filter[class_name]': filterLeftSquareBracketClassNameRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketClassificationRightSquareBracket != null) r'filter[classification]': filterLeftSquareBracketClassificationRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketGradeRightSquareBracket != null) r'filter[grade]': filterLeftSquareBracketGradeRightSquareBracket,
      if (filterLeftSquareBracketClassRightSquareBracket != null) r'filter[class]': filterLeftSquareBracketClassRightSquareBracket,
      if (filterLeftSquareBracketIncludeIrrelevantRightSquareBracket != null) r'filter[include_irrelevant]': filterLeftSquareBracketIncludeIrrelevantRightSquareBracket,
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

    ListWeapons200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListWeapons200Response, ListWeapons200Response>(rawData, 'ListWeapons200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListWeapons200Response>(
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
