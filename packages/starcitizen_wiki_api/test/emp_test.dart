import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Emp
void main() {
  final Emp? instance = /* Emp(...) */ null;
  // TODO add properties to the entity

  group(Emp, () {
    // Peak distortion damage applied at the center of the blast. Observed values: 1000 (S1), 1800-2475 (S2-S3), 2750-3300 (S4 variants).
    // double distortionDamage
    test('to test the property `distortionDamage`', () async {
      // TODO
    });

    // Maximum effective distortion radius in meters. Current items range from 400m (S1) up to 1100m (large ship EMPs).
    // double empRadius
    test('to test the property `empRadius`', () async {
      // TODO
    });

    // Inner radius (m) guaranteed to receive full EMP effect before falloff begins. Presently 150m-250m.
    // double minEmpRadius
    test('to test the property `minEmpRadius`', () async {
      // TODO
    });

    // Seconds required to fully charge before firing. Current game data ranges 12-26 seconds across EMP sizes.
    // double chargeDuration
    test('to test the property `chargeDuration`', () async {
      // TODO
    });

    // Duration in seconds the pulse is actively released after charging completes. Values are either 0.75s (small) or 1.5s (large).
    // double unleashDuration
    test('to test the property `unleashDuration`', () async {
      // TODO
    });

    // Cooldown in seconds before charging can restart. Current data spans 6-40 seconds depending on size and variant.
    // double cooldownDuration
    test('to test the property `cooldownDuration`', () async {
      // TODO
    });

  });
}
