import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for CommoditiesApi
void main() {
  final instance = StarcitizenWikiApi().getCommoditiesApi();

  group(CommoditiesApi, () {
    // Show Game Commodity
    //
    // Returns full details for a single game commodity including detailed location entries with starmap data, resource composition, areas, clustering data, and raw/refined version info. Results are scoped to the requested or default game version. Optionally include related blueprints and items.
    //
    //Future<GetCommodity200Response> getCommodity(String commodity, { String version, String include }) async
    test('test getCommodity', () async {
      // TODO
    });

    // List Game Commodities
    //
    // Returns paginated game commodities with location data and resource metadata, optionally filtered to only those consumed by blueprints. Results include refined version info and starmap location data scoped to the requested or default game version.
    //
    //Future<ListCommodities200Response> listCommodities({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String version, String sort, bool filterLeftSquareBracketUsedRightSquareBracket, String filterLeftSquareBracketSystemRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketRarityRightSquareBracket, String filterLeftSquareBracketKindRightSquareBracket, String filterLeftSquareBracketGroupRightSquareBracket, String filterLeftSquareBracketRefinedVersionRightSquareBracket, String filterLeftSquareBracketLocationRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, bool filterLeftSquareBracketShipRightSquareBracket, bool filterLeftSquareBracketGroundVehicleRightSquareBracket, bool filterLeftSquareBracketFpsRightSquareBracket, bool filterLeftSquareBracketHarvestableRightSquareBracket, bool filterLeftSquareBracketSalvageRightSquareBracket, bool filterLeftSquareBracketMineableRightSquareBracket }) async
    test('test listCommodities', () async {
      // TODO
    });

    // Game Commodity Filters
    //
    // Returns all available filter values for game commodities, scoped to the requested or default game version. Filter values can be combined; providing a system filter will narrow the location facet to that system only.
    //
    //Future<ListCommodityFilters200Response> listCommodityFilters({ String version, bool filterLeftSquareBracketUsedRightSquareBracket, String filterLeftSquareBracketSystemRightSquareBracket, String filterLeftSquareBracketTypeRightSquareBracket, String filterLeftSquareBracketRarityRightSquareBracket, String filterLeftSquareBracketKindRightSquareBracket, String filterLeftSquareBracketGroupRightSquareBracket, String filterLeftSquareBracketRefinedVersionRightSquareBracket, String filterLeftSquareBracketLocationRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, bool filterLeftSquareBracketShipRightSquareBracket, bool filterLeftSquareBracketGroundVehicleRightSquareBracket, bool filterLeftSquareBracketFpsRightSquareBracket, bool filterLeftSquareBracketHarvestableRightSquareBracket, bool filterLeftSquareBracketSalvageRightSquareBracket, bool filterLeftSquareBracketMineableRightSquareBracket }) async
    test('test listCommodityFilters', () async {
      // TODO
    });

  });
}
