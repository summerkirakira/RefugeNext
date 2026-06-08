import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for MissionsApi
void main() {
  final instance = StarcitizenWikiApi().getMissionsApi();

  group(MissionsApi, () {
    // Get Mission Detail
    //
    // Returns full details for a single mission, including chain relationships and associated items. Results are scoped to the requested or default game version.
    //
    //Future<GetMission200Response> getMission(String mission, { String version }) async
    test('test getMission', () async {
      // TODO
    });

    // Get Mission Filter Options
    //
    // Returns available filter facets for missions, scoped to the requested or default game version.
    //
    //Future<ListMissionFilters200Response> listMissionFilters({ String version, bool filterLeftSquareBracketIncludeUnreleasedRightSquareBracket, String filterLeftSquareBracketMissionGiverRightSquareBracket, String filterLeftSquareBracketFactionRightSquareBracket, String filterLeftSquareBracketStarSystemRightSquareBracket, bool filterLeftSquareBracketIllegalRightSquareBracket, bool filterLeftSquareBracketShareableRightSquareBracket, bool filterLeftSquareBracketOnceOnlyRightSquareBracket, bool filterLeftSquareBracketAvailableInPrisonRightSquareBracket, bool filterLeftSquareBracketHasCombatRightSquareBracket, bool filterLeftSquareBracketHasDefendObjectiveRightSquareBracket, int filterLeftSquareBracketRankIndexRightSquareBracket, bool filterLeftSquareBracketHasPrerequisitesRightSquareBracket, int filterLeftSquareBracketMinEnemiesRightSquareBracket, int filterLeftSquareBracketMaxEnemiesRightSquareBracket, int filterLeftSquareBracketRewardMinRightSquareBracket, int filterLeftSquareBracketRewardMaxRightSquareBracket, String filterLeftSquareBracketTitleRightSquareBracket, String filterLeftSquareBracketDescriptionRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, String filterLeftSquareBracketRewardScopeRightSquareBracket, bool filterLeftSquareBracketHasBlueprintsRightSquareBracket, String filterLeftSquareBracketBlueprintNameRightSquareBracket, String filterLeftSquareBracketReputationScopeRightSquareBracket, String filterLeftSquareBracketLocationRightSquareBracket }) async
    test('test listMissionFilters', () async {
      // TODO
    });

    // List Game Missions
    //
    // Returns paginated missions for the requested or default game version. Results are grouped by mission variant key by default. Grouping is automatically disabled when filters are active unless filter[grouped]=true is set explicitly. Includes mission, game version, faction, and blueprint relationships.
    //
    //Future<ListMissions200Response> listMissions({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String version, String sort, String filterLeftSquareBracketMissionGiverRightSquareBracket, String filterLeftSquareBracketFactionRightSquareBracket, String filterLeftSquareBracketStarSystemRightSquareBracket, bool filterLeftSquareBracketIllegalRightSquareBracket, bool filterLeftSquareBracketShareableRightSquareBracket, bool filterLeftSquareBracketOnceOnlyRightSquareBracket, bool filterLeftSquareBracketAvailableInPrisonRightSquareBracket, bool filterLeftSquareBracketHasCombatRightSquareBracket, bool filterLeftSquareBracketHasDefendObjectiveRightSquareBracket, int filterLeftSquareBracketRankIndexRightSquareBracket, bool filterLeftSquareBracketHasPrerequisitesRightSquareBracket, int filterLeftSquareBracketMinEnemiesRightSquareBracket, int filterLeftSquareBracketMaxEnemiesRightSquareBracket, int filterLeftSquareBracketRewardMinRightSquareBracket, int filterLeftSquareBracketRewardMaxRightSquareBracket, String filterLeftSquareBracketTitleRightSquareBracket, String filterLeftSquareBracketDescriptionRightSquareBracket, String filterLeftSquareBracketQueryRightSquareBracket, String filterLeftSquareBracketRewardScopeRightSquareBracket, bool filterLeftSquareBracketHasBlueprintsRightSquareBracket, String filterLeftSquareBracketReputationScopeRightSquareBracket, String filterLeftSquareBracketBlueprintNameRightSquareBracket, String filterLeftSquareBracketLocationRightSquareBracket, bool filterLeftSquareBracketGroupedRightSquareBracket }) async
    test('test listMissions', () async {
      // TODO
    });

  });
}
