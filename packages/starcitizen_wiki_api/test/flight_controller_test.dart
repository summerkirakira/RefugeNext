import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for FlightController
void main() {
  final FlightController? instance = /* FlightController(...) */ null;
  // TODO add properties to the entity

  group(FlightController, () {
    // Space Combat Maneuvering (cruise) speed in meters per second.
    // double scmSpeed
    test('to test the property `scmSpeed`', () async {
      // TODO
    });

    // Forward boost speed cap in m/s.
    // double boostSpeedForward
    test('to test the property `boostSpeedForward`', () async {
      // TODO
    });

    // Reverse boost speed cap in m/s.
    // double boostSpeedBackward
    test('to test the property `boostSpeedBackward`', () async {
      // TODO
    });

    // Absolute flight envelope speed cap in m/s.
    // double maxSpeed
    test('to test the property `maxSpeed`', () async {
      // TODO
    });

    // Maximum pitch rate in degrees per second.
    // double pitch
    test('to test the property `pitch`', () async {
      // TODO
    });

    // Maximum yaw rate in degrees per second.
    // double yaw
    test('to test the property `yaw`', () async {
      // TODO
    });

    // Maximum roll rate in degrees per second.
    // double roll
    test('to test the property `roll`', () async {
      // TODO
    });

    // Derived boosted pitch rate (rounded): pitch * boost_multiplier.pitch (defaults to 1 if missing).
    // int pitchBoosted
    test('to test the property `pitchBoosted`', () async {
      // TODO
    });

    // Derived boosted yaw rate (rounded): yaw * boost_multiplier.yaw (defaults to 1 if missing).
    // int yawBoosted
    test('to test the property `yawBoosted`', () async {
      // TODO
    });

    // Derived boosted roll rate (rounded): roll * boost_multiplier.roll (defaults to 1 if missing).
    // int rollBoosted
    test('to test the property `rollBoosted`', () async {
      // TODO
    });

    // FlightControllerBoostCapacitor boostCapacitor
    test('to test the property `boostCapacitor`', () async {
      // TODO
    });

    // FlightControllerBoostActivation boostActivation
    test('to test the property `boostActivation`', () async {
      // TODO
    });

    // FlightControllerThrusterDecay thrusterDecay
    test('to test the property `thrusterDecay`', () async {
      // TODO
    });

    // FlightControllerMultiplier multiplier
    test('to test the property `multiplier`', () async {
      // TODO
    });

    // FlightControllerBoostMultiplier boostMultiplier
    test('to test the property `boostMultiplier`', () async {
      // TODO
    });

    // FlightControllerPrecisionMode precisionMode
    test('to test the property `precisionMode`', () async {
      // TODO
    });

    // Ship recall approach parameters.
    // FlightControllerRecallParams recallParams
    test('to test the property `recallParams`', () async {
      // TODO
    });

    // Collision warning thresholds.
    // FlightControllerCollisionDetection collisionDetection
    test('to test the property `collisionDetection`', () async {
      // TODO
    });

    // FlightControllerGravlev gravlev
    test('to test the property `gravlev`', () async {
      // TODO
    });

    // Flight parameters when the ship has no fuel.
    // FlightNoFuelParams noFuelParams
    test('to test the property `noFuelParams`', () async {
      // TODO
    });

  });
}
