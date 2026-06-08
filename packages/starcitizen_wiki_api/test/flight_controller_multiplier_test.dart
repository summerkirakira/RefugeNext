import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for FlightControllerMultiplier
void main() {
  final FlightControllerMultiplier? instance = /* FlightControllerMultiplier(...) */ null;
  // TODO add properties to the entity

  group(FlightControllerMultiplier, () {
    // Multiplier applied when torque imbalance is detected to stabilize rotation.
    // double torqueImbalance
    test('to test the property `torqueImbalance`', () async {
      // TODO
    });

    // Vertical thrust multiplier affecting VTOL and hover authority. Higher values increase upward thrust strength.
    // double lift
    test('to test the property `lift`', () async {
      // TODO
    });

    // Drag multiplier scaling atmospheric drag calculations.
    // double drag
    test('to test the property `drag`', () async {
      // TODO
    });

    // Drag multiplier applied specifically while in SCM flight.
    // double scmMaxDrag
    test('to test the property `scmMaxDrag`', () async {
      // TODO
    });

    // Multiplier applied to maneuvering inputs during precision landing to soften responses.
    // double precisionLanding
    test('to test the property `precisionLanding`', () async {
      // TODO
    });

  });
}
