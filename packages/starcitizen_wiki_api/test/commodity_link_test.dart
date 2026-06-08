import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for CommodityLink
void main() {
  final CommodityLink? instance = /* CommodityLink(...) */ null;
  // TODO add properties to the entity

  group(CommodityLink, () {
    // Unique commodity identifier.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // Internal commodity key (e.g. \"Quartz\").
    // String key
    test('to test the property `key`', () async {
      // TODO
    });

    // Display name of the commodity.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Name with leaf commodity group in parentheses, e.g. \"WiDoW (Vice)\".
    // String displayName
    test('to test the property `displayName`', () async {
      // TODO
    });

    // URL-friendly slug for the commodity.
    // String slug
    test('to test the property `slug`', () async {
      // TODO
    });

    // In-game lore description.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Refinement tier (e.g. \"Raw\", \"Refined\").
    // String tier
    test('to test the property `tier`', () async {
      // TODO
    });

    // CommodityLinkRefinedVersion refinedVersion
    test('to test the property `refinedVersion`', () async {
      // TODO
    });

    // Density in grams per cubic centimeter.
    // num densityGPerCc
    test('to test the property `densityGPerCc`', () async {
      // TODO
    });

    // Instability rating affecting mining behavior.
    // num instability
    test('to test the property `instability`', () async {
      // TODO
    });

    // Resistance rating affecting mining difficulty.
    // num resistance
    test('to test the property `resistance`', () async {
      // TODO
    });

    // Standard cargo box sizes in SCU that this commodity fits into.
    // List<num> boxSizesScu
    test('to test the property `boxSizesScu`', () async {
      // TODO
    });

    // Whether the default cargo box validation applies.
    // bool validateDefaultCargoBox
    test('to test the property `validateDefaultCargoBox`', () async {
      // TODO
    });

    // Whether default cargo containers are available for this commodity.
    // bool hasDefaultCargoContainers
    test('to test the property `hasDefaultCargoContainers`', () async {
      // TODO
    });

    // Whether this commodity can be obtained through mining or harvesting.
    // bool isMineable
    test('to test the property `isMineable`', () async {
      // TODO
    });

    // Whether ship mining deposits exist for this commodity.
    // bool hasShipMineables
    test('to test the property `hasShipMineables`', () async {
      // TODO
    });

    // Whether ground vehicle mining deposits exist for this commodity.
    // bool hasGroundVehicleMineables
    test('to test the property `hasGroundVehicleMineables`', () async {
      // TODO
    });

    // Whether FPS mining deposits exist for this commodity.
    // bool hasFpsMineables
    test('to test the property `hasFpsMineables`', () async {
      // TODO
    });

    // Whether harvestable deposits exist for this commodity.
    // bool hasHarvestables
    test('to test the property `hasHarvestables`', () async {
      // TODO
    });

    // Whether salvage deposits exist for this commodity.
    // bool hasSalvage
    test('to test the property `hasSalvage`', () async {
      // TODO
    });

    // Electromagnetic signature strength, used for scanner detection.
    // int signature
    test('to test the property `signature`', () async {
      // TODO
    });

    // Resource kind classification (e.g. \"Mineable\", \"Harvestable\").
    // String kind
    test('to test the property `kind`', () async {
      // TODO
    });

    // Ordered commodity groups from root to leaf (e.g. [\"ProcessedGoods\", \"Vice\"]).
    // List<String> commodityGroups
    test('to test the property `commodityGroups`', () async {
      // TODO
    });

    // Available extraction methods (e.g. [\"Ship\", \"Ground Vehicle\", \"FPS\"]).
    // List<String> methods
    test('to test the property `methods`', () async {
      // TODO
    });

    // Star systems where this commodity can be found.
    // List<String> systems
    test('to test the property `systems`', () async {
      // TODO
    });

    // Named locations where this commodity appears.
    // List<CommodityIndexLocation> locations
    test('to test the property `locations`', () async {
      // TODO
    });

    // API link to this commodity's full details.
    // String link
    test('to test the property `link`', () async {
      // TODO
    });

    // Frontend URL for this commodity's page.
    // String webUrl
    test('to test the property `webUrl`', () async {
      // TODO
    });

    // Images from external sources for this commodity.
    // List<CommodityLinkImagesInner> images
    test('to test the property `images`', () async {
      // TODO
    });

  });
}
