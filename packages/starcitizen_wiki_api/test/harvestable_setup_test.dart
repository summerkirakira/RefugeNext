import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for HarvestableSetup
void main() {
  final HarvestableSetup? instance = /* HarvestableSetup(...) */ null;
  // TODO add properties to the entity

  group(HarvestableSetup, () {
    // Time in seconds before a harvested instance respawns.
    // int respawnSeconds
    test('to test the property `respawnSeconds`', () async {
      // TODO
    });

    // Human-readable respawn duration (e.g. \"5m 30s\").
    // String respawnFormatted
    test('to test the property `respawnFormatted`', () async {
      // TODO
    });

    // Time in seconds before an uncollected instance despawns.
    // int despawnSeconds
    test('to test the property `despawnSeconds`', () async {
      // TODO
    });

    // Human-readable despawn duration (e.g. \"10m\").
    // String despawnFormatted
    test('to test the property `despawnFormatted`', () async {
      // TODO
    });

    // Raw relative spawn probability for this harvestable (0-1).
    // num relativeProbability
    test('to test the property `relativeProbability`', () async {
      // TODO
    });

    // Relative spawn probability expressed as a percentage (0-100).
    // num relativeProbabilityPercent
    test('to test the property `relativeProbabilityPercent`', () async {
      // TODO
    });

    // Multiplier applied to the base respawn time.
    // num respawnMultiplier
    test('to test the property `respawnMultiplier`', () async {
      // TODO
    });

    // Extra wait time in seconds added when nearby players are present.
    // int additionalWaitSeconds
    test('to test the property `additionalWaitSeconds`', () async {
      // TODO
    });

    // Human-readable additional wait duration (e.g. \"2m\").
    // String additionalWaitFormatted
    test('to test the property `additionalWaitFormatted`', () async {
      // TODO
    });

  });
}
