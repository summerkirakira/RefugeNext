//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/list_ground_vehicles200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_manufacturers200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_weapons200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/rate_limit_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_link_search200_response.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_link_search_request.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_search200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_celestial_objects_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_celestial_objects_deprecated_request.dart';
import 'package:starcitizen_wiki_api/src/model/search_comm_link_images_request.dart';
import 'package:starcitizen_wiki_api/src/model/search_galactapedia_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_game_data200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_ship_matrix_vehicles_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_starsystems_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/unauthenticated_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/validation_error_response.dart';

class SearchApi {

  final Dio _dio;

  const SearchApi(this._dio);

  /// Comm-Link Reverse Image Similar Search
  /// Find Comm-Link images similar to an existing RSI-hosted image.
  ///
  /// Parameters:
  /// * [image] - Internal database ID of the image
  /// * [similarity] - Similarity threshold percentage (1-100). Defaults to 50.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReverseImageSearch200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReverseImageSearch200Response>> findSimilarImages({ 
    required int image,
    int? similarity,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-link-images/{image}/similar'.replaceAll('{' r'image' '}', image.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'sanctum',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (similarity != null) r'similarity': similarity,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ReverseImageSearch200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReverseImageSearch200Response, ReverseImageSearch200Response>(rawData, 'ReverseImageSearch200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReverseImageSearch200Response>(
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

  /// Resolve Search Query
  /// Resolve a search query to the best-matching entity and redirect to its API URL, preserving query parameters such as locale, include, and version. Useful for quick lookups where you know the exact name.
  ///
  /// Parameters:
  /// * [query] - Entity name, class name, or UUID to resolve.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> resolveSearchQuery({ 
    required String query,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/search/{query}'.replaceAll('{' r'query' '}', query.toString());
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

    return _response;
  }

