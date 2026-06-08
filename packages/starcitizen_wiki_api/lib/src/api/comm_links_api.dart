//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_comm_link200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_comm_link_image200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_comm_link_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_comm_link_images200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_comm_links200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/rate_limit_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_link_search200_response.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_link_search_request.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_search200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_comm_link_images_request.dart';
import 'package:starcitizen_wiki_api/src/model/search_comm_links_deprecated_request.dart';
import 'package:starcitizen_wiki_api/src/model/unauthenticated_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/validation_error_response.dart';

class CommLinksApi {

  final Dio _dio;

  const CommLinksApi(this._dio);

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

  /// Comm-Link Detail
  /// Retrieve a single Comm-Link by its CIG ID. Images with hash and metadata are always included. The response contains prev_id and next_id metadata for sequential navigation between Comm-Links.
  ///
  /// Parameters:
  /// * [id] 
  /// * [include] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetCommLink200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetCommLink200Response>> getCommLink({ 
    required int id,
    List<String>? include,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-links/{id}'.replaceAll('{' r'id' '}', id.toString());
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

    GetCommLink200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetCommLink200Response, GetCommLink200Response>(rawData, 'GetCommLink200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetCommLink200Response>(
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

  /// Comm-Link Image Detail
  /// Retrieve a single comm-link image with its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.
  ///
  /// Parameters:
  /// * [image] - Internal database ID of the image
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetCommLinkImage200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetCommLinkImage200Response>> getCommLinkImage({ 
    required int image,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-link-images/{image}'.replaceAll('{' r'image' '}', image.toString());
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

    GetCommLinkImage200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetCommLinkImage200Response, GetCommLinkImage200Response>(rawData, 'GetCommLinkImage200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetCommLinkImage200Response>(
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

  /// Comm-Link Images Random
  /// Retrieve random comm-link images (minimum 250 KB), optionally filtered by tag name. Only images without a base image are included.
  ///
  /// Parameters:
  /// * [limit] - Number of random images to return
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
  Future<Response<ReverseImageSearch200Response>> getRandomCommLinkImage({ 
    int? limit,
    String? filterLeftSquareBracketTagsRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-link-images/random';
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
      if (limit != null) r'limit': limit,
      if (filterLeftSquareBracketTagsRightSquareBracket != null) r'filter[tags]': filterLeftSquareBracketTagsRightSquareBracket,
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

  /// Comm-Link Filters
  /// Returns available category, channel, and series filter values for Comm-Links, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.
  ///
  /// Parameters:
  /// * [filterLeftSquareBracketIdRightSquareBracket] - Exact match on the Comm-Link CIG ID
  /// * [filterLeftSquareBracketTitleRightSquareBracket] - Partial match on the Comm-Link title
  /// * [filterLeftSquareBracketContentRightSquareBracket] - Full-text search within English Comm-Link translations
  /// * [filterLeftSquareBracketChannelRightSquareBracket] - Exact match on channel name
  /// * [filterLeftSquareBracketSeriesRightSquareBracket] - Exact match on series name
  /// * [filterLeftSquareBracketCategoryRightSquareBracket] - Exact match on category name
  /// * [filterLeftSquareBracketCreatedAtRightSquareBracket] - Filter by publication year (YYYY) or exact date (YYYY-MM-DD)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListCommLinkFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListCommLinkFilters200Response>> listCommLinkFilters({ 
    int? filterLeftSquareBracketIdRightSquareBracket,
    String? filterLeftSquareBracketTitleRightSquareBracket,
    String? filterLeftSquareBracketContentRightSquareBracket,
    String? filterLeftSquareBracketChannelRightSquareBracket,
    String? filterLeftSquareBracketSeriesRightSquareBracket,
    String? filterLeftSquareBracketCategoryRightSquareBracket,
    String? filterLeftSquareBracketCreatedAtRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-links/filters';
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
      if (filterLeftSquareBracketIdRightSquareBracket != null) r'filter[id]': filterLeftSquareBracketIdRightSquareBracket,
      if (filterLeftSquareBracketTitleRightSquareBracket != null) r'filter[title]': filterLeftSquareBracketTitleRightSquareBracket,
      if (filterLeftSquareBracketContentRightSquareBracket != null) r'filter[content]': filterLeftSquareBracketContentRightSquareBracket,
      if (filterLeftSquareBracketChannelRightSquareBracket != null) r'filter[channel]': filterLeftSquareBracketChannelRightSquareBracket,
      if (filterLeftSquareBracketSeriesRightSquareBracket != null) r'filter[series]': filterLeftSquareBracketSeriesRightSquareBracket,
      if (filterLeftSquareBracketCategoryRightSquareBracket != null) r'filter[category]': filterLeftSquareBracketCategoryRightSquareBracket,
      if (filterLeftSquareBracketCreatedAtRightSquareBracket != null) r'filter[created_at]': filterLeftSquareBracketCreatedAtRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListCommLinkFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListCommLinkFilters200Response, ListCommLinkFilters200Response>(rawData, 'ListCommLinkFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListCommLinkFilters200Response>(
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

  /// Comm-Link Images
  /// List available comm-link images with pagination. Each image includes its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [filterLeftSquareBracketTagsRightSquareBracket] - Partial match on tag name. WARNING: Images have no tags currently.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListCommLinkImages200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListCommLinkImages200Response>> listCommLinkImages({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? filterLeftSquareBracketTagsRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-link-images';
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
      if (filterLeftSquareBracketTagsRightSquareBracket != null) r'filter[tags]': filterLeftSquareBracketTagsRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListCommLinkImages200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListCommLinkImages200Response, ListCommLinkImages200Response>(rawData, 'ListCommLinkImages200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListCommLinkImages200Response>(
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

  /// Comm-Links Overview
  /// Returns paginated comm-links ordered by descending ID by default. Supports filtering by channel, category, series, title, content, and publication date. Results can be sorted by id, title, images_count, links_count, channel, category, series, and created_at. Use the include parameter to embed images or links.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] 
  /// * [filterLeftSquareBracketIdRightSquareBracket] - Exact match on the Comm-Link CIG ID
  /// * [filterLeftSquareBracketTitleRightSquareBracket] - Partial match on the Comm-Link title
  /// * [filterLeftSquareBracketContentRightSquareBracket] - Full-text search within English Comm-Link translations
  /// * [filterLeftSquareBracketChannelRightSquareBracket] - Exact match on channel name (see GET /api/comm-links/filters for valid values)
  /// * [filterLeftSquareBracketSeriesRightSquareBracket] - Exact match on series name (see GET /api/comm-links/filters for valid values)
  /// * [filterLeftSquareBracketCategoryRightSquareBracket] - Exact match on category name (see GET /api/comm-links/filters for valid values)
  /// * [filterLeftSquareBracketCreatedAtRightSquareBracket] - Filter by publication year (YYYY) or exact date (YYYY-MM-DD)
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supported: id, title, images_count, links_count, channel, category, series, created_at.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListCommLinks200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListCommLinks200Response>> listCommLinks({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    List<String>? include,
    int? filterLeftSquareBracketIdRightSquareBracket,
    String? filterLeftSquareBracketTitleRightSquareBracket,
    String? filterLeftSquareBracketContentRightSquareBracket,
    String? filterLeftSquareBracketChannelRightSquareBracket,
    String? filterLeftSquareBracketSeriesRightSquareBracket,
    String? filterLeftSquareBracketCategoryRightSquareBracket,
    String? filterLeftSquareBracketCreatedAtRightSquareBracket,
    String? sort,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-links';
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
      if (filterLeftSquareBracketIdRightSquareBracket != null) r'filter[id]': filterLeftSquareBracketIdRightSquareBracket,
      if (filterLeftSquareBracketTitleRightSquareBracket != null) r'filter[title]': filterLeftSquareBracketTitleRightSquareBracket,
      if (filterLeftSquareBracketContentRightSquareBracket != null) r'filter[content]': filterLeftSquareBracketContentRightSquareBracket,
      if (filterLeftSquareBracketChannelRightSquareBracket != null) r'filter[channel]': filterLeftSquareBracketChannelRightSquareBracket,
      if (filterLeftSquareBracketSeriesRightSquareBracket != null) r'filter[series]': filterLeftSquareBracketSeriesRightSquareBracket,
      if (filterLeftSquareBracketCategoryRightSquareBracket != null) r'filter[category]': filterLeftSquareBracketCategoryRightSquareBracket,
      if (filterLeftSquareBracketCreatedAtRightSquareBracket != null) r'filter[created_at]': filterLeftSquareBracketCreatedAtRightSquareBracket,
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

    ListCommLinks200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListCommLinks200Response, ListCommLinks200Response>(rawData, 'ListCommLinks200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListCommLinks200Response>(
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

  /// Comm-Link Search (Deprecated)
  /// Deprecated. Use GET /api/comm-links?filter[title]&#x3D;{value} for title search. This endpoint will be removed in a future version.
  ///
  /// Parameters:
  /// * [searchCommLinksDeprecatedRequest] - At least one of keyword or query is required.
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] 
  /// * [filterLeftSquareBracketChannelRightSquareBracket] - Exact match on channel name (see GET /api/comm-links/filters for valid values)
  /// * [filterLeftSquareBracketSeriesRightSquareBracket] - Exact match on series name (see GET /api/comm-links/filters for valid values)
  /// * [filterLeftSquareBracketCategoryRightSquareBracket] - Exact match on category name (see GET /api/comm-links/filters for valid values)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListCommLinks200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<ListCommLinks200Response>> searchCommLinksDeprecated({ 
    required SearchCommLinksDeprecatedRequest searchCommLinksDeprecatedRequest,
    String? locale,
    List<String>? include,
    String? filterLeftSquareBracketChannelRightSquareBracket,
    String? filterLeftSquareBracketSeriesRightSquareBracket,
    String? filterLeftSquareBracketCategoryRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/comm-links/search';
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
      if (locale != null) r'locale': locale,
      if (include != null) r'include': include,
      if (filterLeftSquareBracketChannelRightSquareBracket != null) r'filter[channel]': filterLeftSquareBracketChannelRightSquareBracket,
      if (filterLeftSquareBracketSeriesRightSquareBracket != null) r'filter[series]': filterLeftSquareBracketSeriesRightSquareBracket,
      if (filterLeftSquareBracketCategoryRightSquareBracket != null) r'filter[category]': filterLeftSquareBracketCategoryRightSquareBracket,
    };

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(searchCommLinksDeprecatedRequest);

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

    ListCommLinks200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListCommLinks200Response, ListCommLinks200Response>(rawData, 'ListCommLinks200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListCommLinks200Response>(
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
