import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for StarmapLocationMiningTypeGroup
void main() {
  final StarmapLocationMiningTypeGroup? instance = /* StarmapLocationMiningTypeGroup(...) */ null;
  // TODO add properties to the entity

  group(StarmapLocationMiningTypeGroup, () {
    // Original group name from game data identifying the deposit group.
    // String groupName
    test('to test the property `groupName`', () async {
      // TODO
    });

    // Extraction method label (e.g. Mining, Hand Mining, Salvage).
    // String miningType
    test('to test the property `miningType`', () async {
      // TODO
    });

    // Sort order for mining type display ordering.
    // int miningTypeSortOrder
    test('to test the property `miningTypeSortOrder`', () async {
      // TODO
    });

    // Kind of resource (Mineable or Harvestable).
    // String resourceKind
    test('to test the property `resourceKind`', () async {
      // TODO
    });

    // Lowest raw probability among deposits in this group (0-1).
    // num groupProbabilityMin
    test('to test the property `groupProbabilityMin`', () async {
      // TODO
    });

    // Highest raw probability among deposits in this group (0-1).
    // num groupProbabilityMax
    test('to test the property `groupProbabilityMax`', () async {
      // TODO
    });

    // Lowest probability in this group as a percentage (0-100).
    // num groupProbabilityMinPercent
    test('to test the property `groupProbabilityMinPercent`', () async {
      // TODO
    });

    // Highest probability in this group as a percentage (0-100).
    // num groupProbabilityMaxPercent
    test('to test the property `groupProbabilityMaxPercent`', () async {
      // TODO
    });

    // Individual resource deposits within this group.
    // List<StarmapLocationResource> resources
    test('to test the property `resources`', () async {
      // TODO
    });

  });
}
