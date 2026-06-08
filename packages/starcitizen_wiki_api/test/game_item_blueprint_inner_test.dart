import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for GameItemBlueprintInner
void main() {
  final GameItemBlueprintInner? instance = /* GameItemBlueprintInner(...) */ null;
  // TODO add properties to the entity

  group(GameItemBlueprintInner, () {
    // Unique blueprint identifier
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // Display name of the blueprint.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // API URL for this blueprint
    // String link
    test('to test the property `link`', () async {
      // TODO
    });

    // Internal blueprint key (e.g. BP_CRAFT_behr_pistol_ballistic_01)
    // String key
    test('to test the property `key`', () async {
      // TODO
    });

    // UUID of the blueprint category
    // String categoryUuid
    test('to test the property `categoryUuid`', () async {
      // TODO
    });

    // UUID of the item this blueprint crafts
    // String outputItemUuid
    test('to test the property `outputItemUuid`', () async {
      // TODO
    });

    // Display name of the crafted item
    // String outputName
    test('to test the property `outputName`', () async {
      // TODO
    });

    // Internal class identifier of the crafted item
    // String outputClass
    test('to test the property `outputClass`', () async {
      // TODO
    });

    // Crafting duration in seconds
    // int craftTimeSeconds
    test('to test the property `craftTimeSeconds`', () async {
      // TODO
    });

    // Human-readable crafting duration
    // String craftTimeLabel
    test('to test the property `craftTimeLabel`', () async {
      // TODO
    });

    // Whether this blueprint is available without unlocking
    // bool isAvailableByDefault
    test('to test the property `isAvailableByDefault`', () async {
      // TODO
    });

    // Game version code this data applies to
    // String gameVersion
    test('to test the property `gameVersion`', () async {
      // TODO
    });

    // Total number of distinct ingredients across all requirement groups
    // int ingredientCount
    test('to test the property `ingredientCount`', () async {
      // TODO
    });

    // Number of missions that can unlock this blueprint
    // int unlockingMissionsCount
    test('to test the property `unlockingMissionsCount`', () async {
      // TODO
    });

    // Ingredients required to craft the item
    // List<BlueprintIngredient> ingredients
    test('to test the property `ingredients`', () async {
      // TODO
    });

    // Resources returned when dismantling the crafted item
    // List<BlueprintDismantleReturnSummary> dismantleReturns
    test('to test the property `dismantleReturns`', () async {
      // TODO
    });

    // BlueprintOutput output
    test('to test the property `output`', () async {
      // TODO
    });

    // BlueprintDismantle dismantle
    test('to test the property `dismantle`', () async {
      // TODO
    });

    // Only included on blueprint detail responses.
    // List<BlueprintRequirementGroup> requirementGroups
    test('to test the property `requirementGroups`', () async {
      // TODO
    });

    // Only included on blueprint detail responses.
    // List<BlueprintSummaryProperty> summaryProperties
    test('to test the property `summaryProperties`', () async {
      // TODO
    });

    // Only included on blueprint detail responses.
    // List<BlueprintUnlockingMission> unlockingMissions
    test('to test the property `unlockingMissions`', () async {
      // TODO
    });

    // Only included on blueprint detail responses.
    // List<BlueprintUnlockingMissionsGrouped> unlockingMissionsGrouped
    test('to test the property `unlockingMissionsGrouped`', () async {
      // TODO
    });

    // BlueprintAspects aspects
    test('to test the property `aspects`', () async {
      // TODO
    });

    // Only included on blueprint detail responses.
    // List<BlueprintTier> tiers
    test('to test the property `tiers`', () async {
      // TODO
    });

    // Web URL for the blueprint detail page
    // String webUrl
    test('to test the property `webUrl`', () async {
      // TODO
    });

    // Web URL for the crafted item detail page
    // String outputItemWebUrl
    test('to test the property `outputItemWebUrl`', () async {
      // TODO
    });

  });
}
