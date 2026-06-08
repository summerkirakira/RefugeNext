//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_faction200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_factions200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';

class FactionsApi {

  final Dio _dio;

  const FactionsApi(this._dio);

  /// Get Faction Detail
  /// Returns full details for a single faction, including reputation ladder with standings when the faction has a reputation system. Factions hidden from the Delphi app are excluded.
  ///
  /// Parameters:
  /// * [faction] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetFaction200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetFaction200Response>> getFaction({ 
    required String faction,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/factions/{faction}'.replaceAll('{' r'faction' '}', faction.toString());
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

    GetFaction200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetFaction200Response, GetFaction200Response>(rawData, 'GetFaction200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetFaction200Response>(
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

  /// List Factions
  /// Returns paginated factions sorted by name by default. Factions hidden from the Delphi app are excluded.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [filterLeftSquareBracketFactionTypeRightSquareBracket] - Category of faction. Example: `Lawful`
  /// * [filterLeftSquareBracketHasReputationRightSquareBracket] - When true, only factions with a reputation system are returned. Example: `true`
  /// * [filterLeftSquareBracketLawfulRightSquareBracket] - When true, only lawful factions are returned. Example: `true`
  /// * [filterLeftSquareBracketIsNpcRightSquareBracket] - When true, only NPC-controlled factions are returned. Example: `false`
  /// * [filterLeftSquareBracketHideInDelphiAppRightSquareBracket] - When true, only factions hidden from the Delphi app are returned. Note: the index endpoint excludes hidden factions by default. Example: `false`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search factions by name or description. Example: `ArcCorp`
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Supported: name, faction_type.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListFactions200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListFactions200Response>> listFactions({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? filterLeftSquareBracketFactionTypeRightSquareBracket,
    bool? filterLeftSquareBracketHasReputationRightSquareBracket,
    bool? filterLeftSquareBracketLawfulRightSquareBracket,
    bool? filterLeftSquareBracketIsNpcRightSquareBracket,
    bool? filterLeftSquareBracketHideInDelphiAppRightSquareBracket,
    String? filterLeftSquareBracketQueryRightSquareBracket,
    String? sort,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/factions';
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
      if (filterLeftSquareBracketFactionTypeRightSquareBracket != null) r'filter[faction_type]': filterLeftSquareBracketFactionTypeRightSquareBracket,
      if (filterLeftSquareBracketHasReputationRightSquareBracket != null) r'filter[has_reputation]': filterLeftSquareBracketHasReputationRightSquareBracket,
      if (filterLeftSquareBracketLawfulRightSquareBracket != null) r'filter[lawful]': filterLeftSquareBracketLawfulRightSquareBracket,
      if (filterLeftSquareBracketIsNpcRightSquareBracket != null) r'filter[is_npc]': filterLeftSquareBracketIsNpcRightSquareBracket,
      if (filterLeftSquareBracketHideInDelphiAppRightSquareBracket != null) r'filter[hide_in_delphi_app]': filterLeftSquareBracketHideInDelphiAppRightSquareBracket,
      if (filterLeftSquareBracketQueryRightSquareBracket != null) r'filter[query]': filterLeftSquareBracketQueryRightSquareBracket,
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

    ListFactions200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListFactions200Response, ListFactions200Response>(rawData, 'ListFactions200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListFactions200Response>(
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
