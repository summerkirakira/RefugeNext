import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for PersonalWeapon
void main() {
  final PersonalWeapon? instance = /* PersonalWeapon(...) */ null;
  // TODO add properties to the entity

  group(PersonalWeapon, () {
    // Class as provided by DescriptionData.Class.
    // String class_
    test('to test the property `class_`', () async {
      // TODO
    });

    // Type as provided by DescriptionData.Item Type.
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Deprecated: legacy field, currently returned as an empty string; do not use.
    // String magazineType
    test('to test the property `magazineType`', () async {
      // TODO
    });

    // Deprecated: use `capacity`.
    // int magazineSize
    test('to test the property `magazineSize`', () async {
      // TODO
    });

    // Deprecated: use `range`.
    // double effectiveRange
    test('to test the property `effectiveRange`', () async {
      // TODO
    });

    // Weapon magazine capacity.
    // int capacity
    test('to test the property `capacity`', () async {
      // TODO
    });

    // Effective range in meters.
    // double range
    test('to test the property `range`', () async {
      // TODO
    });

    // Deprecated: use `damage.alpha_total` (or per-type `damage.alpha.*`) instead.
    // double damagePerShot
    test('to test the property `damagePerShot`', () async {
      // TODO
    });

    // Pellets per shot.
    // int pelletsPerShot
    test('to test the property `pelletsPerShot`', () async {
      // TODO
    });

    // Deprecated: use `rpm`.
    // double rof
    test('to test the property `rof`', () async {
      // TODO
    });

    // Rounds per minute for the first fire mode.
    // double rpm
    test('to test the property `rpm`', () async {
      // TODO
    });

    // Deprecated: legacy ammunition-derived entries. Prefer `damage` for weapon damage totals/breakdowns.
    // List<WeaponDamageEntry> damages
    test('to test the property `damages`', () async {
      // TODO
    });

    // Fire modes returned from Weapon.Modes.
    // List<PersonalWeaponMode> modes
    test('to test the property `modes`', () async {
      // TODO
    });

    // Weapon fire mode.
    // String fireMode
    test('to test the property `fireMode`', () async {
      // TODO
    });

    // PersonalWeaponDamage damage
    test('to test the property `damage`', () async {
      // TODO
    });

    // PersonalWeaponSpread spread
    test('to test the property `spread`', () async {
      // TODO
    });

    // PersonalWeaponSpread adsSpread
    test('to test the property `adsSpread`', () async {
      // TODO
    });

    // PersonalWeaponCharge charge
    test('to test the property `charge`', () async {
      // TODO
    });

    // PersonalWeaponChargeModifier chargeModifier
    test('to test the property `chargeModifier`', () async {
      // TODO
    });

    // Deprecated: use the root-level ammunition resource (outside this specification payload) where available.
    // Object ammunition
    test('to test the property `ammunition`', () async {
      // TODO
    });

  });
}
