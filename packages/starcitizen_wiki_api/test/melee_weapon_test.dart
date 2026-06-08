import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for MeleeWeapon
void main() {
  final MeleeWeapon? instance = /* MeleeWeapon(...) */ null;
  // TODO add properties to the entity

  group(MeleeWeapon, () {
    // Whether this weapon can be used for takedown attacks.
    // bool canBeUsedForTakeDown
    test('to test the property `canBeUsedForTakeDown`', () async {
      // TODO
    });

    // Whether the wielder can block incoming attacks.
    // bool canBlock
    test('to test the property `canBlock`', () async {
      // TODO
    });

    // Whether the weapon can be used while prone.
    // bool canBeUsedInProne
    test('to test the property `canBeUsedInProne`', () async {
      // TODO
    });

    // Whether the wielder can dodge while equipped.
    // bool canDodge
    test('to test the property `canDodge`', () async {
      // TODO
    });

    // Delay in seconds when transitioning to a melee stance.
    // double stanceTransitionMeleeDelay
    test('to test the property `stanceTransitionMeleeDelay`', () async {
      // TODO
    });

    // UUID reference to the melee combat config record.
    // String meleeCombatConfig
    test('to test the property `meleeCombatConfig`', () async {
      // TODO
    });

    // Attack configurations as returned by the resource.
    // List<MeleeWeaponAttackMode> attackModes
    test('to test the property `attackModes`', () async {
      // TODO
    });

  });
}
