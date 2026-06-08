import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Cooler
void main() {
  final Cooler? instance = /* Cooler(...) */ null;
  // TODO add properties to the entity

  group(Cooler, () {
    // Maximum heat removal capacity (heat units per second). Higher numbers indicate stronger cooling performance. Size 1 military coolers like the Aegis Glacier are around 290,000 while heavy industrial units reach into the tens of millions.
    // double coolingRate
    test('to test the property `coolingRate`', () async {
      // TODO
    });

    // Infrared signature multiplier applied while the cooler is operating. Values below 1.0 lower IR output; most production coolers use 0.1 (90% reduction).
    // double suppressionIrFactor
    test('to test the property `suppressionIrFactor`', () async {
      // TODO
    });

    // Overall heat signature multiplier contributed by the cooler. Commonly 0.1, indicating a significant reduction in emitted heat.
    // double suppressionHeatFactor
    test('to test the property `suppressionHeatFactor`', () async {
      // TODO
    });

    // Coolant segment generation rate from resource network. Use this for actual cooling segment generation.
    // double coolantSegmentGeneration
    test('to test the property `coolantSegmentGeneration`', () async {
      // TODO
    });

  });
}
