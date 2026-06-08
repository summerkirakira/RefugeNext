//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:starcitizen_wiki_api/src/auth/api_key_auth.dart';
import 'package:starcitizen_wiki_api/src/auth/basic_auth.dart';
import 'package:starcitizen_wiki_api/src/auth/bearer_auth.dart';
import 'package:starcitizen_wiki_api/src/auth/oauth.dart';
import 'package:starcitizen_wiki_api/src/api/auth_api.dart';
import 'package:starcitizen_wiki_api/src/api/blueprints_api.dart';
import 'package:starcitizen_wiki_api/src/api/comm_links_api.dart';
import 'package:starcitizen_wiki_api/src/api/commodities_api.dart';
import 'package:starcitizen_wiki_api/src/api/factions_api.dart';
import 'package:starcitizen_wiki_api/src/api/galactapedia_api.dart';
import 'package:starcitizen_wiki_api/src/api/game_versions_api.dart';
import 'package:starcitizen_wiki_api/src/api/images_api.dart';
import 'package:starcitizen_wiki_api/src/api/items_api.dart';
import 'package:starcitizen_wiki_api/src/api/manufacturers_api.dart';
import 'package:starcitizen_wiki_api/src/api/meta_api.dart';
import 'package:starcitizen_wiki_api/src/api/missions_api.dart';
import 'package:starcitizen_wiki_api/src/api/search_api.dart';
import 'package:starcitizen_wiki_api/src/api/ship_matrix_api.dart';
import 'package:starcitizen_wiki_api/src/api/starmap_api.dart';
import 'package:starcitizen_wiki_api/src/api/stats_api.dart';
import 'package:starcitizen_wiki_api/src/api/vehicles_api.dart';

class StarcitizenWikiApi {
  static const String basePath = r'https://api.star-citizen.wiki';

  final Dio dio;
  StarcitizenWikiApi({
    Dio? dio,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : 
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the OAuth token associated with the given [name].
  ///
  /// If no [OAuthInterceptor] is registered or no token exists for the given
  /// [name], this method has no effect.
  void removeOAuthToken(String name) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens.remove(name);
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the bearer authentication token associated with the given [name].
  ///
  /// If no [BearerAuthInterceptor] is registered or no token exists for the
  /// given [name], this method has no effect.
  void removeBearerAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens.remove(name);
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  /// Removes the basic authentication credentials associated with the given [name].
  ///
  /// If no [BasicAuthInterceptor] is registered or no credentials exist for the
  /// given [name], this method has no effect.
  void removeBasicAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo.remove(name);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Removes the API key associated with the given [name].
  ///
  /// If no [ApiKeyAuthInterceptor] is registered or no API key exists for the
  /// given [name], this method has no effect.
  void removeApiKey(String name) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys.remove(name);
    }
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio);
  }

  /// Get BlueprintsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BlueprintsApi getBlueprintsApi() {
    return BlueprintsApi(dio);
  }

  /// Get CommLinksApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CommLinksApi getCommLinksApi() {
    return CommLinksApi(dio);
  }

  /// Get CommoditiesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CommoditiesApi getCommoditiesApi() {
    return CommoditiesApi(dio);
  }

  /// Get FactionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FactionsApi getFactionsApi() {
    return FactionsApi(dio);
  }

  /// Get GalactapediaApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GalactapediaApi getGalactapediaApi() {
    return GalactapediaApi(dio);
  }

  /// Get GameVersionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GameVersionsApi getGameVersionsApi() {
    return GameVersionsApi(dio);
  }

  /// Get ImagesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ImagesApi getImagesApi() {
    return ImagesApi(dio);
  }

  /// Get ItemsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ItemsApi getItemsApi() {
    return ItemsApi(dio);
  }

  /// Get ManufacturersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ManufacturersApi getManufacturersApi() {
    return ManufacturersApi(dio);
  }

  /// Get MetaApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MetaApi getMetaApi() {
    return MetaApi(dio);
  }

  /// Get MissionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MissionsApi getMissionsApi() {
    return MissionsApi(dio);
  }

  /// Get SearchApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SearchApi getSearchApi() {
    return SearchApi(dio);
  }

  /// Get ShipMatrixApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ShipMatrixApi getShipMatrixApi() {
    return ShipMatrixApi(dio);
  }

  /// Get StarmapApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StarmapApi getStarmapApi() {
    return StarmapApi(dio);
  }

  /// Get StatsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StatsApi getStatsApi() {
    return StatsApi(dio);
  }

  /// Get VehiclesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  VehiclesApi getVehiclesApi() {
    return VehiclesApi(dio);
  }
}
