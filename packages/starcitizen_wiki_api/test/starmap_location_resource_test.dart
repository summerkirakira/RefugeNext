import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for StarmapLocationResource
void main() {
  final StarmapLocationResource? instance = /* StarmapLocationResource(...) */ null;
  // TODO add properties to the entity

  group(StarmapLocationResource, () {
    // Unique deposit key identifier.
    // String key
    test('to test the property `key`', () async {
      // TODO
    });

    // Human-readable deposit name derived from the key.
    // String label
    test('to test the property `label`', () async {
      // TODO
    });

    // Electromagnetic signature strength of the deposit.
    // int signature
    test('to test the property `signature`', () async {
      // TODO
    });

    // Area-specific probability modifiers that override the default for this deposit.
    // List<AreaException> areaExceptions
    test('to test the property `areaExceptions`', () async {
      // TODO
    });

    // Clustering configuration for deposit groupings, if applicable.
    // Clustering clustering
    test('to test the property `clustering`', () async {
      // TODO
    });

    // Respawn and despawn timing data for harvestable deposits.
    // HarvestableSetup harvestableSetup
    test('to test the property `harvestableSetup`', () async {
      // TODO
    });

    // List of unique provider names that generate this deposit.
    // List<String> providerNames
    test('to test the property `providerNames`', () async {
      // TODO
    });

    // List of materials (commodities) found in this deposit with their quality and probability data.
    // List<MaterialEntry> materials
    test('to test the property `materials`', () async {
      // TODO
    });

    // Minimum quality across all instances of this deposit.
    // int qualityMin
    test('to test the property `qualityMin`', () async {
      // TODO
    });

    // Maximum quality across all instances of this deposit.
    // int qualityMax
    test('to test the property `qualityMax`', () async {
      // TODO
    });

    // Lowest relative probability among deposit instances (0-1).
    // num relativeProbabilityMin
    test('to test the property `relativeProbabilityMin`', () async {
      // TODO
    });

    // Highest relative probability among deposit instances (0-1).
    // num relativeProbabilityMax
    test('to test the property `relativeProbabilityMax`', () async {
      // TODO
    });

    // Lowest relative probability as a percentage (0-100).
    // num relativeProbabilityMinPercent
    test('to test the property `relativeProbabilityMinPercent`', () async {
      // TODO
    });

    // Highest relative probability as a percentage (0-100).
    // num relativeProbabilityMaxPercent
    test('to test the property `relativeProbabilityMaxPercent`', () async {
      // TODO
    });

    // Commodity name of the resource deposit.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // UUID of the commodity, null for non-commodity deposits.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // Rarity tier of the commodity.
    // String tier
    test('to test the property `tier`', () async {
      // TODO
    });

    // API URL for the commodity detail endpoint.
    // String link
    test('to test the property `link`', () async {
      // TODO
    });

    // Web frontend URL for the commodity detail page.
    // String webUrl
    test('to test the property `webUrl`', () async {
      // TODO
    });

  });
}
