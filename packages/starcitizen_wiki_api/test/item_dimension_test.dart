import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for ItemDimension
void main() {
  final ItemDimension? instance = /* ItemDimension(...) */ null;
  // TODO add properties to the entity

  group(ItemDimension, () {
    // Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Width in meters, either from UIDimensions or Dimensions.
    // double width
    test('to test the property `width`', () async {
      // TODO
    });

    // Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Height in meters, either from UIDimensions or Dimensions.
    // double height
    test('to test the property `height`', () async {
      // TODO
    });

    // Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Length in meters, either from UIDimensions or Dimensions.
    // double length
    test('to test the property `length`', () async {
      // TODO
    });

    // Cubic volume derived from the dimensions (SCU).
    // double volume
    test('to test the property `volume`', () async {
      // TODO
    });

    // Converted volume value from game data (e.g. in µSCU).
    // num volumeConverted
    test('to test the property `volumeConverted`', () async {
      // TODO
    });

    // Unit of the converted volume (e.g. \"µSCU\", \"SCU\").
    // String volumeConvertedUnit
    test('to test the property `volumeConvertedUnit`', () async {
      // TODO
    });

    // ItemDimensionTrueDimension trueDimension
    test('to test the property `trueDimension`', () async {
      // TODO
    });

    // True 3D model bounding box dimensions in meters (from InventoryOccupancy.Dimensions).
    // ItemDimensionBlock dimensions
    test('to test the property `dimensions`', () async {
      // TODO
    });

    // Cargo grid occupancy dimensions in meters (from InventoryOccupancy.CargoGrid).
    // ItemDimensionBlock cargoDimension
    test('to test the property `cargoDimension`', () async {
      // TODO
    });

    // UI display dimensions shown in the in-game inventory in meters (from InventoryOccupancy.UIDimensions).
    // ItemDimensionBlock uiDimension
    test('to test the property `uiDimension`', () async {
      // TODO
    });

  });
}
