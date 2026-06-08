import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for DepositBase
void main() {
  final DepositBase? instance = /* DepositBase(...) */ null;
  // TODO add properties to the entity

  group(DepositBase, () {
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

  });
}
