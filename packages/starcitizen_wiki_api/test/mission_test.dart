import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Mission
void main() {
  final Mission? instance = /* Mission(...) */ null;
  // TODO add properties to the entity

  group(Mission, () {
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // HTML-rendered mission description. Escapes raw text, preserves EM4 styling, and renders exact mission token placeholders as tooltip spans.
    // String descriptionHtml
    test('to test the property `descriptionHtml`', () async {
      // TODO
    });

    // Rendered HTML variants when the raw description is a single mission token with multiple possible values.
    // List<String> descriptionVariants
    test('to test the property `descriptionVariants`', () async {
      // TODO
    });

    // String missionType
    test('to test the property `missionType`', () async {
      // TODO
    });

    // String missionGiver
    test('to test the property `missionGiver`', () async {
      // TODO
    });

    // MissionFaction faction
    test('to test the property `faction`', () async {
      // TODO
    });

    // int rankIndex
    test('to test the property `rankIndex`', () async {
      // TODO
    });

    // bool illegal
    test('to test the property `illegal`', () async {
      // TODO
    });

    // String legalityLabel
    test('to test the property `legalityLabel`', () async {
      // TODO
    });

    // bool shareable
    test('to test the property `shareable`', () async {
      // TODO
    });

    // bool onceOnly
    test('to test the property `onceOnly`', () async {
      // TODO
    });

    // bool availableInPrison
    test('to test the property `availableInPrison`', () async {
      // TODO
    });

    // bool notForRelease
    test('to test the property `notForRelease`', () async {
      // TODO
    });

    // bool workInProgress
    test('to test the property `workInProgress`', () async {
      // TODO
    });

    // bool hasCombat
    test('to test the property `hasCombat`', () async {
      // TODO
    });

    // bool hasDefendObjective
    test('to test the property `hasDefendObjective`', () async {
      // TODO
    });

    // int enemyCountMin
    test('to test the property `enemyCountMin`', () async {
      // TODO
    });

    // int enemyCountMax
    test('to test the property `enemyCountMax`', () async {
      // TODO
    });

    // int minCrimeStat
    test('to test the property `minCrimeStat`', () async {
      // TODO
    });

    // int maxCrimeStat
    test('to test the property `maxCrimeStat`', () async {
      // TODO
    });

    // int rewardMin
    test('to test the property `rewardMin`', () async {
      // TODO
    });

    // int rewardMax
    test('to test the property `rewardMax`', () async {
      // TODO
    });

    // String rewardCurrency
    test('to test the property `rewardCurrency`', () async {
      // TODO
    });

    // double timeToCompleteMinutes
    test('to test the property `timeToCompleteMinutes`', () async {
      // TODO
    });

    // List<String> starSystems
    test('to test the property `starSystems`', () async {
      // TODO
    });

    // MissionCooldown cooldown
    test('to test the property `cooldown`', () async {
      // TODO
    });

    // MissionLifetime lifetime
    test('to test the property `lifetime`', () async {
      // TODO
    });

    // bool reacceptAfterFailing
    test('to test the property `reacceptAfterFailing`', () async {
      // TODO
    });

    // bool reacceptAfterAbandoning
    test('to test the property `reacceptAfterAbandoning`', () async {
      // TODO
    });

    // Array of blueprint pools
    // List<MissionBlueprintPool> blueprints
    test('to test the property `blueprints`', () async {
      // TODO
    });

    // List<MissionRewardItem> rewardItems
    test('to test the property `rewardItems`', () async {
      // TODO
    });

    // MissionCombat combat
    test('to test the property `combat`', () async {
      // TODO
    });

    // List<MissionCompletionTag> completionTags
    test('to test the property `completionTags`', () async {
      // TODO
    });

    // List<MissionReputation> reputationGained
    test('to test the property `reputationGained`', () async {
      // TODO
    });

    // List<MissionReputation> reputationLost
    test('to test the property `reputationLost`', () async {
      // TODO
    });

    // List<MissionHaulingOrder> haulingOrders
    test('to test the property `haulingOrders`', () async {
      // TODO
    });

    // int cost
    test('to test the property `cost`', () async {
      // TODO
    });

    // int maxPlayersPerInstance
    test('to test the property `maxPlayersPerInstance`', () async {
      // TODO
    });

    // bool failIfBecameCriminal
    test('to test the property `failIfBecameCriminal`', () async {
      // TODO
    });

    // MissionIndexMinStanding minStanding
    test('to test the property `minStanding`', () async {
      // TODO
    });

    // MissionIndexMinStanding maxStanding
    test('to test the property `maxStanding`', () async {
      // TODO
    });

    // Resolved mission token values. Keys are token identifiers (e.g. \"Location|Address\", \"Danger\", \"Contractor\"). Values are arrays of possible resolved strings. Keys preserve original case and pipe syntax exactly.
    // Map<String, List<String>> missionTokens
    test('to test the property `missionTokens`', () async {
      // TODO
    });

    // MissionDeadline deadline
    test('to test the property `deadline`', () async {
      // TODO
    });

    // MissionBrokerReputationPrerequisites brokerReputationPrerequisites
    test('to test the property `brokerReputationPrerequisites`', () async {
      // TODO
    });

    // MissionItemCounts itemCounts
    test('to test the property `itemCounts`', () async {
      // TODO
    });

    // List<MissionEntitySpawnsInner> entitySpawns
    test('to test the property `entitySpawns`', () async {
      // TODO
    });

    // bool hiddenInMobiglas
    test('to test the property `hiddenInMobiglas`', () async {
      // TODO
    });

    // bool notifyOnAvailable
    test('to test the property `notifyOnAvailable`', () async {
      // TODO
    });

    // String rewardScope
    test('to test the property `rewardScope`', () async {
      // TODO
    });

    // int reputationAmount
    test('to test the property `reputationAmount`', () async {
      // TODO
    });

    // String gameVersion
    test('to test the property `gameVersion`', () async {
      // TODO
    });

    // List<MissionStarmapLocationGroup> starmapLocations
    test('to test the property `starmapLocations`', () async {
      // TODO
    });

    // List<MissionPrerequisiteGroup> prerequisiteGroups
    test('to test the property `prerequisiteGroups`', () async {
      // TODO
    });

    // Completion tag groups that become available after completing this mission
    // List<MissionUnlockGroup> unlockGroups
    test('to test the property `unlockGroups`', () async {
      // TODO
    });

    // Starmap locations grouped by logical purpose categories (Destinations, Locations, Availability)
    // Object mergedLocations
    test('to test the property `mergedLocations`', () async {
      // TODO
    });

    // bool hasRewards
    test('to test the property `hasRewards`', () async {
      // TODO
    });

    // bool hasCombatSection
    test('to test the property `hasCombatSection`', () async {
      // TODO
    });

    // bool hasLocations
    test('to test the property `hasLocations`', () async {
      // TODO
    });

    // bool hasChain
    test('to test the property `hasChain`', () async {
      // TODO
    });

    // bool hasBlueprints
    test('to test the property `hasBlueprints`', () async {
      // TODO
    });

    // Whether this mission is released (not marked as not_for_release or work_in_progress).
    // bool released
    test('to test the property `released`', () async {
      // TODO
    });

    // String link
    test('to test the property `link`', () async {
      // TODO
    });

  });
}
