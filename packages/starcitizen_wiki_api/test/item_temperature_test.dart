import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for ItemTemperature
void main() {
  final ItemTemperature? instance = /* ItemTemperature(...) */ null;
  // TODO add properties to the entity

  group(ItemTemperature, () {
    // Temperature unit (always \"C\" for Celsius).
    // String unit
    test('to test the property `unit`', () async {
      // TODO
    });

    // Temperature in Celsius at which active cooling begins.
    // double coolingThreshold
    test('to test the property `coolingThreshold`', () async {
      // TODO
    });

    // Temperature in Celsius above which IR emission becomes detectable.
    // double irThreshold
    test('to test the property `irThreshold`', () async {
      // TODO
    });

    // Temperature in Celsius at which the overheat warning triggers (before full overheat).
    // double overheatThreshold
    test('to test the property `overheatThreshold`', () async {
      // TODO
    });

    // Deprecated: Use overheat_threshold.
    // double overheatTemperature
    test('to test the property `overheatTemperature`', () async {
      // TODO
    });

    // Temperature in Celsius at which the item fully overheats and shuts down.
    // double maxTemperature
    test('to test the property `maxTemperature`', () async {
      // TODO
    });

    // Temperature in Celsius the item must cool to before recovering from overheat.
    // double recoveryTemperature
    test('to test the property `recoveryTemperature`', () async {
      // TODO
    });

  });
}
