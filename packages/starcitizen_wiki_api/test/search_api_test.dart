import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for SearchApi
void main() {
  final instance = StarcitizenWikiApi().getSearchApi();

  group(SearchApi, () {
    // Comm-Link Reverse Image Similar Search
    //
    // Find Comm-Link images similar to an existing RSI-hosted image.
    //
    //Future<ReverseImageSearch200Response> findSimilarImages(int image, { int similarity }) async
    test('test findSimilarImages', () async {
      // TODO
    });

    // Resolve Search Query
    //
    // Resolve a search query to the best-matching entity and redirect to its API URL, preserving query parameters such as locale, include, and version. Useful for quick lookups where you know the exact name.
    //
    //Future resolveSearchQuery(String query, { String version }) async
    test('test resolveSearchQuery', () async {
      // TODO
    });

    // Comm-Link Reverse Image Link Search
    //
    // Return comm-links that reference the same RSI-hosted image URL.
    //
    //Future<ReverseImageLinkSearch200Response> reverseImageLinkSearch(ReverseImageLinkSearchRequest reverseImageLinkSearchRequest) async
    test('test reverseImageLinkSearch', () async {
      // TODO
    });

    // Comm-Link Reverse Image Search
    //
    // Search comm-links by uploading an image and specifying a similarity threshold. Requires the GD PHP extension.
    //
    //Future<ReverseImageSearch200Response> reverseImageSearch(MultipartFile image, { int similarity }) async
    test('test reverseImageSearch', () async {
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

    // Comm-Link Image Search by filename
    //
    // Search comm-link images by filename with optional tag filtering. Only images without a base image and with non-zero file size are returned.
    //
    //Future<ReverseImageSearch200Response> searchCommLinkImages(SearchCommLinkImagesRequest searchCommLinkImagesRequest, { String filterLeftSquareBracketTagsRightSquareBracket }) async
    test('test searchCommLinkImages', () async {
      // TODO
    });

    // Galactapedia Article Search (Deprecated)
    //
    // Deprecated. Use GET /api/galactapedia?filter[title]={value} for title search. This endpoint will be removed in a future version.
    //
    //Future<SearchGalactapediaDeprecated200Response> searchGalactapediaDeprecated(Object body) async
    test('test searchGalactapediaDeprecated', () async {
      // TODO
    });

    // Unified Search Across All Game Data
    //
    // Search across items, vehicles, starmap locations, commodities, blueprints, and missions simultaneously. Returns results grouped by type, limited to 5 results per group.
    //
    //Future<SearchGameData200Response> searchGameData(String filterLeftSquareBracketQueryRightSquareBracket, { String version }) async
    test('test searchGameData', () async {
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

    // In-Game Item Search (Deprecated)
    //
    // Deprecated. Use GET /api/items?filter[name]={value} for name search. Note: OR search across name/uuid/type is no longer supported. This endpoint will be removed in a future version.
    //
    //Future<ListWeapons200Response> searchItemsDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String locale, String include, String sort, bool filterLeftSquareBracketVariantsRightSquareBracket, String filterLeftSquareBracketCategoryRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketSubTypeRightSquareBracket, String filterLeftSquareBracketManufacturerRightSquareBracket, String filterLeftSquareBracketManufacturerPeriodNameRightSquareBracket, String filterLeftSquareBracketClassNameRightSquareBracket, String filterLeftSquareBracketNameRightSquareBracket, String filterLeftSquareBracketClassificationRightSquareBracket, num filterLeftSquareBracketSizeRightSquareBracket, num filterLeftSquareBracketGradeRightSquareBracket, String filterLeftSquareBracketClassRightSquareBracket, bool filterLeftSquareBracketIncludeIrrelevantRightSquareBracket }) async
    test('test searchItemsDeprecated', () async {
      // TODO
    });

    // In-Game Manufacturer Search (Deprecated)
    //
    // Deprecated. Use GET /api/manufacturers?filter[name]={value} for name search. This endpoint will be removed in a future version.
    //
    //Future<ListManufacturers200Response> searchManufacturersDeprecated(Object body, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test searchManufacturersDeprecated', () async {
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

    // Starsystem Search (Deprecated)
    //
    // Deprecated. Use GET /api/starsystems?filter[name]={value} for name search. This endpoint will be removed in a future version.
    //
    //Future<SearchStarsystemsDeprecated200Response> searchStarsystemsDeprecated(SearchCelestialObjectsDeprecatedRequest searchCelestialObjectsDeprecatedRequest, { int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test searchStarsystemsDeprecated', () async {
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
