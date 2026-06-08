import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for GameVehiclePort
void main() {
  final GameVehiclePort? instance = /* GameVehiclePort(...) */ null;
  // TODO add properties to the entity

  group(GameVehiclePort, () {
    // Hardpoint name from scunpacked ship data.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Positional label (e.g. left, right, nose).
    // String position
    test('to test the property `position`', () async {
      // TODO
    });

    // GameVehiclePortSizes sizes
    test('to test the property `sizes`', () async {
      // TODO
    });

    // SC class name of the port component.
    // String className
    test('to test the property `className`', () async {
      // TODO
    });

    // Port health points.
    // num health
    test('to test the property `health`', () async {
      // TODO
    });

    // Whether the port can be modified in-game.
    // bool editable
    test('to test the property `editable`', () async {
      // TODO
    });

    // Whether child ports can be modified in-game.
    // bool editableChildren
    test('to test the property `editableChildren`', () async {
      // TODO
    });

    // UUID of the item currently equipped in this port.
    // String equippedItemUuid
    test('to test the property `equippedItemUuid`', () async {
      // TODO
    });

    // Port type (e.g. WeaponGun, Shield, PowerPlant).
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Port sub-type identifier.
    // String subType
    test('to test the property `subType`', () async {
      // TODO
    });

    // Deprecated: Use sub_type.
    // String subtype
    test('to test the property `subtype`', () async {
      // TODO
    });

    // Human-readable category label. Only present on parent ports (e.g. Weapons, Shields, Thrusters).
    // String categoryLabel
    test('to test the property `categoryLabel`', () async {
      // TODO
    });

    // Port compatibility list from ship data.
    // List<GameVehiclePortCompatibleTypesInner> compatibleTypes
    test('to test the property `compatibleTypes`', () async {
      // TODO
    });

    // GameVehiclePortEquippedItem equippedItem
    test('to test the property `equippedItem`', () async {
      // TODO
    });

    // Nested child ports (hardpoints).
    // List<GameVehiclePort> ports
    test('to test the property `ports`', () async {
      // TODO
    });

    // Tags that items must have to be equipped in this port. Pass individual values as filter[tags] to the items API.
    // List<String> requiredTags
    test('to test the property `requiredTags`', () async {
      // TODO
    });

    // Identity tags this port provides. Used to filter items by RequiredTags compatibility - an item can attach if its RequiredTags is empty or fully contained in these tags. Pass as filter[port_tags] to the items API.
    // List<String> portTags
    test('to test the property `portTags`', () async {
      // TODO
    });

    // Game version code for this data.
    // String version
    test('to test the property `version`', () async {
      // TODO
    });

    // GameVehiclePortAttachedVehicle attachedVehicle
    test('to test the property `attachedVehicle`', () async {
      // TODO
    });

  });
}
