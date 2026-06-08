import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for MaterialEntry
void main() {
  final MaterialEntry? instance = /* MaterialEntry(...) */ null;
  // TODO add properties to the entity

  group(MaterialEntry, () {
    // Unique material key identifier.
    // String key
    test('to test the property `key`', () async {
      // TODO
    });

    // Display name of the material.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // UUID of the commodity this material represents.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // Whether this material is the primary commodity being viewed.
    // bool isCurrent
    test('to test the property `isCurrent`', () async {
      // TODO
    });

    // Minimum quality value of this material in the deposit.
    // int qualityMin
    test('to test the property `qualityMin`', () async {
      // TODO
    });

    // Maximum quality value of this material in the deposit.
    // int qualityMax
    test('to test the property `qualityMax`', () async {
      // TODO
    });

    // Average quality value of this material.
    // int qualityMean
    test('to test the property `qualityMean`', () async {
      // TODO
    });

    // Standard deviation of the quality distribution.
    // int qualityStddev
    test('to test the property `qualityStddev`', () async {
      // TODO
    });

    // Minimum composition percentage of this material (0-100).
    // num minPercentage
    test('to test the property `minPercentage`', () async {
      // TODO
    });

    // Maximum composition percentage of this material (0-100).
    // num maxPercentage
    test('to test the property `maxPercentage`', () async {
      // TODO
    });

    // Instability rating of this material, affecting mining difficulty.
    // num instability
    test('to test the property `instability`', () async {
      // TODO
    });

    // Resistance rating of this material, affecting mining difficulty.
    // num resistance
    test('to test the property `resistance`', () async {
      // TODO
    });

    // Raw probability of this material occurring in the deposit group (0-1).
    // num groupProbability
    test('to test the property `groupProbability`', () async {
      // TODO
    });

    // Group probability expressed as a percentage (0-100).
    // num groupProbabilityPercent
    test('to test the property `groupProbabilityPercent`', () async {
      // TODO
    });

    // Raw relative probability compared to other materials in the deposit (0-1).
    // num relativeProbability
    test('to test the property `relativeProbability`', () async {
      // TODO
    });

    // Relative probability expressed as a percentage (0-100).
    // num relativeProbabilityPercent
    test('to test the property `relativeProbabilityPercent`', () async {
      // TODO
    });

    // The discrete set of quantized quality values a player can actually receive, filtered by the material's quality range. Each value corresponds to one reachable quantization band.
    // List<int> qualityQuantizedValues
    test('to test the property `qualityQuantizedValues`', () async {
      // TODO
    });

    // All possible quantized quality values for this material from the source data. Use quality_quantized_values for the filtered set reachable on this specific deposit.
    // List<int> qualityQuantization
    test('to test the property `qualityQuantization`', () async {
      // TODO
    });

  });
}
