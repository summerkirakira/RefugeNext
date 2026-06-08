import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for GameStarmapLocation
void main() {
  final GameStarmapLocation? instance = /* GameStarmapLocation(...) */ null;
  // TODO add properties to the entity

  group(GameStarmapLocation, () {
    // Unique identifier for this starmap location.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // URL-friendly slug for this location.
    // String slug
    test('to test the property `slug`', () async {
      // TODO
    });

    // Display name of the starmap location.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // In-universe description of the location.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Relative size of the location.
    // num size
    test('to test the property `size`', () async {
      // TODO
    });

    // Type of respawn facility available (e.g. Hospital, MedicalRoom).
    // String respawnLocationType
    test('to test the property `respawnLocationType`', () async {
      // TODO
    });

    // Number of direct child locations.
    // int childCount
    test('to test the property `childCount`', () async {
      // TODO
    });

    // Whether this location has harvestable resource deposits.
    // bool hasResources
    test('to test the property `hasResources`', () async {
      // TODO
    });

    // Number of available missions at this location.
    // int missionCount
    test('to test the property `missionCount`', () async {
      // TODO
    });

    // Whether this location can be detected by ship scanners.
    // bool isScannable
    test('to test the property `isScannable`', () async {
      // TODO
    });

    // Whether this location is hidden from the in-game starmap.
    // bool hideInStarmap
    test('to test the property `hideInStarmap`', () async {
      // TODO
    });

    // Whether this location is hidden in the game world.
    // bool hideInWorld
    test('to test the property `hideInWorld`', () async {
      // TODO
    });

    // Whether quantum travel to this location is blocked.
    // bool blockTravel
    test('to test the property `blockTravel`', () async {
      // TODO
    });

    // Quantum travel parameters for this location.
    // GameStarmapLocationQuantumTravel quantumTravel
    test('to test the property `quantumTravel`', () async {
      // TODO
    });

    // Asteroid ring parameters, only present on locations with asteroid rings.
    // GameStarmapLocationAsteroidRing asteroidRing
    test('to test the property `asteroidRing`', () async {
      // TODO
    });

    // Name of the star system this location belongs to (e.g. Stanton System).
    // String system
    test('to test the property `system`', () async {
      // TODO
    });

    // Parent location in the hierarchy.
    // GameStarmapLocationLinkedSummary parent
    test('to test the property `parent`', () async {
      // TODO
    });

    // Nearest star or celestial body.
    // GameStarmapLocationLinkedSummary star
    test('to test the property `star`', () async {
      // TODO
    });

    // Direct child locations. Only included when requested via `include=children`.
    // List<GameStarmapLocationChildSummary> children
    test('to test the property `children`', () async {
      // TODO
    });

    // GameStarmapLocationType type
    test('to test the property `type`', () async {
      // TODO
    });

    // Legal jurisdiction governing this location.
    // GameStarmapLocationJurisdiction jurisdiction
    test('to test the property `jurisdiction`', () async {
      // TODO
    });

    // Faction or organization controlling this location.
    // GameStarmapLocationAffiliation affiliation
    test('to test the property `affiliation`', () async {
      // TODO
    });

    // Available amenities at this location.
    // List<GameStarmapLocationAmenity> amenities
    test('to test the property `amenities`', () async {
      // TODO
    });

    // Hierarchy entity tag for grouping and filtering.
    // GameStarmapLocationTag tag
    test('to test the property `tag`', () async {
      // TODO
    });

    // Official designation code for this location.
    // String designation
    test('to test the property `designation`', () async {
      // TODO
    });

    // Radar contact classification for navigation.
    // GameStarmapLocationRadarContactType radarContactType
    test('to test the property `radarContactType`', () async {
      // TODO
    });

    // API URL for this location's detail endpoint.
    // String link
    test('to test the property `link`', () async {
      // TODO
    });

    // Web frontend URL for this location.
    // String webUrl
    test('to test the property `webUrl`', () async {
      // TODO
    });

    // Timestamp of the last data update.
    // DateTime updatedAt
    test('to test the property `updatedAt`', () async {
      // TODO
    });

    // Game data version code.
    // String version
    test('to test the property `version`', () async {
      // TODO
    });

    // Images from external sources for this location.
    // List<GameStarmapLocationImagesInner> images
    test('to test the property `images`', () async {
      // TODO
    });

    // Areas with boosted deposit spawn rates. Only included when requested via `include=resources`.
    // List<AreaBoost> areaBoosts
    test('to test the property `areaBoosts`', () async {
      // TODO
    });

    // Harvestable resource deposits grouped by extraction method. Only included when requested via `include=resources`.
    // List<StarmapLocationMiningTypeGroup> resources
    test('to test the property `resources`', () async {
      // TODO
    });

    // Available missions grouped by purpose. Only included when requested via `include=missions`.
    // List<GameStarmapLocationMissionGroup> missions
    test('to test the property `missions`', () async {
      // TODO
    });

  });
}
