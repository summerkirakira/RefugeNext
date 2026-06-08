//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_agility.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_speed.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_turrets.dart';
import 'package:starcitizen_wiki_api/src/model/item_inventory.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_manufacturer.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_uex_prices.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_propulsion.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cargo_limits.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cooling.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_drive.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_fuel.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_power.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_game_description.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_hardpoint.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_storage.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_damage_limits.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_suit_storage.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_loaner.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_sizes.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_quantum.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_component.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_emission.dart';
import 'package:starcitizen_wiki_api/src/model/flight_no_fuel_params.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_afterburner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_sku.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_power_pools_value.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_network.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_insurance.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_dimension.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_penetration_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_signature.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weapon_snapshot.dart';
import 'package:starcitizen_wiki_api/src/model/translation.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_summary_total.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_part.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_seating.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cross_section.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_ground_vehicle200_response_data.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetGroundVehicle200ResponseData {
  /// Returns a new [GetGroundVehicle200ResponseData] instance.
  GetGroundVehicle200ResponseData({

     this.uuid,

     this.name,

     this.gameName,

     this.slug,

     this.className,

     this.portTags,

     this.manufacturer,

     this.sizeClass,

     this.dimension,

     this.sizes,

     this.emission,

     this.mass,

     this.massHull,

     this.massLoadout,

     this.massTotal,

     this.cargoCapacity,

     this.oreCapacity,

     this.cargoGrids,

     this.cargoLimits,

     this.maxScuBox,

     this.vehicleInventory,

     this.inventoryContainers,

     this.weaponStorage,

     this.suitStorage,

     this.crew,

     this.maxMedicalTier,

     this.seating,

     this.isVehicle,

     this.isGravlev,

     this.isSpaceship,

     this.health,

     this.shieldHp,

     this.shieldFaceType,

     this.shield,

     this.weaponSnapshot,

     this.speed,

     this.agility,

     this.noFuelParams,

     this.afterburner,

     this.fuel,

     this.quantum,

     this.drive,

     this.armor,

     this.propulsion,

     this.weaponry,

     this.insurance,

     this.damageLimits,

     this.ports,

     this.hardpoints,

     this.parts,

     this.turrets,

     this.crossSection,

     this.crossSectionMax,

     this.signature,

     this.cooling,

     this.power,

     this.powerPools,

     this.penetrationMultiplier,

     this.relayNetwork,

     this.career,

     this.role,

     this.gameDescription,

     this.webUrl,

     this.link,

     this.description,

     this.id,

     this.chassisId,

     this.shipmatrixName,

     this.foci,

     this.productionStatus,

     this.productionNote,

     this.type,

     this.msrp,

     this.pledgeUrl,

     this.loaner,

     this.skus,

     this.components,

     this.uexPrices,

     this.images,

     this.updatedAt,

     this.version,

     this.size,
  });

      /// Unique vehicle identifier.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Internal game class name.
  @JsonKey(
    
    name: r'game_name',
    required: false,
    includeIfNull: false,
  )


  final String? gameName;



  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



      /// class name.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Vehicle-level identity tags. Used by the items API filter[vehicle] to scope equippable items to this vehicle.
  @JsonKey(
    
    name: r'port_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? portTags;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleManufacturer? manufacturer;



      /// Vehicle size classification (1-6).
  @JsonKey(
    
    name: r'size_class',
    required: false,
    includeIfNull: false,
  )


  final int? sizeClass;



  @JsonKey(
    
    name: r'dimension',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleDimension? dimension;



  @Deprecated('sizes has been deprecated')
  @JsonKey(
    
    name: r'sizes',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleSizes? sizes;



  @Deprecated('emission has been deprecated')
  @JsonKey(
    
    name: r'emission',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleEmission? emission;



  @JsonKey(
    
    name: r'mass',
    required: false,
    includeIfNull: false,
  )


  final double? mass;



      /// Hull mass without loadout in kg.
  @JsonKey(
    
    name: r'mass_hull',
    required: false,
    includeIfNull: false,
  )


  final num? massHull;



      /// Equipped loadout mass in kg.
  @JsonKey(
    
    name: r'mass_loadout',
    required: false,
    includeIfNull: false,
  )


  final num? massLoadout;



      /// Total mass (hull + loadout) in kg.
  @JsonKey(
    
    name: r'mass_total',
    required: false,
    includeIfNull: false,
  )


  final num? massTotal;



      /// Cargo Capacity in SCU
  @JsonKey(
    
    name: r'cargo_capacity',
    required: false,
    includeIfNull: false,
  )


  final double? cargoCapacity;



      /// Ore storage capacity in SCU.
  @JsonKey(
    
    name: r'ore_capacity',
    required: false,
    includeIfNull: false,
  )


  final num? oreCapacity;



      /// Cargo grid containers from ship data.
  @JsonKey(
    
    name: r'cargo_grids',
    required: false,
    includeIfNull: false,
  )


  final List<ItemInventory>? cargoGrids;



  @JsonKey(
    
    name: r'cargo_limits',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleCargoLimits? cargoLimits;



      /// Largest standard SCU box that fits within the max item size. Powers of two: 1, 2, 4, 8, 16, 32, 64
  @JsonKey(
    
    name: r'max_scu_box',
    required: false,
    includeIfNull: false,
  )


  final int? maxScuBox;



      /// Vehicle stowage in micro SCU
  @JsonKey(
    
    name: r'vehicle_inventory',
    required: false,
    includeIfNull: false,
  )


  final num? vehicleInventory;



      /// Personal inventory containers (stowage) from ship data.
  @JsonKey(
    
    name: r'inventory_containers',
    required: false,
    includeIfNull: false,
  )


  final List<ItemInventory>? inventoryContainers;



      /// Weapon locker / rack storage from ship data. Only present when lockers exist.
  @JsonKey(
    
    name: r'weapon_storage',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponStorage? weaponStorage;



      /// Suit locker storage from ship data. Only present when lockers exist.
  @JsonKey(
    
    name: r'suit_storage',
    required: false,
    includeIfNull: false,
  )


  final VehicleSuitStorage? suitStorage;



  @JsonKey(
    
    name: r'crew',
    required: false,
    includeIfNull: false,
  )


  final MissionCombatSummaryTotal? crew;



      /// Highest medical bed tier available (e.g., \"T2\", \"T3\"). Null if no medical beds.
  @JsonKey(
    
    name: r'max_medical_tier',
    required: false,
    includeIfNull: false,
  )


  final String? maxMedicalTier;



  @JsonKey(
    
    name: r'seating',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleSeating? seating;



  @JsonKey(
    
    name: r'is_vehicle',
    required: false,
    includeIfNull: false,
  )


  final bool? isVehicle;



  @JsonKey(
    
    name: r'is_gravlev',
    required: false,
    includeIfNull: false,
  )


  final bool? isGravlev;



  @JsonKey(
    
    name: r'is_spaceship',
    required: false,
    includeIfNull: false,
  )


  final bool? isSpaceship;



      /// Total vehicle health pool.
  @JsonKey(
    
    name: r'health',
    required: false,
    includeIfNull: false,
  )


  final num? health;



      /// Use shield.hp property instead.
  @Deprecated('shieldHp has been deprecated')
  @JsonKey(
    
    name: r'shield_hp',
    required: false,
    includeIfNull: false,
  )


  final num? shieldHp;



      /// Use shield.face_type property instead.
  @Deprecated('shieldFaceType has been deprecated')
  @JsonKey(
    
    name: r'shield_face_type',
    required: false,
    includeIfNull: false,
  )


  final String? shieldFaceType;



  @JsonKey(
    
    name: r'shield',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShield? shield;



  @JsonKey(
    
    name: r'weapon_snapshot',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleWeaponSnapshot? weaponSnapshot;



  @JsonKey(
    
    name: r'speed',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleSpeed? speed;



  @JsonKey(
    
    name: r'agility',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleAgility? agility;



      /// Flight parameters when the ship has no fuel.
  @JsonKey(
    
    name: r'no_fuel_params',
    required: false,
    includeIfNull: false,
  )


  final FlightNoFuelParams? noFuelParams;



  @JsonKey(
    
    name: r'afterburner',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleAfterburner? afterburner;



  @JsonKey(
    
    name: r'fuel',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleFuel? fuel;



  @JsonKey(
    
    name: r'quantum',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleQuantum? quantum;



  @JsonKey(
    
    name: r'drive',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleDrive? drive;



      /// Vehicle armor data from ArmorResource. Deprecated plural key aliases (signal_multipliers, damage_multipliers, resistance_multipliers) are emitted for backward compatibility.
  @JsonKey(
    
    name: r'armor',
    required: false,
    includeIfNull: false,
  )


  final VehicleArmor? armor;



  @JsonKey(
    
    name: r'propulsion',
    required: false,
    includeIfNull: false,
  )


  final GameVehiclePropulsion? propulsion;



  @JsonKey(
    
    name: r'weaponry',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleWeaponry? weaponry;



  @JsonKey(
    
    name: r'insurance',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleInsurance? insurance;



  @JsonKey(
    
    name: r'damage_limits',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleDamageLimits? damageLimits;



      /// Equipment ports from ship loadout. On show routes: full ports with resolved items and nested children. On index routes: primary hardpoints only, lightweight items from raw JSON.
  @JsonKey(
    
    name: r'ports',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehiclePort>? ports;



      /// Legacy v2 equipment hardpoints from ship loadout. Only included on show route via legacy v2 API, excluded from index route. Use `ports` in current API.
  @JsonKey(
    
    name: r'hardpoints',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleHardpoint>? hardpoints;



  @JsonKey(
    
    name: r'parts',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehiclePart>? parts;



  @JsonKey(
    
    name: r'turrets',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleTurrets? turrets;



  @JsonKey(
    
    name: r'cross_section',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleCrossSection? crossSection;



      /// Derived: maximum cross-section dimension (max of x, y, z)
  @JsonKey(
    
    name: r'cross_section_max',
    required: false,
    includeIfNull: false,
  )


  final num? crossSectionMax;



  @JsonKey(
    
    name: r'signature',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleSignature? signature;



  @JsonKey(
    
    name: r'cooling',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleCooling? cooling;



  @JsonKey(
    
    name: r'power',
    required: false,
    includeIfNull: false,
  )


  final GameVehiclePower? power;



      /// Power pool allocation limits by component type. Size of -1 indicates unlimited pool.
  @JsonKey(
    
    name: r'power_pools',
    required: false,
    includeIfNull: false,
  )


  final Map<String, GameVehiclePowerPoolsValue>? powerPools;



  @JsonKey(
    
    name: r'penetration_multiplier',
    required: false,
    includeIfNull: false,
  )


  final GameVehiclePenetrationMultiplier? penetrationMultiplier;



  @JsonKey(
    
    name: r'relay_network',
    required: false,
    includeIfNull: false,
  )


  final VehicleRelayNetwork? relayNetwork;



      /// Primary career classification (see GET /api/vehicles/filters for valid values).
  @JsonKey(
    
    name: r'career',
    required: false,
    includeIfNull: false,
  )


  final String? career;



      /// Specific role within the career (see GET /api/vehicles/filters for valid values).
  @JsonKey(
    
    name: r'role',
    required: false,
    includeIfNull: false,
  )


  final String? role;



  @JsonKey(
    
    name: r'game_description',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleGameDescription? gameDescription;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Link to detail endpoint
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final Translation? description;



  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'chassis_id',
    required: false,
    includeIfNull: false,
  )


  final int? chassisId;



      /// Ship-Matrix vehicle name
  @JsonKey(
    
    name: r'shipmatrix_name',
    required: false,
    includeIfNull: false,
  )


  final String? shipmatrixName;



  @JsonKey(
    
    name: r'foci',
    required: false,
    includeIfNull: false,
  )


  final List<Translation>? foci;



  @JsonKey(
    
    name: r'production_status',
    required: false,
    includeIfNull: false,
  )


  final Translation? productionStatus;



  @JsonKey(
    
    name: r'production_note',
    required: false,
    includeIfNull: false,
  )


  final Translation? productionNote;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final Translation? type;



      /// MSRP imported from the Ship Upgrade tool.
  @JsonKey(
    
    name: r'msrp',
    required: false,
    includeIfNull: false,
  )


  final double? msrp;



      /// Link to RSI Pledge Store
  @JsonKey(
    
    name: r'pledge_url',
    required: false,
    includeIfNull: false,
  )


  final String? pledgeUrl;



  @JsonKey(
    
    name: r'loaner',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleLoaner>? loaner;



  @JsonKey(
    
    name: r'skus',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleSku>? skus;



      /// Components imported from the Ship-Matrix
  @JsonKey(
    
    name: r'components',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleComponent>? components;



  @JsonKey(
    
    name: r'uex_prices',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleUexPrices? uexPrices;



      /// Images from external sources for this vehicle.
  @JsonKey(
    
    name: r'images',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleImagesInner>? images;



  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final String? updatedAt;



      /// Game version code this data applies to.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final Translation? size;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetGroundVehicle200ResponseData &&
      other.uuid == uuid &&
      other.name == name &&
      other.gameName == gameName &&
      other.slug == slug &&
      other.className == className &&
      other.portTags == portTags &&
      other.manufacturer == manufacturer &&
      other.sizeClass == sizeClass &&
      other.dimension == dimension &&
      other.sizes == sizes &&
      other.emission == emission &&
      other.mass == mass &&
      other.massHull == massHull &&
      other.massLoadout == massLoadout &&
      other.massTotal == massTotal &&
      other.cargoCapacity == cargoCapacity &&
      other.oreCapacity == oreCapacity &&
      other.cargoGrids == cargoGrids &&
      other.cargoLimits == cargoLimits &&
      other.maxScuBox == maxScuBox &&
      other.vehicleInventory == vehicleInventory &&
      other.inventoryContainers == inventoryContainers &&
      other.weaponStorage == weaponStorage &&
      other.suitStorage == suitStorage &&
      other.crew == crew &&
      other.maxMedicalTier == maxMedicalTier &&
      other.seating == seating &&
      other.isVehicle == isVehicle &&
      other.isGravlev == isGravlev &&
      other.isSpaceship == isSpaceship &&
      other.health == health &&
      other.shieldHp == shieldHp &&
      other.shieldFaceType == shieldFaceType &&
      other.shield == shield &&
      other.weaponSnapshot == weaponSnapshot &&
      other.speed == speed &&
      other.agility == agility &&
      other.noFuelParams == noFuelParams &&
      other.afterburner == afterburner &&
      other.fuel == fuel &&
      other.quantum == quantum &&
      other.drive == drive &&
      other.armor == armor &&
      other.propulsion == propulsion &&
      other.weaponry == weaponry &&
      other.insurance == insurance &&
      other.damageLimits == damageLimits &&
      other.ports == ports &&
      other.hardpoints == hardpoints &&
      other.parts == parts &&
      other.turrets == turrets &&
      other.crossSection == crossSection &&
      other.crossSectionMax == crossSectionMax &&
      other.signature == signature &&
      other.cooling == cooling &&
      other.power == power &&
      other.powerPools == powerPools &&
      other.penetrationMultiplier == penetrationMultiplier &&
      other.relayNetwork == relayNetwork &&
      other.career == career &&
      other.role == role &&
      other.gameDescription == gameDescription &&
      other.webUrl == webUrl &&
      other.link == link &&
      other.description == description &&
      other.id == id &&
      other.chassisId == chassisId &&
      other.shipmatrixName == shipmatrixName &&
      other.foci == foci &&
      other.productionStatus == productionStatus &&
      other.productionNote == productionNote &&
      other.type == type &&
      other.msrp == msrp &&
      other.pledgeUrl == pledgeUrl &&
      other.loaner == loaner &&
      other.skus == skus &&
      other.components == components &&
      other.uexPrices == uexPrices &&
      other.images == images &&
      other.updatedAt == updatedAt &&
      other.version == version &&
      other.size == size;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        (gameName == null ? 0 : gameName.hashCode) +
        slug.hashCode +
        className.hashCode +
        portTags.hashCode +
        manufacturer.hashCode +
        (sizeClass == null ? 0 : sizeClass.hashCode) +
        dimension.hashCode +
        sizes.hashCode +
        (emission == null ? 0 : emission.hashCode) +
        mass.hashCode +
        (massHull == null ? 0 : massHull.hashCode) +
        (massLoadout == null ? 0 : massLoadout.hashCode) +
        (massTotal == null ? 0 : massTotal.hashCode) +
        (cargoCapacity == null ? 0 : cargoCapacity.hashCode) +
        (oreCapacity == null ? 0 : oreCapacity.hashCode) +
        (cargoGrids == null ? 0 : cargoGrids.hashCode) +
        (cargoLimits == null ? 0 : cargoLimits.hashCode) +
        (maxScuBox == null ? 0 : maxScuBox.hashCode) +
        (vehicleInventory == null ? 0 : vehicleInventory.hashCode) +
        (inventoryContainers == null ? 0 : inventoryContainers.hashCode) +
        (weaponStorage == null ? 0 : weaponStorage.hashCode) +
        (suitStorage == null ? 0 : suitStorage.hashCode) +
        crew.hashCode +
        (maxMedicalTier == null ? 0 : maxMedicalTier.hashCode) +
        seating.hashCode +
        (isVehicle == null ? 0 : isVehicle.hashCode) +
        (isGravlev == null ? 0 : isGravlev.hashCode) +
        (isSpaceship == null ? 0 : isSpaceship.hashCode) +
        (health == null ? 0 : health.hashCode) +
        (shieldHp == null ? 0 : shieldHp.hashCode) +
        (shieldFaceType == null ? 0 : shieldFaceType.hashCode) +
        (shield == null ? 0 : shield.hashCode) +
        (weaponSnapshot == null ? 0 : weaponSnapshot.hashCode) +
        speed.hashCode +
        agility.hashCode +
        (noFuelParams == null ? 0 : noFuelParams.hashCode) +
        (afterburner == null ? 0 : afterburner.hashCode) +
        (fuel == null ? 0 : fuel.hashCode) +
        (quantum == null ? 0 : quantum.hashCode) +
        (drive == null ? 0 : drive.hashCode) +
        (armor == null ? 0 : armor.hashCode) +
        (propulsion == null ? 0 : propulsion.hashCode) +
        (weaponry == null ? 0 : weaponry.hashCode) +
        (insurance == null ? 0 : insurance.hashCode) +
        (damageLimits == null ? 0 : damageLimits.hashCode) +
        (ports == null ? 0 : ports.hashCode) +
        (hardpoints == null ? 0 : hardpoints.hashCode) +
        (parts == null ? 0 : parts.hashCode) +
        (turrets == null ? 0 : turrets.hashCode) +
        (crossSection == null ? 0 : crossSection.hashCode) +
        (crossSectionMax == null ? 0 : crossSectionMax.hashCode) +
        (signature == null ? 0 : signature.hashCode) +
        (cooling == null ? 0 : cooling.hashCode) +
        (power == null ? 0 : power.hashCode) +
        (powerPools == null ? 0 : powerPools.hashCode) +
        (penetrationMultiplier == null ? 0 : penetrationMultiplier.hashCode) +
        (relayNetwork == null ? 0 : relayNetwork.hashCode) +
        (career == null ? 0 : career.hashCode) +
        (role == null ? 0 : role.hashCode) +
        (gameDescription == null ? 0 : gameDescription.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode) +
        link.hashCode +
        description.hashCode +
        id.hashCode +
        chassisId.hashCode +
        (shipmatrixName == null ? 0 : shipmatrixName.hashCode) +
        foci.hashCode +
        productionStatus.hashCode +
        productionNote.hashCode +
        type.hashCode +
        (msrp == null ? 0 : msrp.hashCode) +
        (pledgeUrl == null ? 0 : pledgeUrl.hashCode) +
        loaner.hashCode +
        skus.hashCode +
        components.hashCode +
        uexPrices.hashCode +
        (images == null ? 0 : images.hashCode) +
        updatedAt.hashCode +
        version.hashCode +
        size.hashCode;

  factory GetGroundVehicle200ResponseData.fromJson(Map<String, dynamic> json) => _$GetGroundVehicle200ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetGroundVehicle200ResponseDataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

