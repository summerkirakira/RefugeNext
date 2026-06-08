import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for FactionsApi
void main() {
  final instance = StarcitizenWikiApi().getFactionsApi();

  group(FactionsApi, () {
    // Get Faction Detail
    //
    // Returns full details for a single faction, including reputation ladder with standings when the faction has a reputation system. Factions hidden from the Delphi app are excluded.
    //
    //Future<GetFaction200Response> getFaction(String faction) async
    test('test getFaction', () async {
      // TODO
    });

    // List Factions
    //
    // Returns paginated factions sorted by name by default. Factions hidden from the Delphi app are excluded.
    //
    //Future<ListFactions200Response> listFactions({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketFactionTypeRightSquareBracket, bool filterLeftSquareBracketHasReputationRightSquareBracket, bool filterLeftSquareBracketLawfulRightSquareBracket, bool filterLeftSquareBracketIsNpcRightSquareBracket, bool filterLeftSquareBracketHideInDelphiAppRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, String sort }) async
    test('test listFactions', () async {
      // TODO
    });

  });
}
