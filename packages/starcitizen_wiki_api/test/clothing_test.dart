import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Clothing
void main() {
  final Clothing? instance = /* Clothing(...) */ null;
  // TODO add properties to the entity

  group(Clothing, () {
    // Property is set if resource is of type \"clothing\". Superseded by type.
    // String clothingType
    test('to test the property `clothingType`', () async {
      // TODO
    });

    // Clothing slot derived from the item classification (e.g. Torso, Legs, Arms, Head).
    // String slot
    test('to test the property `slot`', () async {
      // TODO
    });

    // Clothing type, not actually set in the game data but derived from the item name.
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Array of damage resistance entries for this clothing. Each entry includes damage type (physical, energy, distortion, thermal, biochemical, stun), damage multiplier (lower = more resistant), and damage threshold. Only damage types with defined multipliers are included.
    // List<ClothingResistancesInner> resistances
    test('to test the property `resistances`', () async {
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
