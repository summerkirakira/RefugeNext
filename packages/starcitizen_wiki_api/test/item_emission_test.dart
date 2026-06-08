import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for ItemEmission
void main() {
  final ItemEmission? instance = /* ItemEmission(...) */ null;
  // TODO add properties to the entity

  group(ItemEmission, () {
    // Infrared (thermal) emission signature. Higher values make the item easier to detect.
    // double ir
    test('to test the property `ir`', () async {
      // TODO
    });

    // Electromagnetic emission at idle/low power (Maximum * minConsumptionFraction * lowPowerRangeModifier).
    // double emMin
    test('to test the property `emMin`', () async {
      // TODO
    });

    // Electromagnetic emission at full power from EMSignature.nominalSignature.
    // double emMax
    test('to test the property `emMax`', () async {
      // TODO
    });

    // Rate at which EM drops when the item powers down (typically 0.15).
    // double emDecay
    test('to test the property `emDecay`', () async {
      // TODO
    });

    // EM per power segment unit (PowerPlant only: Maximum / Generation.Power).
    // double emPerSegment
    test('to test the property `emPerSegment`', () async {
      // TODO
    });

  });
}
