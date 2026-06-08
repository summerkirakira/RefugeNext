import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for FactionStanding
void main() {
  final FactionStanding? instance = /* FactionStanding(...) */ null;
  // TODO add properties to the entity

  group(FactionStanding, () {
    // Unique standing identifier.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // Internal standing name.
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

    // API URL for the full faction detail.
    // String link
    test('to test the property `link`', () async {
      // TODO
    });

    // Human-readable standing name.
    // String displayName
    test('to test the property `displayName`', () async {
      // TODO
    });

    // Minimum reputation required for this standing.
    // int minReputation
    test('to test the property `minReputation`', () async {
      // TODO
    });

    // Reputation change applied per drift cycle.
    // int driftReputation
    test('to test the property `driftReputation`', () async {
      // TODO
    });

    // Hours between drift cycles.
    // int driftTimeHours
    test('to test the property `driftTimeHours`', () async {
      // TODO
    });

    // Whether this standing is gated and cannot be reached through normal progression.
    // bool gated
    test('to test the property `gated`', () async {
      // TODO
    });

  });
}
