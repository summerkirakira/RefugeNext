import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for CommodityDepositGroup
void main() {
  final CommodityDepositGroup? instance = /* CommodityDepositGroup(...) */ null;
  // TODO add properties to the entity

  group(CommodityDepositGroup, () {
    // Internal commodity key (e.g. \"Quartz\").
    // String key
    test('to test the property `key`', () async {
      // TODO
    });

    // Human-readable deposit name derived from the key.
    // String label
    test('to test the property `label`', () async {
      // TODO
    });

    // Electromagnetic signature strength, used for scanner detection.
    // int signature
    test('to test the property `signature`', () async {
      // TODO
    });

    // Area-specific probability modifiers that override the default for this deposit.
    // List<AreaException> areaExceptions
    test('to test the property `areaExceptions`', () async {
      // TODO
    });

    // Clustering configuration for deposit groupings, if applicable.
    // Clustering clustering
    test('to test the property `clustering`', () async {
      // TODO
    });

    // Respawn and despawn timing data for harvestable deposits.
    // HarvestableSetup harvestableSetup
    test('to test the property `harvestableSetup`', () async {
      // TODO
    });

    // List of unique provider names that generate this deposit.
    // List<String> providerNames
    test('to test the property `providerNames`', () async {
      // TODO
    });

    // List of materials (commodities) found in this deposit with their quality and probability data.
    // List<MaterialEntry> materials
    test('to test the property `materials`', () async {
      // TODO
    });

    // Minimum quality across all instances of this deposit.
    // int qualityMin
    test('to test the property `qualityMin`', () async {
      // TODO
    });

    // Maximum quality across all instances of this deposit.
    // int qualityMax
    test('to test the property `qualityMax`', () async {
      // TODO
    });

    // Lowest relative probability among deposit instances (0-1).
    // num relativeProbabilityMin
    test('to test the property `relativeProbabilityMin`', () async {
      // TODO
    });

    // Highest relative probability among deposit instances (0-1).
    // num relativeProbabilityMax
    test('to test the property `relativeProbabilityMax`', () async {
      // TODO
    });

    // Lowest relative probability as a percentage (0-100).
    // num relativeProbabilityMinPercent
    test('to test the property `relativeProbabilityMinPercent`', () async {
      // TODO
    });

    // Highest relative probability as a percentage (0-100).
    // num relativeProbabilityMaxPercent
    test('to test the property `relativeProbabilityMaxPercent`', () async {
      // TODO
    });

    // Unique commodity identifier.
    // String uuid
    test('to test the property `uuid`', () async {
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

    // UUID of the resource (commodity) this deposit yields.
    // String resourceUuid
    test('to test the property `resourceUuid`', () async {
      // TODO
    });

    // Internal group name for the mining category (e.g. \"SpaceShip_Mineables\").
    // String groupName
    test('to test the property `groupName`', () async {
      // TODO
    });

    // Resource extraction kind (e.g. \"Mineable\", \"Harvestable\").
    // String resourceKind
    test('to test the property `resourceKind`', () async {
      // TODO
    });

  });
}
