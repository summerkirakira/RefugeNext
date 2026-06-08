import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Faction
void main() {
  final Faction? instance = /* Faction(...) */ null;
  // TODO add properties to the entity

  group(Faction, () {
    // Unique faction identifier.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // Display name of the faction.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Category of the faction. One of: Lawful, Unlawful, LawEnforcement, PrivateSecurity.
    // String factionType
    test('to test the property `factionType`', () async {
      // TODO
    });

    // Whether the faction is considered lawful.
    // bool lawful
    test('to test the property `lawful`', () async {
      // TODO
    });

    // Whether the faction is NPC-controlled.
    // bool isNpc
    test('to test the property `isNpc`', () async {
      // TODO
    });

    // Whether the faction tracks player reputation.
    // bool hasReputation
    test('to test the property `hasReputation`', () async {
      // TODO
    });

    // API URL for this faction.
    // String link
    test('to test the property `link`', () async {
      // TODO
    });

    // Lore description of the faction.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Default reaction towards the player. One of: Friendly, Hostile, Neutral.
    // String defaultReaction
    test('to test the property `defaultReaction`', () async {
      // TODO
    });

    // Whether the faction can arrest players.
    // bool ableToArrest
    test('to test the property `ableToArrest`', () async {
      // TODO
    });

    // Whether the faction enforces trespass violations against lawful characters.
    // bool policesLawfulTrespass
    test('to test the property `policesLawfulTrespass`', () async {
      // TODO
    });

    // Whether the faction actively polices criminal activity.
    // bool policesCriminality
    test('to test the property `policesCriminality`', () async {
      // TODO
    });

    // Whether the faction operates without legal protections.
    // bool noLegalRights
    test('to test the property `noLegalRights`', () async {
      // TODO
    });

    // Location of the faction's headquarters.
    // String headquarters
    test('to test the property `headquarters`', () async {
      // TODO
    });

    // Founding date or era of the faction.
    // String founded
    test('to test the property `founded`', () async {
      // TODO
    });

    // Current leadership of the faction.
    // String leadership
    test('to test the property `leadership`', () async {
      // TODO
    });

    // Primary area of operations.
    // String area
    test('to test the property `area`', () async {
      // TODO
    });

    // Primary focus or industry of the faction.
    // String focus
    test('to test the property `focus`', () async {
      // TODO
    });

    // Scope key used for sort ordering within reputation tiers.
    // String sortOrderScope
    test('to test the property `sortOrderScope`', () async {
      // TODO
    });

    // Reputation ladder with standings. Requires ?include=reputationLadder.
    // FactionReputationLadder reputationLadder
    test('to test the property `reputationLadder`', () async {
      // TODO
    });

  });
}
