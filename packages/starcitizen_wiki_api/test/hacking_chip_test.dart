import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for HackingChip
void main() {
  final HackingChip? instance = /* HackingChip(...) */ null;
  // TODO add properties to the entity

  group(HackingChip, () {
    // Number of uses before the chip depletes.
    // int maxCharges
    test('to test the property `maxCharges`', () async {
      // TODO
    });

    // Multiplier applied to the base hack duration. Values below 1.0 speed the hack up; values above 1.0 slow it down. Example 0.5 halves the required time.
    // double durationMultiplier
    test('to test the property `durationMultiplier`', () async {
      // TODO
    });

    // Probability (0-1) that a hack attempt fails or produces an error. Higher values indicate more risk. Example 0.9 = 90% error chance.
    // double errorChance
    test('to test the property `errorChance`', () async {
      // TODO
    });

    // Gameplay access tag required/assigned when the chip is used (e.g., MissionQuestItem to mark mission-only keys).
    // String accessTag
    test('to test the property `accessTag`', () async {
      // TODO
    });

  });
}
