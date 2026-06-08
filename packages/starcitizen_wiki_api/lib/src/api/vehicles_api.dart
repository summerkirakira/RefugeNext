//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:starcitizen_wiki_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:starcitizen_wiki_api/src/model/get_ground_vehicle200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_ship_matrix_vehicle200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_ground_vehicles200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_ship_matrix_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_ship_matrix_vehicles200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_vehicle_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_ship_matrix_vehicles_deprecated200_response.dart';

class VehiclesApi {

  final Dio _dio;

  const VehiclesApi(this._dio);

  /// In-Game Gravlev Vehicle Detail
  /// Alias for /api/vehicles/{identifier} scoped to gravlev vehicles. Results are scoped to the requested or default game version.
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
  /// Returns a [Future] containing a [Response] with a [GetGroundVehicle200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetGroundVehicle200Response>> getGravlevVehicle({ 
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
    final _path = r'/api/gravlev-vehicles/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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

    GetGroundVehicle200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetGroundVehicle200Response, GetGroundVehicle200Response>(rawData, 'GetGroundVehicle200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetGroundVehicle200Response>(
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

  /// In-Game Ground Vehicle Detail
  /// Alias for /api/vehicles/{identifier} scoped to ground vehicles. Results are scoped to the requested or default game version.
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
  /// Returns a [Future] containing a [Response] with a [GetGroundVehicle200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetGroundVehicle200Response>> getGroundVehicle({ 
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
    final _path = r'/api/ground-vehicles/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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

    GetGroundVehicle200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetGroundVehicle200Response, GetGroundVehicle200Response>(rawData, 'GetGroundVehicle200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetGroundVehicle200Response>(
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

  /// In-Game Vehicle Detail
  /// Retrieve a vehicle by name, class name, or UUID. Results are scoped to the requested or default game version. Loads manufacturer, gameVersion, shipMatrixVehicle (with foci, productionStatus, productionNote, type, size, loaner, skus, manufacturer, components), and port loadout items.
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
  /// Returns a [Future] containing a [Response] with a [GetGroundVehicle200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetGroundVehicle200Response>> getVehicle({ 
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
    final _path = r'/api/vehicles/{identifier}'.replaceAll('{' r'identifier' '}', identifier.toString());
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

    GetGroundVehicle200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetGroundVehicle200Response, GetGroundVehicle200Response>(rawData, 'GetGroundVehicle200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetGroundVehicle200Response>(
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

  /// In-Game Gravlev Vehicles Overview
  /// Alias for /api/vehicles scoped to gravlev vehicles (is_gravlev&#x3D;true). Returns paginated in-game gravlev vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Drake Interplanetary`
  /// * [filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket] - Alias for filter[manufacturer]. Example: `Origin Jumpworks`
  /// * [filterLeftSquareBracketClassNameRightSquareBracket] - Partial match on vehicle class name. Example: `Dragonfly`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on vehicle display name. Example: `Dragonfly`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search vehicles by name or class name. Example: `Dragonfly`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact match on vehicle size (1-6). Example: `1`
  /// * [filterLeftSquareBracketSizeClassRightSquareBracket] - Alias for filter[size]. Example: `1`
  /// * [filterLeftSquareBracketCareerRightSquareBracket] - Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration`
  /// * [filterLeftSquareBracketRoleRightSquareBracket] - Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing`
  /// * [filterLeftSquareBracketIsVehicleRightSquareBracket] - Filter to ground vehicles only.
  /// * [filterLeftSquareBracketIsGravlevRightSquareBracket] - Filter to gravlev vehicles only.
  /// * [filterLeftSquareBracketIsSpaceshipRightSquareBracket] - Filter to spaceships only.
  /// * [filterLeftSquareBracketMassTotalRightSquareBracket] - Numeric filter on total mass (kg). Supports range operators. Example: `2435`
  /// * [filterLeftSquareBracketCargoCapacityRightSquareBracket] - Numeric filter on cargo capacity (SCU). Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `0`
  /// * [filterLeftSquareBracketVehicleInventoryRightSquareBracket] - Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.39`
  /// * [filterLeftSquareBracketCrewPeriodMinRightSquareBracket] - Numeric filter on minimum crew count. Supports range operators. Example: `1`
  /// * [filterLeftSquareBracketHealthRightSquareBracket] - Numeric filter on vehicle health points. Supports range operators. Example: `1550`
  /// * [filterLeftSquareBracketShieldPeriodHpRightSquareBracket] - Numeric filter on total shield hit points. Supports range operators. Example: `720`
  /// * [filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket] - Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  /// * [filterLeftSquareBracketSpeedPeriodScmRightSquareBracket] - Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `200`
  /// * [filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket] - Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `1000`
  /// * [filterLeftSquareBracketArmorPeriodHealthRightSquareBracket] - Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `50000`
  /// * [filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket] - Numeric filter on cross-section length (X axis). Supports range operators. Example: `0.39`
  /// * [filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket] - Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  /// * [filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket] - Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  /// * [filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket] - Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  /// * [filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket] - Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  /// * [filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket] - Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  /// * [filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket] - Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListGroundVehicles200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListGroundVehicles200Response>> listGravlevVehicles({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
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
    final _path = r'/api/gravlev-vehicles';
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
      if (filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket != null) r'filter[cross section.length]': filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket != null) r'filter[cross section.width]': filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket != null) r'filter[cross section.height]': filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket != null) r'filter[signature.ir_quantum]': filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket != null) r'filter[signature.ir_shields]': filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket != null) r'filter[signature.em_quantum]': filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket != null) r'filter[signature.em_shields]': filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
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

  /// In-Game Ground Vehicles Overview
  /// Alias for /api/vehicles scoped to ground vehicles (is_vehicle&#x3D;true, is_gravlev&#x3D;false, is_spaceship&#x3D;false). Returns paginated in-game ground vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Tumbril Land Systems`
  /// * [filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket] - Alias for filter[manufacturer]. Example: `Anvil Aerospace`
  /// * [filterLeftSquareBracketClassNameRightSquareBracket] - Partial match on vehicle class name. Example: `TMBL_Nova`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on vehicle display name. Example: `Nova`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search vehicles by name or class name. Example: `Nova`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact match on vehicle size (1-6). Example: `3`
  /// * [filterLeftSquareBracketSizeClassRightSquareBracket] - Alias for filter[size]. Example: `3`
  /// * [filterLeftSquareBracketCareerRightSquareBracket] - Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Ground`
  /// * [filterLeftSquareBracketRoleRightSquareBracket] - Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Combat`
  /// * [filterLeftSquareBracketIsVehicleRightSquareBracket] - Filter to ground vehicles only.
  /// * [filterLeftSquareBracketIsGravlevRightSquareBracket] - Filter to gravlev vehicles only.
  /// * [filterLeftSquareBracketIsSpaceshipRightSquareBracket] - Filter to spaceships only.
  /// * [filterLeftSquareBracketMassTotalRightSquareBracket] - Numeric filter on total mass (kg). Supports range operators. Example: `1521`
  /// * [filterLeftSquareBracketCargoCapacityRightSquareBracket] - Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1`
  /// * [filterLeftSquareBracketVehicleInventoryRightSquareBracket] - Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13`
  /// * [filterLeftSquareBracketCrewPeriodMinRightSquareBracket] - Numeric filter on minimum crew count. Supports range operators. Example: `2`
  /// * [filterLeftSquareBracketHealthRightSquareBracket] - Numeric filter on vehicle health points. Supports range operators. Example: `4250`
  /// * [filterLeftSquareBracketShieldPeriodHpRightSquareBracket] - Numeric filter on total shield hit points. Supports range operators. Example: `720`
  /// * [filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket] - Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  /// * [filterLeftSquareBracketSpeedPeriodScmRightSquareBracket] - Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `200`
  /// * [filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket] - Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `1000`
  /// * [filterLeftSquareBracketArmorPeriodHealthRightSquareBracket] - Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `50000`
  /// * [filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket] - Numeric filter on cross-section length (X axis). Supports range operators. Example: `100`
  /// * [filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket] - Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  /// * [filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket] - Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  /// * [filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket] - Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  /// * [filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket] - Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  /// * [filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket] - Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  /// * [filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket] - Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListGroundVehicles200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListGroundVehicles200Response>> listGroundVehicles({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
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
    final _path = r'/api/ground-vehicles';
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
      if (filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket != null) r'filter[cross section.length]': filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket != null) r'filter[cross section.width]': filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket != null) r'filter[cross section.height]': filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket != null) r'filter[signature.ir_quantum]': filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket != null) r'filter[signature.ir_shields]': filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket != null) r'filter[signature.em_quantum]': filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket != null) r'filter[signature.em_shields]': filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
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

  /// In-Game Vehicle Filters
  /// Return all available filter values for in-game vehicles.
  ///
  /// Parameters:
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListVehicleFilters200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListVehicleFilters200Response>> listVehicleFilters({ 
    String? version,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/vehicles/filters';
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

    ListVehicleFilters200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ListVehicleFilters200Response, ListVehicleFilters200Response>(rawData, 'ListVehicleFilters200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListVehicleFilters200Response>(
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

  /// In-Game Vehicles Overview
  /// Returns paginated in-game vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus. Optional includes: shipMatrixVehicle, components, shipmatrixvehicle.components, hardpoints, ports.
  ///
  /// Parameters:
  /// * [page] - Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  /// * [pageLeftSquareBracketNumberRightSquareBracket] - Page number for pagination (starts at 1).
  /// * [pageLeftSquareBracketSizeRightSquareBracket] - Number of results per page. Maximum 200.
  /// * [include] - Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  /// * [version] - Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  /// * [sort] - Sort field. Prefix with \"-\" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  /// * [filterLeftSquareBracketManufacturerRightSquareBracket] - Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Aegis Dynamics`
  /// * [filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket] - Alias for filter[manufacturer]. Example: `Anvil Aerospace`
  /// * [filterLeftSquareBracketClassNameRightSquareBracket] - Partial match on vehicle class name. Example: `TMBL_Nova`
  /// * [filterLeftSquareBracketNameRightSquareBracket] - Partial match on vehicle display name. Example: `Nova`
  /// * [filterLeftSquareBracketQueryRightSquareBracket] - Search vehicles by name or class name. Example: `Carrack`
  /// * [filterLeftSquareBracketSizeRightSquareBracket] - Exact match on vehicle size (1-6). Example: `3`
  /// * [filterLeftSquareBracketSizeClassRightSquareBracket] - Alias for filter[size]. Example: `3`
  /// * [filterLeftSquareBracketCareerRightSquareBracket] - Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration`
  /// * [filterLeftSquareBracketRoleRightSquareBracket] - Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing`
  /// * [filterLeftSquareBracketIsVehicleRightSquareBracket] - Filter to ground vehicles only.
  /// * [filterLeftSquareBracketIsGravlevRightSquareBracket] - Filter to gravlev vehicles only.
  /// * [filterLeftSquareBracketIsSpaceshipRightSquareBracket] - Filter to spaceships only.
  /// * [filterLeftSquareBracketMassTotalRightSquareBracket] - Numeric filter on total mass (kg). Supports range operators. Example: `1521`
  /// * [filterLeftSquareBracketCargoCapacityRightSquareBracket] - Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1`
  /// * [filterLeftSquareBracketVehicleInventoryRightSquareBracket] - Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13`
  /// * [filterLeftSquareBracketCrewPeriodMinRightSquareBracket] - Numeric filter on minimum crew count. Supports range operators. Example: `2`
  /// * [filterLeftSquareBracketHealthRightSquareBracket] - Numeric filter on vehicle health points. Supports range operators. Example: `1550`
  /// * [filterLeftSquareBracketShieldPeriodHpRightSquareBracket] - Numeric filter on total shield hit points. Supports range operators. Example: `720`
  /// * [filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket] - Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  /// * [filterLeftSquareBracketSpeedPeriodScmRightSquareBracket] - Numeric filter on SCM speed. Supports range operators. Example: `220`
  /// * [filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket] - Numeric filter on maximum speed. Supports range operators. Example: `1150`
  /// * [filterLeftSquareBracketArmorPeriodHealthRightSquareBracket] - Numeric filter on armor health points. Supports range operators. Example: `10890`
  /// * [filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket] - Numeric filter on cross-section length (X axis). Supports range operators. Example: `100`
  /// * [filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket] - Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  /// * [filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket] - Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  /// * [filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket] - Numeric filter on infrared quantum signature emission. Supports range operators. Example: `10882`
  /// * [filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket] - Numeric filter on infrared shield signature emission. Supports range operators. Example: `10267`
  /// * [filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket] - Numeric filter on electromagnetic quantum signature emission. Supports range operators. Example: `53959`
  /// * [filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket] - Numeric filter on electromagnetic shield signature emission. Supports range operators. Example: `17643`
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListGroundVehicles200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListGroundVehicles200Response>> listVehicles({ 
    int? page = 1,
    int? pageLeftSquareBracketNumberRightSquareBracket = 1,
    int? pageLeftSquareBracketSizeRightSquareBracket = 30,
    String? include,
    String? version,
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
    final _path = r'/api/vehicles';
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
      if (filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket != null) r'filter[cross section.length]': filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket != null) r'filter[cross section.width]': filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket,
      if (filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket != null) r'filter[cross section.height]': filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket != null) r'filter[signature.ir_quantum]': filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket != null) r'filter[signature.ir_shields]': filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket != null) r'filter[signature.em_quantum]': filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket,
      if (filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket != null) r'filter[signature.em_shields]': filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket,
    };

    final _response = await _dio.request<Object>(
      _path,
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
