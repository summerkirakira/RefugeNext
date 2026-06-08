import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for SuitArmor
void main() {
  final SuitArmor? instance = /* SuitArmor(...) */ null;
  // TODO add properties to the entity

  group(SuitArmor, () {
    // Armor slot derived from the item classification (e.g. Arms, Core, Legs, Helmet).
    // String slot
    test('to test the property `slot`', () async {
      // TODO
    });

    // Deprecated legacy field. Use `slot`.
    // String armorType
    test('to test the property `armorType`', () async {
      // TODO
    });

    // Structured resistance values.
    // SuitArmorDamageResistance damageResistance
    test('to test the property `damageResistance`', () async {
      // TODO
    });

    // Flattened resistance values and multiplier deltas.
    // SuitArmorDamageResistanceMap damageResistanceMap
    test('to test the property `damageResistanceMap`', () async {
      // TODO
    });

    // UUIDs of body parts covered by this armor.
    // List<String> protectedBodyParts
    test('to test the property `protectedBodyParts`', () async {
      // TODO
    });

    // Signature emissions produced by the armor (map form).
    // Map<String, num> signature
    test('to test the property `signature`', () async {
      // TODO
    });

    // Deprecated: Use temperature_resistance from root.
    // double tempResistanceMin
    test('to test the property `tempResistanceMin`', () async {
      // TODO
    });

    // Deprecated: Use temperature_resistance from root.
    // double tempResistanceMax
    test('to test the property `tempResistanceMax`', () async {
      // TODO
    });

    // Radiation protection values from RadiationResistance.
    // RadiationResistance radiationResistance
    test('to test the property `radiationResistance`', () async {
      // TODO
    });

    // G-force tolerance modifier from root. Positive increases tolerance, negative reduces it.
    // double gforceResistance
    test('to test the property `gforceResistance`', () async {
      // TODO
    });

  });
}
