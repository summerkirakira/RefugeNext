import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for GetGroundVehicle200ResponseData
void main() {
  final GetGroundVehicle200ResponseData? instance = /* GetGroundVehicle200ResponseData(...) */ null;
  // TODO add properties to the entity

  group(GetGroundVehicle200ResponseData, () {
    // Unique vehicle identifier.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Internal game class name.
    // String gameName
    test('to test the property `gameName`', () async {
      // TODO
    });

    // String slug
    test('to test the property `slug`', () async {
      // TODO
    });

    // class name.
    // String className
    test('to test the property `className`', () async {
      // TODO
    });

    // Vehicle-level identity tags. Used by the items API filter[vehicle] to scope equippable items to this vehicle.
    // List<String> portTags
    test('to test the property `portTags`', () async {
      // TODO
    });

    // ShipMatrixVehicleManufacturer manufacturer
    test('to test the property `manufacturer`', () async {
      // TODO
    });

    // Vehicle size classification (1-6).
    // int sizeClass
    test('to test the property `sizeClass`', () async {
      // TODO
    });

    // ShipMatrixVehicleDimension dimension
    test('to test the property `dimension`', () async {
      // TODO
    });

    // ShipMatrixVehicleSizes sizes
    test('to test the property `sizes`', () async {
      // TODO
    });

    // GameVehicleEmission emission
    test('to test the property `emission`', () async {
      // TODO
    });

    // double mass
    test('to test the property `mass`', () async {
      // TODO
    });

    // Hull mass without loadout in kg.
    // num massHull
    test('to test the property `massHull`', () async {
      // TODO
    });

    // Equipped loadout mass in kg.
    // num massLoadout
    test('to test the property `massLoadout`', () async {
      // TODO
    });

    // Total mass (hull + loadout) in kg.
    // num massTotal
    test('to test the property `massTotal`', () async {
      // TODO
    });

    // Cargo Capacity in SCU
    // double cargoCapacity
    test('to test the property `cargoCapacity`', () async {
      // TODO
    });

    // Ore storage capacity in SCU.
    // num oreCapacity
    test('to test the property `oreCapacity`', () async {
      // TODO
    });

    // Cargo grid containers from ship data.
    // List<ItemInventory> cargoGrids
    test('to test the property `cargoGrids`', () async {
      // TODO
    });

    // GameVehicleCargoLimits cargoLimits
    test('to test the property `cargoLimits`', () async {
      // TODO
    });

    // Largest standard SCU box that fits within the max item size. Powers of two: 1, 2, 4, 8, 16, 32, 64
    // int maxScuBox
    test('to test the property `maxScuBox`', () async {
      // TODO
    });

    // Vehicle stowage in micro SCU
    // num vehicleInventory
    test('to test the property `vehicleInventory`', () async {
      // TODO
    });

    // Personal inventory containers (stowage) from ship data.
    // List<ItemInventory> inventoryContainers
    test('to test the property `inventoryContainers`', () async {
      // TODO
    });

    // Weapon locker / rack storage from ship data. Only present when lockers exist.
    // VehicleWeaponStorage weaponStorage
    test('to test the property `weaponStorage`', () async {
      // TODO
    });

    // Suit locker storage from ship data. Only present when lockers exist.
    // VehicleSuitStorage suitStorage
    test('to test the property `suitStorage`', () async {
      // TODO
    });

    // MissionCombatSummaryTotal crew
    test('to test the property `crew`', () async {
      // TODO
    });

    // Highest medical bed tier available (e.g., \"T2\", \"T3\"). Null if no medical beds.
    // String maxMedicalTier
    test('to test the property `maxMedicalTier`', () async {
      // TODO
    });

    // GameVehicleSeating seating
    test('to test the property `seating`', () async {
      // TODO
    });

    // bool isVehicle
    test('to test the property `isVehicle`', () async {
      // TODO
    });

    // bool isGravlev
    test('to test the property `isGravlev`', () async {
      // TODO
    });

    // bool isSpaceship
    test('to test the property `isSpaceship`', () async {
      // TODO
    });

    // Total vehicle health pool.
    // num health
    test('to test the property `health`', () async {
      // TODO
    });

    // Use shield.hp property instead.
    // num shieldHp
    test('to test the property `shieldHp`', () async {
      // TODO
    });

    // Use shield.face_type property instead.
    // String shieldFaceType
    test('to test the property `shieldFaceType`', () async {
      // TODO
    });

    // GameVehicleShield shield
    test('to test the property `shield`', () async {
      // TODO
    });

    // GameVehicleWeaponSnapshot weaponSnapshot
    test('to test the property `weaponSnapshot`', () async {
      // TODO
    });

    // ShipMatrixVehicleSpeed speed
    test('to test the property `speed`', () async {
      // TODO
    });

    // ShipMatrixVehicleAgility agility
    test('to test the property `agility`', () async {
      // TODO
    });

    // Flight parameters when the ship has no fuel.
    // FlightNoFuelParams noFuelParams
    test('to test the property `noFuelParams`', () async {
      // TODO
    });

    // GameVehicleAfterburner afterburner
    test('to test the property `afterburner`', () async {
      // TODO
    });

    // GameVehicleFuel fuel
    test('to test the property `fuel`', () async {
      // TODO
    });

    // GameVehicleQuantum quantum
    test('to test the property `quantum`', () async {
      // TODO
    });

    // GameVehicleDrive drive
    test('to test the property `drive`', () async {
      // TODO
    });

    // Vehicle armor data from ArmorResource. Deprecated plural key aliases (signal_multipliers, damage_multipliers, resistance_multipliers) are emitted for backward compatibility.
    // VehicleArmor armor
    test('to test the property `armor`', () async {
      // TODO
    });

    // GameVehiclePropulsion propulsion
    test('to test the property `propulsion`', () async {
      // TODO
    });

    // GameVehicleWeaponry weaponry
    test('to test the property `weaponry`', () async {
      // TODO
    });

    // GameVehicleInsurance insurance
    test('to test the property `insurance`', () async {
      // TODO
    });

    // GameVehicleDamageLimits damageLimits
    test('to test the property `damageLimits`', () async {
      // TODO
    });

    // Equipment ports from ship loadout. On show routes: full ports with resolved items and nested children. On index routes: primary hardpoints only, lightweight items from raw JSON.
    // List<GameVehiclePort> ports
    test('to test the property `ports`', () async {
      // TODO
    });

    // Legacy v2 equipment hardpoints from ship loadout. Only included on show route via legacy v2 API, excluded from index route. Use `ports` in current API.
    // List<GameVehicleHardpoint> hardpoints
    test('to test the property `hardpoints`', () async {
      // TODO
    });

    // List<GameVehiclePart> parts
    test('to test the property `parts`', () async {
      // TODO
    });

    // GameVehicleTurrets turrets
    test('to test the property `turrets`', () async {
      // TODO
    });

    // GameVehicleCrossSection crossSection
    test('to test the property `crossSection`', () async {
      // TODO
    });

    // Derived: maximum cross-section dimension (max of x, y, z)
    // num crossSectionMax
    test('to test the property `crossSectionMax`', () async {
      // TODO
    });

    // GameVehicleSignature signature
    test('to test the property `signature`', () async {
      // TODO
    });

    // GameVehicleCooling cooling
    test('to test the property `cooling`', () async {
      // TODO
    });

    // GameVehiclePower power
    test('to test the property `power`', () async {
      // TODO
    });

    // Power pool allocation limits by component type. Size of -1 indicates unlimited pool.
    // Map<String, GameVehiclePowerPoolsValue> powerPools
    test('to test the property `powerPools`', () async {
      // TODO
    });

    // GameVehiclePenetrationMultiplier penetrationMultiplier
    test('to test the property `penetrationMultiplier`', () async {
      // TODO
    });

    // VehicleRelayNetwork relayNetwork
    test('to test the property `relayNetwork`', () async {
      // TODO
    });

    // Primary career classification (see GET /api/vehicles/filters for valid values).
    // String career
    test('to test the property `career`', () async {
      // TODO
    });

    // Specific role within the career (see GET /api/vehicles/filters for valid values).
    // String role
    test('to test the property `role`', () async {
      // TODO
    });

    // GameVehicleGameDescription gameDescription
    test('to test the property `gameDescription`', () async {
      // TODO
    });

    // String webUrl
    test('to test the property `webUrl`', () async {
      // TODO
    });

    // Link to detail endpoint
    // String link
    test('to test the property `link`', () async {
      // TODO
    });

    // Translation description
    test('to test the property `description`', () async {
      // TODO
    });

    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // int chassisId
    test('to test the property `chassisId`', () async {
      // TODO
    });

    // Ship-Matrix vehicle name
    // String shipmatrixName
    test('to test the property `shipmatrixName`', () async {
      // TODO
    });

    // List<Translation> foci
    test('to test the property `foci`', () async {
      // TODO
    });

    // Translation productionStatus
    test('to test the property `productionStatus`', () async {
      // TODO
    });

    // Translation productionNote
    test('to test the property `productionNote`', () async {
      // TODO
    });

    // Translation type
    test('to test the property `type`', () async {
      // TODO
    });

    // MSRP imported from the Ship Upgrade tool.
    // double msrp
    test('to test the property `msrp`', () async {
      // TODO
    });

    // Link to RSI Pledge Store
    // String pledgeUrl
    test('to test the property `pledgeUrl`', () async {
      // TODO
    });

    // List<VehicleLoaner> loaner
    test('to test the property `loaner`', () async {
      // TODO
    });

    // List<VehicleSku> skus
    test('to test the property `skus`', () async {
      // TODO
    });

    // Components imported from the Ship-Matrix
    // List<VehicleComponent> components
    test('to test the property `components`', () async {
      // TODO
    });

    // GameVehicleUexPrices uexPrices
    test('to test the property `uexPrices`', () async {
      // TODO
    });

    // Images from external sources for this vehicle.
    // List<GameVehicleImagesInner> images
    test('to test the property `images`', () async {
      // TODO
    });

    // String updatedAt
    test('to test the property `updatedAt`', () async {
      // TODO
    });

    // Game version code this data applies to.
    // String version
    test('to test the property `version`', () async {
      // TODO
    });

    // Translation size
    test('to test the property `size`', () async {
      // TODO
    });

  });
}
