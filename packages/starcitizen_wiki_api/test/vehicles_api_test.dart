import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for VehiclesApi
void main() {
  final instance = StarcitizenWikiApi().getVehiclesApi();

  group(VehiclesApi, () {
    // In-Game Gravlev Vehicle Detail
    //
    // Alias for /api/vehicles/{identifier} scoped to gravlev vehicles. Results are scoped to the requested or default game version.
    //
    //Future<GetGroundVehicle200Response> getGravlevVehicle(String identifier, { String include, String version }) async
    test('test getGravlevVehicle', () async {
      // TODO
    });

    // In-Game Ground Vehicle Detail
    //
    // Alias for /api/vehicles/{identifier} scoped to ground vehicles. Results are scoped to the requested or default game version.
    //
    //Future<GetGroundVehicle200Response> getGroundVehicle(String identifier, { String include, String version }) async
    test('test getGroundVehicle', () async {
      // TODO
    });

    // Ship Matrix Vehicle Detail
    //
    // Retrieve a Ship Matrix vehicle by slug. Use the \"include\" query parameter to load additional relationships: components, loaner, skus.
    //
    //Future<GetShipMatrixVehicle200Response> getShipMatrixVehicle(String slug, { String include }) async
    test('test getShipMatrixVehicle', () async {
      // TODO
    });

    // In-Game Vehicle Detail
    //
    // Retrieve a vehicle by name, class name, or UUID. Results are scoped to the requested or default game version. Loads manufacturer, gameVersion, shipMatrixVehicle (with foci, productionStatus, productionNote, type, size, loaner, skus, manufacturer, components), and port loadout items.
    //
    //Future<GetGroundVehicle200Response> getVehicle(String identifier, { String include, String version }) async
    test('test getVehicle', () async {
      // TODO
    });

    // In-Game Gravlev Vehicles Overview
    //
    // Alias for /api/vehicles scoped to gravlev vehicles (is_gravlev=true). Returns paginated in-game gravlev vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.
    //
    //Future<ListGroundVehicles200Response> listGravlevVehicles({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, int filterLeftSquareBracketSizeRightSquareBracket, int filterLeftSquareBracketSizeClassRightSquareBracket, String filterLeftSquareBracketCareerRightSquareBracket, String filterLeftSquareBracketRoleRightSquareBracket, bool filterLeftSquareBracketIsVehicleRightSquareBracket, bool filterLeftSquareBracketIsGravlevRightSquareBracket, bool filterLeftSquareBracketIsSpaceshipRightSquareBracket, num filterLeftSquareBracketMassTotalRightSquareBracket, num filterLeftSquareBracketCargoCapacityRightSquareBracket, num filterLeftSquareBracketVehicleInventoryRightSquareBracket, int filterLeftSquareBracketCrewPeriodMinRightSquareBracket, num filterLeftSquareBracketHealthRightSquareBracket, num filterLeftSquareBracketShieldPeriodHpRightSquareBracket, String filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, num filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, num filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, num filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, num filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, num filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, num filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, num filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket }) async
    test('test listGravlevVehicles', () async {
      // TODO
    });

    // In-Game Ground Vehicles Overview
    //
    // Alias for /api/vehicles scoped to ground vehicles (is_vehicle=true, is_gravlev=false, is_spaceship=false). Returns paginated in-game ground vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus.
    //
    //Future<ListGroundVehicles200Response> listGroundVehicles({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, int filterLeftSquareBracketSizeRightSquareBracket, int filterLeftSquareBracketSizeClassRightSquareBracket, String filterLeftSquareBracketCareerRightSquareBracket, String filterLeftSquareBracketRoleRightSquareBracket, bool filterLeftSquareBracketIsVehicleRightSquareBracket, bool filterLeftSquareBracketIsGravlevRightSquareBracket, bool filterLeftSquareBracketIsSpaceshipRightSquareBracket, num filterLeftSquareBracketMassTotalRightSquareBracket, num filterLeftSquareBracketCargoCapacityRightSquareBracket, num filterLeftSquareBracketVehicleInventoryRightSquareBracket, int filterLeftSquareBracketCrewPeriodMinRightSquareBracket, num filterLeftSquareBracketHealthRightSquareBracket, num filterLeftSquareBracketShieldPeriodHpRightSquareBracket, String filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, num filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, num filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, num filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, num filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, num filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, num filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, num filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket }) async
    test('test listGroundVehicles', () async {
      // TODO
    });

    // Ship Matrix Vehicle Filters
    //
    // Return all available filter values for Ship Matrix vehicles. Supports cross-filtering: pass filter parameters to get filtered facet counts.
    //
    //Future<ListShipMatrixFilters200Response> listShipMatrixFilters() async
    test('test listShipMatrixFilters', () async {
      // TODO
    });

    // Ship Matrix Vehicles Overview
    //
    // Returns paginated Ship Matrix vehicles with optional filters. SKU variants and loaner vehicles are included by default.
    //
    //Future<ListShipMatrixVehicles200Response> listShipMatrixVehicles({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketFocusRightSquareBracket, String filterLeftSquareBracketProductionStatusRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String sort }) async
    test('test listShipMatrixVehicles', () async {
      // TODO
    });

    // In-Game Vehicle Filters
    //
    // Return all available filter values for in-game vehicles.
    //
    //Future<ListVehicleFilters200Response> listVehicleFilters({ String version }) async
    test('test listVehicleFilters', () async {
      // TODO
    });

    // In-Game Vehicles Overview
    //
    // Returns paginated in-game vehicles for the requested game version. Default includes: vehicle, gameVersion, manufacturer, shipMatrixVehicle.loaner, shipMatrixVehicle.skus. Optional includes: shipMatrixVehicle, components, shipmatrixvehicle.components, hardpoints, ports.
    //
    //Future<ListGroundVehicles200Response> listVehicles({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String include, String version, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, int filterLeftSquareBracketSizeRightSquareBracket, int filterLeftSquareBracketSizeClassRightSquareBracket, String filterLeftSquareBracketCareerRightSquareBracket, String filterLeftSquareBracketRoleRightSquareBracket, bool filterLeftSquareBracketIsVehicleRightSquareBracket, bool filterLeftSquareBracketIsGravlevRightSquareBracket, bool filterLeftSquareBracketIsSpaceshipRightSquareBracket, num filterLeftSquareBracketMassTotalRightSquareBracket, num filterLeftSquareBracketCargoCapacityRightSquareBracket, num filterLeftSquareBracketVehicleInventoryRightSquareBracket, int filterLeftSquareBracketCrewPeriodMinRightSquareBracket, num filterLeftSquareBracketHealthRightSquareBracket, num filterLeftSquareBracketShieldPeriodHpRightSquareBracket, String filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, num filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, num filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, num filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, num filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, num filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, num filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, num filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket }) async
    test('test listVehicles', () async {
      // TODO
    });

    // In-Game Gravlev Vehicle Search (Deprecated)
    //
    // Deprecated. Use GET /api/gravlev-vehicles?filter[name]={value} for name search. Scoped to gravlev vehicles. This endpoint will be removed in a future version.
    //
    //Future<ListGroundVehicles200Response> searchGravlevVehiclesDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test searchGravlevVehiclesDeprecated', () async {
      // TODO
    });

    // In-Game Ground Vehicle Search (Deprecated)
    //
    // Deprecated. Use GET /api/ground-vehicles?filter[name]={value} for name search. Scoped to ground vehicles. This endpoint will be removed in a future version.
    //
    //Future<ListGroundVehicles200Response> searchGroundVehiclesDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test searchGroundVehiclesDeprecated', () async {
      // TODO
    });

    // Ship Matrix Vehicle Search (Deprecated)
    //
    // Deprecated. Use GET /api/shipmatrix/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.
    //
    //Future<SearchShipMatrixVehiclesDeprecated200Response> searchShipMatrixVehiclesDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketFocusRightSquareBracket, String filterLeftSquareBracketProductionStatusRightSquareBracket }) async
    test('test searchShipMatrixVehiclesDeprecated', () async {
      // TODO
    });

    // In-Game Vehicle Search (Deprecated)
    //
    // Deprecated. Use GET /api/vehicles?filter[name]={value} for name search. This endpoint will be removed in a future version.
    //
    //Future<ListGroundVehicles200Response> searchVehiclesDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String sort, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, int filterLeftSquareBracketSizeRightSquareBracket, int filterLeftSquareBracketSizeClassRightSquareBracket, String filterLeftSquareBracketCareerRightSquareBracket, String filterLeftSquareBracketRoleRightSquareBracket, bool filterLeftSquareBracketIsVehicleRightSquareBracket, bool filterLeftSquareBracketIsGravlevRightSquareBracket, bool filterLeftSquareBracketIsSpaceshipRightSquareBracket, num filterLeftSquareBracketMassTotalRightSquareBracket, num filterLeftSquareBracketCargoCapacityRightSquareBracket, num filterLeftSquareBracketVehicleInventoryRightSquareBracket, int filterLeftSquareBracketCrewPeriodMinRightSquareBracket, num filterLeftSquareBracketHealthRightSquareBracket, num filterLeftSquareBracketShieldPeriodHpRightSquareBracket, String filterLeftSquareBracketShieldPeriodFaceTypeRightSquareBracket, num filterLeftSquareBracketSpeedPeriodScmRightSquareBracket, num filterLeftSquareBracketSpeedPeriodMaxRightSquareBracket, num filterLeftSquareBracketArmorPeriodHealthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodLengthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodWidthRightSquareBracket, num filterLeftSquareBracketCrossSectionPeriodHeightRightSquareBracket, num filterLeftSquareBracketSignaturePeriodIrQuantumRightSquareBracket, num filterLeftSquareBracketSignaturePeriodIrShieldsRightSquareBracket, num filterLeftSquareBracketSignaturePeriodEmQuantumRightSquareBracket, num filterLeftSquareBracketSignaturePeriodEmShieldsRightSquareBracket }) async
    test('test searchVehiclesDeprecated', () async {
      // TODO
    });

  });
}
