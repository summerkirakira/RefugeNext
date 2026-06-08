import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for FlightControllerBoostCapacitor
void main() {
  final FlightControllerBoostCapacitor? instance = /* FlightControllerBoostCapacitor(...) */ null;
  // TODO add properties to the entity

  group(FlightControllerBoostCapacitor, () {
    // Total afterburner fuel pool. Combined with cost rates, determines total boost time available before depletion.
    // double capacity
    test('to test the property `capacity`', () async {
      // TODO
    });

    // Minimum capacitor fraction required to engage afterburner (0-1).
    // double thresholdRatio
    test('to test the property `thresholdRatio`', () async {
      // TODO
    });

    // Capacitor drain per second while afterburner is armed but not thrusting.
    // double idleCost
    test('to test the property `idleCost`', () async {
      // TODO
    });

    // Capacitor drain per second for linear afterburner thrust.
    // double linearCost
    test('to test the property `linearCost`', () async {
      // TODO
    });

    // Capacitor drain per second for angular afterburner thrust.
    // double angularCost
    test('to test the property `angularCost`', () async {
      // TODO
    });

    // Capacitor regeneration rate per second.
    // double regenPerSec
    test('to test the property `regenPerSec`', () async {
      // TODO
    });

    // Seconds of delay after disengaging before capacitor regen resumes.
    // double regenDelay
    test('to test the property `regenDelay`', () async {
      // TODO
    });

    // Seconds required to fully regenerate the capacitor from empty (if provided by data).
    // double regenTime
    test('to test the property `regenTime`', () async {
      // TODO
    });

  });
}
