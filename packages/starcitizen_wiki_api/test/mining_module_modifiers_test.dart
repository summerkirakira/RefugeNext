import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for MiningModuleModifiers
void main() {
  final MiningModuleModifiers? instance = /* MiningModuleModifiers(...) */ null;
  // TODO add properties to the entity

  group(MiningModuleModifiers, () {
    // Multiplicative change to mining laser power. 150 boosts power by 50%; 85 lowers by 15%.
    // double miningLaserPowerPercent
    test('to test the property `miningLaserPowerPercent`', () async {
      // TODO
    });

    // Multiplier on extraction beam power. Lower values mean slower extraction but often reduce inert material.
    // double extractionLaserPowerPercent
    test('to test the property `extractionLaserPowerPercent`', () async {
      // TODO
    });

    // Change to the size of the optimal (green) window. Positive widens, negative shrinks. Range seen: -10 to +40.
    // double optimalChargeWindowPercent
    test('to test the property `optimalChargeWindowPercent`', () async {
      // TODO
    });

    // Change to the ideal charge rate speed. Higher values speed charging; negatives slow it. Range seen: -20 to +60.
    // double optimalChargeRatePercent
    test('to test the property `optimalChargeRatePercent`', () async {
      // TODO
    });

    // Flat multiplier to all charge-rate bands when present. Range seen: +5 to +24.
    // double allChargeRatesPercent
    test('to test the property `allChargeRatesPercent`', () async {
      // TODO
    });

    // Reduction to inert material collected. Positive values in data mean less inert material (e.g., 6, 24).
    // double inertMaterialModifierPercent
    test('to test the property `inertMaterialModifierPercent`', () async {
      // TODO
    });

    // Change to deposit resistance (hardness). Positive makes rock more resistant; negative softens. Range seen: -24.8 to +15.5.
    // double resistancePercent
    test('to test the property `resistancePercent`', () async {
      // TODO
    });

    // Change to laser instability. Negative stabilizes, positive increases jitter. Range seen: -20 to +10.
    // double instabilityPercent
    test('to test the property `instabilityPercent`', () async {
      // TODO
    });

    // Change to damage taken when the rock shatters. Negative reduces hazard; positive increases. Range seen: -30 to +40.
    // double shatterDamagePercent
    test('to test the property `shatterDamagePercent`', () async {
      // TODO
    });

    // Change to catastrophic/overcharge rate. Negative lowers risk, positive increases. Range seen: -80 to +60.
    // double overchargeRatePercent
    test('to test the property `overchargeRatePercent`', () async {
      // TODO
    });

    // Scaling applied to cluster-related calculations for fracture/extraction when present.
    // double clusterFactor
    test('to test the property `clusterFactor`', () async {
      // TODO
    });

    // General damage multiplier used by modules. Observed range: 0.85-1.50.
    // double damageMultiplier
    test('to test the property `damageMultiplier`', () async {
      // TODO
    });

  });
}
