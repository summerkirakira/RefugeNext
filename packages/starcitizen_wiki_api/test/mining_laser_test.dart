import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for MiningLaser
void main() {
  final MiningLaser? instance = /* MiningLaser(...) */ null;
  // TODO add properties to the entity

  group(MiningLaser, () {
    // MiningLaserPowerBand laserPower
    test('to test the property `laserPower`', () async {
      // TODO
    });

    // Deprecated: Use modifier_map. List of non-null gameplay modifiers derived from stdItem.MiningLaser.Modifiers.
    // List<MiningLaserModifier> modifiers
    test('to test the property `modifiers`', () async {
      // TODO
    });

    // Number of mining module/consumable slots (ModuleSlots).
    // int moduleSlots
    test('to test the property `moduleSlots`', () async {
      // TODO
    });

    // How quickly the throttle responds to input changes.
    // double throttleLerpSpeed
    test('to test the property `throttleLerpSpeed`', () async {
      // TODO
    });

    // Minimum throttle value when firing.
    // double throttleMinimum
    test('to test the property `throttleMinimum`', () async {
      // TODO
    });

    // Deprecated. Use `laser_power.maximum`.
    // double powerTransfer
    test('to test the property `powerTransfer`', () async {
      // TODO
    });

    // Deprecated. Use `laser_power.minimum` and `laser_power.maximum` (this is a formatted string range).
    // String miningLaserPower
    test('to test the property `miningLaserPower`', () async {
      // TODO
    });

    // Key-value map of mining laser modifier names to their numeric values.
    // Map<String, num> modifierMap
    test('to test the property `modifierMap`', () async {
      // TODO
    });

    // Deprecated. Prefer `extraction_throughput` when available (this value is taken from description text).
    // String extractionLaserPower
    test('to test the property `extractionLaserPower`', () async {
      // TODO
    });

    // Optimal mining distance in meters (OptimalRange).
    // double optimalRange
    test('to test the property `optimalRange`', () async {
      // TODO
    });

    // Maximum effective range in meters (MaximumRange).
    // double maximumRange
    test('to test the property `maximumRange`', () async {
      // TODO
    });

    // Rate at which ore is extracted from the target.
    // double extractionThroughput
    test('to test the property `extractionThroughput`', () async {
      // TODO
    });

    // Radius of the mining beam at the collection point.
    // double collectionPointRadius
    test('to test the property `collectionPointRadius`', () async {
      // TODO
    });

  });
}
