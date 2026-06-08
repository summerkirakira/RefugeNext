import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for StatsApi
void main() {
  final instance = StarcitizenWikiApi().getStatsApi();

  group(StatsApi, () {
    // Latest Crowdfunding Statistics
    //
    // Get the most recent Star Citizen crowdfunding statistics snapshot, including funds raised (USD), fan count, and fleet size.
    //
    //Future<GetLatestStats200Response> getLatestStats() async
    test('test getLatestStats', () async {
      // TODO
    });

    // Paginated Historical Statistics
    //
    // Get paginated historical Star Citizen crowdfunding statistics, ordered by most recent first. Supports page-based pagination.
    //
    //Future<ListStats200Response> listStats({ int page, int pageLeftSquareBracketNumberRightSquareBracket, int pageLeftSquareBracketSizeRightSquareBracket }) async
    test('test listStats', () async {
      // TODO
    });

  });
}
