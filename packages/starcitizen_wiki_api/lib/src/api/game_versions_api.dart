//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_default_game_version200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_version_changelog200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_game_versions200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_version_changelog_changes200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';

class GameVersionsApi {

  final Dio _dio;

  const GameVersionsApi(this._dio);

  /// Get Default Game Version
  /// Returns the current default game version. This is the version used by default in version-scoped API queries (see the version query parameter on other endpoints).
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetDefaultGameVersion200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetDefaultGameVersion200Response>> getDefaultGameVersion({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/game-versions/default';
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

    GetDefaultGameVersion200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetDefaultGameVersion200Response, GetDefaultGameVersion200Response>(rawData, 'GetDefaultGameVersion200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetDefaultGameVersion200Response>(
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

  /// Get Game Version
  /// Retrieve a specific game version by its code (case-insensitive). Game versions are used to scope version-aware data endpoints via the &#x60;version&#x60; query parameter.
  ///
  /// Parameters:
  /// * [identifier] - Game version code (case-insensitive).
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetDefaultGameVersion200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetDefaultGameVersion200Response>> getGameVersion({ 
    required String identifier,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/game-versions/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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

    GetDefaultGameVersion200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetDefaultGameVersion200Response, GetDefaultGameVersion200Response>(rawData, 'GetDefaultGameVersion200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetDefaultGameVersion200Response>(
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

  /// Get Version Changelog
  /// Returns the changelog summary between the specified version and its predecessor.
  ///
  /// Parameters:
  /// * [version] - Version code
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetVersionChangelog200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetVersionChangelog200Response>> getVersionChangelog({ 
    required String version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/game-versions/{version}/changelog'.replaceAll('{' r'version' '}', version.toString());
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

    GetVersionChangelog200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetVersionChangelog200Response, GetVersionChangelog200Response>(rawData, 'GetVersionChangelog200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetVersionChangelog200Response>(
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

  /// List Game Versions
  /// Returns paginated game versions sorted by release date (newest first by default). Useful for discovering available game versions for version-scoped API queries.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [filterLeftSquareBracketCodeRightSquareBracket] - Filter by exact version code. Example: `4.8.0-LIVE.11825000`
  /// * [filterLeftSquareBracketChannelRightSquareBracket] - Filter by release channel (live, ptu, eptu), lowercase. Example: `live`
  /// * [filterLeftSquareBracketIsDefaultRightSquareBracket] - Filter by default status. Example: `1`
  /// * [sort] - Sort by field. Prefix with - for descending. Supported: code, channel, released_at.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListGameVersions200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListGameVersions200Response>> listGameVersions({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? filterLeftSquareBracketCodeRightSquareBracket,
    String? filterLeftSquareBracketChannelRightSquareBracket,
    int? filterLeftSquareBracketIsDefaultRightSquareBracket,
    String? sort,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/game-versions';
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
      if (filterLeftSquareBracketCodeRightSquareBracket != null) r'filter[code]': filterLeftSquareBracketCodeRightSquareBracket,
      if (filterLeftSquareBracketChannelRightSquareBracket != null) r'filter[channel]': filterLeftSquareBracketChannelRightSquareBracket,
      if (filterLeftSquareBracketIsDefaultRightSquareBracket != null) r'filter[is_default]': filterLeftSquareBracketIsDefaultRightSquareBracket,
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

    ListGameVersions200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListGameVersions200Response, ListGameVersions200Response>(rawData, 'ListGameVersions200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListGameVersions200Response>(
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

  /// Get Version Changelog Changes
  /// Returns paginated diff entries for a version changelog. Filter by entity_type and change_type.
  ///
  /// Parameters:
  /// * [version] - Version code
  /// * [filterLeftSquareBracketEntityTypeRightSquareBracket] - Filter by entity type (item, vehicle)
  /// * [filterLeftSquareBracketChangeTypeRightSquareBracket] - Filter by change type (added, removed, modified)
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
  /// Returns a [Future] containing a [Response] with a [ListVersionChangelogChanges200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListVersionChangelogChanges200Response>> listVersionChangelogChanges({ 
    required String version,
    String? filterLeftSquareBracketEntityTypeRightSquareBracket,
    String? filterLeftSquareBracketChangeTypeRightSquareBracket,
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
    final _path = r'/api/game-versions/{version}/changelog/changes'.replaceAll('{' r'version' '}', version.toString());
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
      if (filterLeftSquareBracketEntityTypeRightSquareBracket != null) r'filter[entity_type]': filterLeftSquareBracketEntityTypeRightSquareBracket,
      if (filterLeftSquareBracketChangeTypeRightSquareBracket != null) r'filter[change_type]': filterLeftSquareBracketChangeTypeRightSquareBracket,
      if (page != null) r'page': page,
      if (pageLeftSquareBracketNumberRightSquareBracket != null) r'page[number]': pageLeftSquareBracketNumberRightSquareBracket,
      if (pageLeftSquareBracketSizeRightSquareBracket != null) r'page[size]': pageLeftSquareBracketSizeRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListVersionChangelogChanges200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListVersionChangelogChanges200Response, ListVersionChangelogChanges200Response>(rawData, 'ListVersionChangelogChanges200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListVersionChangelogChanges200Response>(
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
