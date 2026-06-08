import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Radar
void main() {
  final Radar? instance = /* Radar(...) */ null;
  // TODO add properties to the entity

  group(Radar, () {
    // Deprecated legacy field. Always null in this resource output.
    // double detectionLifetime
    test('to test the property `detectionLifetime`', () async {
      // TODO
    });

    // Deprecated legacy field. Always null in this resource output.
    // double altitudeCeiling
    test('to test the property `altitudeCeiling`', () async {
      // TODO
    });

    // Deprecated legacy field. Always null in this resource output.
    // bool enableCrossSectionOcclusion
    test('to test the property `enableCrossSectionOcclusion`', () async {
      // TODO
    });

    // Radar ping cooldown in seconds.
    // double cooldown
    test('to test the property `cooldown`', () async {
      // TODO
    });

    // Detection sensitivity per signature type.
    // RadarSensitivityBlock sensitivity
    test('to test the property `sensitivity`', () async {
      // TODO
    });

    // Detection sensitivity for ground vehicles, derived from sensitivity modifiers.
    // RadarSensitivityBlock groundVehicleSensitivity
    test('to test the property `groundVehicleSensitivity`', () async {
      // TODO
    });

    // Signal piercing strength per signature type, controlling detection through occlusion.
    // RadarSensitivityBlock piercing
    test('to test the property `piercing`', () async {
      // TODO
    });

    // Aim assist range parameters.
    // RadarAimAssistBlock aimAssist
    test('to test the property `aimAssist`', () async {
      // TODO
    });

  });
}
