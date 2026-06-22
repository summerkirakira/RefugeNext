// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'starcitizen_wiki.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$StarcitizenWiki extends StarcitizenWiki {
  _$StarcitizenWiki([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = StarcitizenWiki;

  @override
  Future<Response<ApiBlueprintsGet$Response>> _apiBlueprintsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated crafting blueprints, including ingredients, crafted items, and dismantle returns. Results are scoped to the requested or default game version.',
        summary: 'List Game Blueprints',
        operationId: 'listBlueprints',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Blueprints"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/blueprints');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'version': version,
      'sort': sort,
      'filter[query]': filterQuery,
      'filter[output.uuid]': filterOutputUuid,
      'filter[output.name]': filterOutputName,
      'filter[output.class]': filterOutputClass,
      'filter[output.type]': filterOutputType,
      'filter[default]': filterDefault,
      'filter[ingredient]': filterIngredient,
      'filter[ingredient.uuid]': filterIngredientUuid,
      'filter[resource.uuid]': filterResourceUuid,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiBlueprintsGet$Response, ApiBlueprintsGet$Response>($request);
  }

  @override
  Future<Response<ApiBlueprintsBlueprintGet$Response>>
      _apiBlueprintsBlueprintGet({
    required String? blueprint,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns full detail for a single crafting blueprint, including ingredients, crafted item, dismantle returns, and associated missions. Scoped to the requested or default game version.',
        summary: 'Get Game Blueprint Detail',
        operationId: 'getBlueprint',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Blueprints"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/blueprints/${blueprint}');
    final Map<String, dynamic> $params = <String, dynamic>{'version': version};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiBlueprintsBlueprintGet$Response,
        ApiBlueprintsBlueprintGet$Response>($request);
  }

  @override
  Future<Response<ApiBlueprintsFiltersGet$Response>> _apiBlueprintsFiltersGet({
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns available filter facets for blueprints (crafted item types, ingredient and resource UUIDs), optionally scoped to the requested or default game version.',
        summary: 'Get Blueprint Filter Options',
        operationId: 'listBlueprintFilters',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Blueprints"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/blueprints/filters');
    final Map<String, dynamic> $params = <String, dynamic>{'version': version};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiBlueprintsFiltersGet$Response,
        ApiBlueprintsFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiCommoditiesGet$Response>> _apiCommoditiesGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated game commodities with location data and resource metadata, optionally filtered to only those consumed by blueprints. Results include refined version info and starmap location data scoped to the requested or default game version.',
        summary: 'List Game Commodities',
        operationId: 'listCommodities',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Commodities"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/commodities');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'version': version,
      'sort': sort,
      'filter[used]': filterUsed,
      'filter[system]': filterSystem,
      'filter[type]': filterType,
      'filter[rarity]': filterRarity,
      'filter[kind]': filterKind,
      'filter[group]': filterGroup,
      'filter[refined_version]': filterRefinedVersion,
      'filter[location]': filterLocation,
      'filter[query]': filterQuery,
      'filter[ship]': filterShip,
      'filter[ground_vehicle]': filterGroundVehicle,
      'filter[fps]': filterFps,
      'filter[harvestable]': filterHarvestable,
      'filter[salvage]': filterSalvage,
      'filter[mineable]': filterMineable,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiCommoditiesGet$Response, ApiCommoditiesGet$Response>($request);
  }

  @override
  Future<Response<ApiCommoditiesCommodityGet$Response>>
      _apiCommoditiesCommodityGet({
    required String? commodity,
    String? version,
    String? include,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns full details for a single game commodity including detailed location entries with starmap data, resource composition, areas, clustering data, and raw/refined version info. Results are scoped to the requested or default game version. Optionally include related blueprints and items.',
        summary: 'Show Game Commodity',
        operationId: 'getCommodity',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Commodities"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/commodities/${commodity}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'version': version,
      'include': include,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommoditiesCommodityGet$Response,
        ApiCommoditiesCommodityGet$Response>($request);
  }

  @override
  Future<Response<ApiCommoditiesFiltersGet$Response>>
      _apiCommoditiesFiltersGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns all available filter values for game commodities, scoped to the requested or default game version. Filter values can be combined; providing a system filter will narrow the location facet to that system only.',
        summary: 'Game Commodity Filters',
        operationId: 'listCommodityFilters',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Commodities"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/commodities/filters');
    final Map<String, dynamic> $params = <String, dynamic>{
      'version': version,
      'filter[used]': filterUsed,
      'filter[system]': filterSystem,
      'filter[type]': filterType,
      'filter[rarity]': filterRarity,
      'filter[kind]': filterKind,
      'filter[group]': filterGroup,
      'filter[refined_version]': filterRefinedVersion,
      'filter[location]': filterLocation,
      'filter[query]': filterQuery,
      'filter[ship]': filterShip,
      'filter[ground_vehicle]': filterGroundVehicle,
      'filter[fps]': filterFps,
      'filter[harvestable]': filterHarvestable,
      'filter[salvage]': filterSalvage,
      'filter[mineable]': filterMineable,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommoditiesFiltersGet$Response,
        ApiCommoditiesFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiFactionsGet$Response>> _apiFactionsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated factions sorted by name by default. Factions hidden from the Delphi app are excluded.',
        summary: 'List Factions',
        operationId: 'listFactions',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Factions"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/factions');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[faction_type]': filterFactionType,
      'filter[has_reputation]': filterHasReputation,
      'filter[lawful]': filterLawful,
      'filter[is_npc]': filterIsNpc,
      'filter[hide_in_delphi_app]': filterHideInDelphiApp,
      'filter[query]': filterQuery,
      'sort': sort,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiFactionsGet$Response, ApiFactionsGet$Response>($request);
  }

  @override
  Future<Response<ApiFactionsFactionGet$Response>> _apiFactionsFactionGet({
    required String? faction,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns full details for a single faction, including reputation ladder with standings when the faction has a reputation system. Factions hidden from the Delphi app are excluded.',
        summary: 'Get Faction Detail',
        operationId: 'getFaction',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Factions"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/factions/${faction}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiFactionsFactionGet$Response,
        ApiFactionsFactionGet$Response>($request);
  }

  @override
  Future<Response<ApiGameVersionsGet$Response>> _apiGameVersionsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterCode,
    String? filterChannel,
    int? filterIsDefault,
    String? sort,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated game versions sorted by release date (newest first by default). Useful for discovering available game versions for version-scoped API queries.',
        summary: 'List Game Versions',
        operationId: 'listGameVersions',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Game Versions"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/game-versions');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[code]': filterCode,
      'filter[channel]': filterChannel,
      'filter[is_default]': filterIsDefault,
      'sort': sort,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGameVersionsGet$Response,
        ApiGameVersionsGet$Response>($request);
  }

  @override
  Future<
      Response<
          ApiGameVersionsDefaultGet$Response>> _apiGameVersionsDefaultGet(
      {SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
          description:
              'Returns the current default game version. This is the version used by default in version-scoped API queries (see the version query parameter on other endpoints).',
          summary: 'Get Default Game Version',
          operationId: 'getDefaultGameVersion',
          consumes: [],
          produces: [],
          security: [],
          tags: ["Game Versions"],
          deprecated: false)}) {
    final Uri $url = Uri.parse('/api/game-versions/default');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiGameVersionsDefaultGet$Response,
        ApiGameVersionsDefaultGet$Response>($request);
  }

  @override
  Future<Response<ApiGameVersionsIdentifierGet$Response>>
      _apiGameVersionsIdentifierGet({
    required String? identifier,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific game version by its code (case-insensitive). Game versions are used to scope version-aware data endpoints via the `version` query parameter.',
        summary: 'Get Game Version',
        operationId: 'getGameVersion',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Game Versions"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/game-versions/${identifier}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiGameVersionsIdentifierGet$Response,
        ApiGameVersionsIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiWeaponsGet$Response>> _apiWeaponsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/items scoped to FPS weapons (WeaponPersonal type). Results are scoped to the requested or default game version. Returns weapon items with manufacturer, game version, and description data.',
        summary: 'In-Game Weapons Overview',
        operationId: 'listWeapons',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/weapons');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[class_name]': filterClassName,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[size]': filterSize,
      'filter[grade]': filterGrade,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiWeaponsGet$Response, ApiWeaponsGet$Response>($request);
  }

  @override
  Future<Response<ApiWeaponAttachmentsGet$Response>> _apiWeaponAttachmentsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/items scoped to weapon attachments (WeaponAttachment type, excluding magazines and missiles). Results are scoped to the requested or default game version. Returns attachment items with manufacturer, game version, and description data.',
        summary: 'In-Game Weapon Attachments Overview',
        operationId: 'listWeaponAttachments',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/weapon-attachments');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[size]': filterSize,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiWeaponAttachmentsGet$Response,
        ApiWeaponAttachmentsGet$Response>($request);
  }

  @override
  Future<Response<ApiClothesGet$Response>> _apiClothesGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/items scoped to clothing (FPS.Clothing.* classification). Results are scoped to the requested or default game version. Returns clothing items with manufacturer, game version, and description data.',
        summary: 'In-Game Clothes Overview',
        operationId: 'listClothes',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/clothes');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[name]': filterName,
      'filter[classification]': filterClassification,
      'filter[query]': filterQuery,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiClothesGet$Response, ApiClothesGet$Response>($request);
  }

  @override
  Future<Response<ApiArmorGet$Response>> _apiArmorGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/items scoped to armor (FPS.Armor.* classification). Results are scoped to the requested or default game version. Returns armor items with manufacturer, game version, and description data.',
        summary: 'In-Game Armor Overview',
        operationId: 'listArmor',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/armor');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[name]': filterName,
      'filter[classification]': filterClassification,
      'filter[query]': filterQuery,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiArmorGet$Response, ApiArmorGet$Response>($request);
  }

  @override
  Future<Response<ApiFoodGet$Response>> _apiFoodGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/items scoped to food and drink (Food, Bottle, Drink types). Results are scoped to the requested or default game version. Returns consumable items with manufacturer, game version, and description data.',
        summary: 'In-Game Food Overview',
        operationId: 'listFood',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/food');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiFoodGet$Response, ApiFoodGet$Response>($request);
  }

  @override
  Future<Response<ApiVehicleWeaponsGet$Response>> _apiVehicleWeaponsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/items scoped to vehicle weapons (WeaponGun type). Results are scoped to the requested or default game version. Returns ship weapon items with manufacturer, game version, and description data.',
        summary: 'In-Game Vehicle Weapons Overview',
        operationId: 'listVehicleWeapons',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/vehicle-weapons');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[size]': filterSize,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiVehicleWeaponsGet$Response,
        ApiVehicleWeaponsGet$Response>($request);
  }

  @override
  Future<Response<ApiVehicleItemsGet$Response>> _apiVehicleItemsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/items scoped to vehicle components (coolers, shields, power plants, quantum drives, thrusters, etc.). Results are scoped to the requested or default game version. Returns component items with manufacturer, game version, and description data.',
        summary: 'In-Game Vehicle Items Overview',
        operationId: 'listVehicleItems',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/vehicle-items');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[name]': filterName,
      'filter[type]': filterType,
      'filter[sub_type]': filterSubType,
      'filter[query]': filterQuery,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiVehicleItemsGet$Response,
        ApiVehicleItemsGet$Response>($request);
  }

  @override
  Future<Response<ApiItemsGet$Response>> _apiItemsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated in-game items for the requested category and game version. Always includes manufacturer, game version, and description data. Crafting blueprints are loaded automatically. Supports filtering by type, classification, manufacturer, size, grade, and more. Available includes: shops, variants, related_items, blueprints, vehicles, shops.items. Supports 150+ JSON field sorts. (see GET /api/items/filters for valid filter values)',
        summary: 'In-Game Item Overview',
        operationId: 'listItems',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/items');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[variants]': filterVariants,
      'filter[category]': filterCategory,
      'filter[type]': filterType,
      'filter[sub_type]': filterSubType,
      'filter[manufacturer]': filterManufacturer,
      'filter[manufacturer.name]': filterManufacturerName,
      'filter[class_name]': filterClassName,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[classification]': filterClassification,
      'filter[size]': filterSize,
      'filter[grade]': filterGrade,
      'filter[class]': filterClass,
      'filter[rarity]': filterRarity,
      'filter[event_source]': filterEventSource,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
      'filter[tags]': filterTags,
      'filter[port_tags]': filterPortTags,
      'filter[vehicle]': filterVehicle,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiItemsGet$Response, ApiItemsGet$Response>($request);
  }

  @override
  Future<Response<ApiWeaponsIdentifierGet$Response>> _apiWeaponsIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific FPS weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
        summary: 'In-Game Weapon Detail',
        operationId: 'getWeapon',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/weapons/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiWeaponsIdentifierGet$Response,
        ApiWeaponsIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiWeaponAttachmentsIdentifierGet$Response>>
      _apiWeaponAttachmentsIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific weapon attachment by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to weapon attachments. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
        summary: 'In-Game Weapon Attachment Detail',
        operationId: 'getWeaponAttachment',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/weapon-attachments/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiWeaponAttachmentsIdentifierGet$Response,
        ApiWeaponAttachmentsIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiClothesIdentifierGet$Response>> _apiClothesIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific clothing item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to clothing. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
        summary: 'In-Game Clothing Detail',
        operationId: 'getClothingItem',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/clothes/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiClothesIdentifierGet$Response,
        ApiClothesIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiArmorIdentifierGet$Response>> _apiArmorIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific armor item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to armor. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
        summary: 'In-Game Armor Detail',
        operationId: 'getArmor',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/armor/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiArmorIdentifierGet$Response,
        ApiArmorIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiFoodIdentifierGet$Response>> _apiFoodIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific food or drink item by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to food. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
        summary: 'In-Game Food Detail',
        operationId: 'getFood',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/food/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiFoodIdentifierGet$Response,
        ApiFoodIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiVehicleWeaponsIdentifierGet$Response>>
      _apiVehicleWeaponsIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific vehicle weapon by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle weapons. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
        summary: 'In-Game Vehicle Weapon Detail',
        operationId: 'getVehicleWeapon',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/vehicle-weapons/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiVehicleWeaponsIdentifierGet$Response,
        ApiVehicleWeaponsIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiVehicleItemsIdentifierGet$Response>>
      _apiVehicleItemsIdentifierGet({
    required String? identifier,
    String? locale,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific vehicle component by name or UUID. Results are scoped to the requested or default game version. Alias for /api/items/{identifier} scoped to vehicle items. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items.',
        summary: 'In-Game Vehicle Item Detail',
        operationId: 'getVehicleItem',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/vehicle-items/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiVehicleItemsIdentifierGet$Response,
        ApiVehicleItemsIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiItemsIdentifierGet$Response>> _apiItemsIdentifierGet({
    String? locale,
    String? include,
    String? version,
    required String? identifier,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a specific item by UUID, slug, name, or class name (case-insensitive). Results are scoped to the requested or default game version. Always includes manufacturer, game version, description data, entity tags, commodities, and variant group data. Supports includes: shops, variants, related_items, blueprints, vehicles, shops.items. Items with a matching vehicle record automatically redirect to GET /api/vehicles/{uuid}.',
        summary: 'In-Game Item Detail',
        operationId: 'getItem',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/items/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiItemsIdentifierGet$Response,
        ApiItemsIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiItemsSearchPost$Response>> _apiItemsSearchPost({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/items?filter[name]={value} for name search. Note: OR search across name/uuid/type is no longer supported. This endpoint will be removed in a future version.',
        summary: 'In-Game Item Search (Deprecated)',
        operationId: 'searchItemsDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/items/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'locale': locale,
      'include': include,
      'sort': sort,
      'filter[variants]': filterVariants,
      'filter[category]': filterCategory,
      'filter[type]': filterType,
      'filter[sub_type]': filterSubType,
      'filter[manufacturer]': filterManufacturer,
      'filter[manufacturer.name]': filterManufacturerName,
      'filter[class_name]': filterClassName,
      'filter[name]': filterName,
      'filter[classification]': filterClassification,
      'filter[size]': filterSize,
      'filter[grade]': filterGrade,
      'filter[class]': filterClass,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiItemsSearchPost$Response,
        ApiItemsSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiItemsFiltersGet$Response>> _apiItemsFiltersGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns available filter facet values for in-game items, grouped by field with occurrence counts. Applying other filters narrows the facet results. Use these values as filter[*] parameters on GET /api/items. Scoped to the default item category unless filter[category] is specified.',
        summary: 'In-Game Item Filters',
        operationId: 'listItemFilters',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Items"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/items/filters');
    final Map<String, dynamic> $params = <String, dynamic>{
      'version': version,
      'filter[variants]': filterVariants,
      'filter[category]': filterCategory,
      'filter[type]': filterType,
      'filter[sub_type]': filterSubType,
      'filter[manufacturer]': filterManufacturer,
      'filter[manufacturer.name]': filterManufacturerName,
      'filter[class_name]': filterClassName,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[classification]': filterClassification,
      'filter[size]': filterSize,
      'filter[grade]': filterGrade,
      'filter[class]': filterClass,
      'filter[rarity]': filterRarity,
      'filter[event_source]': filterEventSource,
      'filter[include_irrelevant]': filterIncludeIrrelevant,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiItemsFiltersGet$Response,
        ApiItemsFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiManufacturersGet$Response>> _apiManufacturersGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterName,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated manufacturers grouped by name with optional pagination.',
        summary: 'In-Game Manufacturers Overview',
        operationId: 'listManufacturers',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Manufacturers"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/manufacturers');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[name]': filterName,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiManufacturersGet$Response,
        ApiManufacturersGet$Response>($request);
  }

  @override
  Future<Response<ApiManufacturersManufacturerGet$Response>>
      _apiManufacturersManufacturerGet({
    required String? manufacturer,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a manufacturer by name, UUID, or code together with its products.',
        summary: 'In-Game Manufacturer Detail',
        operationId: 'getManufacturer',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Manufacturers"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/manufacturers/${manufacturer}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiManufacturersManufacturerGet$Response,
        ApiManufacturersManufacturerGet$Response>($request);
  }

  @override
  Future<Response<ApiManufacturersSearchPost$Response>>
      _apiManufacturersSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required Object? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/manufacturers?filter[name]={value} for name search. This endpoint will be removed in a future version.',
        summary: 'In-Game Manufacturer Search (Deprecated)',
        operationId: 'searchManufacturersDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Manufacturers", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/manufacturers/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiManufacturersSearchPost$Response,
        ApiManufacturersSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiMissionsGet$Response>> _apiMissionsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated missions for the requested or default game version. Results are grouped by mission variant key by default. Grouping is automatically disabled when filters are active unless filter[grouped]=true is set explicitly. Includes mission, game version, faction, and blueprint relationships.',
        summary: 'List Game Missions',
        operationId: 'listMissions',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Missions"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/missions');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'version': version,
      'sort': sort,
      'filter[mission_giver]': filterMissionGiver,
      'filter[faction]': filterFaction,
      'filter[star_system]': filterStarSystem,
      'filter[illegal]': filterIllegal,
      'filter[shareable]': filterShareable,
      'filter[once_only]': filterOnceOnly,
      'filter[available_in_prison]': filterAvailableInPrison,
      'filter[has_combat]': filterHasCombat,
      'filter[has_defend_objective]': filterHasDefendObjective,
      'filter[rank_index]': filterRankIndex,
      'filter[has_prerequisites]': filterHasPrerequisites,
      'filter[min_enemies]': filterMinEnemies,
      'filter[max_enemies]': filterMaxEnemies,
      'filter[reward_min]': filterRewardMin,
      'filter[reward_max]': filterRewardMax,
      'filter[title]': filterTitle,
      'filter[description]': filterDescription,
      'filter[query]': filterQuery,
      'filter[reward_scope]': filterRewardScope,
      'filter[has_blueprints]': filterHasBlueprints,
      'filter[reputation_scope]': filterReputationScope,
      'filter[blueprint_name]': filterBlueprintName,
      'filter[location]': filterLocation,
      'filter[grouped]': filterGrouped,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiMissionsGet$Response, ApiMissionsGet$Response>($request);
  }

  @override
  Future<Response<ApiMissionsMissionGet$Response>> _apiMissionsMissionGet({
    required String? mission,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns full details for a single mission, including chain relationships and associated items. Results are scoped to the requested or default game version.',
        summary: 'Get Mission Detail',
        operationId: 'getMission',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Missions"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/missions/${mission}');
    final Map<String, dynamic> $params = <String, dynamic>{'version': version};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiMissionsMissionGet$Response,
        ApiMissionsMissionGet$Response>($request);
  }

  @override
  Future<Response<ApiMissionsFiltersGet$Response>> _apiMissionsFiltersGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns available filter facets for missions, scoped to the requested or default game version.',
        summary: 'Get Mission Filter Options',
        operationId: 'listMissionFilters',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Missions"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/missions/filters');
    final Map<String, dynamic> $params = <String, dynamic>{
      'version': version,
      'filter[include_unreleased]': filterIncludeUnreleased,
      'filter[mission_giver]': filterMissionGiver,
      'filter[faction]': filterFaction,
      'filter[star_system]': filterStarSystem,
      'filter[illegal]': filterIllegal,
      'filter[shareable]': filterShareable,
      'filter[once_only]': filterOnceOnly,
      'filter[available_in_prison]': filterAvailableInPrison,
      'filter[has_combat]': filterHasCombat,
      'filter[has_defend_objective]': filterHasDefendObjective,
      'filter[rank_index]': filterRankIndex,
      'filter[has_prerequisites]': filterHasPrerequisites,
      'filter[min_enemies]': filterMinEnemies,
      'filter[max_enemies]': filterMaxEnemies,
      'filter[reward_min]': filterRewardMin,
      'filter[reward_max]': filterRewardMax,
      'filter[title]': filterTitle,
      'filter[description]': filterDescription,
      'filter[query]': filterQuery,
      'filter[reward_scope]': filterRewardScope,
      'filter[has_blueprints]': filterHasBlueprints,
      'filter[blueprint_name]': filterBlueprintName,
      'filter[reputation_scope]': filterReputationScope,
      'filter[location]': filterLocation,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiMissionsFiltersGet$Response,
        ApiMissionsFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiLocationsGet$Response>> _apiLocationsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated versioned starmap locations with optional filters. Results are scoped to the requested or default game version. Each location includes amenities, hierarchy entity tags, parent and star relations, child count, mission count, and resource availability.',
        summary: 'Game Starmap Locations Overview',
        operationId: 'listLocations',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/locations');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'version': version,
      'sort': sort,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[type_name]': filterTypeName,
      'filter[type_classification]': filterTypeClassification,
      'filter[respawn_location_type]': filterRespawnLocationType,
      'filter[jurisdiction_name]': filterJurisdictionName,
      'filter[affiliation_name]': filterAffiliationName,
      'filter[is_scannable]': filterIsScannable,
      'filter[block_travel]': filterBlockTravel,
      'filter[amenity]': filterAmenity,
      'filter[tag]': filterTag,
      'filter[parent_name]': filterParentName,
      'filter[parent_uuid]': filterParentUuid,
      'filter[system]': filterSystem,
      'filter[has_resources]': filterHasResources,
      'filter[resource]': filterResource,
      'filter[hide_minor_locations]': filterHideMinorLocations,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiLocationsGet$Response, ApiLocationsGet$Response>($request);
  }

  @override
  Future<Response<ApiLocationsIdentifierGet$Response>>
      _apiLocationsIdentifierGet({
    required String? identifier,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a versioned starmap location by slug or UUID. Results are scoped to the requested or default game version. Use the `include` parameter to load additional relations: `children` (child locations with amenities and tags), `resources` (harvestable resource placements with commodity data), `missions` (available missions with faction data).',
        summary: 'Game Starmap Location Detail',
        operationId: 'getLocation',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/locations/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiLocationsIdentifierGet$Response,
        ApiLocationsIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiLocationsFiltersGet$Response>> _apiLocationsFiltersGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Return all available filter facet values for versioned starmap locations. Applies any provided filter parameters to scope the facet counts. Returns facets for: type_name, type_classification, respawn_location_type, jurisdiction_name, affiliation_name, system, parent_name, amenity, and resource.',
        summary: 'Game Starmap Location Filters',
        operationId: 'listLocationFilters',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/locations/filters');
    final Map<String, dynamic> $params = <String, dynamic>{
      'version': version,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[type_name]': filterTypeName,
      'filter[type_classification]': filterTypeClassification,
      'filter[respawn_location_type]': filterRespawnLocationType,
      'filter[jurisdiction_name]': filterJurisdictionName,
      'filter[affiliation_name]': filterAffiliationName,
      'filter[is_scannable]': filterIsScannable,
      'filter[block_travel]': filterBlockTravel,
      'filter[amenity]': filterAmenity,
      'filter[tag]': filterTag,
      'filter[parent_name]': filterParentName,
      'filter[parent_uuid]': filterParentUuid,
      'filter[system]': filterSystem,
      'filter[has_resources]': filterHasResources,
      'filter[resource]': filterResource,
      'filter[hide_minor_locations]': filterHideMinorLocations,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiLocationsFiltersGet$Response,
        ApiLocationsFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiLocationsPositionsGet$Response>>
      _apiLocationsPositionsGet({
    String? filterType,
    String? filterSystem,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description: 'Starmap entity world positions.',
        summary: 'Starmap Entity Positions',
        operationId: 'listLocationPositions',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/locations/positions');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter[type]': filterType,
      'filter[system]': filterSystem,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiLocationsPositionsGet$Response,
        ApiLocationsPositionsGet$Response>($request);
  }

  @override
  Future<Response<ApiSearchGet$Response>> _apiSearchGet({
    required String? filterQuery,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Search across items, vehicles, starmap locations, commodities, blueprints, and missions simultaneously. Returns results grouped by type, limited to 5 results per group.',
        summary: 'Unified Search Across All Game Data',
        operationId: 'searchGameData',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Search"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter[query]': filterQuery,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiSearchGet$Response, ApiSearchGet$Response>($request);
  }

  @override
  Future<Response<dynamic>> _apiSearchQueryGet({
    required String? query,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Resolve a search query to the best-matching entity and redirect to its API URL, preserving query parameters such as locale, include, and version. Useful for quick lookups where you know the exact name.',
        summary: 'Resolve Search Query',
        operationId: 'resolveSearchQuery',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Search"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/search/${query}');
    final Map<String, dynamic> $params = <String, dynamic>{'version': version};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ApiGroundVehiclesGet$Response>> _apiGroundVehiclesGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/vehicles scoped to ground vehicles (is_vehicle=true, is_gravlev=false, is_spaceship=false). Returns paginated in-game ground vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.',
        summary: 'In-Game Ground Vehicles Overview',
        operationId: 'listGroundVehicles',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/ground-vehicles');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[manufacturer.name]': filterManufacturerName,
      'filter[class_name]': filterClassName,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[size]': filterSize,
      'filter[size_class]': filterSizeClass,
      'filter[career]': filterCareer,
      'filter[role]': filterRole,
      'filter[is_vehicle]': filterIsVehicle,
      'filter[is_gravlev]': filterIsGravlev,
      'filter[is_spaceship]': filterIsSpaceship,
      'filter[mass_total]': filterMassTotal,
      'filter[cargo_capacity]': filterCargoCapacity,
      'filter[vehicle_inventory]': filterVehicleInventory,
      'filter[crew.min]': filterCrewMin,
      'filter[health]': filterHealth,
      'filter[shield.hp]': filterShieldHp,
      'filter[shield.face_type]': filterShieldFaceType,
      'filter[speed.scm]': filterSpeedScm,
      'filter[speed.max]': filterSpeedMax,
      'filter[armor.health]': filterArmorHealth,
      'filter[cross section.length]': filterCrossSectionLength,
      'filter[cross section.width]': filterCrossSectionWidth,
      'filter[cross section.height]': filterCrossSectionHeight,
      'filter[signature.ir_quantum]': filterSignatureIrQuantum,
      'filter[signature.ir_shields]': filterSignatureIrShields,
      'filter[signature.em_quantum]': filterSignatureEmQuantum,
      'filter[signature.em_shields]': filterSignatureEmShields,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGroundVehiclesGet$Response,
        ApiGroundVehiclesGet$Response>($request);
  }

  @override
  Future<Response<ApiGravlevVehiclesGet$Response>> _apiGravlevVehiclesGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/vehicles scoped to gravlev vehicles (is_gravlev=true). Returns paginated in-game gravlev vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.',
        summary: 'In-Game Gravlev Vehicles Overview',
        operationId: 'listGravlevVehicles',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/gravlev-vehicles');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[manufacturer.name]': filterManufacturerName,
      'filter[class_name]': filterClassName,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[size]': filterSize,
      'filter[size_class]': filterSizeClass,
      'filter[career]': filterCareer,
      'filter[role]': filterRole,
      'filter[is_vehicle]': filterIsVehicle,
      'filter[is_gravlev]': filterIsGravlev,
      'filter[is_spaceship]': filterIsSpaceship,
      'filter[mass_total]': filterMassTotal,
      'filter[cargo_capacity]': filterCargoCapacity,
      'filter[vehicle_inventory]': filterVehicleInventory,
      'filter[crew.min]': filterCrewMin,
      'filter[health]': filterHealth,
      'filter[shield.hp]': filterShieldHp,
      'filter[shield.face_type]': filterShieldFaceType,
      'filter[speed.scm]': filterSpeedScm,
      'filter[speed.max]': filterSpeedMax,
      'filter[armor.health]': filterArmorHealth,
      'filter[cross section.length]': filterCrossSectionLength,
      'filter[cross section.width]': filterCrossSectionWidth,
      'filter[cross section.height]': filterCrossSectionHeight,
      'filter[signature.ir_quantum]': filterSignatureIrQuantum,
      'filter[signature.ir_shields]': filterSignatureIrShields,
      'filter[signature.em_quantum]': filterSignatureEmQuantum,
      'filter[signature.em_shields]': filterSignatureEmShields,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGravlevVehiclesGet$Response,
        ApiGravlevVehiclesGet$Response>($request);
  }

  @override
  Future<Response<ApiVehiclesGet$Response>> _apiVehiclesGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated in-game vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus. Optional includes: shipMatrixVehicle, components, shipmatrixvehicle.components, hardpoints, ports.',
        summary: 'In-Game Vehicles Overview',
        operationId: 'listVehicles',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/vehicles');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'version': version,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[manufacturer.name]': filterManufacturerName,
      'filter[class_name]': filterClassName,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[size]': filterSize,
      'filter[size_class]': filterSizeClass,
      'filter[career]': filterCareer,
      'filter[role]': filterRole,
      'filter[is_vehicle]': filterIsVehicle,
      'filter[is_gravlev]': filterIsGravlev,
      'filter[is_spaceship]': filterIsSpaceship,
      'filter[mass_total]': filterMassTotal,
      'filter[cargo_capacity]': filterCargoCapacity,
      'filter[vehicle_inventory]': filterVehicleInventory,
      'filter[crew.min]': filterCrewMin,
      'filter[health]': filterHealth,
      'filter[shield.hp]': filterShieldHp,
      'filter[shield.face_type]': filterShieldFaceType,
      'filter[speed.scm]': filterSpeedScm,
      'filter[speed.max]': filterSpeedMax,
      'filter[armor.health]': filterArmorHealth,
      'filter[cross section.length]': filterCrossSectionLength,
      'filter[cross section.width]': filterCrossSectionWidth,
      'filter[cross section.height]': filterCrossSectionHeight,
      'filter[signature.ir_quantum]': filterSignatureIrQuantum,
      'filter[signature.ir_shields]': filterSignatureIrShields,
      'filter[signature.em_quantum]': filterSignatureEmQuantum,
      'filter[signature.em_shields]': filterSignatureEmShields,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiVehiclesGet$Response, ApiVehiclesGet$Response>($request);
  }

  @override
  Future<Response<ApiGroundVehiclesIdentifierGet$Response>>
      _apiGroundVehiclesIdentifierGet({
    required String? identifier,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/vehicles/{identifier} scoped to ground vehicles. Results are scoped to the requested or default game version.',
        summary: 'In-Game Ground Vehicle Detail',
        operationId: 'getGroundVehicle',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/ground-vehicles/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGroundVehiclesIdentifierGet$Response,
        ApiGroundVehiclesIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiGravlevVehiclesIdentifierGet$Response>>
      _apiGravlevVehiclesIdentifierGet({
    required String? identifier,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Alias for /api/vehicles/{identifier} scoped to gravlev vehicles. Results are scoped to the requested or default game version.',
        summary: 'In-Game Gravlev Vehicle Detail',
        operationId: 'getGravlevVehicle',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/gravlev-vehicles/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGravlevVehiclesIdentifierGet$Response,
        ApiGravlevVehiclesIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiVehiclesIdentifierGet$Response>>
      _apiVehiclesIdentifierGet({
    required String? identifier,
    String? include,
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a vehicle by name, class name, or UUID. Results are scoped to the requested or default game version. Loads manufacturer, gameVersion, shipMatrixVehicle (with foci, productionStatus, productionNote, type, size, loaner, skus, manufacturer, components), and port loadout items.',
        summary: 'In-Game Vehicle Detail',
        operationId: 'getVehicle',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/vehicles/${identifier}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'include': include,
      'version': version,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiVehiclesIdentifierGet$Response,
        ApiVehiclesIdentifierGet$Response>($request);
  }

  @override
  Future<Response<ApiGroundVehiclesSearchPost$Response>>
      _apiGroundVehiclesSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required Object? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/ground-vehicles?filter[name]={value} for name search. Scoped to ground vehicles. This endpoint will be removed in a future version.',
        summary: 'In-Game Ground Vehicle Search (Deprecated)',
        operationId: 'searchGroundVehiclesDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/ground-vehicles/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGroundVehiclesSearchPost$Response,
        ApiGroundVehiclesSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiGravlevVehiclesSearchPost$Response>>
      _apiGravlevVehiclesSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required Object? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/gravlev-vehicles?filter[name]={value} for name search. Scoped to gravlev vehicles. This endpoint will be removed in a future version.',
        summary: 'In-Game Gravlev Vehicle Search (Deprecated)',
        operationId: 'searchGravlevVehiclesDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/gravlev-vehicles/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGravlevVehiclesSearchPost$Response,
        ApiGravlevVehiclesSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiVehiclesSearchPost$Response>> _apiVehiclesSearchPost({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.',
        summary: 'In-Game Vehicle Search (Deprecated)',
        operationId: 'searchVehiclesDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/vehicles/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'sort': sort,
      'filter[manufacturer]': filterManufacturer,
      'filter[manufacturer.name]': filterManufacturerName,
      'filter[class_name]': filterClassName,
      'filter[name]': filterName,
      'filter[query]': filterQuery,
      'filter[size]': filterSize,
      'filter[size_class]': filterSizeClass,
      'filter[career]': filterCareer,
      'filter[role]': filterRole,
      'filter[is_vehicle]': filterIsVehicle,
      'filter[is_gravlev]': filterIsGravlev,
      'filter[is_spaceship]': filterIsSpaceship,
      'filter[mass_total]': filterMassTotal,
      'filter[cargo_capacity]': filterCargoCapacity,
      'filter[vehicle_inventory]': filterVehicleInventory,
      'filter[crew.min]': filterCrewMin,
      'filter[health]': filterHealth,
      'filter[shield.hp]': filterShieldHp,
      'filter[shield.face_type]': filterShieldFaceType,
      'filter[speed.scm]': filterSpeedScm,
      'filter[speed.max]': filterSpeedMax,
      'filter[armor.health]': filterArmorHealth,
      'filter[cross_section.length]': filterCrossSectionLength,
      'filter[cross_section.width]': filterCrossSectionWidth,
      'filter[cross_section.height]': filterCrossSectionHeight,
      'filter[signature.ir_quantum]': filterSignatureIrQuantum,
      'filter[signature.ir_shields]': filterSignatureIrShields,
      'filter[signature.em_quantum]': filterSignatureEmQuantum,
      'filter[signature.em_shields]': filterSignatureEmShields,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiVehiclesSearchPost$Response,
        ApiVehiclesSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiVehiclesFiltersGet$Response>> _apiVehiclesFiltersGet({
    String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description: 'Return all available filter values for in-game vehicles.',
        summary: 'In-Game Vehicle Filters',
        operationId: 'listVehicleFilters',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/vehicles/filters');
    final Map<String, dynamic> $params = <String, dynamic>{'version': version};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiVehiclesFiltersGet$Response,
        ApiVehiclesFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiGameVersionsVersionChangelogGet$Response>>
      _apiGameVersionsVersionChangelogGet({
    required String? version,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns the changelog summary between the specified version and its predecessor.',
        summary: 'Get Version Changelog',
        operationId: 'getVersionChangelog',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Game Versions"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/game-versions/${version}/changelog');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiGameVersionsVersionChangelogGet$Response,
        ApiGameVersionsVersionChangelogGet$Response>($request);
  }

  @override
  Future<Response<ApiGameVersionsVersionChangelogChangesGet$Response>>
      _apiGameVersionsVersionChangelogChangesGet({
    required String? version,
    String? filterEntityType,
    String? filterChangeType,
    int? page,
    int? pageNumber,
    int? pageSize,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated diff entries for a version changelog. Filter by entity_type and change_type.',
        summary: 'Get Version Changelog Changes',
        operationId: 'listVersionChangelogChanges',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Game Versions"],
        deprecated: false),
  }) {
    final Uri $url =
        Uri.parse('/api/game-versions/${version}/changelog/changes');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter[entity_type]': filterEntityType,
      'filter[change_type]': filterChangeType,
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGameVersionsVersionChangelogChangesGet$Response,
        ApiGameVersionsVersionChangelogChangesGet$Response>($request);
  }

  @override
  Future<Response<String>> _apiOpenapiGet(
      {SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
          description:
              'Returns the OpenAPI 3.0 specification as YAML. This spec describes all documented API endpoints, parameters, request bodies, and response schemas.',
          summary: 'OpenAPI Specification',
          operationId: 'getOpenApiSpec',
          consumes: [],
          produces: [],
          security: [],
          tags: ["Meta"],
          deprecated: false)}) {
    final Uri $url = Uri.parse('/api/openapi');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<String, String>($request);
  }

  @override
  Future<Response<ApiCommLinksGet$Response>> _apiCommLinksGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated comm-links ordered by descending ID by default. Supports filtering by channel, category, series, title, content, and publication date. Results can be sorted by id, title, images_count, links_count, channel, category, series, and created_at. Use the include parameter to embed images or links.',
        summary: 'Comm-Links Overview',
        operationId: 'listCommLinks',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-links');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'include': include,
      'filter[id]': filterId,
      'filter[title]': filterTitle,
      'filter[content]': filterContent,
      'filter[channel]': filterChannel,
      'filter[series]': filterSeries,
      'filter[category]': filterCategory,
      'filter[created_at]': filterCreatedAt,
      'sort': sort,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiCommLinksGet$Response, ApiCommLinksGet$Response>($request);
  }

  @override
  Future<Response<ApiCommLinksFiltersGet$Response>> _apiCommLinksFiltersGet({
    int? filterId,
    String? filterTitle,
    String? filterContent,
    String? filterChannel,
    String? filterSeries,
    String? filterCategory,
    String? filterCreatedAt,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns available category, channel, and series filter values for Comm-Links, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.',
        summary: 'Comm-Link Filters',
        operationId: 'listCommLinkFilters',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-links/filters');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter[id]': filterId,
      'filter[title]': filterTitle,
      'filter[content]': filterContent,
      'filter[channel]': filterChannel,
      'filter[series]': filterSeries,
      'filter[category]': filterCategory,
      'filter[created_at]': filterCreatedAt,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinksFiltersGet$Response,
        ApiCommLinksFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiCommLinksIdGet$Response>> _apiCommLinksIdGet({
    List<String>? include,
    required int? id,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a single Comm-Link by its CIG ID. Images with hash and metadata are always included. The response contains prev_id and next_id metadata for sequential navigation between Comm-Links.',
        summary: 'Comm-Link Detail',
        operationId: 'getCommLink',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-links/${id}');
    final Map<String, dynamic> $params = <String, dynamic>{'include': include};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiCommLinksIdGet$Response, ApiCommLinksIdGet$Response>($request);
  }

  @override
  Future<Response<ApiCommLinksSearchPost$Response>> _apiCommLinksSearchPost({
    String? locale,
    List<String>? include,
    String? filterChannel,
    String? filterSeries,
    String? filterCategory,
    required ApiCommLinksSearchPost$RequestBody? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/comm-links?filter[title]={value} for title search. This endpoint will be removed in a future version.',
        summary: 'Comm-Link Search (Deprecated)',
        operationId: 'searchCommLinksDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/comm-links/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
      'filter[channel]': filterChannel,
      'filter[series]': filterSeries,
      'filter[category]': filterCategory,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinksSearchPost$Response,
        ApiCommLinksSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiCommLinksReverseImageLinkSearchPost$Response>>
      _apiCommLinksReverseImageLinkSearchPost({
    required ApiCommLinksReverseImageLinkSearchPost$RequestBody? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Return comm-links that reference the same RSI-hosted image URL.',
        summary: 'Comm-Link Reverse Image Link Search',
        operationId: 'reverseImageLinkSearch',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links", "Search"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-links/reverse-image-link-search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinksReverseImageLinkSearchPost$Response,
        ApiCommLinksReverseImageLinkSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiCommLinksReverseImageSearchPost$Response>>
      _apiCommLinksReverseImageSearchPost({
    required List<int> image,
    int? similarity,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Search comm-links by uploading an image and specifying a similarity threshold. Requires the GD PHP extension.',
        summary: 'Comm-Link Reverse Image Search',
        operationId: 'reverseImageSearch',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links", "Search"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-links/reverse-image-search');
    final List<PartValue> $parts = <PartValue>[
      PartValue<int?>(
        'similarity',
        similarity,
      ),
      PartValueFile<List<int>>(
        'image',
        image,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinksReverseImageSearchPost$Response,
        ApiCommLinksReverseImageSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiCommLinkImagesImageSimilarGet$Response>>
      _apiCommLinkImagesImageSimilarGet({
    required int? image,
    int? similarity,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Find Comm-Link images similar to an existing RSI-hosted image.',
        summary: 'Comm-Link Reverse Image Similar Search',
        operationId: 'findSimilarImages',
        consumes: [],
        produces: [],
        security: ["sanctum"],
        tags: ["Comm-Links", "Search"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-link-images/${image}/similar');
    final Map<String, dynamic> $params = <String, dynamic>{
      'similarity': similarity
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinkImagesImageSimilarGet$Response,
        ApiCommLinkImagesImageSimilarGet$Response>($request);
  }

  @override
  Future<Response<ApiCommLinkImagesGet$Response>> _apiCommLinkImagesGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterTags,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'List available comm-link images with pagination. Each image includes its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.',
        summary: 'Comm-Link Images',
        operationId: 'listCommLinkImages',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links", "Images"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-link-images');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[tags]': filterTags,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinkImagesGet$Response,
        ApiCommLinkImagesGet$Response>($request);
  }

  @override
  Future<Response<ApiCommLinkImagesImageGet$Response>>
      _apiCommLinkImagesImageGet({
    required int? image,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a single comm-link image with its associated Comm-Links (with channel, category, series), tags, duplicates, and base image when available.',
        summary: 'Comm-Link Image Detail',
        operationId: 'getCommLinkImage',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links", "Images"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-link-images/${image}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinkImagesImageGet$Response,
        ApiCommLinkImagesImageGet$Response>($request);
  }

  @override
  Future<Response<ApiCommLinkImagesRandomGet$Response>>
      _apiCommLinkImagesRandomGet({
    int? limit,
    String? filterTags,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve random comm-link images (minimum 250 KB), optionally filtered by tag name. Only images without a base image are included.',
        summary: 'Comm-Link Images Random',
        operationId: 'getRandomCommLinkImage',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links", "Images"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-link-images/random');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'filter[tags]': filterTags,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinkImagesRandomGet$Response,
        ApiCommLinkImagesRandomGet$Response>($request);
  }

  @override
  Future<Response<ApiCommLinkImagesSearchPost$Response>>
      _apiCommLinkImagesSearchPost({
    String? filterTags,
    required ApiCommLinkImagesSearchPost$RequestBody? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Search comm-link images by filename with optional tag filtering. Only images without a base image and with non-zero file size are returned.',
        summary: 'Comm-Link Image Search by filename',
        operationId: 'searchCommLinkImages',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Comm-Links", "Images", "Search"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/comm-link-images/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter[tags]': filterTags
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCommLinkImagesSearchPost$Response,
        ApiCommLinkImagesSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiGalactapediaGet$Response>> _apiGalactapediaGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterCategory,
    String? filterTag,
    String? filterTemplate,
    String? filterTitle,
    String? filterCreatedAt,
    String? sort,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated Galactapedia articles ordered by descending ID by default. Each article includes its templates, categories, and tags. Supports filtering by category, tag, template, title, and creation date. Results can be sorted by title, categories_count, tags_count, and related_articles_count.',
        summary: 'Galactapedia Overview',
        operationId: 'listGalactapediaArticles',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Galactapedia"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/galactapedia');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[category]': filterCategory,
      'filter[tag]': filterTag,
      'filter[template]': filterTemplate,
      'filter[title]': filterTitle,
      'filter[created_at]': filterCreatedAt,
      'sort': sort,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGalactapediaGet$Response,
        ApiGalactapediaGet$Response>($request);
  }

  @override
  Future<Response<ApiGalactapediaFiltersGet$Response>>
      _apiGalactapediaFiltersGet({
    String? filterCategory,
    String? filterTag,
    String? filterTemplate,
    String? filterTitle,
    String? filterCreatedAt,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns available category, tag, and template filter values for Galactapedia articles, with occurrence counts. Providing additional filter parameters will narrow the facets accordingly.',
        summary: 'Galactapedia Filters',
        operationId: 'listGalactapediaFilters',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Galactapedia"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/galactapedia/filters');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter[category]': filterCategory,
      'filter[tag]': filterTag,
      'filter[template]': filterTemplate,
      'filter[title]': filterTitle,
      'filter[created_at]': filterCreatedAt,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGalactapediaFiltersGet$Response,
        ApiGalactapediaFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiGalactapediaIdGet$Response>> _apiGalactapediaIdGet({
    String? locale,
    required String? id,
    List<String>? include,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a Galactapedia article by ID with available includes and translations.',
        summary: 'Galactapedia Article',
        operationId: 'getGalactapediaArticle',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Galactapedia"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/galactapedia/${id}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'locale': locale,
      'include': include,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiGalactapediaIdGet$Response,
        ApiGalactapediaIdGet$Response>($request);
  }

  @override
  Future<Response<ApiGalactapediaSearchPost$Response>>
      _apiGalactapediaSearchPost({
    required Object? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/galactapedia?filter[title]={value} for title search. This endpoint will be removed in a future version.',
        summary: 'Galactapedia Article Search (Deprecated)',
        operationId: 'searchGalactapediaDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Galactapedia", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/galactapedia/search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      tag: swaggerMetaData,
    );
    return client.send<ApiGalactapediaSearchPost$Response,
        ApiGalactapediaSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiCelestialObjectsGet$Response>> _apiCelestialObjectsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterStarsystem,
    String? filterName,
    String? filterDesignation,
    String? filterType,
    String? sort,
    String? include,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated celestial objects with optional relationships.',
        summary: 'Starmap Celestial Objects Overview',
        operationId: 'listCelestialObjects',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/celestial-objects');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[starsystem]': filterStarsystem,
      'filter[name]': filterName,
      'filter[designation]': filterDesignation,
      'filter[type]': filterType,
      'sort': sort,
      'include': include,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCelestialObjectsGet$Response,
        ApiCelestialObjectsGet$Response>($request);
  }

  @override
  Future<Response<ApiCelestialObjectsCodeGet$Response>>
      _apiCelestialObjectsCodeGet({
    required String? code,
    String? include,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a celestial object by code, optionally including relations.',
        summary: 'Celestial Object Detail',
        operationId: 'getCelestialObject',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/celestial-objects/${code}');
    final Map<String, dynamic> $params = <String, dynamic>{'include': include};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCelestialObjectsCodeGet$Response,
        ApiCelestialObjectsCodeGet$Response>($request);
  }

  @override
  Future<Response<ApiCelestialObjectsSearchPost$Response>>
      _apiCelestialObjectsSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required ApiCelestialObjectsSearchPost$RequestBody? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/celestial-objects?filter[name]={value} for name search. This endpoint will be removed in a future version.',
        summary: 'Celestial Object Search (Deprecated)',
        operationId: 'searchCelestialObjectsDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/celestial-objects/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiCelestialObjectsSearchPost$Response,
        ApiCelestialObjectsSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiStarsystemsGet$Response>> _apiStarsystemsGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated starsystems, optionally including related resources.',
        summary: 'Starmap Starsystems Overview',
        operationId: 'listStarsystems',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/starsystems');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[affiliation]': filterAffiliation,
      'filter[code]': filterCode,
      'filter[name]': filterName,
      'filter[status]': filterStatus,
      'filter[type]': filterType,
      'filter[size]': filterSize,
      'sort': sort,
      'include': include,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiStarsystemsGet$Response, ApiStarsystemsGet$Response>($request);
  }

  @override
  Future<Response<ApiStarsystemsCodeGet$Response>> _apiStarsystemsCodeGet({
    required String? code,
    String? include,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a starsystem by code or identifier, with optional includes.',
        summary: 'Starsystem Detail',
        operationId: 'getStarsystem',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/starsystems/${code}');
    final Map<String, dynamic> $params = <String, dynamic>{'include': include};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiStarsystemsCodeGet$Response,
        ApiStarsystemsCodeGet$Response>($request);
  }

  @override
  Future<Response<ApiStarsystemsSearchPost$Response>>
      _apiStarsystemsSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    required ApiStarsystemsSearchPost$RequestBody? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/starsystems?filter[name]={value} for name search. This endpoint will be removed in a future version.',
        summary: 'Starsystem Search (Deprecated)',
        operationId: 'searchStarsystemsDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Starmap", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/starsystems/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiStarsystemsSearchPost$Response,
        ApiStarsystemsSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiStarsystemsFiltersGet$Response>> _apiStarsystemsFiltersGet(
      {SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
          description: 'Return all available filter values for starsystems.',
          summary: 'Starsystem Filters',
          operationId: 'listStarsystemFilters',
          consumes: [],
          produces: [],
          security: [],
          tags: ["Starmap"],
          deprecated: false)}) {
    final Uri $url = Uri.parse('/api/starsystems/filters');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiStarsystemsFiltersGet$Response,
        ApiStarsystemsFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiStatsLatestGet$Response>> _apiStatsLatestGet(
      {SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
          description:
              'Get the most recent Star Citizen crowdfunding statistics snapshot, including funds raised (USD), fan count, and fleet size.',
          summary: 'Latest Crowdfunding Statistics',
          operationId: 'getLatestStats',
          consumes: [],
          produces: [],
          security: [],
          tags: ["Stats"],
          deprecated: false)}) {
    final Uri $url = Uri.parse('/api/stats/latest');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client
        .send<ApiStatsLatestGet$Response, ApiStatsLatestGet$Response>($request);
  }

  @override
  Future<Response<ApiStatsGet$Response>> _apiStatsGet({
    int? page,
    int? pageNumber,
    int? pageSize,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Get paginated historical Star Citizen crowdfunding statistics, ordered by most recent first. Supports page-based pagination.',
        summary: 'Paginated Historical Statistics',
        operationId: 'listStats',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Stats"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/stats');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiStatsGet$Response, ApiStatsGet$Response>($request);
  }

  @override
  Future<Response<ApiShipmatrixVehiclesGet$Response>>
      _apiShipmatrixVehiclesGet({
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
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Returns paginated Ship Matrix vehicles with optional filters. SKU variants and loaner vehicles are included by default.',
        summary: 'Ship Matrix Vehicles Overview',
        operationId: 'listShipMatrixVehicles',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Ship Matrix", "Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/shipmatrix/vehicles');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[manufacturer]': filterManufacturer,
      'filter[size]': filterSize,
      'filter[type]': filterType,
      'filter[focus]': filterFocus,
      'filter[production_status]': filterProductionStatus,
      'filter[name]': filterName,
      'sort': sort,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiShipmatrixVehiclesGet$Response,
        ApiShipmatrixVehiclesGet$Response>($request);
  }

  @override
  Future<Response<ApiShipmatrixVehiclesFiltersGet$Response>>
      _apiShipmatrixVehiclesFiltersGet(
          {SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
              description:
                  'Return all available filter values for Ship Matrix vehicles. Supports cross-filtering: pass filter parameters to get filtered facet counts.',
              summary: 'Ship Matrix Vehicle Filters',
              operationId: 'listShipMatrixFilters',
              consumes: [],
              produces: [],
              security: [],
              tags: ["Ship Matrix", "Vehicles"],
              deprecated: false)}) {
    final Uri $url = Uri.parse('/api/shipmatrix/vehicles/filters');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiShipmatrixVehiclesFiltersGet$Response,
        ApiShipmatrixVehiclesFiltersGet$Response>($request);
  }

  @override
  Future<Response<ApiShipmatrixVehiclesSlugGet$Response>>
      _apiShipmatrixVehiclesSlugGet({
    required String? slug,
    String? include,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Retrieve a Ship Matrix vehicle by slug. Use the "include" query parameter to load additional relationships: components, loaner, skus.',
        summary: 'Ship Matrix Vehicle Detail',
        operationId: 'getShipMatrixVehicle',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Ship Matrix", "Vehicles"],
        deprecated: false),
  }) {
    final Uri $url = Uri.parse('/api/shipmatrix/vehicles/${slug}');
    final Map<String, dynamic> $params = <String, dynamic>{'include': include};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiShipmatrixVehiclesSlugGet$Response,
        ApiShipmatrixVehiclesSlugGet$Response>($request);
  }

  @override
  Future<Response<ApiShipmatrixVehiclesSearchPost$Response>>
      _apiShipmatrixVehiclesSearchPost({
    int? page,
    int? pageNumber,
    int? pageSize,
    String? filterManufacturer,
    String? filterSize,
    String? filterType,
    String? filterFocus,
    String? filterProductionStatus,
    required Object? body,
    SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
        description:
            'Deprecated. Use GET /api/shipmatrix/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.',
        summary: 'Ship Matrix Vehicle Search (Deprecated)',
        operationId: 'searchShipMatrixVehiclesDeprecated',
        consumes: [],
        produces: [],
        security: [],
        tags: ["Ship Matrix", "Vehicles", "Search"],
        deprecated: true),
  }) {
    final Uri $url = Uri.parse('/api/shipmatrix/vehicles/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'page[number]': pageNumber,
      'page[size]': pageSize,
      'filter[manufacturer]': filterManufacturer,
      'filter[size]': filterSize,
      'filter[type]': filterType,
      'filter[focus]': filterFocus,
      'filter[production_status]': filterProductionStatus,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      tag: swaggerMetaData,
    );
    return client.send<ApiShipmatrixVehiclesSearchPost$Response,
        ApiShipmatrixVehiclesSearchPost$Response>($request);
  }

  @override
  Future<Response<ApiUserGet$Response>> _apiUserGet(
      {SwaggerMetaData swaggerMetaData = const SwaggerMetaData(
          description:
              'Returns the currently authenticated user. Requires a valid Sanctum bearer token.',
          summary: 'Get Authenticated User',
          operationId: 'getAuthenticatedUser',
          consumes: [],
          produces: [],
          security: ["sanctum"],
          tags: ["Auth"],
          deprecated: false)}) {
    final Uri $url = Uri.parse('/api/user');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      tag: swaggerMetaData,
    );
    return client.send<ApiUserGet$Response, ApiUserGet$Response>($request);
  }
}
