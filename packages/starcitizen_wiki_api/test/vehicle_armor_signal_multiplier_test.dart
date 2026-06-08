import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for VehicleArmorSignalMultiplier
void main() {
  final VehicleArmorSignalMultiplier? instance = /* VehicleArmorSignalMultiplier(...) */ null;
  // TODO add properties to the entity

  group(VehicleArmorSignalMultiplier, () {
    // Radar cross-section multiplier.
    // double crossSection
    test('to test the property `crossSection`', () async {
      // TODO
    });

    // Cross-section change from baseline (multiplier - 1). Negative values indicate reduction.
    // double crossSectionChange
    test('to test the property `crossSectionChange`', () async {
      // TODO
    });

    // Infrared signature multiplier. Lower values reduce heat detectability.
    // double infrared
    test('to test the property `infrared`', () async {
      // TODO
    });

    // Infrared change from baseline (multiplier - 1).
    // double infraredChange
    test('to test the property `infraredChange`', () async {
      // TODO
    });

    // Electromagnetic signature multiplier. Lower values improve EM stealth.
    // double electromagnetic
    test('to test the property `electromagnetic`', () async {
      // TODO
    });

    // EM change from baseline (multiplier - 1).
    // double electromagneticChange
    test('to test the property `electromagneticChange`', () async {
      // TODO
    });

  });
}
