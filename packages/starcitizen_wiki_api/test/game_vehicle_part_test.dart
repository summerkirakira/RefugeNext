import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for GameVehiclePart
void main() {
  final GameVehiclePart? instance = /* GameVehiclePart(...) */ null;
  // TODO add properties to the entity

  group(GameVehiclePart, () {
    // Raw part name from scunpacked data (e.g. LEFT_WING).
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Human-readable name with positional suffix (e.g. \"Wing (left)\").
    // String displayName
    test('to test the property `displayName`', () async {
      // TODO
    });

    // Maximum damage this structural part can absorb.
    // num damageMax
    test('to test the property `damageMax`', () async {
      // TODO
    });

    // Total damage needed to destroy this part (only set when part appears in DamageBeforeDestruction).
    // num destructionDamage
    test('to test the property `destructionDamage`', () async {
      // TODO
    });

    // Total damage needed to detach this part (only set when part appears in DamageBeforeDetach).
    // num detachDamage
    test('to test the property `detachDamage`', () async {
      // TODO
    });

    // Nested child structural parts.
    // List<GameVehiclePart> children
    test('to test the property `children`', () async {
      // TODO
    });

    // Game version code for this data.
    // String version
    test('to test the property `version`', () async {
      // TODO
    });

  });
}
