//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_galactapedia_article200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_galactapedia_articles200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_galactapedia_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_galactapedia_deprecated200_response.dart';

class GalactapediaApi {

  final Dio _dio;

  const GalactapediaApi(this._dio);

  /// Galactapedia Article
  /// Retrieve a Galactapedia article by ID with available includes and translations.
  ///
  /// Parameters:
  /// * [id] 
  /// * [locale] - Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  /// * [include] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetGalactapediaArticle200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetGalactapediaArticle200Response>> getGalactapediaArticle({ 
    required String id,
    String? locale,
    List<String>? include,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/galactapedia/{id}'.replaceAll('{' r'id' '}', id.toString());
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
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetGalactapediaArticle200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetGalactapediaArticle200Response, GetGalactapediaArticle200Response>(rawData, 'GetGalactapediaArticle200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetGalactapediaArticle200Response>(
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

  /// Galactapedia Overview
  /// Returns paginated Galactapedia articles ordered by descending ID by default. Each article includes its templates, categories, and tags. Supports filtering by category, tag, template, title, and creation date. Results can be sorted by title, categories_count, tags_count, and related_articles_count.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [filterLeftSquareBracketCategoryRightSquareBracket] - Exact match on category name (see GET /api/galactapedia/filters for valid values)
  /// * [filterLeftSquareBracketTagRightSquareBracket] - Exact match on tag name (see GET /api/galactapedia/filters for valid values)
  /// * [filterLeftSquareBracketTemplateRightSquareBracket] - Exact match on template name (see GET /api/galactapedia/filters for valid values)
  /// * [filterLeftSquareBracketTitleRightSquareBracket] - Partial match on the article title
  /// * [filterLeftSquareBracketCreatedAtRightSquareBracket] - Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD)
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supported: title, categories_count, tags_count, related_articles_count.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListGalactapediaArticles200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListGalactapediaArticles200Response>> listGalactapediaArticles({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? filterLeftSquareBracketCategoryRightSquareBracket,
    String? filterLeftSquareBracketTagRightSquareBracket,
    String? filterLeftSquareBracketTemplateRightSquareBracket,
    String? filterLeftSquareBracketTitleRightSquareBracket,
    String? filterLeftSquareBracketCreatedAtRightSquareBracket,
    String? sort,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/galactapedia';
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
      if (filterLeftSquareBracketCategoryRightSquareBracket != null) r'filter[category]': filterLeftSquareBracketCategoryRightSquareBracket,
      if (filterLeftSquareBracketTagRightSquareBracket != null) r'filter[tag]': filterLeftSquareBracketTagRightSquareBracket,
      if (filterLeftSquareBracketTemplateRightSquareBracket != null) r'filter[template]': filterLeftSquareBracketTemplateRightSquareBracket,
      if (filterLeftSquareBracketTitleRightSquareBracket != null) r'filter[title]': filterLeftSquareBracketTitleRightSquareBracket,
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

    ListGalactapediaArticles200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListGalactapediaArticles200Response, ListGalactapediaArticles200Response>(rawData, 'ListGalactapediaArticles200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListGalactapediaArticles200Response>(
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

  /// Galactapedia Filters
  /// Returns available category, tag, and template filter values for Galactapedia articles, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.
  ///
  /// Parameters:
  /// * [filterLeftSquareBracketCategoryRightSquareBracket] - Exact match on category name
  /// * [filterLeftSquareBracketTagRightSquareBracket] - Exact match on tag name
  /// * [filterLeftSquareBracketTemplateRightSquareBracket] - Exact match on template name
  /// * [filterLeftSquareBracketTitleRightSquareBracket] - Partial match on the article title
  /// * [filterLeftSquareBracketCreatedAtRightSquareBracket] - Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListGalactapediaFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListGalactapediaFilters200Response>> listGalactapediaFilters({ 
    String? filterLeftSquareBracketCategoryRightSquareBracket,
    String? filterLeftSquareBracketTagRightSquareBracket,
    String? filterLeftSquareBracketTemplateRightSquareBracket,
    String? filterLeftSquareBracketTitleRightSquareBracket,
    String? filterLeftSquareBracketCreatedAtRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/galactapedia/filters';
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
      if (filterLeftSquareBracketCategoryRightSquareBracket != null) r'filter[category]': filterLeftSquareBracketCategoryRightSquareBracket,
      if (filterLeftSquareBracketTagRightSquareBracket != null) r'filter[tag]': filterLeftSquareBracketTagRightSquareBracket,
      if (filterLeftSquareBracketTemplateRightSquareBracket != null) r'filter[template]': filterLeftSquareBracketTemplateRightSquareBracket,
      if (filterLeftSquareBracketTitleRightSquareBracket != null) r'filter[title]': filterLeftSquareBracketTitleRightSquareBracket,
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

    ListGalactapediaFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListGalactapediaFilters200Response, ListGalactapediaFilters200Response>(rawData, 'ListGalactapediaFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListGalactapediaFilters200Response>(
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

}
