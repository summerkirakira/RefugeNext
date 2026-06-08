import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for StarmapApi
void main() {
  final instance = StarcitizenWikiApi().getStarmapApi();

  group(StarmapApi, () {
    // Celestial Object Detail
    //
    // Retrieve a celestial object by code, optionally including relations.
    //
    //Future<GetCelestialObject200Response> getCelestialObject(String code, { String include }) async
    test('test getCelestialObject', () async {
      // TODO
    });

    // Game Starmap Location Detail
    //
    // Retrieve a versioned starmap location by slug or UUID. Results are scoped to the requested or default game version. Use the `include` parameter to load additional relations: `children` (child locations with amenities and tags), `resources` (harvestable resource placements with commodity data), `missions` (available missions with faction data).
    //
    //Future<GetLocation200Response> getLocation(String identifier, { String include, String version }) async
    test('test getLocation', () async {
      // TODO
    });

    // Starsystem Detail
    //
    // Retrieve a starsystem by code or identifier, with optional includes.
    //
    //Future<GetStarsystem200Response> getStarsystem(String code, { String include }) async
    test('test getStarsystem', () async {
      // TODO
    });

    // Starmap Celestial Objects Overview
    //
    // Returns paginated celestial objects with optional relationships.
    //
    //Future<ListCelestialObjects200Response> listCelestialObjects({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketStarsystemRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketDesignationRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String sort, String include }) async
    test('test listCelestialObjects', () async {
      // TODO
    });

    // Game Starmap Location Filters
    //
    // Return all available filter facet values for versioned starmap locations. Applies any provided filter parameters to scope the facet counts. Returns facets for: type_name, type_classification, respawn_location_type, jurisdiction_name, affiliation_name, system, parent_name, amenity, and resource.
    //
    //Future<ListLocationFilters200Response> listLocationFilters({ String version, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, String filterLeftSquareBracketTypeNameRightSquareBracket, String filterLeftSquareBracketTypeClassificationRightSquareBracket, String filterLeftSquareBracketRespawnLocationTypeRightSquareBracket, String filterLeftSquareBracketJurisdictionNameRightSquareBracket, String filterLeftSquareBracketAffiliationNameRightSquareBracket, bool filterLeftSquareBracketIsScannableRightSquareBracket, bool filterLeftSquareBracketBlockTravelRightSquareBracket, String filterLeftSquareBracketAmenityRightSquareBracket, String filterLeftSquareBracketTagRightSquareBracket, String filterLeftSquareBracketParentNameRightSquareBracket, String filterLeftSquareBracketParentUuidRightSquareBracket, String filterLeftSquareBracketSystemRightSquareBracket, bool filterLeftSquareBracketHasResourcesRightSquareBracket, String filterLeftSquareBracketResourceRightSquareBracket, bool filterLeftSquareBracketHideMinorLocationsRightSquareBracket }) async
    test('test listLocationFilters', () async {
      // TODO
    });

    // Starmap Entity Positions
    //
    // Starmap entity world positions.
    //
    //Future<ListLocationPositions200Response> listLocationPositions({ String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketSystemRightSquareBracket }) async
    test('test listLocationPositions', () async {
      // TODO
    });

    // Game Starmap Locations Overview
    //
    // Returns paginated versioned starmap locations with optional filters. Results are scoped to the requested or default game version. Each location includes amenities, hierarchy entity tags, parent and star relations, child count, mission count, and resource availability.
    //
    //Future<ListLocations200Response> listLocations({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String version, String sort, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, String filterLeftSquareBracketTypeNameRightSquareBracket, String filterLeftSquareBracketTypeClassificationRightSquareBracket, String filterLeftSquareBracketRespawnLocationTypeRightSquareBracket, String filterLeftSquareBracketJurisdictionNameRightSquareBracket, String filterLeftSquareBracketAffiliationNameRightSquareBracket, bool filterLeftSquareBracketIsScannableRightSquareBracket, bool filterLeftSquareBracketBlockTravelRightSquareBracket, String filterLeftSquareBracketAmenityRightSquareBracket, String filterLeftSquareBracketTagRightSquareBracket, String filterLeftSquareBracketParentNameRightSquareBracket, String filterLeftSquareBracketParentUuidRightSquareBracket, String filterLeftSquareBracketSystemRightSquareBracket, bool filterLeftSquareBracketHasResourcesRightSquareBracket, String filterLeftSquareBracketResourceRightSquareBracket, bool filterLeftSquareBracketHideMinorLocationsRightSquareBracket }) async
    test('test listLocations', () async {
      // TODO
    });

    // Starsystem Filters
    //
    // Return all available filter values for starsystems.
    //
    //Future<ListStarsystemFilters200Response> listStarsystemFilters() async
    test('test listStarsystemFilters', () async {
      // TODO
    });

    // Starmap Starsystems Overview
    //
    // Returns paginated starsystems, optionally including related resources.
    //
    //Future<ListStarsystems200Response> listStarsystems({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketAffiliationRightSquareBracket, String filterLeftSquareBracketCodeRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketStatusRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, num filterLeftSquareBracketSizeRightSquareBracket, String sort, String include }) async
    test('test listStarsystems', () async {
      // TODO
    });

    // Celestial Object Search (Deprecated)
    //
    // Deprecated. Use GET /api/celestial-objects?filter[name]={value} for name search. This endpoint will be removed in a future version.
    //
    //Future<SearchCelestialObjectsDeprecated200Response> searchCelestialObjectsDeprecated(SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test searchCelestialObjectsDeprecated', () async {
      // TODO
    });

    // Starsystem Search (Deprecated)
    //
    // Deprecated. Use GET /api/starsystems?filter[name]={value} for name search. This endpoint will be removed in a future version.
    //
    //Future<SearchStarsystemsDeprecated200Response> searchStarsystemsDeprecated(SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test searchStarsystemsDeprecated', () async {
      // TODO
    });

  });
}
