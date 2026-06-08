import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for PowerPlant
void main() {
  final PowerPlant? instance = /* PowerPlant(...) */ null;
  // TODO add properties to the entity

  group(PowerPlant, () {
    // Power draw value. Deprecated in favor of power_segment_generation for actual output measurement.
    // double powerOutput
    test('to test the property `powerOutput`', () async {
      // TODO
    });

    // Power segment generation rate from the resource network. This is the primary power output metric.
    // double powerSegmentGeneration
    test('to test the property `powerSegmentGeneration`', () async {
      // TODO
    });

  });
}
