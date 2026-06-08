import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for ItemInventory
void main() {
  final ItemInventory? instance = /* ItemInventory(...) */ null;
  // TODO add properties to the entity

  group(ItemInventory, () {
    // Unique identifier of the referenced InventoryContainer.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // Interior width in meters (interiorDimensions.x).
    // double width
    test('to test the property `width`', () async {
      // TODO
    });

    // Interior height in meters (interiorDimensions.z).
    // double height
    test('to test the property `height`', () async {
      // TODO
    });

    // Interior depth in meters (interiorDimensions.y).
    // double length
    test('to test the property `length`', () async {
      // TODO
    });

    // Interior volume in cubic meters (width * height * length).
    // double volume
    test('to test the property `volume`', () async {
      // TODO
    });

    // Raw SCU capacity as set in game data.
    // double scu
    test('to test the property `scu`', () async {
      // TODO
    });

    // SCU capacity converted to the unit specified in the unit field (e.g. µSCU, cSCU, or SCU).
    // double scuConverted
    test('to test the property `scuConverted`', () async {
      // TODO
    });

    // Unit label displayed in the UI, e.g. \"µSCU\" or \"SCU\".
    // String unit
    test('to test the property `unit`', () async {
      // TODO
    });

    // Capacity in µSCU. Only present when unit exponent is 0 (standard SCU).
    // double microScu
    test('to test the property `microScu`', () async {
      // TODO
    });

    // Whether this is an open container (e.g. a cargo grid).
    // bool open
    test('to test the property `open`', () async {
      // TODO
    });

    // Whether this container is externally accessible (e.g. a cargo pod).
    // bool external_
    test('to test the property `external_`', () async {
      // TODO
    });

    // Whether this is a closed container (e.g. a locker or personal storage).
    // bool closed
    test('to test the property `closed`', () async {
      // TODO
    });

    // ItemInventoryMinSize minSize
    test('to test the property `minSize`', () async {
      // TODO
    });

    // ItemInventoryMaxSize maxSize
    test('to test the property `maxSize`', () async {
      // TODO
    });

    // Smallest standard SCU box whose dimensions satisfy the min item size. Powers of two: 0.125, 1, 2, 4, 8, 16, 32.
    // num minScuBox
    test('to test the property `minScuBox`', () async {
      // TODO
    });

    // Largest standard SCU box that fits within the max item size and interior dimensions. Powers of two: 0.125, 1, 2, 4, 8, 16, 32.
    // num maxScuBox
    test('to test the property `maxScuBox`', () async {
      // TODO
    });

  });
}
