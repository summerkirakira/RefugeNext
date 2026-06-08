import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Food
void main() {
  final Food? instance = /* Food(...) */ null;
  // TODO add properties to the entity

  group(Food, () {
    // Dynamic map of nutrient name (snake_case) to total amount for the item.
    // Map<String, num> nutrition
    test('to test the property `nutrition`', () async {
      // TODO
    });

    // Dynamic map of effect/buff type (snake_case) to duration in seconds.
    // Map<String, num> buffs
    test('to test the property `buffs`', () async {
      // TODO
    });

    // Dynamic map of effect/buff type (snake_case) to duration in seconds.
    // Map<String, num> debuffs
    test('to test the property `debuffs`', () async {
      // TODO
    });

    // FoodContainer container
    test('to test the property `container`', () async {
      // TODO
    });

    // FoodConsumption consumption
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

  });
}
