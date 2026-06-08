import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for FlightControllerRecallParams
void main() {
  final FlightControllerRecallParams? instance = /* FlightControllerRecallParams(...) */ null;
  // TODO add properties to the entity

  group(FlightControllerRecallParams, () {
    // Target hover height in meters when arriving at the recall destination.
    // double hoverHeightAtDestination
    test('to test the property `hoverHeightAtDestination`', () async {
      // TODO
    });

    // Forward offset in meters from the destination point where the ship stages before final landing.
    // double forwardOffset
    test('to test the property `forwardOffset`', () async {
      // TODO
    });

    // Range in meters to scan for obstacles while recalling.
    // double obstructionDetectionRange
    test('to test the property `obstructionDetectionRange`', () async {
      // TODO
    });

    // Detection radius in meters to locate a viable landing platform.
    // double defaultPlatformDetectionRange
    test('to test the property `defaultPlatformDetectionRange`', () async {
      // TODO
    });

    // Minimum distance in meters from the player before recall engages.
    // double minimumRecallDistance
    test('to test the property `minimumRecallDistance`', () async {
      // TODO
    });

    // Extra buffer distance in meters used to start braking during recall approach.
    // double brakingDistanceOffset
    test('to test the property `brakingDistanceOffset`', () async {
      // TODO
    });

  });
}
