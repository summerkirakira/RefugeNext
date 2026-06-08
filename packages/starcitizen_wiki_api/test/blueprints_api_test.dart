import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for BlueprintsApi
void main() {
  final instance = StarcitizenWikiApi().getBlueprintsApi();

  group(BlueprintsApi, () {
    // Get Game Blueprint Detail
    //
    // Returns full detail for a single crafting blueprint, including ingredients, crafted item, dismantle returns, and associated missions. Scoped to the requested or default game version.
    //
    //Future<GetBlueprint200Response> getBlueprint(String blueprint, { String version }) async
    test('test getBlueprint', () async {
      // TODO
    });

    // Get Blueprint Filter Options
    //
    // Returns available filter facets for blueprints (crafted item types, ingredient and resource UUIDs), optionally scoped to the requested or default game version.
    //
    //Future<ListBlueprintFilters200Response> listBlueprintFilters({ String version }) async
    test('test listBlueprintFilters', () async {
      // TODO
    });

    // List Game Blueprints
    //
    // Returns paginated crafting blueprints, including ingredients, crafted items, and dismantle returns. Results are scoped to the requested or default game version.
    //
    //Future<ListBlueprints200Response> listBlueprints({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String version, String sort, String filterLeftSquareBracketQueryRightSquareBracket, String filterLeftSquareBracketOutputPeriodUuidRightSquareBracket, String filterLeftSquareBracketOutputPeriodNameRightSquareBracket, String filterLeftSquareBracketOutputPeriodClassRightSquareBracket, String filterLeftSquareBracketOutputPeriodTypeRightSquareBracket, bool filterLeftSquareBracketDefaultRightSquareBracket, String filterLeftSquareBracketIngredientRightSquareBracket, String filterLeftSquareBracketIngredientPeriodUuidRightSquareBracket, String filterLeftSquareBracketResourcePeriodUuidRightSquareBracket }) async
    test('test listBlueprints', () async {
      // TODO
    });

  });
}