  /// Comm-Link Reverse Image Link Search
  /// Return comm-links that reference the same RSI-hosted image URL.
  ///
  /// Parameters:
  /// * [reverseImageLinkSearchRequest] - URL to an image hosted on (media.)robertsspaceindustries.com
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReverseImageLinkSearch200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReverseImageLinkSearch200Response>> reverseImageLinkSearch({ 
    required ReverseImageLinkSearchRequest reverseImageLinkSearchRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-links/reverse-image-link-search';
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(reverseImageLinkSearchRequest);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
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
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ReverseImageLinkSearch200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReverseImageLinkSearch200Response, ReverseImageLinkSearch200Response>(rawData, 'ReverseImageLinkSearch200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReverseImageLinkSearch200Response>(
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

  /// Comm-Link Reverse Image Search
  /// Search comm-links by uploading an image and specifying a similarity threshold. Requires the GD PHP extension.
  ///
  /// Parameters:
  /// * [image] - The image to reverse-search (max 5 MB)
  /// * [similarity] - Similarity threshold percentage (1-100). Defaults to 75.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReverseImageSearch200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReverseImageSearch200Response>> reverseImageSearch({ 
    required MultipartFile image,
    int? similarity,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-links/reverse-image-search';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'multipart/form-data',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = FormData.fromMap(<String, dynamic>{
        r'image': image,
        if (similarity != null) r'similarity': similarity,
      });

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
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
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ReverseImageSearch200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReverseImageSearch200Response, ReverseImageSearch200Response>(rawData, 'ReverseImageSearch200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReverseImageSearch200Response>(
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

  /// Comm-Link Image Search by filename
  /// Search comm-link images by filename with optional tag filtering. Only images without a base image and with non-zero file size are returned.
  ///
  /// Parameters:
  /// * [searchCommLinkImagesRequest] 
  /// * [filterLeftSquareBracketTagsRightSquareBracket] - Partial match on tag name
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReverseImageSearch200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReverseImageSearch200Response>> searchCommLinkImages({ 
    required SearchCommLinkImagesRequest searchCommLinkImagesRequest,
    String? filterLeftSquareBracketTagsRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-link-images/search';
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
      if (filterLeftSquareBracketTagsRightSquareBracket != null) r'filter[tags]': filterLeftSquareBracketTagsRightSquareBracket,
    };

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(searchCommLinkImagesRequest);

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

    ReverseImageSearch200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReverseImageSearch200Response, ReverseImageSearch200Response>(rawData, 'ReverseImageSearch200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReverseImageSearch200Response>(
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

  /// Galactapedia Article Search (Deprecated)
  /// Deprecated. Use GET /api/galactapedia?filter[title]&#x3D;{value} for title search. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [body] - Article (partial) title, template or slug
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SearchGalactapediaDeprecated200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<SearchGalactapediaDeprecated200Response>> searchGalactapediaDeprecated({ 
    required Object body,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/galactapedia/search';
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(body);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
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
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    SearchGalactapediaDeprecated200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SearchGalactapediaDeprecated200Response, SearchGalactapediaDeprecated200Response>(rawData, 'SearchGalactapediaDeprecated200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SearchGalactapediaDeprecated200Response>(
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

  /// Unified Search Across All Game Data
  /// Search across items, vehicles, starmap locations, commodities, blueprints, and missions simultaneously. Returns results grouped by type, limited to 5 results per group.
  ///
  /// Parameters:
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search query (minimum 2 characters). Searches names, class names, and other identifiers.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SearchGameData200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SearchGameData200Response>> searchGameData({ 
    required String filterLeftSquareBracketQueryRightSquareBracket,
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/search';
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
      r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
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

    SearchGameData200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SearchGameData200Response, SearchGameData200Response>(rawData, 'SearchGameData200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SearchGameData200Response>(
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

  /// In-Game Gravlev Vehicle Search (Deprecated)
  /// Deprecated. Use GET /api/gravlev-vehicles?filter[name]&#x3D;{value} for name search. Scoped to gravlev vehicles. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [body] - Vehicle name, class_name, or UUID
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
  /// Returns a [Future] containing a [Response] with a [ListGroundVehicles200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<ListGroundVehicles200Response>> searchGravlevVehiclesDeprecated({ 
    required Object body,
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
    final _path = r'/api/gravlev-vehicles/search';
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

    ListGroundVehicles200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListGroundVehicles200Response, ListGroundVehicles200Response>(rawData, 'ListGroundVehicles200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListGroundVehicles200Response>(
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

  /// In-Game Ground Vehicle Search (Deprecated)
  /// Deprecated. Use GET /api/ground-vehicles?filter[name]&#x3D;{value} for name search. Scoped to ground vehicles. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [body] - Vehicle name, class_name, or UUID
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
  /// Returns a [Future] containing a [Response] with a [ListGroundVehicles200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<ListGroundVehicles200Response>> searchGroundVehiclesDeprecated({ 
    required Object body,
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
    final _path = r'/api/ground-vehicles/search';
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

    ListGroundVehicles200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListGroundVehicles200Response, ListGroundVehicles200Response>(rawData, 'ListGroundVehicles200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListGroundVehicles200Response>(
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

  /// In-Game Manufacturer Search (Deprecated)
  /// Deprecated. Use GET /api/manufacturers?filter[name]&#x3D;{value} for name search. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [body] - Manufacturer name, uuid, or code
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
  /// Returns a [Future] containing a [Response] with a [ListManufacturers200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<ListManufacturers200Response>> searchManufacturersDeprecated({ 
    required Object body,
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
    final _path = r'/api/manufacturers/search';
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

    ListManufacturers200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListManufacturers200Response, ListManufacturers200Response>(rawData, 'ListManufacturers200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListManufacturers200Response>(
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

  /// In-Game Vehicle Search (Deprecated)
  /// Deprecated. Use GET /api/vehicles?filter[name]&#x3D;{value} for name search. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [body] - Vehicle name, class_name, career, or UUID
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [sort] - Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] 
  /// * [filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket] 
  /// * [filterLeftSquareBracketClassNameRightSquareBracket] 
  /// * [filterLeftSquareBracketNameRightSquareBracket] 
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search vehicles by name or class name.
  /// * [filterLeftSquareBracketSizeRightSquareBracket] 
  /// * [filterLeftSquareBracketSizeClassRightSquareBracket] 
  /// * [filterLeftSquareBracketCareerRightSquareBracket] 
  /// * [filterLeftSquareBracketRoleRightSquareBracket] 
  /// * [filterLeftSquareBracketIsVehicleRightSquareBracket] 
  /// * [filterLeftSquareBracketIsGravlevRightSquareBracket] 
  /// * [filterLeftSquareBracketIsSpaceshipRightSquareBracket] 
  /// * [filterLeftSquareBracketMassTotalRightSquareBracket] 
  /// * [filterLeftSquareBracketCargoCapacityRightSquareBracket] 
  /// * [filterLeftSquareBracketVehicleInventoryRightSquareBracket] 
  /// * [filterLeftSquareBracketCrewPeriodMinRightSquareBracket] 
  /// * [filterLeftSquareBracketHealthRightSquareBracket] 
  /// * [filterLeftSquareBracketShieldPeriodHpRightSquareBracket] 
  /// * [filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket] 
  /// * [filterLeftSquareBracketSpeedPeriodScmRightSquareBracket] 
  /// * [filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket] 
  /// * [filterLeftSquareBracketArmorPeriodHealthRightSquareBracket] 
  /// * [filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket] 
  /// * [filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket] 
  /// * [filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket] 
  /// * [filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket] 
  /// * [filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket] 
  /// * [filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket] 
  /// * [filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListGroundVehicles200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<ListGroundVehicles200Response>> searchVehiclesDeprecated({ 
    required Object body,
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? sort,
    String? filterLeftSquareBracketManufacturerRightSquareBracket,
    String? filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket,
    String? filterLeftSquareBracketClassNameRightSquareBracket,
    String? filterLeftSquareBracketNameRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    int? filterLeftSquareBracketSizeRightSquareBracket,
    int? filterLeftSquareBracketSizeClassRightSquareBracket,
    String? filterLeftSquareBracketCareerRightSquareBracket,
    String? filterLeftSquareBracketRoleRightSquareBracket,
    bool? filterLeftSquareBracketIsVehicleRightSquareBracket,
    bool? filterLeftSquareBracketIsGravlevRightSquareBracket,
    bool? filterLeftSquareBracketIsSpaceshipRightSquareBracket,
    num? filterLeftSquareBracketMassTotalRightSquareBracket,
    num? filterLeftSquareBracketCargoCapacityRightSquareBracket,
    num? filterLeftSquareBracketVehicleInventoryRightSquareBracket,
    int? filterLeftSquareBracketCrewPeriodMinRightSquareBracket,
    num? filterLeftSquareBracketHealthRightSquareBracket,
    num? filterLeftSquareBracketShieldPeriodHpRightSquareBracket,
    String? filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket,
    num? filterLeftSquareBracketSpeedPeriodScmRightSquareBracket,
    num? filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket,
    num? filterLeftSquareBracketArmorPeriodHealthRightSquareBracket,
    num? filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket,
    num? filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket,
    num? filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket,
    num? filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket,
    num? filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket,
    num? filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket,
    num? filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/vehicles/search';
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
      if (sort != null) r'sort': sort,
      if (filterLeftSquareBracketManufacturerRightSquareBracket != null) r'filter[manufacturer]': filterLeftSquareBracketManufacturerRightSquareBracket,
      if (filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket != null) r'filter[manufacturer.name]': filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket,
      if (filterLeftSquareBracketClassNameRightSquareBracket != null) r'filter[class_name]': filterLeftSquareBracketClassNameRightSquareBracket,
      if (filterLeftSquareBracketNameRightSquareBracket != null) r'filter[name]': filterLeftSquareBracketNameRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
      if (filterLeftSquareBracketSizeRightSquareBracket != null) r'filter[size]': filterLeftSquareBracketSizeRightSquareBracket,
      if (filterLeftSquareBracketSizeClassRightSquareBracket != null) r'filter[size_class]': filterLeftSquareBracketSizeClassRightSquareBracket,
      if (filterLeftSquareBracketCareerRightSquareBracket != null) r'filter[career]': filterLeftSquareBracketCareerRightSquareBracket,
      if (filterLeftSquareBracketRoleRightSquareBracket != null) r'filter[role]': filterLeftSquareBracketRoleRightSquareBracket,
      if (filterLeftSquareBracketIsVehicleRightSquareBracket != null) r'filter[is_vehicle]': filterLeftSquareBracketIsVehicleRightSquareBracket,
      if (filterLeftSquareBracketIsGravlevRightSquareBracket != null) r'filter[is_gravlev]': filterLeftSquareBracketIsGravlevRightSquareBracket,
      if (filterLeftSquareBracketIsSpaceshipRightSquareBracket != null) r'filter[is_spaceship]': filterLeftSquareBracketIsSpaceshipRightSquareBracket,
      if (filterLeftSquareBracketMassTotalRightSquareBracket != null) r'filter[mass_total]': filterLeftSquareBracketMassTotalRightSquareBracket,
      if (filterLeftSquareBracketCargoCapacityRightSquareBracket != null) r'filter[cargo_capacity]': filterLeftSquareBracketCargoCapacityRightSquareBracket,
      if (filterLeftSquareBracketVehicleInventoryRightSquareBracket != null) r'filter[vehicle_inventory]': filterLeftSquareBracketVehicleInventoryRightSquareBracket,
      if (filterLeftSquareBracketCrewPeriodMinRightSquareBracket != null) r'filter[crew.min]': filterLeftSquareBracketCrewPeriodMinRightSquareBracket,
      if (filterLeftSquareBracketHealthRightSquareBracket != null) r'filter[health]': filterLeftSquareBracketHealthRightSquareBracket,
      if (filterLeftSquareBracketShieldPeriodHpRightSquareBracket != null) r'filter[shield.hp]': filterLeftSquareBracketShieldPeriodHpRightSquareBracket,
      if (filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket != null) r'filter[shield.face_type]': filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket,
      if (filterLeftSquareBracketSpeedPeriodScmRightSquareBracket != null) r'filter[speed.scm]': filterLeftSquareBracketSpeedPeriodScmRightSquareBracket,
      if (filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket != null) r'filter[speed.max]': filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket,
      if (filterLeftSquareBracketArmorPeriodHealthRightSquareBracket != null) r'filter[armor.health]': filterLeftSquareBracketArmorPeriodHealthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket != null) r'filter[cross_section.length]': filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket != null) r'filter[cross_section.width]': filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket != null) r'filter[cross_section.height]': filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket != null) r'filter[signature.ir_quantum]': filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket != null) r'filter[signature.ir_shields]': filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket != null) r'filter[signature.em_quantum]': filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket != null) r'filter[signature.em_shields]': filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket,
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

    ListGroundVehicles200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListGroundVehicles200Response, ListGroundVehicles200Response>(rawData, 'ListGroundVehicles200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListGroundVehicles200Response>(
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
