import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Medicine
void main() {
  final Medicine? instance = /* Medicine(...) */ null;
  // TODO add properties to the entity

  group(Medicine, () {
    // Dynamic map of nutrient name (snake_case) to total amount.
    // Map<String, num> nutrition
    test('to test the property `nutrition`', () async {
      // TODO
    });

    // Dynamic map of effect/buff type (snake_case) to duration in seconds.
    // Map<String, num> buffs
    test('to test the property `buffs`', () async {
      // TODO
    });

    // Dynamic map of debuff type (snake_case) to duration in seconds.
    // Map<String, num> debuffs
    test('to test the property `debuffs`', () async {
      // TODO
    });

    // MedicineAllOfContainer container
    test('to test the property `container`', () async {
      // TODO
    });

    // MedicineAllOfConsumption consumption
    test('to test the property `consumption`', () async {
      // TODO
    });

    // Nutritional density rating (NDR) from food data or description.
    // String nutritionalDensityRating
    test('to test the property `nutritionalDensityRating`', () async {
      // TODO
    });

    // Hydration efficacy index (HEI) from food data or description.
    // String hydrationEfficacyIndex
    test('to test the property `hydrationEfficacyIndex`', () async {
      // TODO
    });

    // Deprecated. Use `container.type`.
    // String containerType
    test('to test the property `containerType`', () async {
      // TODO
    });

    // Deprecated. Use `consumption.one_shot_consume`.
    // bool oneShotConsume
    test('to test the property `oneShotConsume`', () async {
      // TODO
    });

    // Deprecated. Use `container.can_be_reclosed`.
    // bool canBeReclosed
    test('to test the property `canBeReclosed`', () async {
      // TODO
    });

    // Deprecated. Use `container.discard_when_consumed`.
    // bool discardWhenConsumed
    test('to test the property `discardWhenConsumed`', () async {
      // TODO
    });

    // List of effect strings (parsed from food data or description). Null when no effects are present.
    // List<String> effects
    test('to test the property `effects`', () async {
      // TODO
    });

    // Dynamic map of combat buff flags (derived from MedicalEffects.CombatBuffs). Keys are normalized (snake_case, without `_mask`). Values are boolean flags.
    // Map<String, bool> combatBuffs
    test('to test the property `combatBuffs`', () async {
      // TODO
    });

    // Dynamic map of impact resistance flags (derived from MedicalEffects.ImpactResistance). Keys are normalized (snake_case, without `impact_resistance_` or `_mask`). Values are boolean flags.
    // Map<String, bool> impactResistances
    test('to test the property `impactResistances`', () async {
      // TODO
    });

  });
}
