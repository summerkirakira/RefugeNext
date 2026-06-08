import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for ItemPort
void main() {
  final ItemPort? instance = /* ItemPort(...) */ null;
  // TODO add properties to the entity

  group(ItemPort, () {
    // Internal port identifier (e.g. hardpoint_weapon_wing_right).
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Human-readable port name, resolved from localization key.
    // String displayName
    test('to test the property `displayName`', () async {
      // TODO
    });

    // Derived position label (e.g. magazine_well, optics, underbarrel, barrel).
    // String position
    test('to test the property `position`', () async {
      // TODO
    });

    // Maximum item size this port accepts (same as sizes.max).
    // int size
    test('to test the property `size`', () async {
      // TODO
    });

    // ItemPortSizes sizes
    test('to test the property `sizes`', () async {
      // TODO
    });

    // List<ItemPortType> compatibleTypes
    test('to test the property `compatibleTypes`', () async {
      // TODO
    });

    // Structured compatible type entries with type and sub-types.
    // List<String> types
    test('to test the property `types`', () async {
      // TODO
    });

    // Tags provided by this port to attached items (from PortTags attribute).
    // List<String> tags
    test('to test the property `tags`', () async {
      // TODO
    });

    // Tags an item must have to attach to this port (from RequiredPortTags, $ prefix stripped).
    // List<String> requiredTags
    test('to test the property `requiredTags`', () async {
      // TODO
    });

    // Port flags controlling behavior (e.g. editable, uneditable, invisible, select).
    // List<String> flags
    test('to test the property `flags`', () async {
      // TODO
    });

    // Whether the port can be modified in-game.
    // bool editable
    test('to test the property `editable`', () async {
      // TODO
    });

    // Deprecated: Use editable (inverted value).
    // bool uneditable
    test('to test the property `uneditable`', () async {
      // TODO
    });

    // UUID of the equipped item
    // String equippedItemUuid
    test('to test the property `equippedItemUuid`', () async {
      // TODO
    });

    // Port type derived from CompatibleTypes (e.g. WeaponGun, MissileLauncher).
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Port sub-type derived from CompatibleTypes.
    // String subType
    test('to test the property `subType`', () async {
      // TODO
    });

    // Tags provided by this port. Same as tags field, for vehicle port_tags compat.
    // List<String> portTags
    test('to test the property `portTags`', () async {
      // TODO
    });

    // Sub-ports from the equipped item.
    // List<ItemPort> ports
    test('to test the property `ports`', () async {
      // TODO
    });

    // GamePortItem equippedItem
    test('to test the property `equippedItem`', () async {
      // TODO
    });

  });
}
