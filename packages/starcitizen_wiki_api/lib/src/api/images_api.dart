//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_comm_link_image200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_comm_link_images200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_search200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_comm_link_images_request.dart';
import 'package:starcitizen_wiki_api/src/model/validation_error_response.dart';

class ImagesApi {

  final Dio _dio;

  const ImagesApi(this._dio);

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

}
