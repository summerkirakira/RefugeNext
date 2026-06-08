import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for GameVersionsApi
void main() {
  final instance = StarcitizenWikiApi().getGameVersionsApi();

  group(GameVersionsApi, () {
    // Get Default Game Version
    //
    // Returns the current default game version. This is the version used by default in version-scoped API queries (see the version query parameter on other endpoints).
    //
    //Future<GetDefaultGameVersion200Response> getDefaultGameVersion() async
    test('test getDefaultGameVersion', () async {
      // TODO
    });

    // Get Game Version
    //
    // Retrieve a specific game version by its code (case-insensitive). Game versions are used to scope version-aware data endpoints via the `version` query parameter.
    //
    //Future<GetDefaultGameVersion200Response> getGameVersion(String identifier) async
    test('test getGameVersion', () async {
      // TODO
    });

    // Get Version Changelog
    //
    // Returns the changelog summary between the specified version and its predecessor.
    //
    //Future<GetVersionChangelog200Response> getVersionChangelog(String version) async
    test('test getVersionChangelog', () async {
      // TODO
    });

    // List Game Versions
    //
    // Returns paginated game versions sorted by release date (newest first by default). Useful for discovering available game versions for version-scoped API queries.
    //
    //Future<ListGameVersions200Response> listGameVersions({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket, String filterLeftSquareBracketCodeRightSquareBracket, String filterLeftSquareBracketChannelRightSquareBracket, int filterLeftSquareBracketIsDefaultRightSquareBracket, String sort }) async
    test('test listGameVersions', () async {
      // TODO
    });

    // Get Version Changelog Changes
    //
    // Returns paginated diff entries for a version changelog. Filter by entity_type and change_type.
    //
    //Future<ListVersionChangelogChanges200Response> listVersionChangelogChanges(String version, { String filterLeftSquareBracketEntityTypeRightSquareBracket, String filterLeftSquareBracketChangeTypeRightSquareBracket, int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test listVersionChangelogChanges', () async {
      // TODO
    });

  });
}
