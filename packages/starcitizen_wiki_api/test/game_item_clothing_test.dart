import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for GameItemClothing
void main() {
  final GameItemClothing? instance = /* GameItemClothing(...) */ null;
  // TODO add properties to the entity

  group(GameItemClothing, () {
    // Property is set if resource is of type \"clothing\". Superseded by type.
    // String clothingType
    test('to test the property `clothingType`', () async {
      // TODO
    });

    // Armor slot derived from the item classification (e.g. Arms, Core, Legs, Helmet).
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

  });
}
