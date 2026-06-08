import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for BlueprintModifier
void main() {
  final BlueprintModifier? instance = /* BlueprintModifier(...) */ null;
  // TODO add properties to the entity

  group(BlueprintModifier, () {
    // Internal key identifying the modifier property
    // String propertyKey
    test('to test the property `propertyKey`', () async {
      // TODO
    });

    // UUID of the property definition, if available
    // String propertyUuid
    test('to test the property `propertyUuid`', () async {
      // TODO
    });

    // Human-readable label for the modifier
    // String label
    test('to test the property `label`', () async {
      // TODO
    });

    // Indicates whether a higher or lower value is desirable
    // String betterWhen
    test('to test the property `betterWhen`', () async {
      // TODO
    });

    // BlueprintModifierQualityRange qualityRange
    test('to test the property `qualityRange`', () async {
      // TODO
    });

    // BlueprintModifierRange modifierRange
    test('to test the property `modifierRange`', () async {
      // TODO
    });

    // Interpolation type for the modifier value range. When present, value_segments should be used for interpolation instead of the simple quality_range/modifier_range pair.
    // String valueRangeType
    test('to test the property `valueRangeType`', () async {
      // TODO
    });

    // Multi-step interpolation segments. Each segment defines its own quality range and modifier start/end values. When present, use these for interpolation instead of quality_range/modifier_range.
    // List<BlueprintModifierValueSegmentsInner> valueSegments
    test('to test the property `valueSegments`', () async {
      // TODO
    });

  });
}
