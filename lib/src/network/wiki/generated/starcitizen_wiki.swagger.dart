// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element_parameter

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'starcitizen_wiki.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'starcitizen_wiki.enums.swagger.dart' as enums;
import 'starcitizen_wiki.metadata.swagger.dart';
export 'starcitizen_wiki.enums.swagger.dart';
export 'starcitizen_wiki.models.swagger.dart';

part 'starcitizen_wiki.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class StarcitizenWiki extends ChopperService {
  static StarcitizenWiki create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$StarcitizenWiki(client);
    }

    final newClient = ChopperClient(
      services: [_$StarcitizenWiki()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl ?? Uri.parse('http://'),
    );
    return _$StarcitizenWiki(newClient);
  }

  ///List Game Blueprints
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supported: craft_time_seconds, ingredient_count, unlocking_missions_count.
  ///@param filter[query] Search blueprints by crafted item name. Example: `Shotgun`
  ///@param filter[output.uuid] Filter by crafted item UUID (see GET /api/items). Example: `02d4cd2e-fa98-4086-aee1-6b2dfce8ea27`
  ///@param filter[output.name] Filter by crafted item name. Example: `P4-AR Magazine (40 cap)`
  ///@param filter[output.class] Filter by crafted item class. Example: `ksar_smg_energy_01_gold01`
  ///@param filter[output.type] Filter by crafted item type (see GET /api/blueprints/filters for valid values). Example: `WeaponPersonal`
  ///@param filter[default] Filter by default availability (true/false). Example: `true`
  ///@param filter[ingredient] Matches ingredient resource type by name, key, or UUID before filtering blueprints. Example: `Aluminum`
  ///@param filter[ingredient.uuid] Filter by ingredient commodity UUID. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac`
  ///@param filter[resource.uuid] Filter by resource commodity UUID, matching ingredients and dismantle returns. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac`
  Future<chopper.Response<ApiBlueprintsGet$Response>> apiBlueprintsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? version,
    String? sort,
    String? filterQuery,
    String? filterOutputUuid,
    String? filterOutputName,
    String? filterOutputClass,
    String? filterOutputType,
    bool? filterDefault,
    String? filterIngredient,
    String? filterIngredientUuid,
    String? filterResourceUuid,
  }) {
    generatedMapping.putIfAbsent(
      ApiBlueprintsGet$Response,
      () => ApiBlueprintsGet$Response.fromJsonFactory,
    );

    return _apiBlueprintsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      version: version,
      sort: sort,
      filterQuery: filterQuery,
      filterOutputUuid: filterOutputUuid,
      filterOutputName: filterOutputName,
      filterOutputClass: filterOutputClass,
      filterOutputType: filterOutputType,
      filterDefault: filterDefault,
      filterIngredient: filterIngredient,
      filterIngredientUuid: filterIngredientUuid,
      filterResourceUuid: filterResourceUuid,
    );
  }

  ///List Game Blueprints
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supported: craft_time_seconds, ingredient_count, unlocking_missions_count.
  ///@param filter[query] Search blueprints by crafted item name. Example: `Shotgun`
  ///@param filter[output.uuid] Filter by crafted item UUID (see GET /api/items). Example: `02d4cd2e-fa98-4086-aee1-6b2dfce8ea27`
  ///@param filter[output.name] Filter by crafted item name. Example: `P4-AR Magazine (40 cap)`
  ///@param filter[output.class] Filter by crafted item class. Example: `ksar_smg_energy_01_gold01`
  ///@param filter[output.type] Filter by crafted item type (see GET /api/blueprints/filters for valid values). Example: `WeaponPersonal`
  ///@param filter[default] Filter by default availability (true/false). Example: `true`
  ///@param filter[ingredient] Matches ingredient resource type by name, key, or UUID before filtering blueprints. Example: `Aluminum`
  ///@param filter[ingredient.uuid] Filter by ingredient commodity UUID. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac`
  ///@param filter[resource.uuid] Filter by resource commodity UUID, matching ingredients and dismantle returns. Accepts comma-separated values (see GET /api/commodities). Example: `fde0cd65-8827-4b23-804d-cc8845dfa7ac`
  @GET(path: '/api/blueprints')
  Future<chopper.Response<ApiBlueprintsGet$Response>> _apiBlueprintsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[output.uuid]') String? filterOutputUuid,
    @Query('filter[output.name]') String? filterOutputName,
    @Query('filter[output.class]') String? filterOutputClass,
    @Query('filter[output.type]') String? filterOutputType,
    @Query('filter[default]') bool? filterDefault,
    @Query('filter[ingredient]') String? filterIngredient,
    @Query('filter[ingredient.uuid]') String? filterIngredientUuid,
    @Query('filter[resource.uuid]') String? filterResourceUuid,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated crafting blueprints, including ingredients, crafted items, and dismantle returns. Results are scoped to the requested or default game version.',
      summary: 'List Game Blueprints',
      operationId: 'listBlueprints',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Blueprints"],
      deprecated: false,
    ),
  });

  ///Get Game Blueprint Detail
  ///@param blueprint Blueprint UUID
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiBlueprintsBlueprintGet$Response>>
  apiBlueprintsBlueprintGet({required String? blueprint, String? version}) {
    generatedMapping.putIfAbsent(
      ApiBlueprintsBlueprintGet$Response,
      () => ApiBlueprintsBlueprintGet$Response.fromJsonFactory,
    );

    return _apiBlueprintsBlueprintGet(blueprint: blueprint, version: version);
  }

  ///Get Game Blueprint Detail
  ///@param blueprint Blueprint UUID
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/blueprints/{blueprint}')
  Future<chopper.Response<ApiBlueprintsBlueprintGet$Response>>
  _apiBlueprintsBlueprintGet({
    @Path('blueprint') required String? blueprint,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns full detail for a single crafting blueprint, including ingredients, crafted item, dismantle returns, and associated missions. Scoped to the requested or default game version.',
      summary: 'Get Game Blueprint Detail',
      operationId: 'getBlueprint',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Blueprints"],
      deprecated: false,
    ),
  });

  ///Get Blueprint Filter Options
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiBlueprintsFiltersGet$Response>>
  apiBlueprintsFiltersGet({String? version}) {
    generatedMapping.putIfAbsent(
      ApiBlueprintsFiltersGet$Response,
      () => ApiBlueprintsFiltersGet$Response.fromJsonFactory,
    );

    return _apiBlueprintsFiltersGet(version: version);
  }

  ///Get Blueprint Filter Options
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/blueprints/filters')
  Future<chopper.Response<ApiBlueprintsFiltersGet$Response>>
  _apiBlueprintsFiltersGet({
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns available filter facets for blueprints (crafted item types, ingredient and resource UUIDs), optionally scoped to the requested or default game version.',
      summary: 'Get Blueprint Filter Options',
      operationId: 'listBlueprintFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Blueprints"],
      deprecated: false,
    ),
  });

  ///List Game Commodities
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supported: key, name, rarity, density, instability, resistance, signature.
  ///@param filter[used] When true, only commodities used by blueprint ingredients in the requested or default game version are returned. Example: `true`
  ///@param filter[system] Star system where the commodity can be found (see GET /api/commodities/filters for valid values). Example: `Stanton System`
  ///@param filter[type] Location type name (see GET /api/commodities/filters for valid values). Example: `Planet`
  ///@param filter[rarity] Commodity tier/rarity level, lowercase (see GET /api/commodities/filters for valid values). Example: `epic`
  ///@param filter[kind] Resource kind (see GET /api/commodities/filters for valid values). Example: `mineable`
  ///@param filter[group] Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food`
  ///@param filter[refined_version] Refined version name (see GET /api/commodities/filters for valid values). Example: `Agricium`
  ///@param filter[location] Partial match on starmap location name. Example: `ArcCorp`
  ///@param filter[query] Search commodities by name or key. Example: `Agricium`
  ///@param filter[ship] When true, only show commodities mineable by ships. Example: `true`
  ///@param filter[ground_vehicle] When true, only show commodities mineable by ground vehicles. Example: `true`
  ///@param filter[fps] When true, only show commodities mineable on foot (FPS). Example: `true`
  ///@param filter[harvestable] When true, only show commodities collectible from harvestable or plant deposits. Example: `true`
  ///@param filter[salvage] When true, only show commodities obtainable through salvage. Example: `false`
  ///@param filter[mineable] When true, only show mineable commodities; when false, only show non-mineable. Example: `true`
  Future<chopper.Response<ApiCommoditiesGet$Response>> apiCommoditiesGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? version,
    String? sort,
    bool? filterUsed,
    String? filterSystem,
    String? filterType,
    String? filterRarity,
    String? filterKind,
    String? filterGroup,
    String? filterRefinedVersion,
    String? filterLocation,
    String? filterQuery,
    bool? filterShip,
    bool? filterGroundVehicle,
    bool? filterFps,
    bool? filterHarvestable,
    bool? filterSalvage,
    bool? filterMineable,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommoditiesGet$Response,
      () => ApiCommoditiesGet$Response.fromJsonFactory,
    );

    return _apiCommoditiesGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      version: version,
      sort: sort,
      filterUsed: filterUsed,
      filterSystem: filterSystem,
      filterType: filterType,
      filterRarity: filterRarity,
      filterKind: filterKind,
      filterGroup: filterGroup,
      filterRefinedVersion: filterRefinedVersion,
      filterLocation: filterLocation,
      filterQuery: filterQuery,
      filterShip: filterShip,
      filterGroundVehicle: filterGroundVehicle,
      filterFps: filterFps,
      filterHarvestable: filterHarvestable,
      filterSalvage: filterSalvage,
      filterMineable: filterMineable,
    );
  }

  ///List Game Commodities
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supported: key, name, rarity, density, instability, resistance, signature.
  ///@param filter[used] When true, only commodities used by blueprint ingredients in the requested or default game version are returned. Example: `true`
  ///@param filter[system] Star system where the commodity can be found (see GET /api/commodities/filters for valid values). Example: `Stanton System`
  ///@param filter[type] Location type name (see GET /api/commodities/filters for valid values). Example: `Planet`
  ///@param filter[rarity] Commodity tier/rarity level, lowercase (see GET /api/commodities/filters for valid values). Example: `epic`
  ///@param filter[kind] Resource kind (see GET /api/commodities/filters for valid values). Example: `mineable`
  ///@param filter[group] Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food`
  ///@param filter[refined_version] Refined version name (see GET /api/commodities/filters for valid values). Example: `Agricium`
  ///@param filter[location] Partial match on starmap location name. Example: `ArcCorp`
  ///@param filter[query] Search commodities by name or key. Example: `Agricium`
  ///@param filter[ship] When true, only show commodities mineable by ships. Example: `true`
  ///@param filter[ground_vehicle] When true, only show commodities mineable by ground vehicles. Example: `true`
  ///@param filter[fps] When true, only show commodities mineable on foot (FPS). Example: `true`
  ///@param filter[harvestable] When true, only show commodities collectible from harvestable or plant deposits. Example: `true`
  ///@param filter[salvage] When true, only show commodities obtainable through salvage. Example: `false`
  ///@param filter[mineable] When true, only show mineable commodities; when false, only show non-mineable. Example: `true`
  @GET(path: '/api/commodities')
  Future<chopper.Response<ApiCommoditiesGet$Response>> _apiCommoditiesGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[used]') bool? filterUsed,
    @Query('filter[system]') String? filterSystem,
    @Query('filter[type]') String? filterType,
    @Query('filter[rarity]') String? filterRarity,
    @Query('filter[kind]') String? filterKind,
    @Query('filter[group]') String? filterGroup,
    @Query('filter[refined_version]') String? filterRefinedVersion,
    @Query('filter[location]') String? filterLocation,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[ship]') bool? filterShip,
    @Query('filter[ground_vehicle]') bool? filterGroundVehicle,
    @Query('filter[fps]') bool? filterFps,
    @Query('filter[harvestable]') bool? filterHarvestable,
    @Query('filter[salvage]') bool? filterSalvage,
    @Query('filter[mineable]') bool? filterMineable,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated game commodities with location data and resource metadata, optionally filtered to only those consumed by blueprints. Results include refined version info and starmap location data scoped to the requested or default game version.',
      summary: 'List Game Commodities',
      operationId: 'listCommodities',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Commodities"],
      deprecated: false,
    ),
  });

  ///Show Game Commodity
  ///@param commodity Commodity UUID or slug
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param include Comma-separated relationships to include. Available: blueprints (crafting blueprints that use this commodity), items (items that produce or require this commodity).
  Future<chopper.Response<ApiCommoditiesCommodityGet$Response>>
  apiCommoditiesCommodityGet({
    required String? commodity,
    String? version,
    String? include,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommoditiesCommodityGet$Response,
      () => ApiCommoditiesCommodityGet$Response.fromJsonFactory,
    );

    return _apiCommoditiesCommodityGet(
      commodity: commodity,
      version: version,
      include: include,
    );
  }

  ///Show Game Commodity
  ///@param commodity Commodity UUID or slug
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param include Comma-separated relationships to include. Available: blueprints (crafting blueprints that use this commodity), items (items that produce or require this commodity).
  @GET(path: '/api/commodities/{commodity}')
  Future<chopper.Response<ApiCommoditiesCommodityGet$Response>>
  _apiCommoditiesCommodityGet({
    @Path('commodity') required String? commodity,
    @Query('version') String? version,
    @Query('include') String? include,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns full details for a single game commodity including detailed location entries with starmap data, resource composition, areas, clustering data, and raw/refined version info. Results are scoped to the requested or default game version. Optionally include related blueprints and items.',
      summary: 'Show Game Commodity',
      operationId: 'getCommodity',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Commodities"],
      deprecated: false,
    ),
  });

  ///Game Commodity Filters
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param filter[used] When true, filter facets to only commodities used by blueprint ingredients. Example: `true`
  ///@param filter[system] Star system where the commodity can be found. Example: `Stanton System`
  ///@param filter[type] Location type name. Example: `Planet`
  ///@param filter[rarity] Commodity tier/rarity level, lowercase. Example: `epic`
  ///@param filter[kind] Resource kind. Example: `mineable`
  ///@param filter[group] Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food`
  ///@param filter[refined_version] Refined version name. Example: `Agricium`
  ///@param filter[location] Partial match on starmap location name. Example: `ArcCorp`
  ///@param filter[query] Search commodities by name or key. Example: `Agricium`
  ///@param filter[ship] When true, only show commodities mineable by ships. Example: `true`
  ///@param filter[ground_vehicle] When true, only show commodities mineable by ground vehicles. Example: `true`
  ///@param filter[fps] When true, only show commodities mineable on foot (FPS). Example: `true`
  ///@param filter[harvestable] When true, only show commodities collectible from harvestable or plant deposits. Example: `true`
  ///@param filter[salvage] When true, only show commodities obtainable through salvage. Example: `false`
  ///@param filter[mineable] When true, only show mineable commodities; when false, only show non-mineable. Example: `true`
  Future<chopper.Response<ApiCommoditiesFiltersGet$Response>>
  apiCommoditiesFiltersGet({
    String? version,
    bool? filterUsed,
    String? filterSystem,
    String? filterType,
    String? filterRarity,
    String? filterKind,
    String? filterGroup,
    String? filterRefinedVersion,
    String? filterLocation,
    String? filterQuery,
    bool? filterShip,
    bool? filterGroundVehicle,
    bool? filterFps,
    bool? filterHarvestable,
    bool? filterSalvage,
    bool? filterMineable,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommoditiesFiltersGet$Response,
      () => ApiCommoditiesFiltersGet$Response.fromJsonFactory,
    );

    return _apiCommoditiesFiltersGet(
      version: version,
      filterUsed: filterUsed,
      filterSystem: filterSystem,
      filterType: filterType,
      filterRarity: filterRarity,
      filterKind: filterKind,
      filterGroup: filterGroup,
      filterRefinedVersion: filterRefinedVersion,
      filterLocation: filterLocation,
      filterQuery: filterQuery,
      filterShip: filterShip,
      filterGroundVehicle: filterGroundVehicle,
      filterFps: filterFps,
      filterHarvestable: filterHarvestable,
      filterSalvage: filterSalvage,
      filterMineable: filterMineable,
    );
  }

  ///Game Commodity Filters
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param filter[used] When true, filter facets to only commodities used by blueprint ingredients. Example: `true`
  ///@param filter[system] Star system where the commodity can be found. Example: `Stanton System`
  ///@param filter[type] Location type name. Example: `Planet`
  ///@param filter[rarity] Commodity tier/rarity level, lowercase. Example: `epic`
  ///@param filter[kind] Resource kind. Example: `mineable`
  ///@param filter[group] Commodity group name. Comma-separated for multiple. Example: `ProcessedGoods,Food`
  ///@param filter[refined_version] Refined version name. Example: `Agricium`
  ///@param filter[location] Partial match on starmap location name. Example: `ArcCorp`
  ///@param filter[query] Search commodities by name or key. Example: `Agricium`
  ///@param filter[ship] When true, only show commodities mineable by ships. Example: `true`
  ///@param filter[ground_vehicle] When true, only show commodities mineable by ground vehicles. Example: `true`
  ///@param filter[fps] When true, only show commodities mineable on foot (FPS). Example: `true`
  ///@param filter[harvestable] When true, only show commodities collectible from harvestable or plant deposits. Example: `true`
  ///@param filter[salvage] When true, only show commodities obtainable through salvage. Example: `false`
  ///@param filter[mineable] When true, only show mineable commodities; when false, only show non-mineable. Example: `true`
  @GET(path: '/api/commodities/filters')
  Future<chopper.Response<ApiCommoditiesFiltersGet$Response>>
  _apiCommoditiesFiltersGet({
    @Query('version') String? version,
    @Query('filter[used]') bool? filterUsed,
    @Query('filter[system]') String? filterSystem,
    @Query('filter[type]') String? filterType,
    @Query('filter[rarity]') String? filterRarity,
    @Query('filter[kind]') String? filterKind,
    @Query('filter[group]') String? filterGroup,
    @Query('filter[refined_version]') String? filterRefinedVersion,
    @Query('filter[location]') String? filterLocation,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[ship]') bool? filterShip,
    @Query('filter[ground_vehicle]') bool? filterGroundVehicle,
    @Query('filter[fps]') bool? filterFps,
    @Query('filter[harvestable]') bool? filterHarvestable,
    @Query('filter[salvage]') bool? filterSalvage,
    @Query('filter[mineable]') bool? filterMineable,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns all available filter values for game commodities, scoped to the requested or default game version. Filter values can be combined; providing a system filter will narrow the location facet to that system only.',
      summary: 'Game Commodity Filters',
      operationId: 'listCommodityFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Commodities"],
      deprecated: false,
    ),
  });

  ///List Factions
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[faction_type] Category of faction. Example: `Lawful`
  ///@param filter[has_reputation] When true, only factions with a reputation system are returned. Example: `true`
  ///@param filter[lawful] When true, only lawful factions are returned. Example: `true`
  ///@param filter[is_npc] When true, only NPC-controlled factions are returned. Example: `false`
  ///@param filter[hide_in_delphi_app] When true, only factions hidden from the Delphi app are returned. Note: the index endpoint excludes hidden factions by default. Example: `false`
  ///@param filter[query] Search factions by name or description. Example: `ArcCorp`
  ///@param sort Sort field. Prefix with "-" for descending. Supported: name, faction_type.
  Future<chopper.Response<ApiFactionsGet$Response>> apiFactionsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterFactionType,
    bool? filterHasReputation,
    bool? filterLawful,
    bool? filterIsNpc,
    bool? filterHideInDelphiApp,
    String? filterQuery,
    String? sort,
  }) {
    generatedMapping.putIfAbsent(
      ApiFactionsGet$Response,
      () => ApiFactionsGet$Response.fromJsonFactory,
    );

    return _apiFactionsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterFactionType: filterFactionType,
      filterHasReputation: filterHasReputation,
      filterLawful: filterLawful,
      filterIsNpc: filterIsNpc,
      filterHideInDelphiApp: filterHideInDelphiApp,
      filterQuery: filterQuery,
      sort: sort,
    );
  }

  ///List Factions
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[faction_type] Category of faction. Example: `Lawful`
  ///@param filter[has_reputation] When true, only factions with a reputation system are returned. Example: `true`
  ///@param filter[lawful] When true, only lawful factions are returned. Example: `true`
  ///@param filter[is_npc] When true, only NPC-controlled factions are returned. Example: `false`
  ///@param filter[hide_in_delphi_app] When true, only factions hidden from the Delphi app are returned. Note: the index endpoint excludes hidden factions by default. Example: `false`
  ///@param filter[query] Search factions by name or description. Example: `ArcCorp`
  ///@param sort Sort field. Prefix with "-" for descending. Supported: name, faction_type.
  @GET(path: '/api/factions')
  Future<chopper.Response<ApiFactionsGet$Response>> _apiFactionsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[faction_type]') String? filterFactionType,
    @Query('filter[has_reputation]') bool? filterHasReputation,
    @Query('filter[lawful]') bool? filterLawful,
    @Query('filter[is_npc]') bool? filterIsNpc,
    @Query('filter[hide_in_delphi_app]') bool? filterHideInDelphiApp,
    @Query('filter[query]') String? filterQuery,
    @Query('sort') String? sort,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated factions sorted by name by default. Factions hidden from the Delphi app are excluded.',
      summary: 'List Factions',
      operationId: 'listFactions',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Factions"],
      deprecated: false,
    ),
  });

  ///Get Faction Detail
  ///@param faction Faction UUID.
  Future<chopper.Response<ApiFactionsFactionGet$Response>>
  apiFactionsFactionGet({required String? faction}) {
    generatedMapping.putIfAbsent(
      ApiFactionsFactionGet$Response,
      () => ApiFactionsFactionGet$Response.fromJsonFactory,
    );

    return _apiFactionsFactionGet(faction: faction);
  }

  ///Get Faction Detail
  ///@param faction Faction UUID.
  @GET(path: '/api/factions/{faction}')
  Future<chopper.Response<ApiFactionsFactionGet$Response>>
  _apiFactionsFactionGet({
    @Path('faction') required String? faction,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns full details for a single faction, including reputation ladder with standings when the faction has a reputation system. Factions hidden from the Delphi app are excluded.',
      summary: 'Get Faction Detail',
      operationId: 'getFaction',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Factions"],
      deprecated: false,
    ),
  });

  ///List Game Versions
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[code] Filter by exact version code. Example: `4.8.0-LIVE.11825000`
  ///@param filter[channel] Filter by release channel (live, ptu, eptu), lowercase. Example: `live`
  ///@param filter[is_default] Filter by default status. Example: `1`
  ///@param sort Sort by field. Prefix with - for descending. Supported: code, channel, released_at.
  Future<chopper.Response<ApiGameVersionsGet$Response>> apiGameVersionsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterCode,
    String? filterChannel,
    int? filterIsDefault,
    String? sort,
  }) {
    generatedMapping.putIfAbsent(
      ApiGameVersionsGet$Response,
      () => ApiGameVersionsGet$Response.fromJsonFactory,
    );

    return _apiGameVersionsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterCode: filterCode,
      filterChannel: filterChannel,
      filterIsDefault: filterIsDefault,
      sort: sort,
    );
  }

  ///List Game Versions
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[code] Filter by exact version code. Example: `4.8.0-LIVE.11825000`
  ///@param filter[channel] Filter by release channel (live, ptu, eptu), lowercase. Example: `live`
  ///@param filter[is_default] Filter by default status. Example: `1`
  ///@param sort Sort by field. Prefix with - for descending. Supported: code, channel, released_at.
  @GET(path: '/api/game-versions')
  Future<chopper.Response<ApiGameVersionsGet$Response>> _apiGameVersionsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[code]') String? filterCode,
    @Query('filter[channel]') String? filterChannel,
    @Query('filter[is_default]') int? filterIsDefault,
    @Query('sort') String? sort,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated game versions sorted by release date (newest first by default). Useful for discovering available game versions for version-scoped API queries.',
      summary: 'List Game Versions',
      operationId: 'listGameVersions',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Game Versions"],
      deprecated: false,
    ),
  });

  ///Get Default Game Version
  Future<chopper.Response<ApiGameVersionsDefaultGet$Response>>
  apiGameVersionsDefaultGet() {
    generatedMapping.putIfAbsent(
      ApiGameVersionsDefaultGet$Response,
      () => ApiGameVersionsDefaultGet$Response.fromJsonFactory,
    );

    return _apiGameVersionsDefaultGet();
  }

  ///Get Default Game Version
  @GET(path: '/api/game-versions/default')
  Future<chopper.Response<ApiGameVersionsDefaultGet$Response>>
  _apiGameVersionsDefaultGet({
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns the current default game version. This is the version used by default in version-scoped API queries (see the version query parameter on other endpoints).',
      summary: 'Get Default Game Version',
      operationId: 'getDefaultGameVersion',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Game Versions"],
      deprecated: false,
    ),
  });

  ///Get Game Version
  ///@param identifier Game version code (case-insensitive).
  Future<chopper.Response<ApiGameVersionsIdentifierGet$Response>>
  apiGameVersionsIdentifierGet({required String? identifier}) {
    generatedMapping.putIfAbsent(
      ApiGameVersionsIdentifierGet$Response,
      () => ApiGameVersionsIdentifierGet$Response.fromJsonFactory,
    );

    return _apiGameVersionsIdentifierGet(identifier: identifier);
  }

  ///Get Game Version
  ///@param identifier Game version code (case-insensitive).
  @GET(path: '/api/game-versions/{identifier}')
  Future<chopper.Response<ApiGameVersionsIdentifierGet$Response>>
  _apiGameVersionsIdentifierGet({
    @Path('identifier') required String? identifier,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific game version by its code (case-insensitive). Game versions are used to scope version-aware data endpoints via the `version` query parameter.',
      summary: 'Get Game Version',
      operationId: 'getGameVersion',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Game Versions"],
      deprecated: false,
    ),
  });

  ///In-Game Weapons Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Klaus & Werner`
  ///@param filter[class_name] Partial match on item class name. Example: `behr_sniper_ballistic_01`
  ///@param filter[name] Partial match on item display name. Example: `Arrow`
  ///@param filter[query] Search items by name or class name. Example: `Arrow`
  ///@param filter[size] Exact item size (0-12). Example: `3`
  ///@param filter[grade] Exact item grade (1-7, mapped to A-G). Example: `1`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  Future<chopper.Response<ApiWeaponsGet$Response>> apiWeaponsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterClassName,
    String? filterName,
    String? filterQuery,
    num? filterSize,
    num? filterGrade,
    bool? filterIncludeIrrelevant,
  }) {
    generatedMapping.putIfAbsent(
      ApiWeaponsGet$Response,
      () => ApiWeaponsGet$Response.fromJsonFactory,
    );

    return _apiWeaponsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterClassName: filterClassName,
      filterName: filterName,
      filterQuery: filterQuery,
      filterSize: filterSize,
      filterGrade: filterGrade,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
    );
  }

  ///In-Game Weapons Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Klaus & Werner`
  ///@param filter[class_name] Partial match on item class name. Example: `behr_sniper_ballistic_01`
  ///@param filter[name] Partial match on item display name. Example: `Arrow`
  ///@param filter[query] Search items by name or class name. Example: `Arrow`
  ///@param filter[size] Exact item size (0-12). Example: `3`
  ///@param filter[grade] Exact item grade (1-7, mapped to A-G). Example: `1`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @GET(path: '/api/weapons')
  Future<chopper.Response<ApiWeaponsGet$Response>> _apiWeaponsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[class_name]') String? filterClassName,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[size]') num? filterSize,
    @Query('filter[grade]') num? filterGrade,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/items scoped to FPS weapons (WeaponPersonal type). Results are scoped to the requested or default game version. Returns weapon items with manufacturer, game version, and description data.',
      summary: 'In-Game Weapons Overview',
      operationId: 'listWeapons',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Weapon Attachments Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `ArmaMod`
  ///@param filter[name] Partial match on item display name. Example: `Quell Suppressor2`
  ///@param filter[query] Search items by name or class name. Example: `Quell Suppressor2`
  ///@param filter[size] Exact item size (0-12). Example: `1`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  Future<chopper.Response<ApiWeaponAttachmentsGet$Response>>
  apiWeaponAttachmentsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterName,
    String? filterQuery,
    num? filterSize,
    bool? filterIncludeIrrelevant,
  }) {
    generatedMapping.putIfAbsent(
      ApiWeaponAttachmentsGet$Response,
      () => ApiWeaponAttachmentsGet$Response.fromJsonFactory,
    );

    return _apiWeaponAttachmentsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterName: filterName,
      filterQuery: filterQuery,
      filterSize: filterSize,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
    );
  }

  ///In-Game Weapon Attachments Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `ArmaMod`
  ///@param filter[name] Partial match on item display name. Example: `Quell Suppressor2`
  ///@param filter[query] Search items by name or class name. Example: `Quell Suppressor2`
  ///@param filter[size] Exact item size (0-12). Example: `1`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @GET(path: '/api/weapon-attachments')
  Future<chopper.Response<ApiWeaponAttachmentsGet$Response>>
  _apiWeaponAttachmentsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[size]') num? filterSize,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/items scoped to weapon attachments (WeaponAttachment type, excluding magazines and missiles). Results are scoped to the requested or default game version. Returns attachment items with manufacturer, game version, and description data.',
      summary: 'In-Game Weapon Attachments Overview',
      operationId: 'listWeaponAttachments',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Clothes Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Fiore`
  ///@param filter[name] Partial match on item display name. Example: `Jacket`
  ///@param filter[classification] Partial match on item classification (dot-notation, e.g. FPS.Clothing). (see GET /api/items/filters for valid values). Example: `FPS.Clothing.Torso`
  ///@param filter[query] Search items by name or class name. Example: `Jacket`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  Future<chopper.Response<ApiClothesGet$Response>> apiClothesGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterName,
    String? filterClassification,
    String? filterQuery,
    bool? filterIncludeIrrelevant,
  }) {
    generatedMapping.putIfAbsent(
      ApiClothesGet$Response,
      () => ApiClothesGet$Response.fromJsonFactory,
    );

    return _apiClothesGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterName: filterName,
      filterClassification: filterClassification,
      filterQuery: filterQuery,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
    );
  }

  ///In-Game Clothes Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Fiore`
  ///@param filter[name] Partial match on item display name. Example: `Jacket`
  ///@param filter[classification] Partial match on item classification (dot-notation, e.g. FPS.Clothing). (see GET /api/items/filters for valid values). Example: `FPS.Clothing.Torso`
  ///@param filter[query] Search items by name or class name. Example: `Jacket`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @GET(path: '/api/clothes')
  Future<chopper.Response<ApiClothesGet$Response>> _apiClothesGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[name]') String? filterName,
    @Query('filter[classification]') String? filterClassification,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/items scoped to clothing (FPS.Clothing.* classification). Results are scoped to the requested or default game version. Returns clothing items with manufacturer, game version, and description data.',
      summary: 'In-Game Clothes Overview',
      operationId: 'listClothes',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Armor Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Clark Defense Systems`
  ///@param filter[name] Partial match on item display name. Example: `Core`
  ///@param filter[classification] Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  ///@param filter[query] Search items by name or class name. Example: `Core`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  Future<chopper.Response<ApiArmorGet$Response>> apiArmorGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterName,
    String? filterClassification,
    String? filterQuery,
    bool? filterIncludeIrrelevant,
  }) {
    generatedMapping.putIfAbsent(
      ApiArmorGet$Response,
      () => ApiArmorGet$Response.fromJsonFactory,
    );

    return _apiArmorGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterName: filterName,
      filterClassification: filterClassification,
      filterQuery: filterQuery,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
    );
  }

  ///In-Game Armor Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Clark Defense Systems`
  ///@param filter[name] Partial match on item display name. Example: `Core`
  ///@param filter[classification] Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  ///@param filter[query] Search items by name or class name. Example: `Core`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @GET(path: '/api/armor')
  Future<chopper.Response<ApiArmorGet$Response>> _apiArmorGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[name]') String? filterName,
    @Query('filter[classification]') String? filterClassification,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/items scoped to armor (FPS.Armor.* classification). Results are scoped to the requested or default game version. Returns armor items with manufacturer, game version, and description data.',
      summary: 'In-Game Armor Overview',
      operationId: 'listArmor',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Food Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Consumable`
  ///@param filter[name] Partial match on item display name. Example: `Burger`
  ///@param filter[query] Search items by name or class name. Example: `Burger`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  Future<chopper.Response<ApiFoodGet$Response>> apiFoodGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterName,
    String? filterQuery,
    bool? filterIncludeIrrelevant,
  }) {
    generatedMapping.putIfAbsent(
      ApiFoodGet$Response,
      () => ApiFoodGet$Response.fromJsonFactory,
    );

    return _apiFoodGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterName: filterName,
      filterQuery: filterQuery,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
    );
  }

  ///In-Game Food Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Consumable`
  ///@param filter[name] Partial match on item display name. Example: `Burger`
  ///@param filter[query] Search items by name or class name. Example: `Burger`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @GET(path: '/api/food')
  Future<chopper.Response<ApiFoodGet$Response>> _apiFoodGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/items scoped to food and drink (Food, Bottle, Drink types). Results are scoped to the requested or default game version. Returns consumable items with manufacturer, game version, and description data.',
      summary: 'In-Game Food Overview',
      operationId: 'listFood',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Vehicle Weapons Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  ///@param filter[name] Partial match on item display name. Example: `Cannon`
  ///@param filter[query] Search items by name or class name. Example: `Cannon`
  ///@param filter[size] Exact item size (0-12). Example: `3`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  Future<chopper.Response<ApiVehicleWeaponsGet$Response>> apiVehicleWeaponsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterName,
    String? filterQuery,
    num? filterSize,
    bool? filterIncludeIrrelevant,
  }) {
    generatedMapping.putIfAbsent(
      ApiVehicleWeaponsGet$Response,
      () => ApiVehicleWeaponsGet$Response.fromJsonFactory,
    );

    return _apiVehicleWeaponsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterName: filterName,
      filterQuery: filterQuery,
      filterSize: filterSize,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
    );
  }

  ///In-Game Vehicle Weapons Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  ///@param filter[name] Partial match on item display name. Example: `Cannon`
  ///@param filter[query] Search items by name or class name. Example: `Cannon`
  ///@param filter[size] Exact item size (0-12). Example: `3`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @GET(path: '/api/vehicle-weapons')
  Future<chopper.Response<ApiVehicleWeaponsGet$Response>>
  _apiVehicleWeaponsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[size]') num? filterSize,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/items scoped to vehicle weapons (WeaponGun type). Results are scoped to the requested or default game version. Returns ship weapon items with manufacturer, game version, and description data.',
      summary: 'In-Game Vehicle Weapons Overview',
      operationId: 'listVehicleWeapons',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Vehicle Items Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Aegis Dynamics`
  ///@param filter[name] Partial match on item display name. Example: `Shield`
  ///@param filter[type] Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Cooler`
  ///@param filter[sub_type] Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Default`
  ///@param filter[query] Search items by name or class name. Example: `Shield`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  Future<chopper.Response<ApiVehicleItemsGet$Response>> apiVehicleItemsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterName,
    String? filterType,
    String? filterSubType,
    String? filterQuery,
    bool? filterIncludeIrrelevant,
  }) {
    generatedMapping.putIfAbsent(
      ApiVehicleItemsGet$Response,
      () => ApiVehicleItemsGet$Response.fromJsonFactory,
    );

    return _apiVehicleItemsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterName: filterName,
      filterType: filterType,
      filterSubType: filterSubType,
      filterQuery: filterQuery,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
    );
  }

  ///In-Game Vehicle Items Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Aegis Dynamics`
  ///@param filter[name] Partial match on item display name. Example: `Shield`
  ///@param filter[type] Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Cooler`
  ///@param filter[sub_type] Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Default`
  ///@param filter[query] Search items by name or class name. Example: `Shield`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @GET(path: '/api/vehicle-items')
  Future<chopper.Response<ApiVehicleItemsGet$Response>> _apiVehicleItemsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[name]') String? filterName,
    @Query('filter[type]') String? filterType,
    @Query('filter[sub_type]') String? filterSubType,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/items scoped to vehicle components (coolers, shields, power plants, quantum drives, thrusters, etc.). Results are scoped to the requested or default game version. Returns component items with manufacturer, game version, and description data.',
      summary: 'In-Game Vehicle Items Overview',
      operationId: 'listVehicleItems',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Item Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supports 250+ JSON fields. Examples: name, -grade, weapon.damage.alpha_total, -shield_controller.face_type. Use comma for multiple: grade,-name
  ///@param filter[variants] When false, excludes variant items (base_id IS NOT NULL) and returns only base items. When true or omitted, returns all items including variants.
  ///@param filter[category] Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  ///@param filter[type] Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
  ///@param filter[sub_type] Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  ///@param filter[manufacturer.name] Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
  ///@param filter[class_name] Partial match on item class name. Example: `Controller_Comms`
  ///@param filter[name] Partial match on item display name. Example: `Arrow`
  ///@param filter[query] Search items by name or class name. Example: `helmet`
  ///@param filter[classification] Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  ///@param filter[size] Exact item size (0-12). Example: `3`
  ///@param filter[grade] Exact item grade (1-7, mapped to A-G). Example: `3`
  ///@param filter[class] Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
  ///@param filter[rarity] Item rarity. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Rare`
  ///@param filter[event_source] Event or reward source label. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `IAE`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  ///@param filter[tags] Filter by stdItem.RequiredTags array values. Use when a port has required_tags - matches items whose RequiredTags contain ALL specified values. Accepts comma-separated tags for AND matching. Example: `MISC_Fury_Miru`
  ///@param filter[port_tags] Filter items by RequiredTags compatibility with a port's tags. Accepts comma-separated port tag values. Returns items where any of their RequiredTags appear in the provided tags, OR items with no RequiredTags but whose Tags overlap with the provided tags (e.g. older paint system). Items with no RequiredTags and no overlapping Tags are excluded. Pass the port_tags value from a vehicle hardpoint port. Example: `flight_ready,Ship_Dock_Refuel`
  ///@param filter[vehicle] Scope items to a specific vehicle. Accepts one or more vehicle identity tags (from the vehicle's port_tags field). Returns: (1) universal items with no RequiredTags and not bespoke, (2) bespoke items whose RequiredTags match any provided tag, (3) bespoke items whose bespoke_vehicle_tags match any provided tag. Use on vehicle pages to show only items equippable on that vehicle. Example: `AEGS_Avenger_Base`
  Future<chopper.Response<ApiItemsGet$Response>> apiItemsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    bool? filterVariants,
    String? filterCategory,
    String? filterType,
    String? filterSubType,
    String? filterManufacturer,
    String? filterManufacturerName,
    String? filterClassName,
    String? filterName,
    String? filterQuery,
    String? filterClassification,
    num? filterSize,
    num? filterGrade,
    String? filterClass,
    String? filterRarity,
    String? filterEventSource,
    bool? filterIncludeIrrelevant,
    String? filterTags,
    String? filterPortTags,
    String? filterVehicle,
  }) {
    generatedMapping.putIfAbsent(
      ApiItemsGet$Response,
      () => ApiItemsGet$Response.fromJsonFactory,
    );

    return _apiItemsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterVariants: filterVariants,
      filterCategory: filterCategory,
      filterType: filterType,
      filterSubType: filterSubType,
      filterManufacturer: filterManufacturer,
      filterManufacturerName: filterManufacturerName,
      filterClassName: filterClassName,
      filterName: filterName,
      filterQuery: filterQuery,
      filterClassification: filterClassification,
      filterSize: filterSize,
      filterGrade: filterGrade,
      filterClass: filterClass,
      filterRarity: filterRarity,
      filterEventSource: filterEventSource,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
      filterTags: filterTags,
      filterPortTags: filterPortTags,
      filterVehicle: filterVehicle,
    );
  }

  ///In-Game Item Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supports 250+ JSON fields. Examples: name, -grade, weapon.damage.alpha_total, -shield_controller.face_type. Use comma for multiple: grade,-name
  ///@param filter[variants] When false, excludes variant items (base_id IS NOT NULL) and returns only base items. When true or omitted, returns all items including variants.
  ///@param filter[category] Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  ///@param filter[type] Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
  ///@param filter[sub_type] Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  ///@param filter[manufacturer.name] Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
  ///@param filter[class_name] Partial match on item class name. Example: `Controller_Comms`
  ///@param filter[name] Partial match on item display name. Example: `Arrow`
  ///@param filter[query] Search items by name or class name. Example: `helmet`
  ///@param filter[classification] Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  ///@param filter[size] Exact item size (0-12). Example: `3`
  ///@param filter[grade] Exact item grade (1-7, mapped to A-G). Example: `3`
  ///@param filter[class] Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
  ///@param filter[rarity] Item rarity. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Rare`
  ///@param filter[event_source] Event or reward source label. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `IAE`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  ///@param filter[tags] Filter by stdItem.RequiredTags array values. Use when a port has required_tags - matches items whose RequiredTags contain ALL specified values. Accepts comma-separated tags for AND matching. Example: `MISC_Fury_Miru`
  ///@param filter[port_tags] Filter items by RequiredTags compatibility with a port's tags. Accepts comma-separated port tag values. Returns items where any of their RequiredTags appear in the provided tags, OR items with no RequiredTags but whose Tags overlap with the provided tags (e.g. older paint system). Items with no RequiredTags and no overlapping Tags are excluded. Pass the port_tags value from a vehicle hardpoint port. Example: `flight_ready,Ship_Dock_Refuel`
  ///@param filter[vehicle] Scope items to a specific vehicle. Accepts one or more vehicle identity tags (from the vehicle's port_tags field). Returns: (1) universal items with no RequiredTags and not bespoke, (2) bespoke items whose RequiredTags match any provided tag, (3) bespoke items whose bespoke_vehicle_tags match any provided tag. Use on vehicle pages to show only items equippable on that vehicle. Example: `AEGS_Avenger_Base`
  @GET(path: '/api/items')
  Future<chopper.Response<ApiItemsGet$Response>> _apiItemsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[variants]') bool? filterVariants,
    @Query('filter[category]') String? filterCategory,
    @Query('filter[type]') String? filterType,
    @Query('filter[sub_type]') String? filterSubType,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[manufacturer.name]') String? filterManufacturerName,
    @Query('filter[class_name]') String? filterClassName,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[classification]') String? filterClassification,
    @Query('filter[size]') num? filterSize,
    @Query('filter[grade]') num? filterGrade,
    @Query('filter[class]') String? filterClass,
    @Query('filter[rarity]') String? filterRarity,
    @Query('filter[event_source]') String? filterEventSource,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @Query('filter[tags]') String? filterTags,
    @Query('filter[port_tags]') String? filterPortTags,
    @Query('filter[vehicle]') String? filterVehicle,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated in-game items for the requested category and game version. Always includes manufacturer, game version, and description data. Crafting blueprints are loaded automatically. Supports filtering by type, classification, manufacturer, size, grade, and more. Available includes: shops, variants, related_items, blueprints, vehicles, shops.items. Supports 150+ JSON field sorts. (see GET /api/items/filters for valid filter values)',
      summary: 'In-Game Item Overview',
      operationId: 'listItems',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Weapon Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiWeaponsIdentifierGet$Response>>
  apiWeaponsIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiWeaponsIdentifierGet$Response,
      () => ApiWeaponsIdentifierGet$Response.fromJsonFactory,
    );

    return _apiWeaponsIdentifierGet(
      identifier: identifier,
      locale: locale,
      include: include,
      version: version,
    );
  }

  ///In-Game Weapon Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/weapons/{identifier}')
  Future<chopper.Response<ApiWeaponsIdentifierGet$Response>>
  _apiWeaponsIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific FPS weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
      summary: 'In-Game Weapon Detail',
      operationId: 'getWeapon',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Weapon Attachment Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiWeaponAttachmentsIdentifierGet$Response>>
  apiWeaponAttachmentsIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiWeaponAttachmentsIdentifierGet$Response,
      () => ApiWeaponAttachmentsIdentifierGet$Response.fromJsonFactory,
    );

    return _apiWeaponAttachmentsIdentifierGet(
      identifier: identifier,
      locale: locale,
      include: include,
      version: version,
    );
  }

  ///In-Game Weapon Attachment Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/weapon-attachments/{identifier}')
  Future<chopper.Response<ApiWeaponAttachmentsIdentifierGet$Response>>
  _apiWeaponAttachmentsIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific weapon attachment by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapon attachments. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
      summary: 'In-Game Weapon Attachment Detail',
      operationId: 'getWeaponAttachment',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Clothing Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiClothesIdentifierGet$Response>>
  apiClothesIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiClothesIdentifierGet$Response,
      () => ApiClothesIdentifierGet$Response.fromJsonFactory,
    );

    return _apiClothesIdentifierGet(
      identifier: identifier,
      locale: locale,
      include: include,
      version: version,
    );
  }

  ///In-Game Clothing Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/clothes/{identifier}')
  Future<chopper.Response<ApiClothesIdentifierGet$Response>>
  _apiClothesIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific clothing item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to clothing. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
      summary: 'In-Game Clothing Detail',
      operationId: 'getClothingItem',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Armor Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiArmorIdentifierGet$Response>>
  apiArmorIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiArmorIdentifierGet$Response,
      () => ApiArmorIdentifierGet$Response.fromJsonFactory,
    );

    return _apiArmorIdentifierGet(
      identifier: identifier,
      locale: locale,
      include: include,
      version: version,
    );
  }

  ///In-Game Armor Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/armor/{identifier}')
  Future<chopper.Response<ApiArmorIdentifierGet$Response>>
  _apiArmorIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific armor item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to armor. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
      summary: 'In-Game Armor Detail',
      operationId: 'getArmor',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Food Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiFoodIdentifierGet$Response>> apiFoodIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiFoodIdentifierGet$Response,
      () => ApiFoodIdentifierGet$Response.fromJsonFactory,
    );

    return _apiFoodIdentifierGet(
      identifier: identifier,
      locale: locale,
      include: include,
      version: version,
    );
  }

  ///In-Game Food Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/food/{identifier}')
  Future<chopper.Response<ApiFoodIdentifierGet$Response>>
  _apiFoodIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific food or drink item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to food. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
      summary: 'In-Game Food Detail',
      operationId: 'getFood',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Vehicle Weapon Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiVehicleWeaponsIdentifierGet$Response>>
  apiVehicleWeaponsIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiVehicleWeaponsIdentifierGet$Response,
      () => ApiVehicleWeaponsIdentifierGet$Response.fromJsonFactory,
    );

    return _apiVehicleWeaponsIdentifierGet(
      identifier: identifier,
      locale: locale,
      include: include,
      version: version,
    );
  }

  ///In-Game Vehicle Weapon Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/vehicle-weapons/{identifier}')
  Future<chopper.Response<ApiVehicleWeaponsIdentifierGet$Response>>
  _apiVehicleWeaponsIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific vehicle weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
      summary: 'In-Game Vehicle Weapon Detail',
      operationId: 'getVehicleWeapon',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Vehicle Item Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiVehicleItemsIdentifierGet$Response>>
  apiVehicleItemsIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiVehicleItemsIdentifierGet$Response,
      () => ApiVehicleItemsIdentifierGet$Response.fromJsonFactory,
    );

    return _apiVehicleItemsIdentifierGet(
      identifier: identifier,
      locale: locale,
      include: include,
      version: version,
    );
  }

  ///In-Game Vehicle Item Detail
  ///@param identifier Item name or UUID
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/vehicle-items/{identifier}')
  Future<chopper.Response<ApiVehicleItemsIdentifierGet$Response>>
  _apiVehicleItemsIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific vehicle component by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle items. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
      summary: 'In-Game Vehicle Item Detail',
      operationId: 'getVehicleItem',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Item Detail
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated relationships to include. Available: blueprints (full crafting blueprint data including ingredients, missions, tiers), variants (item variants), related_items (related items from variant groups and sets), vehicles (vehicles this item is installed on), shops (shop availability data), shops.items (shop items).
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param identifier Item name, slug, class name, or UUID
  Future<chopper.Response<ApiItemsIdentifierGet$Response>>
  apiItemsIdentifierGet({
    String? locale,
    String? include,
    String? version,
    required String? identifier,
  }) {
    generatedMapping.putIfAbsent(
      ApiItemsIdentifierGet$Response,
      () => ApiItemsIdentifierGet$Response.fromJsonFactory,
    );

    return _apiItemsIdentifierGet(
      locale: locale,
      include: include,
      version: version,
      identifier: identifier,
    );
  }

  ///In-Game Item Detail
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated relationships to include. Available: blueprints (full crafting blueprint data including ingredients, missions, tiers), variants (item variants), related_items (related items from variant groups and sets), vehicles (vehicles this item is installed on), shops (shop availability data), shops.items (shop items).
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param identifier Item name, slug, class name, or UUID
  @GET(path: '/api/items/{identifier}')
  Future<chopper.Response<ApiItemsIdentifierGet$Response>>
  _apiItemsIdentifierGet({
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('version') String? version,
    @Path('identifier') required String? identifier,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a specific item by UUID, slug, name, or class name (case-insensitive). Results are scoped to the requested or default game version. Always includes manufacturer, game version, description data, entity tags, commodities, and variant group data. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items. Items with a matching vehicle record automatically redirect to GET /api/vehicles/{uuid}.',
      summary: 'In-Game Item Detail',
      operationId: 'getItem',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Item Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[variants] When false, excludes variant items and returns only base items. When true or omitted, returns all items.
  ///@param filter[category] Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  ///@param filter[type] Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
  ///@param filter[sub_type] Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  ///@param filter[manufacturer.name] Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
  ///@param filter[class_name] Partial match on item class name. Example: `MGA_Assault`
  ///@param filter[name] Partial match on item display name. Example: `Arrow`
  ///@param filter[classification] Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  ///@param filter[size] Exact item size (0-12). Example: `3`
  ///@param filter[grade] Exact item grade (1-7, mapped to A-G). Example: `3`
  ///@param filter[class] Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @deprecated
  Future<chopper.Response<ApiItemsSearchPost$Response>> apiItemsSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? locale,
    String? include,
    String? sort,
    bool? filterVariants,
    String? filterCategory,
    String? filterType,
    String? filterSubType,
    String? filterManufacturer,
    String? filterManufacturerName,
    String? filterClassName,
    String? filterName,
    String? filterClassification,
    num? filterSize,
    num? filterGrade,
    String? filterClass,
    bool? filterIncludeIrrelevant,
    required Object? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiItemsSearchPost$Response,
      () => ApiItemsSearchPost$Response.fromJsonFactory,
    );

    return _apiItemsSearchPost(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      locale: locale,
      include: include,
      sort: sort,
      filterVariants: filterVariants,
      filterCategory: filterCategory,
      filterType: filterType,
      filterSubType: filterSubType,
      filterManufacturer: filterManufacturer,
      filterManufacturerName: filterManufacturerName,
      filterClassName: filterClassName,
      filterName: filterName,
      filterClassification: filterClassification,
      filterSize: filterSize,
      filterGrade: filterGrade,
      filterClass: filterClass,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
      body: body,
    );
  }

  ///In-Game Item Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[variants] When false, excludes variant items and returns only base items. When true or omitted, returns all items.
  ///@param filter[category] Item category to scope results. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  ///@param filter[type] Exact match on item type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `WeaponPersonal`
  ///@param filter[sub_type] Exact match on item sub-type. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Barrel`
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `KnightBridge Arms`
  ///@param filter[manufacturer.name] Same as filter[manufacturer]. Accepts comma-separated values for OR matching. Example: `Anvil Aerospace`
  ///@param filter[class_name] Partial match on item class name. Example: `MGA_Assault`
  ///@param filter[name] Partial match on item display name. Example: `Arrow`
  ///@param filter[classification] Partial match on item classification (dot-notation, e.g. FPS.Armor). (see GET /api/items/filters for valid values). Example: `FPS.Armor.Torso`
  ///@param filter[size] Exact item size (0-12). Example: `3`
  ///@param filter[grade] Exact item grade (1-7, mapped to A-G). Example: `3`
  ///@param filter[class] Exact match on item class. Accepts comma-separated values for OR matching. (see GET /api/items/filters for valid values). Example: `Military`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @deprecated
  @POST(path: '/api/items/search', optionalBody: true)
  Future<chopper.Response<ApiItemsSearchPost$Response>> _apiItemsSearchPost({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('locale') String? locale,
    @Query('include') String? include,
    @Query('sort') String? sort,
    @Query('filter[variants]') bool? filterVariants,
    @Query('filter[category]') String? filterCategory,
    @Query('filter[type]') String? filterType,
    @Query('filter[sub_type]') String? filterSubType,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[manufacturer.name]') String? filterManufacturerName,
    @Query('filter[class_name]') String? filterClassName,
    @Query('filter[name]') String? filterName,
    @Query('filter[classification]') String? filterClassification,
    @Query('filter[size]') num? filterSize,
    @Query('filter[grade]') num? filterGrade,
    @Query('filter[class]') String? filterClass,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @Body() required Object? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/items?filter[name]={value} for name search. Note: OR search across name/uuid/type is no longer supported. This endpoint will be removed in a future version.',
      summary: 'In-Game Item Search (Deprecated)',
      operationId: 'searchItemsDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items", "Search"],
      deprecated: true,
    ),
  });

  ///In-Game Item Filters
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param filter[variants] When false, facets are computed excluding variant items. When true or omitted, all items are included.
  ///@param filter[category] Item category to scope facets. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  ///@param filter[type] Narrow facets to items matching this type. Example: `WeaponPersonal`
  ///@param filter[sub_type] Narrow facets to items matching this sub-type. Example: `Barrel`
  ///@param filter[manufacturer] Narrow facets to items from this manufacturer. Example: `KnightBridge Arms`
  ///@param filter[manufacturer.name] Same as filter[manufacturer]. Example: `Anvil Aerospace`
  ///@param filter[class_name] Narrow facets to items with matching class name. Example: `MGA_Assault`
  ///@param filter[name] Narrow facets to items with matching name. Example: `Arrow`
  ///@param filter[query] Narrow facets to items matching name or class name. Example: `Arrow`
  ///@param filter[classification] Narrow facets to items with matching classification. Example: `FPS.Armor.Torso`
  ///@param filter[size] Narrow facets to items with this size. Example: `3`
  ///@param filter[grade] Narrow facets to items with this grade. Example: `3`
  ///@param filter[class] Narrow facets to items with this class. Example: `Military`
  ///@param filter[rarity] Narrow facets to items with this rarity. Example: `Rare`
  ///@param filter[event_source] Narrow facets to items with this event or reward source. Example: `IAE`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  Future<chopper.Response<ApiItemsFiltersGet$Response>> apiItemsFiltersGet({
    String? version,
    bool? filterVariants,
    String? filterCategory,
    String? filterType,
    String? filterSubType,
    String? filterManufacturer,
    String? filterManufacturerName,
    String? filterClassName,
    String? filterName,
    String? filterQuery,
    String? filterClassification,
    num? filterSize,
    num? filterGrade,
    String? filterClass,
    String? filterRarity,
    String? filterEventSource,
    bool? filterIncludeIrrelevant,
  }) {
    generatedMapping.putIfAbsent(
      ApiItemsFiltersGet$Response,
      () => ApiItemsFiltersGet$Response.fromJsonFactory,
    );

    return _apiItemsFiltersGet(
      version: version,
      filterVariants: filterVariants,
      filterCategory: filterCategory,
      filterType: filterType,
      filterSubType: filterSubType,
      filterManufacturer: filterManufacturer,
      filterManufacturerName: filterManufacturerName,
      filterClassName: filterClassName,
      filterName: filterName,
      filterQuery: filterQuery,
      filterClassification: filterClassification,
      filterSize: filterSize,
      filterGrade: filterGrade,
      filterClass: filterClass,
      filterRarity: filterRarity,
      filterEventSource: filterEventSource,
      filterIncludeIrrelevant: filterIncludeIrrelevant,
    );
  }

  ///In-Game Item Filters
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param filter[variants] When false, facets are computed excluding variant items. When true or omitted, all items are included.
  ///@param filter[category] Item category to scope facets. Accepts: weapons, weapon-attachments, clothes, armor, food, medical, mining-modifiers, fps-items, vehicle-weapons, vehicle-items, vehicle-flair-items, vehicle-components. Example: `weapons`
  ///@param filter[type] Narrow facets to items matching this type. Example: `WeaponPersonal`
  ///@param filter[sub_type] Narrow facets to items matching this sub-type. Example: `Barrel`
  ///@param filter[manufacturer] Narrow facets to items from this manufacturer. Example: `KnightBridge Arms`
  ///@param filter[manufacturer.name] Same as filter[manufacturer]. Example: `Anvil Aerospace`
  ///@param filter[class_name] Narrow facets to items with matching class name. Example: `MGA_Assault`
  ///@param filter[name] Narrow facets to items with matching name. Example: `Arrow`
  ///@param filter[query] Narrow facets to items matching name or class name. Example: `Arrow`
  ///@param filter[classification] Narrow facets to items with matching classification. Example: `FPS.Armor.Torso`
  ///@param filter[size] Narrow facets to items with this size. Example: `3`
  ///@param filter[grade] Narrow facets to items with this grade. Example: `3`
  ///@param filter[class] Narrow facets to items with this class. Example: `Military`
  ///@param filter[rarity] Narrow facets to items with this rarity. Example: `Rare`
  ///@param filter[event_source] Narrow facets to items with this event or reward source. Example: `IAE`
  ///@param filter[include_irrelevant] When set to true, includes items flagged as not player-relevant (test, placeholder, dev items). Default shows only relevant items.
  @GET(path: '/api/items/filters')
  Future<chopper.Response<ApiItemsFiltersGet$Response>> _apiItemsFiltersGet({
    @Query('version') String? version,
    @Query('filter[variants]') bool? filterVariants,
    @Query('filter[category]') String? filterCategory,
    @Query('filter[type]') String? filterType,
    @Query('filter[sub_type]') String? filterSubType,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[manufacturer.name]') String? filterManufacturerName,
    @Query('filter[class_name]') String? filterClassName,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[classification]') String? filterClassification,
    @Query('filter[size]') num? filterSize,
    @Query('filter[grade]') num? filterGrade,
    @Query('filter[class]') String? filterClass,
    @Query('filter[rarity]') String? filterRarity,
    @Query('filter[event_source]') String? filterEventSource,
    @Query('filter[include_irrelevant]') bool? filterIncludeIrrelevant,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns available filter facet values for in-game items, grouped by field with occurrence counts. Applying other filters narrows the facet results. Use these values as filter[*] parameters on GET /api/items. Scoped to the default item category unless filter[category] is specified.',
      summary: 'In-Game Item Filters',
      operationId: 'listItemFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Items"],
      deprecated: false,
    ),
  });

  ///In-Game Manufacturers Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[name] Partial match on manufacturer name
  Future<chopper.Response<ApiManufacturersGet$Response>> apiManufacturersGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterName,
  }) {
    generatedMapping.putIfAbsent(
      ApiManufacturersGet$Response,
      () => ApiManufacturersGet$Response.fromJsonFactory,
    );

    return _apiManufacturersGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterName: filterName,
    );
  }

  ///In-Game Manufacturers Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[name] Partial match on manufacturer name
  @GET(path: '/api/manufacturers')
  Future<chopper.Response<ApiManufacturersGet$Response>> _apiManufacturersGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[name]') String? filterName,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated manufacturers grouped by name with optional pagination.',
      summary: 'In-Game Manufacturers Overview',
      operationId: 'listManufacturers',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Manufacturers"],
      deprecated: false,
    ),
  });

  ///In-Game Manufacturer Detail
  ///@param manufacturer Manufacturer name, uuid, or code
  Future<chopper.Response<ApiManufacturersManufacturerGet$Response>>
  apiManufacturersManufacturerGet({required String? manufacturer}) {
    generatedMapping.putIfAbsent(
      ApiManufacturersManufacturerGet$Response,
      () => ApiManufacturersManufacturerGet$Response.fromJsonFactory,
    );

    return _apiManufacturersManufacturerGet(manufacturer: manufacturer);
  }

  ///In-Game Manufacturer Detail
  ///@param manufacturer Manufacturer name, uuid, or code
  @GET(path: '/api/manufacturers/{manufacturer}')
  Future<chopper.Response<ApiManufacturersManufacturerGet$Response>>
  _apiManufacturersManufacturerGet({
    @Path('manufacturer') required String? manufacturer,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a manufacturer by name, UUID, or code together with its products.',
      summary: 'In-Game Manufacturer Detail',
      operationId: 'getManufacturer',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Manufacturers"],
      deprecated: false,
    ),
  });

  ///In-Game Manufacturer Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  Future<chopper.Response<ApiManufacturersSearchPost$Response>>
  apiManufacturersSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required Object? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiManufacturersSearchPost$Response,
      () => ApiManufacturersSearchPost$Response.fromJsonFactory,
    );

    return _apiManufacturersSearchPost(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      body: body,
    );
  }

  ///In-Game Manufacturer Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  @POST(path: '/api/manufacturers/search', optionalBody: true)
  Future<chopper.Response<ApiManufacturersSearchPost$Response>>
  _apiManufacturersSearchPost({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Body() required Object? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/manufacturers?filter[name]={value} for name search. This endpoint will be removed in a future version.',
      summary: 'In-Game Manufacturer Search (Deprecated)',
      operationId: 'searchManufacturersDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Manufacturers", "Search"],
      deprecated: true,
    ),
  });

  ///List Game Missions
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supported: title, mission_giver, rank_index, reward_min, reward_max, time_to_complete_minutes, max_players_per_instance, reputation_amount.
  ///@param filter[mission_giver] Exact match on the mission giver NPC name. Example: `Citizens for Prosperity`
  ///@param filter[faction] Filter by faction name. Accepts comma-separated values. Example: `Headhunters`
  ///@param filter[star_system] Filter by star system name. Example: `Stanton`
  ///@param filter[illegal] Filter for missions marked as illegal. Example: `true`
  ///@param filter[shareable] Filter for shareable missions. Example: `true`
  ///@param filter[once_only] Filter for one-time-only missions. Example: `true`
  ///@param filter[available_in_prison] Filter for missions available while in prison. Example: `true`
  ///@param filter[has_combat] Filter for missions involving combat encounters. Example: `true`
  ///@param filter[has_defend_objective] Filter for missions with a defend objective. Example: `true`
  ///@param filter[rank_index] Filter by mission difficulty rank. Example: `1`
  ///@param filter[has_prerequisites] Filter for missions that have prerequisite requirements. Example: `true`
  ///@param filter[min_enemies] Minimum enemy count threshold. Example: `3`
  ///@param filter[max_enemies] Maximum enemy count threshold. Example: `10`
  ///@param filter[reward_min] Minimum reward in aUEC. Example: `5000`
  ///@param filter[reward_max] Maximum reward in aUEC. Example: `50000`
  ///@param filter[title] Partial match on mission title. Example: `Delivery`
  ///@param filter[description] Partial match on mission description. Example: `combat`
  ///@param filter[query] Search across title, description, and debug name. Example: `delivery`
  ///@param filter[reward_scope] Mission category scope. Example: `Bounty Hunter`
  ///@param filter[has_blueprints] Filter for missions that reward blueprints. Example: `true`
  ///@param filter[reputation_scope] Reputation reward scope from ReputationGained data. Example: `FactionReputation`
  ///@param filter[blueprint_name] Filter by crafted item name from mission blueprint rewards. Example: `Arclight Pistol`
  ///@param filter[location] Filter by starmap location UUID. Example: `2bf56608-62ea-4d1a-9e9b-38377004dc1b`
  ///@param filter[grouped] Control mission variant grouping. Defaults to true (grouped) when no filters are active, false (ungrouped) when filters are active. Set explicitly to true to keep grouping with filters, or false to always ungroup.
  Future<chopper.Response<ApiMissionsGet$Response>> apiMissionsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? version,
    String? sort,
    String? filterMissionGiver,
    String? filterFaction,
    String? filterStarSystem,
    bool? filterIllegal,
    bool? filterShareable,
    bool? filterOnceOnly,
    bool? filterAvailableInPrison,
    bool? filterHasCombat,
    bool? filterHasDefendObjective,
    int? filterRankIndex,
    bool? filterHasPrerequisites,
    int? filterMinEnemies,
    int? filterMaxEnemies,
    int? filterRewardMin,
    int? filterRewardMax,
    String? filterTitle,
    String? filterDescription,
    String? filterQuery,
    String? filterRewardScope,
    bool? filterHasBlueprints,
    String? filterReputationScope,
    String? filterBlueprintName,
    String? filterLocation,
    bool? filterGrouped,
  }) {
    generatedMapping.putIfAbsent(
      ApiMissionsGet$Response,
      () => ApiMissionsGet$Response.fromJsonFactory,
    );

    return _apiMissionsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      version: version,
      sort: sort,
      filterMissionGiver: filterMissionGiver,
      filterFaction: filterFaction,
      filterStarSystem: filterStarSystem,
      filterIllegal: filterIllegal,
      filterShareable: filterShareable,
      filterOnceOnly: filterOnceOnly,
      filterAvailableInPrison: filterAvailableInPrison,
      filterHasCombat: filterHasCombat,
      filterHasDefendObjective: filterHasDefendObjective,
      filterRankIndex: filterRankIndex,
      filterHasPrerequisites: filterHasPrerequisites,
      filterMinEnemies: filterMinEnemies,
      filterMaxEnemies: filterMaxEnemies,
      filterRewardMin: filterRewardMin,
      filterRewardMax: filterRewardMax,
      filterTitle: filterTitle,
      filterDescription: filterDescription,
      filterQuery: filterQuery,
      filterRewardScope: filterRewardScope,
      filterHasBlueprints: filterHasBlueprints,
      filterReputationScope: filterReputationScope,
      filterBlueprintName: filterBlueprintName,
      filterLocation: filterLocation,
      filterGrouped: filterGrouped,
    );
  }

  ///List Game Missions
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supported: title, mission_giver, rank_index, reward_min, reward_max, time_to_complete_minutes, max_players_per_instance, reputation_amount.
  ///@param filter[mission_giver] Exact match on the mission giver NPC name. Example: `Citizens for Prosperity`
  ///@param filter[faction] Filter by faction name. Accepts comma-separated values. Example: `Headhunters`
  ///@param filter[star_system] Filter by star system name. Example: `Stanton`
  ///@param filter[illegal] Filter for missions marked as illegal. Example: `true`
  ///@param filter[shareable] Filter for shareable missions. Example: `true`
  ///@param filter[once_only] Filter for one-time-only missions. Example: `true`
  ///@param filter[available_in_prison] Filter for missions available while in prison. Example: `true`
  ///@param filter[has_combat] Filter for missions involving combat encounters. Example: `true`
  ///@param filter[has_defend_objective] Filter for missions with a defend objective. Example: `true`
  ///@param filter[rank_index] Filter by mission difficulty rank. Example: `1`
  ///@param filter[has_prerequisites] Filter for missions that have prerequisite requirements. Example: `true`
  ///@param filter[min_enemies] Minimum enemy count threshold. Example: `3`
  ///@param filter[max_enemies] Maximum enemy count threshold. Example: `10`
  ///@param filter[reward_min] Minimum reward in aUEC. Example: `5000`
  ///@param filter[reward_max] Maximum reward in aUEC. Example: `50000`
  ///@param filter[title] Partial match on mission title. Example: `Delivery`
  ///@param filter[description] Partial match on mission description. Example: `combat`
  ///@param filter[query] Search across title, description, and debug name. Example: `delivery`
  ///@param filter[reward_scope] Mission category scope. Example: `Bounty Hunter`
  ///@param filter[has_blueprints] Filter for missions that reward blueprints. Example: `true`
  ///@param filter[reputation_scope] Reputation reward scope from ReputationGained data. Example: `FactionReputation`
  ///@param filter[blueprint_name] Filter by crafted item name from mission blueprint rewards. Example: `Arclight Pistol`
  ///@param filter[location] Filter by starmap location UUID. Example: `2bf56608-62ea-4d1a-9e9b-38377004dc1b`
  ///@param filter[grouped] Control mission variant grouping. Defaults to true (grouped) when no filters are active, false (ungrouped) when filters are active. Set explicitly to true to keep grouping with filters, or false to always ungroup.
  @GET(path: '/api/missions')
  Future<chopper.Response<ApiMissionsGet$Response>> _apiMissionsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[mission_giver]') String? filterMissionGiver,
    @Query('filter[faction]') String? filterFaction,
    @Query('filter[star_system]') String? filterStarSystem,
    @Query('filter[illegal]') bool? filterIllegal,
    @Query('filter[shareable]') bool? filterShareable,
    @Query('filter[once_only]') bool? filterOnceOnly,
    @Query('filter[available_in_prison]') bool? filterAvailableInPrison,
    @Query('filter[has_combat]') bool? filterHasCombat,
    @Query('filter[has_defend_objective]') bool? filterHasDefendObjective,
    @Query('filter[rank_index]') int? filterRankIndex,
    @Query('filter[has_prerequisites]') bool? filterHasPrerequisites,
    @Query('filter[min_enemies]') int? filterMinEnemies,
    @Query('filter[max_enemies]') int? filterMaxEnemies,
    @Query('filter[reward_min]') int? filterRewardMin,
    @Query('filter[reward_max]') int? filterRewardMax,
    @Query('filter[title]') String? filterTitle,
    @Query('filter[description]') String? filterDescription,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[reward_scope]') String? filterRewardScope,
    @Query('filter[has_blueprints]') bool? filterHasBlueprints,
    @Query('filter[reputation_scope]') String? filterReputationScope,
    @Query('filter[blueprint_name]') String? filterBlueprintName,
    @Query('filter[location]') String? filterLocation,
    @Query('filter[grouped]') bool? filterGrouped,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated missions for the requested or default game version. Results are grouped by mission variant key by default. Grouping is automatically disabled when filters are active unless filter[grouped]=true is set explicitly. Includes mission, game version, faction, and blueprint relationships.',
      summary: 'List Game Missions',
      operationId: 'listMissions',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Missions"],
      deprecated: false,
    ),
  });

  ///Get Mission Detail
  ///@param mission Mission slug or UUID
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiMissionsMissionGet$Response>>
  apiMissionsMissionGet({required String? mission, String? version}) {
    generatedMapping.putIfAbsent(
      ApiMissionsMissionGet$Response,
      () => ApiMissionsMissionGet$Response.fromJsonFactory,
    );

    return _apiMissionsMissionGet(mission: mission, version: version);
  }

  ///Get Mission Detail
  ///@param mission Mission slug or UUID
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/missions/{mission}')
  Future<chopper.Response<ApiMissionsMissionGet$Response>>
  _apiMissionsMissionGet({
    @Path('mission') required String? mission,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns full details for a single mission, including chain relationships and associated items. Results are scoped to the requested or default game version.',
      summary: 'Get Mission Detail',
      operationId: 'getMission',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Missions"],
      deprecated: false,
    ),
  });

  ///Get Mission Filter Options
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param filter[include_unreleased] Include unreleased and work-in-progress missions
  ///@param filter[mission_giver] Exact match on the mission giver NPC name. (see GET /api/missions/filters for valid values)
  ///@param filter[faction] Filter by faction name. Accepts comma-separated values. (see GET /api/missions/filters for valid values)
  ///@param filter[star_system] Filter by star system name. (see GET /api/missions/filters for valid values)
  ///@param filter[illegal] Filter for missions marked as illegal
  ///@param filter[shareable] Filter for shareable missions
  ///@param filter[once_only] Filter for one-time-only missions
  ///@param filter[available_in_prison] Filter for missions available while in prison
  ///@param filter[has_combat] Filter for missions involving combat encounters
  ///@param filter[has_defend_objective] Filter for missions with a defend objective
  ///@param filter[rank_index] Filter by mission difficulty rank
  ///@param filter[has_prerequisites] Filter for missions that have prerequisite requirements
  ///@param filter[min_enemies] Minimum enemy count threshold
  ///@param filter[max_enemies] Maximum enemy count threshold
  ///@param filter[reward_min] Minimum reward in aUEC
  ///@param filter[reward_max] Maximum reward in aUEC
  ///@param filter[title] Partial match on mission title
  ///@param filter[description] Partial match on mission description
  ///@param filter[query] Search across title, description, and debug name
  ///@param filter[reward_scope] Mission category scope. (see GET /api/missions/filters for valid values)
  ///@param filter[has_blueprints] Filter for missions that reward blueprints
  ///@param filter[blueprint_name] Filter by crafted item name from mission blueprint rewards. (see GET /api/missions/filters for valid values)
  ///@param filter[reputation_scope] Reputation reward scope from ReputationGained data. (see GET /api/missions/filters for valid values)
  ///@param filter[location] Filter by starmap location UUID
  Future<chopper.Response<ApiMissionsFiltersGet$Response>>
  apiMissionsFiltersGet({
    String? version,
    bool? filterIncludeUnreleased,
    String? filterMissionGiver,
    String? filterFaction,
    String? filterStarSystem,
    bool? filterIllegal,
    bool? filterShareable,
    bool? filterOnceOnly,
    bool? filterAvailableInPrison,
    bool? filterHasCombat,
    bool? filterHasDefendObjective,
    int? filterRankIndex,
    bool? filterHasPrerequisites,
    int? filterMinEnemies,
    int? filterMaxEnemies,
    int? filterRewardMin,
    int? filterRewardMax,
    String? filterTitle,
    String? filterDescription,
    String? filterQuery,
    String? filterRewardScope,
    bool? filterHasBlueprints,
    String? filterBlueprintName,
    String? filterReputationScope,
    String? filterLocation,
  }) {
    generatedMapping.putIfAbsent(
      ApiMissionsFiltersGet$Response,
      () => ApiMissionsFiltersGet$Response.fromJsonFactory,
    );

    return _apiMissionsFiltersGet(
      version: version,
      filterIncludeUnreleased: filterIncludeUnreleased,
      filterMissionGiver: filterMissionGiver,
      filterFaction: filterFaction,
      filterStarSystem: filterStarSystem,
      filterIllegal: filterIllegal,
      filterShareable: filterShareable,
      filterOnceOnly: filterOnceOnly,
      filterAvailableInPrison: filterAvailableInPrison,
      filterHasCombat: filterHasCombat,
      filterHasDefendObjective: filterHasDefendObjective,
      filterRankIndex: filterRankIndex,
      filterHasPrerequisites: filterHasPrerequisites,
      filterMinEnemies: filterMinEnemies,
      filterMaxEnemies: filterMaxEnemies,
      filterRewardMin: filterRewardMin,
      filterRewardMax: filterRewardMax,
      filterTitle: filterTitle,
      filterDescription: filterDescription,
      filterQuery: filterQuery,
      filterRewardScope: filterRewardScope,
      filterHasBlueprints: filterHasBlueprints,
      filterBlueprintName: filterBlueprintName,
      filterReputationScope: filterReputationScope,
      filterLocation: filterLocation,
    );
  }

  ///Get Mission Filter Options
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param filter[include_unreleased] Include unreleased and work-in-progress missions
  ///@param filter[mission_giver] Exact match on the mission giver NPC name. (see GET /api/missions/filters for valid values)
  ///@param filter[faction] Filter by faction name. Accepts comma-separated values. (see GET /api/missions/filters for valid values)
  ///@param filter[star_system] Filter by star system name. (see GET /api/missions/filters for valid values)
  ///@param filter[illegal] Filter for missions marked as illegal
  ///@param filter[shareable] Filter for shareable missions
  ///@param filter[once_only] Filter for one-time-only missions
  ///@param filter[available_in_prison] Filter for missions available while in prison
  ///@param filter[has_combat] Filter for missions involving combat encounters
  ///@param filter[has_defend_objective] Filter for missions with a defend objective
  ///@param filter[rank_index] Filter by mission difficulty rank
  ///@param filter[has_prerequisites] Filter for missions that have prerequisite requirements
  ///@param filter[min_enemies] Minimum enemy count threshold
  ///@param filter[max_enemies] Maximum enemy count threshold
  ///@param filter[reward_min] Minimum reward in aUEC
  ///@param filter[reward_max] Maximum reward in aUEC
  ///@param filter[title] Partial match on mission title
  ///@param filter[description] Partial match on mission description
  ///@param filter[query] Search across title, description, and debug name
  ///@param filter[reward_scope] Mission category scope. (see GET /api/missions/filters for valid values)
  ///@param filter[has_blueprints] Filter for missions that reward blueprints
  ///@param filter[blueprint_name] Filter by crafted item name from mission blueprint rewards. (see GET /api/missions/filters for valid values)
  ///@param filter[reputation_scope] Reputation reward scope from ReputationGained data. (see GET /api/missions/filters for valid values)
  ///@param filter[location] Filter by starmap location UUID
  @GET(path: '/api/missions/filters')
  Future<chopper.Response<ApiMissionsFiltersGet$Response>>
  _apiMissionsFiltersGet({
    @Query('version') String? version,
    @Query('filter[include_unreleased]') bool? filterIncludeUnreleased,
    @Query('filter[mission_giver]') String? filterMissionGiver,
    @Query('filter[faction]') String? filterFaction,
    @Query('filter[star_system]') String? filterStarSystem,
    @Query('filter[illegal]') bool? filterIllegal,
    @Query('filter[shareable]') bool? filterShareable,
    @Query('filter[once_only]') bool? filterOnceOnly,
    @Query('filter[available_in_prison]') bool? filterAvailableInPrison,
    @Query('filter[has_combat]') bool? filterHasCombat,
    @Query('filter[has_defend_objective]') bool? filterHasDefendObjective,
    @Query('filter[rank_index]') int? filterRankIndex,
    @Query('filter[has_prerequisites]') bool? filterHasPrerequisites,
    @Query('filter[min_enemies]') int? filterMinEnemies,
    @Query('filter[max_enemies]') int? filterMaxEnemies,
    @Query('filter[reward_min]') int? filterRewardMin,
    @Query('filter[reward_max]') int? filterRewardMax,
    @Query('filter[title]') String? filterTitle,
    @Query('filter[description]') String? filterDescription,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[reward_scope]') String? filterRewardScope,
    @Query('filter[has_blueprints]') bool? filterHasBlueprints,
    @Query('filter[blueprint_name]') String? filterBlueprintName,
    @Query('filter[reputation_scope]') String? filterReputationScope,
    @Query('filter[location]') String? filterLocation,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns available filter facets for missions, scoped to the requested or default game version.',
      summary: 'Get Mission Filter Options',
      operationId: 'listMissionFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Missions"],
      deprecated: false,
    ),
  });

  ///Game Starmap Locations Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supported: name, type_name, size, child_count.
  ///@param filter[name] Partial match on location name.
  ///@param filter[query] Search locations by name.
  ///@param filter[type_name] Exact match on location type name (see GET /api/locations/filters for valid values).
  ///@param filter[type_classification] Location type classification from JSON data (see GET /api/locations/filters for valid values).
  ///@param filter[respawn_location_type] Respawn location type classification (see GET /api/locations/filters for valid values).
  ///@param filter[jurisdiction_name] Governing jurisdiction name (see GET /api/locations/filters for valid values).
  ///@param filter[affiliation_name] Faction or organization affiliation display name (see GET /api/locations/filters for valid values).
  ///@param filter[is_scannable] When true, only show scannable locations; when false, only show non-scannable.
  ///@param filter[block_travel] When true, only show locations where travel is blocked; when false, only show locations where travel is allowed.
  ///@param filter[amenity] Filter by amenity name, display name, or UUID. Accepts comma-separated values (see GET /api/locations/filters for valid values).
  ///@param filter[tag] Filter by hierarchy entity tag name or UUID. Accepts comma-separated values.
  ///@param filter[parent_name] Partial match on parent location name.
  ///@param filter[parent_uuid] Exact match on parent location UUID.
  ///@param filter[system] Partial match on star system name (see GET /api/locations/filters for valid values).
  ///@param filter[has_resources] When true, only locations with harvestable resources; when false, only locations without.
  ///@param filter[resource] Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values).
  ///@param filter[hide_minor_locations] When true, exclude minor locations that are only shown when their parent is selected.
  Future<chopper.Response<ApiLocationsGet$Response>> apiLocationsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? version,
    String? sort,
    String? filterName,
    String? filterQuery,
    String? filterTypeName,
    String? filterTypeClassification,
    String? filterRespawnLocationType,
    String? filterJurisdictionName,
    String? filterAffiliationName,
    bool? filterIsScannable,
    bool? filterBlockTravel,
    String? filterAmenity,
    String? filterTag,
    String? filterParentName,
    String? filterParentUuid,
    String? filterSystem,
    bool? filterHasResources,
    String? filterResource,
    bool? filterHideMinorLocations,
  }) {
    generatedMapping.putIfAbsent(
      ApiLocationsGet$Response,
      () => ApiLocationsGet$Response.fromJsonFactory,
    );

    return _apiLocationsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      version: version,
      sort: sort,
      filterName: filterName,
      filterQuery: filterQuery,
      filterTypeName: filterTypeName,
      filterTypeClassification: filterTypeClassification,
      filterRespawnLocationType: filterRespawnLocationType,
      filterJurisdictionName: filterJurisdictionName,
      filterAffiliationName: filterAffiliationName,
      filterIsScannable: filterIsScannable,
      filterBlockTravel: filterBlockTravel,
      filterAmenity: filterAmenity,
      filterTag: filterTag,
      filterParentName: filterParentName,
      filterParentUuid: filterParentUuid,
      filterSystem: filterSystem,
      filterHasResources: filterHasResources,
      filterResource: filterResource,
      filterHideMinorLocations: filterHideMinorLocations,
    );
  }

  ///Game Starmap Locations Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Supported: name, type_name, size, child_count.
  ///@param filter[name] Partial match on location name.
  ///@param filter[query] Search locations by name.
  ///@param filter[type_name] Exact match on location type name (see GET /api/locations/filters for valid values).
  ///@param filter[type_classification] Location type classification from JSON data (see GET /api/locations/filters for valid values).
  ///@param filter[respawn_location_type] Respawn location type classification (see GET /api/locations/filters for valid values).
  ///@param filter[jurisdiction_name] Governing jurisdiction name (see GET /api/locations/filters for valid values).
  ///@param filter[affiliation_name] Faction or organization affiliation display name (see GET /api/locations/filters for valid values).
  ///@param filter[is_scannable] When true, only show scannable locations; when false, only show non-scannable.
  ///@param filter[block_travel] When true, only show locations where travel is blocked; when false, only show locations where travel is allowed.
  ///@param filter[amenity] Filter by amenity name, display name, or UUID. Accepts comma-separated values (see GET /api/locations/filters for valid values).
  ///@param filter[tag] Filter by hierarchy entity tag name or UUID. Accepts comma-separated values.
  ///@param filter[parent_name] Partial match on parent location name.
  ///@param filter[parent_uuid] Exact match on parent location UUID.
  ///@param filter[system] Partial match on star system name (see GET /api/locations/filters for valid values).
  ///@param filter[has_resources] When true, only locations with harvestable resources; when false, only locations without.
  ///@param filter[resource] Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values).
  ///@param filter[hide_minor_locations] When true, exclude minor locations that are only shown when their parent is selected.
  @GET(path: '/api/locations')
  Future<chopper.Response<ApiLocationsGet$Response>> _apiLocationsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[type_name]') String? filterTypeName,
    @Query('filter[type_classification]') String? filterTypeClassification,
    @Query('filter[respawn_location_type]') String? filterRespawnLocationType,
    @Query('filter[jurisdiction_name]') String? filterJurisdictionName,
    @Query('filter[affiliation_name]') String? filterAffiliationName,
    @Query('filter[is_scannable]') bool? filterIsScannable,
    @Query('filter[block_travel]') bool? filterBlockTravel,
    @Query('filter[amenity]') String? filterAmenity,
    @Query('filter[tag]') String? filterTag,
    @Query('filter[parent_name]') String? filterParentName,
    @Query('filter[parent_uuid]') String? filterParentUuid,
    @Query('filter[system]') String? filterSystem,
    @Query('filter[has_resources]') bool? filterHasResources,
    @Query('filter[resource]') String? filterResource,
    @Query('filter[hide_minor_locations]') bool? filterHideMinorLocations,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated versioned starmap locations with optional filters. Results are scoped to the requested or default game version. Each location includes amenities, hierarchy entity tags, parent and star relations, child count, mission count, and resource availability.',
      summary: 'Game Starmap Locations Overview',
      operationId: 'listLocations',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Game Starmap Location Detail
  ///@param identifier Starmap location slug or UUID
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiLocationsIdentifierGet$Response>>
  apiLocationsIdentifierGet({
    required String? identifier,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiLocationsIdentifierGet$Response,
      () => ApiLocationsIdentifierGet$Response.fromJsonFactory,
    );

    return _apiLocationsIdentifierGet(
      identifier: identifier,
      include: include,
      version: version,
    );
  }

  ///Game Starmap Location Detail
  ///@param identifier Starmap location slug or UUID
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/locations/{identifier}')
  Future<chopper.Response<ApiLocationsIdentifierGet$Response>>
  _apiLocationsIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a versioned starmap location by slug or UUID. Results are scoped to the requested or default game version. Use the `include` parameter to load additional relations: `children` (child locations with amenities and tags), `resources` (harvestable resource placements with commodity data), `missions` (available missions with faction data).',
      summary: 'Game Starmap Location Detail',
      operationId: 'getLocation',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Game Starmap Location Filters
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param filter[name] Partial match on location name.
  ///@param filter[query] Search locations by name.
  ///@param filter[type_name] Exact match on location type name (see response for valid values).
  ///@param filter[type_classification] Location type classification from JSON data (see response for valid values).
  ///@param filter[respawn_location_type] Respawn location type classification (see response for valid values).
  ///@param filter[jurisdiction_name] Governing jurisdiction name (see response for valid values).
  ///@param filter[affiliation_name] Faction or organization affiliation display name (see response for valid values).
  ///@param filter[is_scannable] When true, only show scannable locations; when false, only show non-scannable.
  ///@param filter[block_travel] When true, only show locations where travel is blocked; when false, only show locations where travel is allowed.
  ///@param filter[amenity] Filter by amenity name, display name, or UUID. Accepts comma-separated values (see response for valid values).
  ///@param filter[tag] Filter by hierarchy entity tag name or UUID. Accepts comma-separated values.
  ///@param filter[parent_name] Partial match on parent location name.
  ///@param filter[parent_uuid] Exact match on parent location UUID.
  ///@param filter[system] Partial match on star system name (see response for valid values).
  ///@param filter[has_resources] When true, only locations with harvestable resources; when false, only locations without.
  ///@param filter[resource] Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values).
  ///@param filter[hide_minor_locations] When true, exclude minor locations that are only shown when their parent is selected.
  Future<chopper.Response<ApiLocationsFiltersGet$Response>>
  apiLocationsFiltersGet({
    String? version,
    String? filterName,
    String? filterQuery,
    String? filterTypeName,
    String? filterTypeClassification,
    String? filterRespawnLocationType,
    String? filterJurisdictionName,
    String? filterAffiliationName,
    bool? filterIsScannable,
    bool? filterBlockTravel,
    String? filterAmenity,
    String? filterTag,
    String? filterParentName,
    String? filterParentUuid,
    String? filterSystem,
    bool? filterHasResources,
    String? filterResource,
    bool? filterHideMinorLocations,
  }) {
    generatedMapping.putIfAbsent(
      ApiLocationsFiltersGet$Response,
      () => ApiLocationsFiltersGet$Response.fromJsonFactory,
    );

    return _apiLocationsFiltersGet(
      version: version,
      filterName: filterName,
      filterQuery: filterQuery,
      filterTypeName: filterTypeName,
      filterTypeClassification: filterTypeClassification,
      filterRespawnLocationType: filterRespawnLocationType,
      filterJurisdictionName: filterJurisdictionName,
      filterAffiliationName: filterAffiliationName,
      filterIsScannable: filterIsScannable,
      filterBlockTravel: filterBlockTravel,
      filterAmenity: filterAmenity,
      filterTag: filterTag,
      filterParentName: filterParentName,
      filterParentUuid: filterParentUuid,
      filterSystem: filterSystem,
      filterHasResources: filterHasResources,
      filterResource: filterResource,
      filterHideMinorLocations: filterHideMinorLocations,
    );
  }

  ///Game Starmap Location Filters
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param filter[name] Partial match on location name.
  ///@param filter[query] Search locations by name.
  ///@param filter[type_name] Exact match on location type name (see response for valid values).
  ///@param filter[type_classification] Location type classification from JSON data (see response for valid values).
  ///@param filter[respawn_location_type] Respawn location type classification (see response for valid values).
  ///@param filter[jurisdiction_name] Governing jurisdiction name (see response for valid values).
  ///@param filter[affiliation_name] Faction or organization affiliation display name (see response for valid values).
  ///@param filter[is_scannable] When true, only show scannable locations; when false, only show non-scannable.
  ///@param filter[block_travel] When true, only show locations where travel is blocked; when false, only show locations where travel is allowed.
  ///@param filter[amenity] Filter by amenity name, display name, or UUID. Accepts comma-separated values (see response for valid values).
  ///@param filter[tag] Filter by hierarchy entity tag name or UUID. Accepts comma-separated values.
  ///@param filter[parent_name] Partial match on parent location name.
  ///@param filter[parent_uuid] Exact match on parent location UUID.
  ///@param filter[system] Partial match on star system name (see response for valid values).
  ///@param filter[has_resources] When true, only locations with harvestable resources; when false, only locations without.
  ///@param filter[resource] Filter by harvestable commodity name or UUID. Accepts comma-separated values (see GET /api/commodities for valid values).
  ///@param filter[hide_minor_locations] When true, exclude minor locations that are only shown when their parent is selected.
  @GET(path: '/api/locations/filters')
  Future<chopper.Response<ApiLocationsFiltersGet$Response>>
  _apiLocationsFiltersGet({
    @Query('version') String? version,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[type_name]') String? filterTypeName,
    @Query('filter[type_classification]') String? filterTypeClassification,
    @Query('filter[respawn_location_type]') String? filterRespawnLocationType,
    @Query('filter[jurisdiction_name]') String? filterJurisdictionName,
    @Query('filter[affiliation_name]') String? filterAffiliationName,
    @Query('filter[is_scannable]') bool? filterIsScannable,
    @Query('filter[block_travel]') bool? filterBlockTravel,
    @Query('filter[amenity]') String? filterAmenity,
    @Query('filter[tag]') String? filterTag,
    @Query('filter[parent_name]') String? filterParentName,
    @Query('filter[parent_uuid]') String? filterParentUuid,
    @Query('filter[system]') String? filterSystem,
    @Query('filter[has_resources]') bool? filterHasResources,
    @Query('filter[resource]') String? filterResource,
    @Query('filter[hide_minor_locations]') bool? filterHideMinorLocations,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Return all available filter facet values for versioned starmap locations. Applies any provided filter parameters to scope the facet counts. Returns facets for: type_name, type_classification, respawn_location_type, jurisdiction_name, affiliation_name, system, parent_name, amenity, and resource.',
      summary: 'Game Starmap Location Filters',
      operationId: 'listLocationFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Starmap Entity Positions
  ///@param filter[type] Exact match on entity type (Planet, Moon, Star, Manmade, Asteroid, Anomaly, JumpPoint, etc.)
  ///@param filter[system] Exact match on system name (stanton, pyro, nyx)
  Future<chopper.Response<ApiLocationsPositionsGet$Response>>
  apiLocationsPositionsGet({String? filterType, String? filterSystem}) {
    generatedMapping.putIfAbsent(
      ApiLocationsPositionsGet$Response,
      () => ApiLocationsPositionsGet$Response.fromJsonFactory,
    );

    return _apiLocationsPositionsGet(
      filterType: filterType,
      filterSystem: filterSystem,
    );
  }

  ///Starmap Entity Positions
  ///@param filter[type] Exact match on entity type (Planet, Moon, Star, Manmade, Asteroid, Anomaly, JumpPoint, etc.)
  ///@param filter[system] Exact match on system name (stanton, pyro, nyx)
  @GET(path: '/api/locations/positions')
  Future<chopper.Response<ApiLocationsPositionsGet$Response>>
  _apiLocationsPositionsGet({
    @Query('filter[type]') String? filterType,
    @Query('filter[system]') String? filterSystem,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Starmap entity world positions.',
      summary: 'Starmap Entity Positions',
      operationId: 'listLocationPositions',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Unified Search Across All Game Data
  ///@param filter[query] Search query (minimum 2 characters). Searches names, class names, and other identifiers.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiSearchGet$Response>> apiSearchGet({
    required String? filterQuery,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiSearchGet$Response,
      () => ApiSearchGet$Response.fromJsonFactory,
    );

    return _apiSearchGet(filterQuery: filterQuery, version: version);
  }

  ///Unified Search Across All Game Data
  ///@param filter[query] Search query (minimum 2 characters). Searches names, class names, and other identifiers.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/search')
  Future<chopper.Response<ApiSearchGet$Response>> _apiSearchGet({
    @Query('filter[query]') required String? filterQuery,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Search across items, vehicles, starmap locations, commodities, blueprints, and missions simultaneously. Returns results grouped by type, limited to 5 results per group.',
      summary: 'Unified Search Across All Game Data',
      operationId: 'searchGameData',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Search"],
      deprecated: false,
    ),
  });

  ///Resolve Search Query
  ///@param query Entity name, class name, or UUID to resolve.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response> apiSearchQueryGet({
    required String? query,
    String? version,
  }) {
    return _apiSearchQueryGet(query: query, version: version);
  }

  ///Resolve Search Query
  ///@param query Entity name, class name, or UUID to resolve.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/search/{query}')
  Future<chopper.Response> _apiSearchQueryGet({
    @Path('query') required String? query,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Resolve a search query to the best-matching entity and redirect to its API URL, preserving query parameters such as locale, include, and version. Useful for quick lookups where you know the exact name.',
      summary: 'Resolve Search Query',
      operationId: 'resolveSearchQuery',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Search"],
      deprecated: false,
    ),
  });

  ///In-Game Ground Vehicles Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Tumbril Land Systems`
  ///@param filter[manufacturer.name] Alias for filter[manufacturer]. Example: `Anvil Aerospace`
  ///@param filter[class_name] Partial match on vehicle class name. Example: `TMBL_Nova`
  ///@param filter[name] Partial match on vehicle display name. Example: `Nova`
  ///@param filter[query] Search vehicles by name or class name. Example: `Nova`
  ///@param filter[size] Exact match on vehicle size (1-6). Example: `3`
  ///@param filter[size_class] Alias for filter[size]. Example: `3`
  ///@param filter[career] Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Ground`
  ///@param filter[role] Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Combat`
  ///@param filter[is_vehicle] Filter to ground vehicles only.
  ///@param filter[is_gravlev] Filter to gravlev vehicles only.
  ///@param filter[is_spaceship] Filter to spaceships only.
  ///@param filter[mass_total] Numeric filter on total mass (kg). Supports range operators. Example: `1521`
  ///@param filter[cargo_capacity] Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1`
  ///@param filter[vehicle_inventory] Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13`
  ///@param filter[crew.min] Numeric filter on minimum crew count. Supports range operators. Example: `2`
  ///@param filter[health] Numeric filter on vehicle health points. Supports range operators. Example: `4250`
  ///@param filter[shield.hp] Numeric filter on total shield hit points. Supports range operators. Example: `720`
  ///@param filter[shield.face_type] Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  ///@param filter[speed.scm] Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `200`
  ///@param filter[speed.max] Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `1000`
  ///@param filter[armor.health] Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `50000`
  ///@param filter[cross section.length] Numeric filter on cross-section length (X axis). Supports range operators. Example: `100`
  ///@param filter[cross section.width] Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  ///@param filter[cross section.height] Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  ///@param filter[signature.ir_quantum] Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  ///@param filter[signature.ir_shields] Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  ///@param filter[signature.em_quantum] Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  ///@param filter[signature.em_shields] Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  Future<chopper.Response<ApiGroundVehiclesGet$Response>> apiGroundVehiclesGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterManufacturerName,
    String? filterClassName,
    String? filterName,
    String? filterQuery,
    int? filterSize,
    int? filterSizeClass,
    String? filterCareer,
    String? filterRole,
    bool? filterIsVehicle,
    bool? filterIsGravlev,
    bool? filterIsSpaceship,
    num? filterMassTotal,
    num? filterCargoCapacity,
    num? filterVehicleInventory,
    int? filterCrewMin,
    num? filterHealth,
    num? filterShieldHp,
    String? filterShieldFaceType,
    num? filterSpeedScm,
    num? filterSpeedMax,
    num? filterArmorHealth,
    num? filterCrossSectionLength,
    num? filterCrossSectionWidth,
    num? filterCrossSectionHeight,
    num? filterSignatureIrQuantum,
    num? filterSignatureIrShields,
    num? filterSignatureEmQuantum,
    num? filterSignatureEmShields,
  }) {
    generatedMapping.putIfAbsent(
      ApiGroundVehiclesGet$Response,
      () => ApiGroundVehiclesGet$Response.fromJsonFactory,
    );

    return _apiGroundVehiclesGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterManufacturerName: filterManufacturerName,
      filterClassName: filterClassName,
      filterName: filterName,
      filterQuery: filterQuery,
      filterSize: filterSize,
      filterSizeClass: filterSizeClass,
      filterCareer: filterCareer,
      filterRole: filterRole,
      filterIsVehicle: filterIsVehicle,
      filterIsGravlev: filterIsGravlev,
      filterIsSpaceship: filterIsSpaceship,
      filterMassTotal: filterMassTotal,
      filterCargoCapacity: filterCargoCapacity,
      filterVehicleInventory: filterVehicleInventory,
      filterCrewMin: filterCrewMin,
      filterHealth: filterHealth,
      filterShieldHp: filterShieldHp,
      filterShieldFaceType: filterShieldFaceType,
      filterSpeedScm: filterSpeedScm,
      filterSpeedMax: filterSpeedMax,
      filterArmorHealth: filterArmorHealth,
      filterCrossSectionLength: filterCrossSectionLength,
      filterCrossSectionWidth: filterCrossSectionWidth,
      filterCrossSectionHeight: filterCrossSectionHeight,
      filterSignatureIrQuantum: filterSignatureIrQuantum,
      filterSignatureIrShields: filterSignatureIrShields,
      filterSignatureEmQuantum: filterSignatureEmQuantum,
      filterSignatureEmShields: filterSignatureEmShields,
    );
  }

  ///In-Game Ground Vehicles Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Tumbril Land Systems`
  ///@param filter[manufacturer.name] Alias for filter[manufacturer]. Example: `Anvil Aerospace`
  ///@param filter[class_name] Partial match on vehicle class name. Example: `TMBL_Nova`
  ///@param filter[name] Partial match on vehicle display name. Example: `Nova`
  ///@param filter[query] Search vehicles by name or class name. Example: `Nova`
  ///@param filter[size] Exact match on vehicle size (1-6). Example: `3`
  ///@param filter[size_class] Alias for filter[size]. Example: `3`
  ///@param filter[career] Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Ground`
  ///@param filter[role] Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Combat`
  ///@param filter[is_vehicle] Filter to ground vehicles only.
  ///@param filter[is_gravlev] Filter to gravlev vehicles only.
  ///@param filter[is_spaceship] Filter to spaceships only.
  ///@param filter[mass_total] Numeric filter on total mass (kg). Supports range operators. Example: `1521`
  ///@param filter[cargo_capacity] Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1`
  ///@param filter[vehicle_inventory] Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13`
  ///@param filter[crew.min] Numeric filter on minimum crew count. Supports range operators. Example: `2`
  ///@param filter[health] Numeric filter on vehicle health points. Supports range operators. Example: `4250`
  ///@param filter[shield.hp] Numeric filter on total shield hit points. Supports range operators. Example: `720`
  ///@param filter[shield.face_type] Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  ///@param filter[speed.scm] Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `200`
  ///@param filter[speed.max] Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `1000`
  ///@param filter[armor.health] Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `50000`
  ///@param filter[cross section.length] Numeric filter on cross-section length (X axis). Supports range operators. Example: `100`
  ///@param filter[cross section.width] Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  ///@param filter[cross section.height] Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  ///@param filter[signature.ir_quantum] Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  ///@param filter[signature.ir_shields] Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  ///@param filter[signature.em_quantum] Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  ///@param filter[signature.em_shields] Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for ground vehicles. Example: `100`
  @GET(path: '/api/ground-vehicles')
  Future<chopper.Response<ApiGroundVehiclesGet$Response>>
  _apiGroundVehiclesGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[manufacturer.name]') String? filterManufacturerName,
    @Query('filter[class_name]') String? filterClassName,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[size]') int? filterSize,
    @Query('filter[size_class]') int? filterSizeClass,
    @Query('filter[career]') String? filterCareer,
    @Query('filter[role]') String? filterRole,
    @Query('filter[is_vehicle]') bool? filterIsVehicle,
    @Query('filter[is_gravlev]') bool? filterIsGravlev,
    @Query('filter[is_spaceship]') bool? filterIsSpaceship,
    @Query('filter[mass_total]') num? filterMassTotal,
    @Query('filter[cargo_capacity]') num? filterCargoCapacity,
    @Query('filter[vehicle_inventory]') num? filterVehicleInventory,
    @Query('filter[crew.min]') int? filterCrewMin,
    @Query('filter[health]') num? filterHealth,
    @Query('filter[shield.hp]') num? filterShieldHp,
    @Query('filter[shield.face_type]') String? filterShieldFaceType,
    @Query('filter[speed.scm]') num? filterSpeedScm,
    @Query('filter[speed.max]') num? filterSpeedMax,
    @Query('filter[armor.health]') num? filterArmorHealth,
    @Query('filter[cross section.length]') num? filterCrossSectionLength,
    @Query('filter[cross section.width]') num? filterCrossSectionWidth,
    @Query('filter[cross section.height]') num? filterCrossSectionHeight,
    @Query('filter[signature.ir_quantum]') num? filterSignatureIrQuantum,
    @Query('filter[signature.ir_shields]') num? filterSignatureIrShields,
    @Query('filter[signature.em_quantum]') num? filterSignatureEmQuantum,
    @Query('filter[signature.em_shields]') num? filterSignatureEmShields,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/vehicles scoped to ground vehicles (is_vehicle=true, is_gravlev=false, is_spaceship=false). Returns paginated in-game ground vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.',
      summary: 'In-Game Ground Vehicles Overview',
      operationId: 'listGroundVehicles',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles"],
      deprecated: false,
    ),
  });

  ///In-Game Gravlev Vehicles Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Drake Interplanetary`
  ///@param filter[manufacturer.name] Alias for filter[manufacturer]. Example: `Origin Jumpworks`
  ///@param filter[class_name] Partial match on vehicle class name. Example: `Dragonfly`
  ///@param filter[name] Partial match on vehicle display name. Example: `Dragonfly`
  ///@param filter[query] Search vehicles by name or class name. Example: `Dragonfly`
  ///@param filter[size] Exact match on vehicle size (1-6). Example: `1`
  ///@param filter[size_class] Alias for filter[size]. Example: `1`
  ///@param filter[career] Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration`
  ///@param filter[role] Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing`
  ///@param filter[is_vehicle] Filter to ground vehicles only.
  ///@param filter[is_gravlev] Filter to gravlev vehicles only.
  ///@param filter[is_spaceship] Filter to spaceships only.
  ///@param filter[mass_total] Numeric filter on total mass (kg). Supports range operators. Example: `2435`
  ///@param filter[cargo_capacity] Numeric filter on cargo capacity (SCU). Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `0`
  ///@param filter[vehicle_inventory] Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.39`
  ///@param filter[crew.min] Numeric filter on minimum crew count. Supports range operators. Example: `1`
  ///@param filter[health] Numeric filter on vehicle health points. Supports range operators. Example: `1550`
  ///@param filter[shield.hp] Numeric filter on total shield hit points. Supports range operators. Example: `720`
  ///@param filter[shield.face_type] Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  ///@param filter[speed.scm] Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `200`
  ///@param filter[speed.max] Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `1000`
  ///@param filter[armor.health] Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `50000`
  ///@param filter[cross section.length] Numeric filter on cross-section length (X axis). Supports range operators. Example: `0.39`
  ///@param filter[cross section.width] Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  ///@param filter[cross section.height] Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  ///@param filter[signature.ir_quantum] Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  ///@param filter[signature.ir_shields] Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  ///@param filter[signature.em_quantum] Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  ///@param filter[signature.em_shields] Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  Future<chopper.Response<ApiGravlevVehiclesGet$Response>>
  apiGravlevVehiclesGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterManufacturerName,
    String? filterClassName,
    String? filterName,
    String? filterQuery,
    int? filterSize,
    int? filterSizeClass,
    String? filterCareer,
    String? filterRole,
    bool? filterIsVehicle,
    bool? filterIsGravlev,
    bool? filterIsSpaceship,
    num? filterMassTotal,
    num? filterCargoCapacity,
    num? filterVehicleInventory,
    int? filterCrewMin,
    num? filterHealth,
    num? filterShieldHp,
    String? filterShieldFaceType,
    num? filterSpeedScm,
    num? filterSpeedMax,
    num? filterArmorHealth,
    num? filterCrossSectionLength,
    num? filterCrossSectionWidth,
    num? filterCrossSectionHeight,
    num? filterSignatureIrQuantum,
    num? filterSignatureIrShields,
    num? filterSignatureEmQuantum,
    num? filterSignatureEmShields,
  }) {
    generatedMapping.putIfAbsent(
      ApiGravlevVehiclesGet$Response,
      () => ApiGravlevVehiclesGet$Response.fromJsonFactory,
    );

    return _apiGravlevVehiclesGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterManufacturerName: filterManufacturerName,
      filterClassName: filterClassName,
      filterName: filterName,
      filterQuery: filterQuery,
      filterSize: filterSize,
      filterSizeClass: filterSizeClass,
      filterCareer: filterCareer,
      filterRole: filterRole,
      filterIsVehicle: filterIsVehicle,
      filterIsGravlev: filterIsGravlev,
      filterIsSpaceship: filterIsSpaceship,
      filterMassTotal: filterMassTotal,
      filterCargoCapacity: filterCargoCapacity,
      filterVehicleInventory: filterVehicleInventory,
      filterCrewMin: filterCrewMin,
      filterHealth: filterHealth,
      filterShieldHp: filterShieldHp,
      filterShieldFaceType: filterShieldFaceType,
      filterSpeedScm: filterSpeedScm,
      filterSpeedMax: filterSpeedMax,
      filterArmorHealth: filterArmorHealth,
      filterCrossSectionLength: filterCrossSectionLength,
      filterCrossSectionWidth: filterCrossSectionWidth,
      filterCrossSectionHeight: filterCrossSectionHeight,
      filterSignatureIrQuantum: filterSignatureIrQuantum,
      filterSignatureIrShields: filterSignatureIrShields,
      filterSignatureEmQuantum: filterSignatureEmQuantum,
      filterSignatureEmShields: filterSignatureEmShields,
    );
  }

  ///In-Game Gravlev Vehicles Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Drake Interplanetary`
  ///@param filter[manufacturer.name] Alias for filter[manufacturer]. Example: `Origin Jumpworks`
  ///@param filter[class_name] Partial match on vehicle class name. Example: `Dragonfly`
  ///@param filter[name] Partial match on vehicle display name. Example: `Dragonfly`
  ///@param filter[query] Search vehicles by name or class name. Example: `Dragonfly`
  ///@param filter[size] Exact match on vehicle size (1-6). Example: `1`
  ///@param filter[size_class] Alias for filter[size]. Example: `1`
  ///@param filter[career] Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration`
  ///@param filter[role] Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing`
  ///@param filter[is_vehicle] Filter to ground vehicles only.
  ///@param filter[is_gravlev] Filter to gravlev vehicles only.
  ///@param filter[is_spaceship] Filter to spaceships only.
  ///@param filter[mass_total] Numeric filter on total mass (kg). Supports range operators. Example: `2435`
  ///@param filter[cargo_capacity] Numeric filter on cargo capacity (SCU). Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `0`
  ///@param filter[vehicle_inventory] Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.39`
  ///@param filter[crew.min] Numeric filter on minimum crew count. Supports range operators. Example: `1`
  ///@param filter[health] Numeric filter on vehicle health points. Supports range operators. Example: `1550`
  ///@param filter[shield.hp] Numeric filter on total shield hit points. Supports range operators. Example: `720`
  ///@param filter[shield.face_type] Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  ///@param filter[speed.scm] Numeric filter on SCM speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `200`
  ///@param filter[speed.max] Numeric filter on maximum speed. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `1000`
  ///@param filter[armor.health] Numeric filter on armor health points. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `50000`
  ///@param filter[cross section.length] Numeric filter on cross-section length (X axis). Supports range operators. Example: `0.39`
  ///@param filter[cross section.width] Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  ///@param filter[cross section.height] Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  ///@param filter[signature.ir_quantum] Numeric filter on infrared quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  ///@param filter[signature.ir_shields] Numeric filter on infrared shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  ///@param filter[signature.em_quantum] Numeric filter on electromagnetic quantum signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  ///@param filter[signature.em_shields] Numeric filter on electromagnetic shield signature emission. Supports range operators. Spaceship-only field; returns empty for gravlev vehicles. Example: `100`
  @GET(path: '/api/gravlev-vehicles')
  Future<chopper.Response<ApiGravlevVehiclesGet$Response>>
  _apiGravlevVehiclesGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[manufacturer.name]') String? filterManufacturerName,
    @Query('filter[class_name]') String? filterClassName,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[size]') int? filterSize,
    @Query('filter[size_class]') int? filterSizeClass,
    @Query('filter[career]') String? filterCareer,
    @Query('filter[role]') String? filterRole,
    @Query('filter[is_vehicle]') bool? filterIsVehicle,
    @Query('filter[is_gravlev]') bool? filterIsGravlev,
    @Query('filter[is_spaceship]') bool? filterIsSpaceship,
    @Query('filter[mass_total]') num? filterMassTotal,
    @Query('filter[cargo_capacity]') num? filterCargoCapacity,
    @Query('filter[vehicle_inventory]') num? filterVehicleInventory,
    @Query('filter[crew.min]') int? filterCrewMin,
    @Query('filter[health]') num? filterHealth,
    @Query('filter[shield.hp]') num? filterShieldHp,
    @Query('filter[shield.face_type]') String? filterShieldFaceType,
    @Query('filter[speed.scm]') num? filterSpeedScm,
    @Query('filter[speed.max]') num? filterSpeedMax,
    @Query('filter[armor.health]') num? filterArmorHealth,
    @Query('filter[cross section.length]') num? filterCrossSectionLength,
    @Query('filter[cross section.width]') num? filterCrossSectionWidth,
    @Query('filter[cross section.height]') num? filterCrossSectionHeight,
    @Query('filter[signature.ir_quantum]') num? filterSignatureIrQuantum,
    @Query('filter[signature.ir_shields]') num? filterSignatureIrShields,
    @Query('filter[signature.em_quantum]') num? filterSignatureEmQuantum,
    @Query('filter[signature.em_shields]') num? filterSignatureEmShields,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/vehicles scoped to gravlev vehicles (is_gravlev=true). Returns paginated in-game gravlev vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.',
      summary: 'In-Game Gravlev Vehicles Overview',
      operationId: 'listGravlevVehicles',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles"],
      deprecated: false,
    ),
  });

  ///In-Game Vehicles Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Aegis Dynamics`
  ///@param filter[manufacturer.name] Alias for filter[manufacturer]. Example: `Anvil Aerospace`
  ///@param filter[class_name] Partial match on vehicle class name. Example: `TMBL_Nova`
  ///@param filter[name] Partial match on vehicle display name. Example: `Nova`
  ///@param filter[query] Search vehicles by name or class name. Example: `Carrack`
  ///@param filter[size] Exact match on vehicle size (1-6). Example: `3`
  ///@param filter[size_class] Alias for filter[size]. Example: `3`
  ///@param filter[career] Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration`
  ///@param filter[role] Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing`
  ///@param filter[is_vehicle] Filter to ground vehicles only.
  ///@param filter[is_gravlev] Filter to gravlev vehicles only.
  ///@param filter[is_spaceship] Filter to spaceships only.
  ///@param filter[mass_total] Numeric filter on total mass (kg). Supports range operators. Example: `1521`
  ///@param filter[cargo_capacity] Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1`
  ///@param filter[vehicle_inventory] Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13`
  ///@param filter[crew.min] Numeric filter on minimum crew count. Supports range operators. Example: `2`
  ///@param filter[health] Numeric filter on vehicle health points. Supports range operators. Example: `1550`
  ///@param filter[shield.hp] Numeric filter on total shield hit points. Supports range operators. Example: `720`
  ///@param filter[shield.face_type] Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  ///@param filter[speed.scm] Numeric filter on SCM speed. Supports range operators. Example: `220`
  ///@param filter[speed.max] Numeric filter on maximum speed. Supports range operators. Example: `1150`
  ///@param filter[armor.health] Numeric filter on armor health points. Supports range operators. Example: `10890`
  ///@param filter[cross section.length] Numeric filter on cross-section length (X axis). Supports range operators. Example: `100`
  ///@param filter[cross section.width] Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  ///@param filter[cross section.height] Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  ///@param filter[signature.ir_quantum] Numeric filter on infrared quantum signature emission. Supports range operators. Example: `10882`
  ///@param filter[signature.ir_shields] Numeric filter on infrared shield signature emission. Supports range operators. Example: `10267`
  ///@param filter[signature.em_quantum] Numeric filter on electromagnetic quantum signature emission. Supports range operators. Example: `53959`
  ///@param filter[signature.em_shields] Numeric filter on electromagnetic shield signature emission. Supports range operators. Example: `17643`
  Future<chopper.Response<ApiVehiclesGet$Response>> apiVehiclesGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? include,
    String? version,
    String? sort,
    String? filterManufacturer,
    String? filterManufacturerName,
    String? filterClassName,
    String? filterName,
    String? filterQuery,
    int? filterSize,
    int? filterSizeClass,
    String? filterCareer,
    String? filterRole,
    bool? filterIsVehicle,
    bool? filterIsGravlev,
    bool? filterIsSpaceship,
    num? filterMassTotal,
    num? filterCargoCapacity,
    num? filterVehicleInventory,
    int? filterCrewMin,
    num? filterHealth,
    num? filterShieldHp,
    String? filterShieldFaceType,
    num? filterSpeedScm,
    num? filterSpeedMax,
    num? filterArmorHealth,
    num? filterCrossSectionLength,
    num? filterCrossSectionWidth,
    num? filterCrossSectionHeight,
    num? filterSignatureIrQuantum,
    num? filterSignatureIrShields,
    num? filterSignatureEmQuantum,
    num? filterSignatureEmShields,
  }) {
    generatedMapping.putIfAbsent(
      ApiVehiclesGet$Response,
      () => ApiVehiclesGet$Response.fromJsonFactory,
    );

    return _apiVehiclesGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      version: version,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterManufacturerName: filterManufacturerName,
      filterClassName: filterClassName,
      filterName: filterName,
      filterQuery: filterQuery,
      filterSize: filterSize,
      filterSizeClass: filterSizeClass,
      filterCareer: filterCareer,
      filterRole: filterRole,
      filterIsVehicle: filterIsVehicle,
      filterIsGravlev: filterIsGravlev,
      filterIsSpaceship: filterIsSpaceship,
      filterMassTotal: filterMassTotal,
      filterCargoCapacity: filterCargoCapacity,
      filterVehicleInventory: filterVehicleInventory,
      filterCrewMin: filterCrewMin,
      filterHealth: filterHealth,
      filterShieldHp: filterShieldHp,
      filterShieldFaceType: filterShieldFaceType,
      filterSpeedScm: filterSpeedScm,
      filterSpeedMax: filterSpeedMax,
      filterArmorHealth: filterArmorHealth,
      filterCrossSectionLength: filterCrossSectionLength,
      filterCrossSectionWidth: filterCrossSectionWidth,
      filterCrossSectionHeight: filterCrossSectionHeight,
      filterSignatureIrQuantum: filterSignatureIrQuantum,
      filterSignatureIrShields: filterSignatureIrShields,
      filterSignatureEmQuantum: filterSignatureEmQuantum,
      filterSignatureEmShields: filterSignatureEmShields,
    );
  }

  ///In-Game Vehicles Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  ///@param sort Sort field. Prefix with "-" for descending. Examples: name, -size, manufacturer.name, cargo_capacity, -speed.scm, shield.face_type. Use comma for multiple: size,-cargo_capacity
  ///@param filter[manufacturer] Manufacturer name or code. Accepts comma-separated values for OR matching. (see GET /api/vehicles/filters for valid values). Example: `Aegis Dynamics`
  ///@param filter[manufacturer.name] Alias for filter[manufacturer]. Example: `Anvil Aerospace`
  ///@param filter[class_name] Partial match on vehicle class name. Example: `TMBL_Nova`
  ///@param filter[name] Partial match on vehicle display name. Example: `Nova`
  ///@param filter[query] Search vehicles by name or class name. Example: `Carrack`
  ///@param filter[size] Exact match on vehicle size (1-6). Example: `3`
  ///@param filter[size_class] Alias for filter[size]. Example: `3`
  ///@param filter[career] Partial match on vehicle career. (see GET /api/vehicles/filters for valid values). Example: `Exploration`
  ///@param filter[role] Partial match on vehicle role. (see GET /api/vehicles/filters for valid values). Example: `Racing`
  ///@param filter[is_vehicle] Filter to ground vehicles only.
  ///@param filter[is_gravlev] Filter to gravlev vehicles only.
  ///@param filter[is_spaceship] Filter to spaceships only.
  ///@param filter[mass_total] Numeric filter on total mass (kg). Supports range operators. Example: `1521`
  ///@param filter[cargo_capacity] Numeric filter on cargo capacity (SCU). Supports range operators. Example: `1`
  ///@param filter[vehicle_inventory] Numeric filter on vehicle inventory/stowage capacity. Supports range operators. Example: `0.13`
  ///@param filter[crew.min] Numeric filter on minimum crew count. Supports range operators. Example: `2`
  ///@param filter[health] Numeric filter on vehicle health points. Supports range operators. Example: `1550`
  ///@param filter[shield.hp] Numeric filter on total shield hit points. Supports range operators. Example: `720`
  ///@param filter[shield.face_type] Shield face type. (see GET /api/vehicles/filters for valid values). Example: `Bubble`
  ///@param filter[speed.scm] Numeric filter on SCM speed. Supports range operators. Example: `220`
  ///@param filter[speed.max] Numeric filter on maximum speed. Supports range operators. Example: `1150`
  ///@param filter[armor.health] Numeric filter on armor health points. Supports range operators. Example: `10890`
  ///@param filter[cross section.length] Numeric filter on cross-section length (X axis). Supports range operators. Example: `100`
  ///@param filter[cross section.width] Numeric filter on cross-section width (Y axis). Supports range operators. Example: `50`
  ///@param filter[cross section.height] Numeric filter on cross-section height (Z axis). Supports range operators. Example: `30`
  ///@param filter[signature.ir_quantum] Numeric filter on infrared quantum signature emission. Supports range operators. Example: `10882`
  ///@param filter[signature.ir_shields] Numeric filter on infrared shield signature emission. Supports range operators. Example: `10267`
  ///@param filter[signature.em_quantum] Numeric filter on electromagnetic quantum signature emission. Supports range operators. Example: `53959`
  ///@param filter[signature.em_shields] Numeric filter on electromagnetic shield signature emission. Supports range operators. Example: `17643`
  @GET(path: '/api/vehicles')
  Future<chopper.Response<ApiVehiclesGet$Response>> _apiVehiclesGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') String? include,
    @Query('version') String? version,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[manufacturer.name]') String? filterManufacturerName,
    @Query('filter[class_name]') String? filterClassName,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[size]') int? filterSize,
    @Query('filter[size_class]') int? filterSizeClass,
    @Query('filter[career]') String? filterCareer,
    @Query('filter[role]') String? filterRole,
    @Query('filter[is_vehicle]') bool? filterIsVehicle,
    @Query('filter[is_gravlev]') bool? filterIsGravlev,
    @Query('filter[is_spaceship]') bool? filterIsSpaceship,
    @Query('filter[mass_total]') num? filterMassTotal,
    @Query('filter[cargo_capacity]') num? filterCargoCapacity,
    @Query('filter[vehicle_inventory]') num? filterVehicleInventory,
    @Query('filter[crew.min]') int? filterCrewMin,
    @Query('filter[health]') num? filterHealth,
    @Query('filter[shield.hp]') num? filterShieldHp,
    @Query('filter[shield.face_type]') String? filterShieldFaceType,
    @Query('filter[speed.scm]') num? filterSpeedScm,
    @Query('filter[speed.max]') num? filterSpeedMax,
    @Query('filter[armor.health]') num? filterArmorHealth,
    @Query('filter[cross section.length]') num? filterCrossSectionLength,
    @Query('filter[cross section.width]') num? filterCrossSectionWidth,
    @Query('filter[cross section.height]') num? filterCrossSectionHeight,
    @Query('filter[signature.ir_quantum]') num? filterSignatureIrQuantum,
    @Query('filter[signature.ir_shields]') num? filterSignatureIrShields,
    @Query('filter[signature.em_quantum]') num? filterSignatureEmQuantum,
    @Query('filter[signature.em_shields]') num? filterSignatureEmShields,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated in-game vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus. Optional includes: shipMatrixVehicle, components, shipmatrixvehicle.components, hardpoints, ports.',
      summary: 'In-Game Vehicles Overview',
      operationId: 'listVehicles',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles"],
      deprecated: false,
    ),
  });

  ///In-Game Ground Vehicle Detail
  ///@param identifier Vehicle name, class_name, or UUID
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiGroundVehiclesIdentifierGet$Response>>
  apiGroundVehiclesIdentifierGet({
    required String? identifier,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiGroundVehiclesIdentifierGet$Response,
      () => ApiGroundVehiclesIdentifierGet$Response.fromJsonFactory,
    );

    return _apiGroundVehiclesIdentifierGet(
      identifier: identifier,
      include: include,
      version: version,
    );
  }

  ///In-Game Ground Vehicle Detail
  ///@param identifier Vehicle name, class_name, or UUID
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/ground-vehicles/{identifier}')
  Future<chopper.Response<ApiGroundVehiclesIdentifierGet$Response>>
  _apiGroundVehiclesIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/vehicles/{identifier} scoped to ground vehicles. Results are scoped to the requested or default game version.',
      summary: 'In-Game Ground Vehicle Detail',
      operationId: 'getGroundVehicle',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles"],
      deprecated: false,
    ),
  });

  ///In-Game Gravlev Vehicle Detail
  ///@param identifier Vehicle name, class_name, or UUID
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiGravlevVehiclesIdentifierGet$Response>>
  apiGravlevVehiclesIdentifierGet({
    required String? identifier,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiGravlevVehiclesIdentifierGet$Response,
      () => ApiGravlevVehiclesIdentifierGet$Response.fromJsonFactory,
    );

    return _apiGravlevVehiclesIdentifierGet(
      identifier: identifier,
      include: include,
      version: version,
    );
  }

  ///In-Game Gravlev Vehicle Detail
  ///@param identifier Vehicle name, class_name, or UUID
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/gravlev-vehicles/{identifier}')
  Future<chopper.Response<ApiGravlevVehiclesIdentifierGet$Response>>
  _apiGravlevVehiclesIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Alias for /api/vehicles/{identifier} scoped to gravlev vehicles. Results are scoped to the requested or default game version.',
      summary: 'In-Game Gravlev Vehicle Detail',
      operationId: 'getGravlevVehicle',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles"],
      deprecated: false,
    ),
  });

  ///In-Game Vehicle Detail
  ///@param identifier Vehicle name, class_name, or UUID
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiVehiclesIdentifierGet$Response>>
  apiVehiclesIdentifierGet({
    required String? identifier,
    String? include,
    String? version,
  }) {
    generatedMapping.putIfAbsent(
      ApiVehiclesIdentifierGet$Response,
      () => ApiVehiclesIdentifierGet$Response.fromJsonFactory,
    );

    return _apiVehiclesIdentifierGet(
      identifier: identifier,
      include: include,
      version: version,
    );
  }

  ///In-Game Vehicle Detail
  ///@param identifier Vehicle name, class_name, or UUID
  ///@param include Comma-separated list of relationships to include. Available includes vary per endpoint, see each endpoint's description for supported values.
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/vehicles/{identifier}')
  Future<chopper.Response<ApiVehiclesIdentifierGet$Response>>
  _apiVehiclesIdentifierGet({
    @Path('identifier') required String? identifier,
    @Query('include') String? include,
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a vehicle by name, class name, or UUID. Results are scoped to the requested or default game version. Loads manufacturer, gameVersion, shipMatrixVehicle (with foci, productionStatus, productionNote, type, size, loaner, skus, manufacturer, components), and port loadout items.',
      summary: 'In-Game Vehicle Detail',
      operationId: 'getVehicle',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles"],
      deprecated: false,
    ),
  });

  ///In-Game Ground Vehicle Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  Future<chopper.Response<ApiGroundVehiclesSearchPost$Response>>
  apiGroundVehiclesSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required Object? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiGroundVehiclesSearchPost$Response,
      () => ApiGroundVehiclesSearchPost$Response.fromJsonFactory,
    );

    return _apiGroundVehiclesSearchPost(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      body: body,
    );
  }

  ///In-Game Ground Vehicle Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  @POST(path: '/api/ground-vehicles/search', optionalBody: true)
  Future<chopper.Response<ApiGroundVehiclesSearchPost$Response>>
  _apiGroundVehiclesSearchPost({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Body() required Object? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/ground-vehicles?filter[name]={value} for name search. Scoped to ground vehicles. This endpoint will be removed in a future version.',
      summary: 'In-Game Ground Vehicle Search (Deprecated)',
      operationId: 'searchGroundVehiclesDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles", "Search"],
      deprecated: true,
    ),
  });

  ///In-Game Gravlev Vehicle Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  Future<chopper.Response<ApiGravlevVehiclesSearchPost$Response>>
  apiGravlevVehiclesSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required Object? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiGravlevVehiclesSearchPost$Response,
      () => ApiGravlevVehiclesSearchPost$Response.fromJsonFactory,
    );

    return _apiGravlevVehiclesSearchPost(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      body: body,
    );
  }

  ///In-Game Gravlev Vehicle Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  @POST(path: '/api/gravlev-vehicles/search', optionalBody: true)
  Future<chopper.Response<ApiGravlevVehiclesSearchPost$Response>>
  _apiGravlevVehiclesSearchPost({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Body() required Object? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/gravlev-vehicles?filter[name]={value} for name search. Scoped to gravlev vehicles. This endpoint will be removed in a future version.',
      summary: 'In-Game Gravlev Vehicle Search (Deprecated)',
      operationId: 'searchGravlevVehiclesDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles", "Search"],
      deprecated: true,
    ),
  });

  ///In-Game Vehicle Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer]
  ///@param filter[manufacturer.name]
  ///@param filter[class_name]
  ///@param filter[name]
  ///@param filter[query] Search vehicles by name or class name.
  ///@param filter[size]
  ///@param filter[size_class]
  ///@param filter[career]
  ///@param filter[role]
  ///@param filter[is_vehicle]
  ///@param filter[is_gravlev]
  ///@param filter[is_spaceship]
  ///@param filter[mass_total]
  ///@param filter[cargo_capacity]
  ///@param filter[vehicle_inventory]
  ///@param filter[crew.min]
  ///@param filter[health]
  ///@param filter[shield.hp]
  ///@param filter[shield.face_type]
  ///@param filter[speed.scm]
  ///@param filter[speed.max]
  ///@param filter[armor.health]
  ///@param filter[cross_section.length]
  ///@param filter[cross_section.width]
  ///@param filter[cross_section.height]
  ///@param filter[signature.ir_quantum]
  ///@param filter[signature.ir_shields]
  ///@param filter[signature.em_quantum]
  ///@param filter[signature.em_shields]
  @deprecated
  Future<chopper.Response<ApiVehiclesSearchPost$Response>>
  apiVehiclesSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? sort,
    String? filterManufacturer,
    String? filterManufacturerName,
    String? filterClassName,
    String? filterName,
    String? filterQuery,
    int? filterSize,
    int? filterSizeClass,
    String? filterCareer,
    String? filterRole,
    bool? filterIsVehicle,
    bool? filterIsGravlev,
    bool? filterIsSpaceship,
    num? filterMassTotal,
    num? filterCargoCapacity,
    num? filterVehicleInventory,
    int? filterCrewMin,
    num? filterHealth,
    num? filterShieldHp,
    String? filterShieldFaceType,
    num? filterSpeedScm,
    num? filterSpeedMax,
    num? filterArmorHealth,
    num? filterCrossSectionLength,
    num? filterCrossSectionWidth,
    num? filterCrossSectionHeight,
    num? filterSignatureIrQuantum,
    num? filterSignatureIrShields,
    num? filterSignatureEmQuantum,
    num? filterSignatureEmShields,
    required Object? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiVehiclesSearchPost$Response,
      () => ApiVehiclesSearchPost$Response.fromJsonFactory,
    );

    return _apiVehiclesSearchPost(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      sort: sort,
      filterManufacturer: filterManufacturer,
      filterManufacturerName: filterManufacturerName,
      filterClassName: filterClassName,
      filterName: filterName,
      filterQuery: filterQuery,
      filterSize: filterSize,
      filterSizeClass: filterSizeClass,
      filterCareer: filterCareer,
      filterRole: filterRole,
      filterIsVehicle: filterIsVehicle,
      filterIsGravlev: filterIsGravlev,
      filterIsSpaceship: filterIsSpaceship,
      filterMassTotal: filterMassTotal,
      filterCargoCapacity: filterCargoCapacity,
      filterVehicleInventory: filterVehicleInventory,
      filterCrewMin: filterCrewMin,
      filterHealth: filterHealth,
      filterShieldHp: filterShieldHp,
      filterShieldFaceType: filterShieldFaceType,
      filterSpeedScm: filterSpeedScm,
      filterSpeedMax: filterSpeedMax,
      filterArmorHealth: filterArmorHealth,
      filterCrossSectionLength: filterCrossSectionLength,
      filterCrossSectionWidth: filterCrossSectionWidth,
      filterCrossSectionHeight: filterCrossSectionHeight,
      filterSignatureIrQuantum: filterSignatureIrQuantum,
      filterSignatureIrShields: filterSignatureIrShields,
      filterSignatureEmQuantum: filterSignatureEmQuantum,
      filterSignatureEmShields: filterSignatureEmShields,
      body: body,
    );
  }

  ///In-Game Vehicle Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param sort Comma-separated sort fields. Prefix with `-` for descending. Supported fields vary per endpoint.
  ///@param filter[manufacturer]
  ///@param filter[manufacturer.name]
  ///@param filter[class_name]
  ///@param filter[name]
  ///@param filter[query] Search vehicles by name or class name.
  ///@param filter[size]
  ///@param filter[size_class]
  ///@param filter[career]
  ///@param filter[role]
  ///@param filter[is_vehicle]
  ///@param filter[is_gravlev]
  ///@param filter[is_spaceship]
  ///@param filter[mass_total]
  ///@param filter[cargo_capacity]
  ///@param filter[vehicle_inventory]
  ///@param filter[crew.min]
  ///@param filter[health]
  ///@param filter[shield.hp]
  ///@param filter[shield.face_type]
  ///@param filter[speed.scm]
  ///@param filter[speed.max]
  ///@param filter[armor.health]
  ///@param filter[cross_section.length]
  ///@param filter[cross_section.width]
  ///@param filter[cross_section.height]
  ///@param filter[signature.ir_quantum]
  ///@param filter[signature.ir_shields]
  ///@param filter[signature.em_quantum]
  ///@param filter[signature.em_shields]
  @deprecated
  @POST(path: '/api/vehicles/search', optionalBody: true)
  Future<chopper.Response<ApiVehiclesSearchPost$Response>>
  _apiVehiclesSearchPost({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('sort') String? sort,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[manufacturer.name]') String? filterManufacturerName,
    @Query('filter[class_name]') String? filterClassName,
    @Query('filter[name]') String? filterName,
    @Query('filter[query]') String? filterQuery,
    @Query('filter[size]') int? filterSize,
    @Query('filter[size_class]') int? filterSizeClass,
    @Query('filter[career]') String? filterCareer,
    @Query('filter[role]') String? filterRole,
    @Query('filter[is_vehicle]') bool? filterIsVehicle,
    @Query('filter[is_gravlev]') bool? filterIsGravlev,
    @Query('filter[is_spaceship]') bool? filterIsSpaceship,
    @Query('filter[mass_total]') num? filterMassTotal,
    @Query('filter[cargo_capacity]') num? filterCargoCapacity,
    @Query('filter[vehicle_inventory]') num? filterVehicleInventory,
    @Query('filter[crew.min]') int? filterCrewMin,
    @Query('filter[health]') num? filterHealth,
    @Query('filter[shield.hp]') num? filterShieldHp,
    @Query('filter[shield.face_type]') String? filterShieldFaceType,
    @Query('filter[speed.scm]') num? filterSpeedScm,
    @Query('filter[speed.max]') num? filterSpeedMax,
    @Query('filter[armor.health]') num? filterArmorHealth,
    @Query('filter[cross_section.length]') num? filterCrossSectionLength,
    @Query('filter[cross_section.width]') num? filterCrossSectionWidth,
    @Query('filter[cross_section.height]') num? filterCrossSectionHeight,
    @Query('filter[signature.ir_quantum]') num? filterSignatureIrQuantum,
    @Query('filter[signature.ir_shields]') num? filterSignatureIrShields,
    @Query('filter[signature.em_quantum]') num? filterSignatureEmQuantum,
    @Query('filter[signature.em_shields]') num? filterSignatureEmShields,
    @Body() required Object? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.',
      summary: 'In-Game Vehicle Search (Deprecated)',
      operationId: 'searchVehiclesDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles", "Search"],
      deprecated: true,
    ),
  });

  ///In-Game Vehicle Filters
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  Future<chopper.Response<ApiVehiclesFiltersGet$Response>>
  apiVehiclesFiltersGet({String? version}) {
    generatedMapping.putIfAbsent(
      ApiVehiclesFiltersGet$Response,
      () => ApiVehiclesFiltersGet$Response.fromJsonFactory,
    );

    return _apiVehiclesFiltersGet(version: version);
  }

  ///In-Game Vehicle Filters
  ///@param version Game version code to scope results to. Omit to use the current default version. Use `GET /api/game-versions` to list available versions and `GET /api/game-versions/default` to discover the default.
  @GET(path: '/api/vehicles/filters')
  Future<chopper.Response<ApiVehiclesFiltersGet$Response>>
  _apiVehiclesFiltersGet({
    @Query('version') String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Return all available filter values for in-game vehicles.',
      summary: 'In-Game Vehicle Filters',
      operationId: 'listVehicleFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Vehicles"],
      deprecated: false,
    ),
  });

  ///Get Version Changelog
  ///@param version Version code
  Future<chopper.Response<ApiGameVersionsVersionChangelogGet$Response>>
  apiGameVersionsVersionChangelogGet({required String? version}) {
    generatedMapping.putIfAbsent(
      ApiGameVersionsVersionChangelogGet$Response,
      () => ApiGameVersionsVersionChangelogGet$Response.fromJsonFactory,
    );

    return _apiGameVersionsVersionChangelogGet(version: version);
  }

  ///Get Version Changelog
  ///@param version Version code
  @GET(path: '/api/game-versions/{version}/changelog')
  Future<chopper.Response<ApiGameVersionsVersionChangelogGet$Response>>
  _apiGameVersionsVersionChangelogGet({
    @Path('version') required String? version,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns the changelog summary between the specified version and its predecessor.',
      summary: 'Get Version Changelog',
      operationId: 'getVersionChangelog',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Game Versions"],
      deprecated: false,
    ),
  });

  ///Get Version Changelog Changes
  ///@param version Version code
  ///@param filter[entity_type] Filter by entity type (item, vehicle)
  ///@param filter[change_type] Filter by change type (added, removed, modified)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  Future<chopper.Response<ApiGameVersionsVersionChangelogChangesGet$Response>>
  apiGameVersionsVersionChangelogChangesGet({
    required String? version,
    String? filterEntityType,
    String? filterChangeType,
    int? page,
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(
      ApiGameVersionsVersionChangelogChangesGet$Response,
      () => ApiGameVersionsVersionChangelogChangesGet$Response.fromJsonFactory,
    );

    return _apiGameVersionsVersionChangelogChangesGet(
      version: version,
      filterEntityType: filterEntityType,
      filterChangeType: filterChangeType,
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }

  ///Get Version Changelog Changes
  ///@param version Version code
  ///@param filter[entity_type] Filter by entity type (item, vehicle)
  ///@param filter[change_type] Filter by change type (added, removed, modified)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @GET(path: '/api/game-versions/{version}/changelog/changes')
  Future<chopper.Response<ApiGameVersionsVersionChangelogChangesGet$Response>>
  _apiGameVersionsVersionChangelogChangesGet({
    @Path('version') required String? version,
    @Query('filter[entity_type]') String? filterEntityType,
    @Query('filter[change_type]') String? filterChangeType,
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated diff entries for a version changelog. Filter by entity_type and change_type.',
      summary: 'Get Version Changelog Changes',
      operationId: 'listVersionChangelogChanges',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Game Versions"],
      deprecated: false,
    ),
  });

  ///OpenAPI Specification
  Future<chopper.Response<String>> apiOpenapiGet() {
    return _apiOpenapiGet();
  }

  ///OpenAPI Specification
  @GET(path: '/api/openapi')
  Future<chopper.Response<String>> _apiOpenapiGet({
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns the OpenAPI 3.0 specification as YAML. This spec describes all documented API endpoints, parameters, request bodies, and response schemas.',
      summary: 'OpenAPI Specification',
      operationId: 'getOpenApiSpec',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Meta"],
      deprecated: false,
    ),
  });

  ///Comm-Links Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Available Comm-Link includes
  ///@param filter[id] Exact match on the Comm-Link CIG ID
  ///@param filter[title] Partial match on the Comm-Link title
  ///@param filter[content] Full-text search within English Comm-Link translations
  ///@param filter[channel] Exact match on channel name (see GET /api/comm-links/filters for valid values)
  ///@param filter[series] Exact match on series name (see GET /api/comm-links/filters for valid values)
  ///@param filter[category] Exact match on category name (see GET /api/comm-links/filters for valid values)
  ///@param filter[created_at] Filter by publication year (YYYY) or exact date (YYYY-MM-DD)
  ///@param sort Sort field. Prefix with "-" for descending. Supported: id, title, images_count, links_count, channel, category, series, created_at.
  Future<chopper.Response<ApiCommLinksGet$Response>> apiCommLinksGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    List<String>? include,
    int? filterId,
    String? filterTitle,
    String? filterContent,
    String? filterChannel,
    String? filterSeries,
    String? filterCategory,
    String? filterCreatedAt,
    String? sort,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommLinksGet$Response,
      () => ApiCommLinksGet$Response.fromJsonFactory,
    );

    return _apiCommLinksGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      include: include,
      filterId: filterId,
      filterTitle: filterTitle,
      filterContent: filterContent,
      filterChannel: filterChannel,
      filterSeries: filterSeries,
      filterCategory: filterCategory,
      filterCreatedAt: filterCreatedAt,
      sort: sort,
    );
  }

  ///Comm-Links Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param include Available Comm-Link includes
  ///@param filter[id] Exact match on the Comm-Link CIG ID
  ///@param filter[title] Partial match on the Comm-Link title
  ///@param filter[content] Full-text search within English Comm-Link translations
  ///@param filter[channel] Exact match on channel name (see GET /api/comm-links/filters for valid values)
  ///@param filter[series] Exact match on series name (see GET /api/comm-links/filters for valid values)
  ///@param filter[category] Exact match on category name (see GET /api/comm-links/filters for valid values)
  ///@param filter[created_at] Filter by publication year (YYYY) or exact date (YYYY-MM-DD)
  ///@param sort Sort field. Prefix with "-" for descending. Supported: id, title, images_count, links_count, channel, category, series, created_at.
  @GET(path: '/api/comm-links')
  Future<chopper.Response<ApiCommLinksGet$Response>> _apiCommLinksGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('include') List<String>? include,
    @Query('filter[id]') int? filterId,
    @Query('filter[title]') String? filterTitle,
    @Query('filter[content]') String? filterContent,
    @Query('filter[channel]') String? filterChannel,
    @Query('filter[series]') String? filterSeries,
    @Query('filter[category]') String? filterCategory,
    @Query('filter[created_at]') String? filterCreatedAt,
    @Query('sort') String? sort,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated comm-links ordered by descending ID by default. Supports filtering by channel, category, series, title, content, and publication date. Results can be sorted by id, title, images_count, links_count, channel, category, series, and created_at. Use the include parameter to embed images or links.',
      summary: 'Comm-Links Overview',
      operationId: 'listCommLinks',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links"],
      deprecated: false,
    ),
  });

  ///Comm-Link Filters
  ///@param filter[id] Exact match on the Comm-Link CIG ID
  ///@param filter[title] Partial match on the Comm-Link title
  ///@param filter[content] Full-text search within English Comm-Link translations
  ///@param filter[channel] Exact match on channel name
  ///@param filter[series] Exact match on series name
  ///@param filter[category] Exact match on category name
  ///@param filter[created_at] Filter by publication year (YYYY) or exact date (YYYY-MM-DD)
  Future<chopper.Response<ApiCommLinksFiltersGet$Response>>
  apiCommLinksFiltersGet({
    int? filterId,
    String? filterTitle,
    String? filterContent,
    String? filterChannel,
    String? filterSeries,
    String? filterCategory,
    String? filterCreatedAt,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommLinksFiltersGet$Response,
      () => ApiCommLinksFiltersGet$Response.fromJsonFactory,
    );

    return _apiCommLinksFiltersGet(
      filterId: filterId,
      filterTitle: filterTitle,
      filterContent: filterContent,
      filterChannel: filterChannel,
      filterSeries: filterSeries,
      filterCategory: filterCategory,
      filterCreatedAt: filterCreatedAt,
    );
  }

  ///Comm-Link Filters
  ///@param filter[id] Exact match on the Comm-Link CIG ID
  ///@param filter[title] Partial match on the Comm-Link title
  ///@param filter[content] Full-text search within English Comm-Link translations
  ///@param filter[channel] Exact match on channel name
  ///@param filter[series] Exact match on series name
  ///@param filter[category] Exact match on category name
  ///@param filter[created_at] Filter by publication year (YYYY) or exact date (YYYY-MM-DD)
  @GET(path: '/api/comm-links/filters')
  Future<chopper.Response<ApiCommLinksFiltersGet$Response>>
  _apiCommLinksFiltersGet({
    @Query('filter[id]') int? filterId,
    @Query('filter[title]') String? filterTitle,
    @Query('filter[content]') String? filterContent,
    @Query('filter[channel]') String? filterChannel,
    @Query('filter[series]') String? filterSeries,
    @Query('filter[category]') String? filterCategory,
    @Query('filter[created_at]') String? filterCreatedAt,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns available category, channel, and series filter values for Comm-Links, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.',
      summary: 'Comm-Link Filters',
      operationId: 'listCommLinkFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links"],
      deprecated: false,
    ),
  });

  ///Comm-Link Detail
  ///@param include Available Comm-Link includes
  ///@param id Comm-Link CIG ID, starting from 12663
  Future<chopper.Response<ApiCommLinksIdGet$Response>> apiCommLinksIdGet({
    List<String>? include,
    required int? id,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommLinksIdGet$Response,
      () => ApiCommLinksIdGet$Response.fromJsonFactory,
    );

    return _apiCommLinksIdGet(include: include, id: id);
  }

  ///Comm-Link Detail
  ///@param include Available Comm-Link includes
  ///@param id Comm-Link CIG ID, starting from 12663
  @GET(path: '/api/comm-links/{id}')
  Future<chopper.Response<ApiCommLinksIdGet$Response>> _apiCommLinksIdGet({
    @Query('include') List<String>? include,
    @Path('id') required int? id,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a single Comm-Link by its CIG ID. Images with hash and metadata are always included. The response contains prev_id and next_id metadata for sequential navigation between Comm-Links.',
      summary: 'Comm-Link Detail',
      operationId: 'getCommLink',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links"],
      deprecated: false,
    ),
  });

  ///Comm-Link Search (Deprecated)
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Available Comm-Link includes
  ///@param filter[channel] Exact match on channel name (see GET /api/comm-links/filters for valid values)
  ///@param filter[series] Exact match on series name (see GET /api/comm-links/filters for valid values)
  ///@param filter[category] Exact match on category name (see GET /api/comm-links/filters for valid values)
  @deprecated
  Future<chopper.Response<ApiCommLinksSearchPost$Response>>
  apiCommLinksSearchPost({
    String? locale,
    List<String>? include,
    String? filterChannel,
    String? filterSeries,
    String? filterCategory,
    required ApiCommLinksSearchPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommLinksSearchPost$Response,
      () => ApiCommLinksSearchPost$Response.fromJsonFactory,
    );

    return _apiCommLinksSearchPost(
      locale: locale,
      include: include,
      filterChannel: filterChannel,
      filterSeries: filterSeries,
      filterCategory: filterCategory,
      body: body,
    );
  }

  ///Comm-Link Search (Deprecated)
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param include Available Comm-Link includes
  ///@param filter[channel] Exact match on channel name (see GET /api/comm-links/filters for valid values)
  ///@param filter[series] Exact match on series name (see GET /api/comm-links/filters for valid values)
  ///@param filter[category] Exact match on category name (see GET /api/comm-links/filters for valid values)
  @deprecated
  @POST(path: '/api/comm-links/search', optionalBody: true)
  Future<chopper.Response<ApiCommLinksSearchPost$Response>>
  _apiCommLinksSearchPost({
    @Query('locale') String? locale,
    @Query('include') List<String>? include,
    @Query('filter[channel]') String? filterChannel,
    @Query('filter[series]') String? filterSeries,
    @Query('filter[category]') String? filterCategory,
    @Body() required ApiCommLinksSearchPost$RequestBody? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/comm-links?filter[title]={value} for title search. This endpoint will be removed in a future version.',
      summary: 'Comm-Link Search (Deprecated)',
      operationId: 'searchCommLinksDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links"],
      deprecated: true,
    ),
  });

  ///Comm-Link Reverse Image Link Search
  Future<chopper.Response<ApiCommLinksReverseImageLinkSearchPost$Response>>
  apiCommLinksReverseImageLinkSearchPost({
    required ApiCommLinksReverseImageLinkSearchPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommLinksReverseImageLinkSearchPost$Response,
      () => ApiCommLinksReverseImageLinkSearchPost$Response.fromJsonFactory,
    );

    return _apiCommLinksReverseImageLinkSearchPost(body: body);
  }

  ///Comm-Link Reverse Image Link Search
  @POST(path: '/api/comm-links/reverse-image-link-search', optionalBody: true)
  Future<chopper.Response<ApiCommLinksReverseImageLinkSearchPost$Response>>
  _apiCommLinksReverseImageLinkSearchPost({
    @Body() required ApiCommLinksReverseImageLinkSearchPost$RequestBody? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Return comm-links that reference the same RSI-hosted image URL.',
      summary: 'Comm-Link Reverse Image Link Search',
      operationId: 'reverseImageLinkSearch',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links", "Search"],
      deprecated: false,
    ),
  });

  ///Comm-Link Reverse Image Search
  Future<chopper.Response<ApiCommLinksReverseImageSearchPost$Response>>
  apiCommLinksReverseImageSearchPost({
    required List<int> image,
    int? similarity,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommLinksReverseImageSearchPost$Response,
      () => ApiCommLinksReverseImageSearchPost$Response.fromJsonFactory,
    );

    return _apiCommLinksReverseImageSearchPost(
      image: image,
      similarity: similarity,
    );
  }

  ///Comm-Link Reverse Image Search
  @POST(path: '/api/comm-links/reverse-image-search', optionalBody: true)
  @Multipart()
  Future<chopper.Response<ApiCommLinksReverseImageSearchPost$Response>>
  _apiCommLinksReverseImageSearchPost({
    @PartFile() required List<int> image,
    @Part('similarity') int? similarity,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Search comm-links by uploading an image and specifying a similarity threshold. Requires the GD PHP extension.',
      summary: 'Comm-Link Reverse Image Search',
      operationId: 'reverseImageSearch',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links", "Search"],
      deprecated: false,
    ),
  });

  ///Comm-Link Reverse Image Similar Search
  ///@param image Internal database ID of the image
  ///@param similarity Similarity threshold percentage (1-100). Defaults to 50.
  Future<chopper.Response<ApiCommLinkImagesImageSimilarGet$Response>>
  apiCommLinkImagesImageSimilarGet({required int? image, int? similarity}) {
    generatedMapping.putIfAbsent(
      ApiCommLinkImagesImageSimilarGet$Response,
      () => ApiCommLinkImagesImageSimilarGet$Response.fromJsonFactory,
    );

    return _apiCommLinkImagesImageSimilarGet(
      image: image,
      similarity: similarity,
    );
  }

  ///Comm-Link Reverse Image Similar Search
  ///@param image Internal database ID of the image
  ///@param similarity Similarity threshold percentage (1-100). Defaults to 50.
  @GET(path: '/api/comm-link-images/{image}/similar')
  Future<chopper.Response<ApiCommLinkImagesImageSimilarGet$Response>>
  _apiCommLinkImagesImageSimilarGet({
    @Path('image') required int? image,
    @Query('similarity') int? similarity,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Find Comm-Link images similar to an existing RSI-hosted image.',
      summary: 'Comm-Link Reverse Image Similar Search',
      operationId: 'findSimilarImages',
      consumes: [],
      produces: [],
      security: ["sanctum"],
      tags: ["Comm-Links", "Search"],
      deprecated: false,
    ),
  });

  ///Comm-Link Images
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[tags] Partial match on tag name. WARNING: Images have no tags currently.
  Future<chopper.Response<ApiCommLinkImagesGet$Response>> apiCommLinkImagesGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterTags,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommLinkImagesGet$Response,
      () => ApiCommLinkImagesGet$Response.fromJsonFactory,
    );

    return _apiCommLinkImagesGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterTags: filterTags,
    );
  }

  ///Comm-Link Images
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[tags] Partial match on tag name. WARNING: Images have no tags currently.
  @GET(path: '/api/comm-link-images')
  Future<chopper.Response<ApiCommLinkImagesGet$Response>>
  _apiCommLinkImagesGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[tags]') String? filterTags,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'List available comm-link images with pagination. Each image includes its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.',
      summary: 'Comm-Link Images',
      operationId: 'listCommLinkImages',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links", "Images"],
      deprecated: false,
    ),
  });

  ///Comm-Link Image Detail
  ///@param image Internal database ID of the image
  Future<chopper.Response<ApiCommLinkImagesImageGet$Response>>
  apiCommLinkImagesImageGet({required int? image}) {
    generatedMapping.putIfAbsent(
      ApiCommLinkImagesImageGet$Response,
      () => ApiCommLinkImagesImageGet$Response.fromJsonFactory,
    );

    return _apiCommLinkImagesImageGet(image: image);
  }

  ///Comm-Link Image Detail
  ///@param image Internal database ID of the image
  @GET(path: '/api/comm-link-images/{image}')
  Future<chopper.Response<ApiCommLinkImagesImageGet$Response>>
  _apiCommLinkImagesImageGet({
    @Path('image') required int? image,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a single comm-link image with its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.',
      summary: 'Comm-Link Image Detail',
      operationId: 'getCommLinkImage',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links", "Images"],
      deprecated: false,
    ),
  });

  ///Comm-Link Images Random
  ///@param limit Number of random images to return
  ///@param filter[tags] Partial match on tag name
  Future<chopper.Response<ApiCommLinkImagesRandomGet$Response>>
  apiCommLinkImagesRandomGet({int? limit, String? filterTags}) {
    generatedMapping.putIfAbsent(
      ApiCommLinkImagesRandomGet$Response,
      () => ApiCommLinkImagesRandomGet$Response.fromJsonFactory,
    );

    return _apiCommLinkImagesRandomGet(limit: limit, filterTags: filterTags);
  }

  ///Comm-Link Images Random
  ///@param limit Number of random images to return
  ///@param filter[tags] Partial match on tag name
  @GET(path: '/api/comm-link-images/random')
  Future<chopper.Response<ApiCommLinkImagesRandomGet$Response>>
  _apiCommLinkImagesRandomGet({
    @Query('limit') int? limit,
    @Query('filter[tags]') String? filterTags,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve random comm-link images (minimum 250 KB), optionally filtered by tag name. Only images without a base image are included.',
      summary: 'Comm-Link Images Random',
      operationId: 'getRandomCommLinkImage',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links", "Images"],
      deprecated: false,
    ),
  });

  ///Comm-Link Image Search by filename
  ///@param filter[tags] Partial match on tag name
  Future<chopper.Response<ApiCommLinkImagesSearchPost$Response>>
  apiCommLinkImagesSearchPost({
    String? filterTags,
    required ApiCommLinkImagesSearchPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiCommLinkImagesSearchPost$Response,
      () => ApiCommLinkImagesSearchPost$Response.fromJsonFactory,
    );

    return _apiCommLinkImagesSearchPost(filterTags: filterTags, body: body);
  }

  ///Comm-Link Image Search by filename
  ///@param filter[tags] Partial match on tag name
  @POST(path: '/api/comm-link-images/search', optionalBody: true)
  Future<chopper.Response<ApiCommLinkImagesSearchPost$Response>>
  _apiCommLinkImagesSearchPost({
    @Query('filter[tags]') String? filterTags,
    @Body() required ApiCommLinkImagesSearchPost$RequestBody? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Search comm-link images by filename with optional tag filtering. Only images without a base image and with non-zero file size are returned.',
      summary: 'Comm-Link Image Search by filename',
      operationId: 'searchCommLinkImages',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Comm-Links", "Images", "Search"],
      deprecated: false,
    ),
  });

  ///Galactapedia Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[category] Exact match on category name (see GET /api/galactapedia/filters for valid values)
  ///@param filter[tag] Exact match on tag name (see GET /api/galactapedia/filters for valid values)
  ///@param filter[template] Exact match on template name (see GET /api/galactapedia/filters for valid values)
  ///@param filter[title] Partial match on the article title
  ///@param filter[created_at] Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD)
  ///@param sort Sort field. Prefix with "-" for descending. Supported: title, categories_count, tags_count, related_articles_count.
  Future<chopper.Response<ApiGalactapediaGet$Response>> apiGalactapediaGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterCategory,
    String? filterTag,
    String? filterTemplate,
    String? filterTitle,
    String? filterCreatedAt,
    String? sort,
  }) {
    generatedMapping.putIfAbsent(
      ApiGalactapediaGet$Response,
      () => ApiGalactapediaGet$Response.fromJsonFactory,
    );

    return _apiGalactapediaGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterCategory: filterCategory,
      filterTag: filterTag,
      filterTemplate: filterTemplate,
      filterTitle: filterTitle,
      filterCreatedAt: filterCreatedAt,
      sort: sort,
    );
  }

  ///Galactapedia Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[category] Exact match on category name (see GET /api/galactapedia/filters for valid values)
  ///@param filter[tag] Exact match on tag name (see GET /api/galactapedia/filters for valid values)
  ///@param filter[template] Exact match on template name (see GET /api/galactapedia/filters for valid values)
  ///@param filter[title] Partial match on the article title
  ///@param filter[created_at] Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD)
  ///@param sort Sort field. Prefix with "-" for descending. Supported: title, categories_count, tags_count, related_articles_count.
  @GET(path: '/api/galactapedia')
  Future<chopper.Response<ApiGalactapediaGet$Response>> _apiGalactapediaGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[category]') String? filterCategory,
    @Query('filter[tag]') String? filterTag,
    @Query('filter[template]') String? filterTemplate,
    @Query('filter[title]') String? filterTitle,
    @Query('filter[created_at]') String? filterCreatedAt,
    @Query('sort') String? sort,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated Galactapedia articles ordered by descending ID by default. Each article includes its templates, categories, and tags. Supports filtering by category, tag, template, title, and creation date. Results can be sorted by title, categories_count, tags_count, and related_articles_count.',
      summary: 'Galactapedia Overview',
      operationId: 'listGalactapediaArticles',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Galactapedia"],
      deprecated: false,
    ),
  });

  ///Galactapedia Filters
  ///@param filter[category] Exact match on category name
  ///@param filter[tag] Exact match on tag name
  ///@param filter[template] Exact match on template name
  ///@param filter[title] Partial match on the article title
  ///@param filter[created_at] Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD)
  Future<chopper.Response<ApiGalactapediaFiltersGet$Response>>
  apiGalactapediaFiltersGet({
    String? filterCategory,
    String? filterTag,
    String? filterTemplate,
    String? filterTitle,
    String? filterCreatedAt,
  }) {
    generatedMapping.putIfAbsent(
      ApiGalactapediaFiltersGet$Response,
      () => ApiGalactapediaFiltersGet$Response.fromJsonFactory,
    );

    return _apiGalactapediaFiltersGet(
      filterCategory: filterCategory,
      filterTag: filterTag,
      filterTemplate: filterTemplate,
      filterTitle: filterTitle,
      filterCreatedAt: filterCreatedAt,
    );
  }

  ///Galactapedia Filters
  ///@param filter[category] Exact match on category name
  ///@param filter[tag] Exact match on tag name
  ///@param filter[template] Exact match on template name
  ///@param filter[title] Partial match on the article title
  ///@param filter[created_at] Filter by creation year (YYYY), year-month (YYYY-MM), or exact date (YYYY-MM-DD)
  @GET(path: '/api/galactapedia/filters')
  Future<chopper.Response<ApiGalactapediaFiltersGet$Response>>
  _apiGalactapediaFiltersGet({
    @Query('filter[category]') String? filterCategory,
    @Query('filter[tag]') String? filterTag,
    @Query('filter[template]') String? filterTemplate,
    @Query('filter[title]') String? filterTitle,
    @Query('filter[created_at]') String? filterCreatedAt,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns available category, tag, and template filter values for Galactapedia articles, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.',
      summary: 'Galactapedia Filters',
      operationId: 'listGalactapediaFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Galactapedia"],
      deprecated: false,
    ),
  });

  ///Galactapedia Article
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param id Galactapedia Article CIG ID
  ///@param include Available Galactapedia includes
  Future<chopper.Response<ApiGalactapediaIdGet$Response>> apiGalactapediaIdGet({
    String? locale,
    required String? id,
    List<String>? include,
  }) {
    generatedMapping.putIfAbsent(
      ApiGalactapediaIdGet$Response,
      () => ApiGalactapediaIdGet$Response.fromJsonFactory,
    );

    return _apiGalactapediaIdGet(locale: locale, id: id, include: include);
  }

  ///Galactapedia Article
  ///@param locale Locale code for translated fields. Supported values depend on available translations (e.g. en, de, zh).
  ///@param id Galactapedia Article CIG ID
  ///@param include Available Galactapedia includes
  @GET(path: '/api/galactapedia/{id}')
  Future<chopper.Response<ApiGalactapediaIdGet$Response>>
  _apiGalactapediaIdGet({
    @Query('locale') String? locale,
    @Path('id') required String? id,
    @Query('include') List<String>? include,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a Galactapedia article by ID with available includes and translations.',
      summary: 'Galactapedia Article',
      operationId: 'getGalactapediaArticle',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Galactapedia"],
      deprecated: false,
    ),
  });

  ///Galactapedia Article Search (Deprecated)
  @deprecated
  Future<chopper.Response<ApiGalactapediaSearchPost$Response>>
  apiGalactapediaSearchPost({required Object? body}) {
    generatedMapping.putIfAbsent(
      ApiGalactapediaSearchPost$Response,
      () => ApiGalactapediaSearchPost$Response.fromJsonFactory,
    );

    return _apiGalactapediaSearchPost(body: body);
  }

  ///Galactapedia Article Search (Deprecated)
  @deprecated
  @POST(path: '/api/galactapedia/search', optionalBody: true)
  Future<chopper.Response<ApiGalactapediaSearchPost$Response>>
  _apiGalactapediaSearchPost({
    @Body() required Object? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/galactapedia?filter[title]={value} for title search. This endpoint will be removed in a future version.',
      summary: 'Galactapedia Article Search (Deprecated)',
      operationId: 'searchGalactapediaDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Galactapedia", "Search"],
      deprecated: true,
    ),
  });

  ///Starmap Celestial Objects Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[starsystem]
  ///@param filter[name] Partial match on celestial object name
  ///@param filter[designation]
  ///@param filter[type]
  ///@param sort
  ///@param include Include additional relationships (affiliation, starsystem, jumppoints).
  Future<chopper.Response<ApiCelestialObjectsGet$Response>>
  apiCelestialObjectsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterStarsystem,
    String? filterName,
    String? filterDesignation,
    String? filterType,
    String? sort,
    String? include,
  }) {
    generatedMapping.putIfAbsent(
      ApiCelestialObjectsGet$Response,
      () => ApiCelestialObjectsGet$Response.fromJsonFactory,
    );

    return _apiCelestialObjectsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterStarsystem: filterStarsystem,
      filterName: filterName,
      filterDesignation: filterDesignation,
      filterType: filterType,
      sort: sort,
      include: include,
    );
  }

  ///Starmap Celestial Objects Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[starsystem]
  ///@param filter[name] Partial match on celestial object name
  ///@param filter[designation]
  ///@param filter[type]
  ///@param sort
  ///@param include Include additional relationships (affiliation, starsystem, jumppoints).
  @GET(path: '/api/celestial-objects')
  Future<chopper.Response<ApiCelestialObjectsGet$Response>>
  _apiCelestialObjectsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[starsystem]') String? filterStarsystem,
    @Query('filter[name]') String? filterName,
    @Query('filter[designation]') String? filterDesignation,
    @Query('filter[type]') String? filterType,
    @Query('sort') String? sort,
    @Query('include') String? include,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated celestial objects with optional relationships.',
      summary: 'Starmap Celestial Objects Overview',
      operationId: 'listCelestialObjects',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Celestial Object Detail
  ///@param code Celestial Object code (e.g., NYX.JUMPPOINTS.BREMEN)
  ///@param include Include additional relationships (affiliation, starsystem, jumppoints).
  Future<chopper.Response<ApiCelestialObjectsCodeGet$Response>>
  apiCelestialObjectsCodeGet({required String? code, String? include}) {
    generatedMapping.putIfAbsent(
      ApiCelestialObjectsCodeGet$Response,
      () => ApiCelestialObjectsCodeGet$Response.fromJsonFactory,
    );

    return _apiCelestialObjectsCodeGet(code: code, include: include);
  }

  ///Celestial Object Detail
  ///@param code Celestial Object code (e.g., NYX.JUMPPOINTS.BREMEN)
  ///@param include Include additional relationships (affiliation, starsystem, jumppoints).
  @GET(path: '/api/celestial-objects/{code}')
  Future<chopper.Response<ApiCelestialObjectsCodeGet$Response>>
  _apiCelestialObjectsCodeGet({
    @Path('code') required String? code,
    @Query('include') String? include,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a celestial object by code, optionally including relations.',
      summary: 'Celestial Object Detail',
      operationId: 'getCelestialObject',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Celestial Object Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  Future<chopper.Response<ApiCelestialObjectsSearchPost$Response>>
  apiCelestialObjectsSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required ApiCelestialObjectsSearchPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiCelestialObjectsSearchPost$Response,
      () => ApiCelestialObjectsSearchPost$Response.fromJsonFactory,
    );

    return _apiCelestialObjectsSearchPost(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      body: body,
    );
  }

  ///Celestial Object Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  @POST(path: '/api/celestial-objects/search', optionalBody: true)
  Future<chopper.Response<ApiCelestialObjectsSearchPost$Response>>
  _apiCelestialObjectsSearchPost({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Body() required ApiCelestialObjectsSearchPost$RequestBody? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/celestial-objects?filter[name]={value} for name search. This endpoint will be removed in a future version.',
      summary: 'Celestial Object Search (Deprecated)',
      operationId: 'searchCelestialObjectsDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap", "Search"],
      deprecated: true,
    ),
  });

  ///Starmap Starsystems Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[affiliation]
  ///@param filter[code]
  ///@param filter[name]
  ///@param filter[status]
  ///@param filter[type]
  ///@param filter[size]
  ///@param sort
  ///@param include Include additional relationships (affiliation, celestialObjects, jumppoints).
  Future<chopper.Response<ApiStarsystemsGet$Response>> apiStarsystemsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterAffiliation,
    String? filterCode,
    String? filterName,
    String? filterStatus,
    String? filterType,
    num? filterSize,
    String? sort,
    String? include,
  }) {
    generatedMapping.putIfAbsent(
      ApiStarsystemsGet$Response,
      () => ApiStarsystemsGet$Response.fromJsonFactory,
    );

    return _apiStarsystemsGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterAffiliation: filterAffiliation,
      filterCode: filterCode,
      filterName: filterName,
      filterStatus: filterStatus,
      filterType: filterType,
      filterSize: filterSize,
      sort: sort,
      include: include,
    );
  }

  ///Starmap Starsystems Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[affiliation]
  ///@param filter[code]
  ///@param filter[name]
  ///@param filter[status]
  ///@param filter[type]
  ///@param filter[size]
  ///@param sort
  ///@param include Include additional relationships (affiliation, celestialObjects, jumppoints).
  @GET(path: '/api/starsystems')
  Future<chopper.Response<ApiStarsystemsGet$Response>> _apiStarsystemsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[affiliation]') String? filterAffiliation,
    @Query('filter[code]') String? filterCode,
    @Query('filter[name]') String? filterName,
    @Query('filter[status]') String? filterStatus,
    @Query('filter[type]') String? filterType,
    @Query('filter[size]') num? filterSize,
    @Query('sort') String? sort,
    @Query('include') String? include,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated starsystems, optionally including related resources.',
      summary: 'Starmap Starsystems Overview',
      operationId: 'listStarsystems',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Starsystem Detail
  ///@param code Starsystem code or identifier (e.g. SOL)
  ///@param include Include additional relationships (affiliation, celestialObjects, jumppoints).
  Future<chopper.Response<ApiStarsystemsCodeGet$Response>>
  apiStarsystemsCodeGet({required String? code, String? include}) {
    generatedMapping.putIfAbsent(
      ApiStarsystemsCodeGet$Response,
      () => ApiStarsystemsCodeGet$Response.fromJsonFactory,
    );

    return _apiStarsystemsCodeGet(code: code, include: include);
  }

  ///Starsystem Detail
  ///@param code Starsystem code or identifier (e.g. SOL)
  ///@param include Include additional relationships (affiliation, celestialObjects, jumppoints).
  @GET(path: '/api/starsystems/{code}')
  Future<chopper.Response<ApiStarsystemsCodeGet$Response>>
  _apiStarsystemsCodeGet({
    @Path('code') required String? code,
    @Query('include') String? include,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a starsystem by code or identifier, with optional includes.',
      summary: 'Starsystem Detail',
      operationId: 'getStarsystem',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Starsystem Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  Future<chopper.Response<ApiStarsystemsSearchPost$Response>>
  apiStarsystemsSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required ApiStarsystemsSearchPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiStarsystemsSearchPost$Response,
      () => ApiStarsystemsSearchPost$Response.fromJsonFactory,
    );

    return _apiStarsystemsSearchPost(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      body: body,
    );
  }

  ///Starsystem Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @deprecated
  @POST(path: '/api/starsystems/search', optionalBody: true)
  Future<chopper.Response<ApiStarsystemsSearchPost$Response>>
  _apiStarsystemsSearchPost({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Body() required ApiStarsystemsSearchPost$RequestBody? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/starsystems?filter[name]={value} for name search. This endpoint will be removed in a future version.',
      summary: 'Starsystem Search (Deprecated)',
      operationId: 'searchStarsystemsDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap", "Search"],
      deprecated: true,
    ),
  });

  ///Starsystem Filters
  Future<chopper.Response<ApiStarsystemsFiltersGet$Response>>
  apiStarsystemsFiltersGet() {
    generatedMapping.putIfAbsent(
      ApiStarsystemsFiltersGet$Response,
      () => ApiStarsystemsFiltersGet$Response.fromJsonFactory,
    );

    return _apiStarsystemsFiltersGet();
  }

  ///Starsystem Filters
  @GET(path: '/api/starsystems/filters')
  Future<chopper.Response<ApiStarsystemsFiltersGet$Response>>
  _apiStarsystemsFiltersGet({
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description: 'Return all available filter values for starsystems.',
      summary: 'Starsystem Filters',
      operationId: 'listStarsystemFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Starmap"],
      deprecated: false,
    ),
  });

  ///Latest Crowdfunding Statistics
  Future<chopper.Response<ApiStatsLatestGet$Response>> apiStatsLatestGet() {
    generatedMapping.putIfAbsent(
      ApiStatsLatestGet$Response,
      () => ApiStatsLatestGet$Response.fromJsonFactory,
    );

    return _apiStatsLatestGet();
  }

  ///Latest Crowdfunding Statistics
  @GET(path: '/api/stats/latest')
  Future<chopper.Response<ApiStatsLatestGet$Response>> _apiStatsLatestGet({
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Get the most recent Star Citizen crowdfunding statistics snapshot, including funds raised (USD), fan count, and fleet size.',
      summary: 'Latest Crowdfunding Statistics',
      operationId: 'getLatestStats',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Stats"],
      deprecated: false,
    ),
  });

  ///Paginated Historical Statistics
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  Future<chopper.Response<ApiStatsGet$Response>> apiStatsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
  }) {
    generatedMapping.putIfAbsent(
      ApiStatsGet$Response,
      () => ApiStatsGet$Response.fromJsonFactory,
    );

    return _apiStatsGet(page: page, pageNumber: pageNumber, pageSize: pageSize);
  }

  ///Paginated Historical Statistics
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  @GET(path: '/api/stats')
  Future<chopper.Response<ApiStatsGet$Response>> _apiStatsGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Get paginated historical Star Citizen crowdfunding statistics, ordered by most recent first. Supports page-based pagination.',
      summary: 'Paginated Historical Statistics',
      operationId: 'listStats',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Stats"],
      deprecated: false,
    ),
  });

  ///Ship Matrix Vehicles Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[manufacturer] Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values)
  ///@param filter[size] Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values)
  ///@param filter[type] Filter by vehicle type slug
  ///@param filter[focus] Filter by vehicle focus slug (comma-separated for multiple)
  ///@param filter[production_status] Filter by production status slug
  ///@param filter[name] Partial match on vehicle name
  ///@param sort Sort field. Prefix with "-" for descending. Supported: id, chassis_id, name, msrp, updated_at, length, width, height, cargo_capacity, min_crew, max_crew, manufacturer, focus, type, size
  Future<chopper.Response<ApiShipmatrixVehiclesGet$Response>>
  apiShipmatrixVehiclesGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterManufacturer,
    String? filterSize,
    String? filterType,
    String? filterFocus,
    String? filterProductionStatus,
    String? filterName,
    String? sort,
  }) {
    generatedMapping.putIfAbsent(
      ApiShipmatrixVehiclesGet$Response,
      () => ApiShipmatrixVehiclesGet$Response.fromJsonFactory,
    );

    return _apiShipmatrixVehiclesGet(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterManufacturer: filterManufacturer,
      filterSize: filterSize,
      filterType: filterType,
      filterFocus: filterFocus,
      filterProductionStatus: filterProductionStatus,
      filterName: filterName,
      sort: sort,
    );
  }

  ///Ship Matrix Vehicles Overview
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[manufacturer] Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values)
  ///@param filter[size] Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values)
  ///@param filter[type] Filter by vehicle type slug
  ///@param filter[focus] Filter by vehicle focus slug (comma-separated for multiple)
  ///@param filter[production_status] Filter by production status slug
  ///@param filter[name] Partial match on vehicle name
  ///@param sort Sort field. Prefix with "-" for descending. Supported: id, chassis_id, name, msrp, updated_at, length, width, height, cargo_capacity, min_crew, max_crew, manufacturer, focus, type, size
  @GET(path: '/api/shipmatrix/vehicles')
  Future<chopper.Response<ApiShipmatrixVehiclesGet$Response>>
  _apiShipmatrixVehiclesGet({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[size]') String? filterSize,
    @Query('filter[type]') String? filterType,
    @Query('filter[focus]') String? filterFocus,
    @Query('filter[production_status]') String? filterProductionStatus,
    @Query('filter[name]') String? filterName,
    @Query('sort') String? sort,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns paginated Ship Matrix vehicles with optional filters. SKU variants and loaner vehicles are included by default.',
      summary: 'Ship Matrix Vehicles Overview',
      operationId: 'listShipMatrixVehicles',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Ship Matrix", "Vehicles"],
      deprecated: false,
    ),
  });

  ///Ship Matrix Vehicle Filters
  Future<chopper.Response<ApiShipmatrixVehiclesFiltersGet$Response>>
  apiShipmatrixVehiclesFiltersGet() {
    generatedMapping.putIfAbsent(
      ApiShipmatrixVehiclesFiltersGet$Response,
      () => ApiShipmatrixVehiclesFiltersGet$Response.fromJsonFactory,
    );

    return _apiShipmatrixVehiclesFiltersGet();
  }

  ///Ship Matrix Vehicle Filters
  @GET(path: '/api/shipmatrix/vehicles/filters')
  Future<chopper.Response<ApiShipmatrixVehiclesFiltersGet$Response>>
  _apiShipmatrixVehiclesFiltersGet({
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Return all available filter values for Ship Matrix vehicles. Supports cross-filtering: pass filter parameters to get filtered facet counts.',
      summary: 'Ship Matrix Vehicle Filters',
      operationId: 'listShipMatrixFilters',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Ship Matrix", "Vehicles"],
      deprecated: false,
    ),
  });

  ///Ship Matrix Vehicle Detail
  ///@param slug Vehicle slug
  ///@param include Include additional relationships (components, loaner, skus)
  Future<chopper.Response<ApiShipmatrixVehiclesSlugGet$Response>>
  apiShipmatrixVehiclesSlugGet({required String? slug, String? include}) {
    generatedMapping.putIfAbsent(
      ApiShipmatrixVehiclesSlugGet$Response,
      () => ApiShipmatrixVehiclesSlugGet$Response.fromJsonFactory,
    );

    return _apiShipmatrixVehiclesSlugGet(slug: slug, include: include);
  }

  ///Ship Matrix Vehicle Detail
  ///@param slug Vehicle slug
  ///@param include Include additional relationships (components, loaner, skus)
  @GET(path: '/api/shipmatrix/vehicles/{slug}')
  Future<chopper.Response<ApiShipmatrixVehiclesSlugGet$Response>>
  _apiShipmatrixVehiclesSlugGet({
    @Path('slug') required String? slug,
    @Query('include') String? include,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Retrieve a Ship Matrix vehicle by slug. Use the "include" query parameter to load additional relationships: components, loaner, skus.',
      summary: 'Ship Matrix Vehicle Detail',
      operationId: 'getShipMatrixVehicle',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Ship Matrix", "Vehicles"],
      deprecated: false,
    ),
  });

  ///Ship Matrix Vehicle Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[manufacturer] Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values)
  ///@param filter[size] Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values)
  ///@param filter[type] Filter by vehicle type slug
  ///@param filter[focus] Filter by vehicle focus slug (comma-separated for multiple)
  ///@param filter[production_status] Filter by production status slug
  @deprecated
  Future<chopper.Response<ApiShipmatrixVehiclesSearchPost$Response>>
  apiShipmatrixVehiclesSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterManufacturer,
    String? filterSize,
    String? filterType,
    String? filterFocus,
    String? filterProductionStatus,
    required Object? body,
  }) {
    generatedMapping.putIfAbsent(
      ApiShipmatrixVehiclesSearchPost$Response,
      () => ApiShipmatrixVehiclesSearchPost$Response.fromJsonFactory,
    );

    return _apiShipmatrixVehiclesSearchPost(
      page: page,
      pageNumber: pageNumber,
      pageSize: pageSize,
      filterManufacturer: filterManufacturer,
      filterSize: filterSize,
      filterType: filterType,
      filterFocus: filterFocus,
      filterProductionStatus: filterProductionStatus,
      body: body,
    );
  }

  ///Ship Matrix Vehicle Search (Deprecated)
  ///@param page Page number for pagination (starts at 1). Prefer using `page[number]` instead.
  ///@param page[number] Page number for pagination (starts at 1).
  ///@param page[size] Number of results per page. Maximum 200.
  ///@param filter[manufacturer] Exact match on manufacturer name (see GET /api/shipmatrix/vehicles/filters for valid values)
  ///@param filter[size] Exact match on size slug (see GET /api/shipmatrix/vehicles/filters for valid values)
  ///@param filter[type] Filter by vehicle type slug
  ///@param filter[focus] Filter by vehicle focus slug (comma-separated for multiple)
  ///@param filter[production_status] Filter by production status slug
  @deprecated
  @POST(path: '/api/shipmatrix/vehicles/search', optionalBody: true)
  Future<chopper.Response<ApiShipmatrixVehiclesSearchPost$Response>>
  _apiShipmatrixVehiclesSearchPost({
    @Query('page') int? page,
    @Query('page[number]') int? pageNumber,
    @Query('page[size]') int? pageSize,
    @Query('filter[manufacturer]') String? filterManufacturer,
    @Query('filter[size]') String? filterSize,
    @Query('filter[type]') String? filterType,
    @Query('filter[focus]') String? filterFocus,
    @Query('filter[production_status]') String? filterProductionStatus,
    @Body() required Object? body,
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Deprecated. Use GET /api/shipmatrix/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.',
      summary: 'Ship Matrix Vehicle Search (Deprecated)',
      operationId: 'searchShipMatrixVehiclesDeprecated',
      consumes: [],
      produces: [],
      security: [],
      tags: ["Ship Matrix", "Vehicles", "Search"],
      deprecated: true,
    ),
  });

  ///Get Authenticated User
  Future<chopper.Response<ApiUserGet$Response>> apiUserGet() {
    generatedMapping.putIfAbsent(
      ApiUserGet$Response,
      () => ApiUserGet$Response.fromJsonFactory,
    );

    return _apiUserGet();
  }

  ///Get Authenticated User
  @GET(path: '/api/user')
  Future<chopper.Response<ApiUserGet$Response>> _apiUserGet({
    @chopper.Tag()
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
      description:
          'Returns the currently authenticated user. Requires a valid Sanctum bearer token.',
      summary: 'Get Authenticated User',
      operationId: 'getAuthenticatedUser',
      consumes: [],
      produces: [],
      security: ["sanctum"],
      tags: ["Auth"],
      deprecated: false,
    ),
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
