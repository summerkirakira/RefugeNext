import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for MiningModifier
void main() {
  final MiningModifier? instance = /* MiningModifier(...) */ null;
  // TODO add properties to the entity

  group(MiningModifier, () {
    // Modifier type (from MiningModule.Type).
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Derived from classification: `Gadget` when classification is `Mining.Gadget`, otherwise `Module`.
    // String itemType
    test('to test the property `itemType`', () async {
      // TODO
    });

    // Remaining charges (MiningModule.Charges). `null` when the source value is -1 (unlimited).
    // int charges
    test('to test the property `charges`', () async {
      // TODO
    });

    // Lifetime/duration in seconds (MiningModule.Lifetime).
    // double duration
    test('to test the property `duration`', () async {
      // TODO
    });

    // MiningModifierPowerModifier powerModifier
    test('to test the property `powerModifier`', () async {
      // TODO
    });

    // Map of modifier keys to values.
    // Map<String, MiningModifierValue> modifierMap
    test('to test the property `modifierMap`', () async {
      // TODO
    });

  });
}
