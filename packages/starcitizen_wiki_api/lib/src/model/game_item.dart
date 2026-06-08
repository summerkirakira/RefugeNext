//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_related_items.dart';
import 'package:starcitizen_wiki_api/src/model/fuel_tank.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam.dart';
import 'package:starcitizen_wiki_api/src/model/temperature_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/emp.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_entity_tag_map_inner.dart';
import 'package:starcitizen_wiki_api/src/model/radar.dart';
import 'package:starcitizen_wiki_api/src/model/item_heat_connection.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_blueprint_inner.dart';
import 'package:starcitizen_wiki_api/src/model/resource_container.dart';
import 'package:starcitizen_wiki_api/src/model/salvage_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/shield_controller.dart';
import 'package:starcitizen_wiki_api/src/model/item_emission.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon.dart';
import 'package:starcitizen_wiki_api/src/model/fuel_intake.dart';
import 'package:starcitizen_wiki_api/src/model/cooler.dart';
import 'package:starcitizen_wiki_api/src/model/jump_drive.dart';
import 'package:starcitizen_wiki_api/src/model/thruster.dart';
import 'package:starcitizen_wiki_api/src/model/item_port.dart';
import 'package:starcitizen_wiki_api/src/model/item_description_data.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_description.dart';
import 'package:starcitizen_wiki_api/src/model/manufacturer_link.dart';
import 'package:starcitizen_wiki_api/src/model/mining_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network.dart';
import 'package:starcitizen_wiki_api/src/model/turret.dart';
import 'package:starcitizen_wiki_api/src/model/item_inventory.dart';
import 'package:starcitizen_wiki_api/src/model/item_distortion.dart';
import 'package:starcitizen_wiki_api/src/model/medicine.dart';
import 'package:starcitizen_wiki_api/src/model/seat.dart';
import 'package:starcitizen_wiki_api/src/model/self_destruct.dart';
import 'package:starcitizen_wiki_api/src/model/item_durability.dart';
import 'package:starcitizen_wiki_api/src/model/counter_measure.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_magazine.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor.dart';
import 'package:starcitizen_wiki_api/src/model/missile_rack.dart';
import 'package:starcitizen_wiki_api/src/model/missile.dart';
import 'package:starcitizen_wiki_api/src/model/mining_module.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition.dart';
import 'package:starcitizen_wiki_api/src/model/melee_weapon.dart';
import 'package:starcitizen_wiki_api/src/model/hacking_chip.dart';
import 'package:starcitizen_wiki_api/src/model/food.dart';
import 'package:starcitizen_wiki_api/src/model/mining_laser.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_interdiction_generator.dart';
import 'package:starcitizen_wiki_api/src/model/suit_armor.dart';
import 'package:starcitizen_wiki_api/src/model/grenade.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_link.dart';
import 'package:starcitizen_wiki_api/src/model/item_dimension.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_uex_prices.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_rack.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_barrel_attachment.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_iron_sight.dart';
import 'package:starcitizen_wiki_api/src/model/radiation_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/item_link.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_drive.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller.dart';
import 'package:starcitizen_wiki_api/src/model/item_power_connection.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_clothing.dart';
import 'package:starcitizen_wiki_api/src/model/shield.dart';
import 'package:starcitizen_wiki_api/src/model/power_plant.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_flashlight_profile.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_laser_pointer.dart';
import 'package:starcitizen_wiki_api/src/model/item_temperature.dart';
import 'package:starcitizen_wiki_api/src/model/bomb.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_item.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameItem {
  /// Returns a new [GameItem] instance.
  GameItem({

     this.uuid,

     this.slug,

     this.name,

     this.className,

     this.classification,

     this.classificationLabel,

     this.description,

     this.size,

     this.mass,

     this.rarity,

     this.eventSource,

     this.isBaseVariant,

     this.isCraftable,

     this.blueprint,

     this.grade,

     this.class_,

     this.descriptionData,

     this.manufacturerDescription,

     this.manufacturer,

     this.type,

     this.typeLabel,

     this.typeWebUrl,

     this.subType,

     this.subTypeLabel,

     this.position,

     this.maxMounts,

     this.maxMissiles,

     this.maxBombs,

     this.minSize,

     this.maxSize,

     this.dimension,

     this.inventory,

     this.tags,

     this.requiredTags,

     this.entityTags,

     this.entityTagMap,

     this.interactions,

     this.ports,

     this.heat,

     this.temperature,

     this.power,

     this.distortion,

     this.durability,

     this.resourceContainer,

     this.resourceNetwork,

     this.emission,

     this.seat,

     this.ammunition,

     this.temperatureResistance,

     this.radiationResistance,

     this.gforceResistance,

     this.armor,

     this.cooler,

     this.flightController,

     this.fuelTank,

     this.fuelIntake,

     this.hackingChip,

     this.miningLaser,

     this.miningModule,

     this.miningModifier,

     this.miningGadget,

     this.quantumDrive,

     this.quantumInterdictionGenerator,

     this.selfDestruct,

     this.shield,

     this.shieldController,

     this.jumpDrive,

     this.thruster,

     this.powerPlant,

     this.radar,

     this.cargoGrid,

     this.clothing,

     this.suitArmor,

     this.bomb,

     this.missile,

     this.missileRack,

     this.counterMeasure,

     this.emp,

     this.personalWeapon,

     this.vehicleWeapon,

     this.meleeWeapon,

     this.grenade,

     this.knife,

     this.turret,

     this.tractorBeam,

     this.food,

     this.medical,

     this.weaponRack,

     this.weaponModifier,

     this.salvageModifier,

     this.ironSight,

     this.laserPointer,

     this.flashlight,

     this.magazine,

     this.compensator,

     this.flashHider,

     this.baseVariant,

     this.variants,

     this.relatedItems,

     this.shops,

     this.images,

     this.uexPrices,

     this.vehicles,

     this.webUrl,

     this.link,

     this.updatedAt,

     this.version,
  });

      /// Unique identifier of the item.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// URL-friendly slug for the item.
  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



      /// Display name of the item.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Internal class name of the item definition.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Classification generated by ScDataDumper.
  @JsonKey(
    
    name: r'classification',
    required: false,
    includeIfNull: false,
  )


  final String? classification;



      /// Human-readable label for the item classification
  @JsonKey(
    
    name: r'classification_label',
    required: false,
    includeIfNull: false,
  )


  final String? classificationLabel;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final GameItemDescription? description;



      /// Item size from AttachDef. Vehicle items range 1-12, FPS items are smaller.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Physical mass in kilograms from SEntityRigidPhysicsControllerParams.
  @JsonKey(
    
    name: r'mass',
    required: false,
    includeIfNull: false,
  )


  final double? mass;



      /// Item rarity from stdItem.Rarity. Only present when the item has rarity data.
  @JsonKey(
    
    name: r'rarity',
    required: false,
    includeIfNull: false,
  )


  final GameItemRarityEnum? rarity;



      /// Event or reward source labels for limited/event items. Empty for regular items.
  @JsonKey(
    
    name: r'event_source',
    required: false,
    includeIfNull: false,
  )


  final List<String>? eventSource;



      /// Whether this item is the base variant (has no parent variant).
  @JsonKey(
    
    name: r'is_base_variant',
    required: false,
    includeIfNull: false,
  )


  final bool? isBaseVariant;



      /// Whether this item can be crafted via blueprints.
  @JsonKey(
    
    name: r'is_craftable',
    required: false,
    includeIfNull: false,
  )


  final bool? isCraftable;



      /// Crafting blueprints that produce this item. Only returned when the item is craftable. Use include=blueprints to get full blueprint data instead of links.
  @JsonKey(
    
    name: r'blueprint',
    required: false,
    includeIfNull: false,
  )


  final List<GameItemBlueprintInner>? blueprint;



      /// Only returned for Ship.* items (derived formatting for ship grades).
  @JsonKey(
    
    name: r'grade',
    required: false,
    includeIfNull: false,
  )


  final String? grade;



      /// Only returned for Ship.* items.
  @JsonKey(
    
    name: r'class',
    required: false,
    includeIfNull: false,
  )


  final String? class_;



      /// Key/value pairs derived from the item description.
  @JsonKey(
    
    name: r'description_data',
    required: false,
    includeIfNull: false,
  )


  final List<ItemDescriptionData>? descriptionData;



      /// Manufacturer name extracted from the description data entries.
  @JsonKey(
    
    name: r'manufacturer_description',
    required: false,
    includeIfNull: false,
  )


  final String? manufacturerDescription;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final ManufacturerLink? manufacturer;



      /// Item type identifier (NOITEM_ prefix removed), e.g. Weapon, Armor, Clothing.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Human-readable label for the item type
  @JsonKey(
    
    name: r'type_label',
    required: false,
    includeIfNull: false,
  )


  final String? typeLabel;



      /// Web URL for filtering items by type
  @JsonKey(
    
    name: r'type_web_url',
    required: false,
    includeIfNull: false,
  )


  final String? typeWebUrl;



      /// Item sub-type identifier, e.g. Small, Medium, Rocket.
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final String? subType;



      /// Human-readable label for the item sub-type
  @JsonKey(
    
    name: r'sub_type_label',
    required: false,
    includeIfNull: false,
  )


  final String? subTypeLabel;



      /// Only returned for WeaponAttachment items (non-placeholder). Maps sub_type to a display slot name.
  @JsonKey(
    
    name: r'position',
    required: false,
    includeIfNull: false,
  )


  final String? position;



      /// Only returned for turret-like items.
  @JsonKey(
    
    name: r'max_mounts',
    required: false,
    includeIfNull: false,
  )


  final int? maxMounts;



      /// Only returned for MissileLauncher turret-like items.
  @JsonKey(
    
    name: r'max_missiles',
    required: false,
    includeIfNull: false,
  )


  final int? maxMissiles;



      /// Only returned for BombLauncher turret-like items.
  @JsonKey(
    
    name: r'max_bombs',
    required: false,
    includeIfNull: false,
  )


  final int? maxBombs;



      /// Only returned for turret-like items.
  @JsonKey(
    
    name: r'min_size',
    required: false,
    includeIfNull: false,
  )


  final int? minSize;



      /// Only returned for turret-like items.
  @JsonKey(
    
    name: r'max_size',
    required: false,
    includeIfNull: false,
  )


  final int? maxSize;



  @JsonKey(
    
    name: r'dimension',
    required: false,
    includeIfNull: false,
  )


  final ItemDimension? dimension;



  @JsonKey(
    
    name: r'inventory',
    required: false,
    includeIfNull: false,
  )


  final ItemInventory? inventory;



      /// Item tags from AttachDef.
  @JsonKey(
    
    name: r'tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? tags;



      /// Required tags an item must match to attach.
  @JsonKey(
    
    name: r'required_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? requiredTags;



      /// Entity tag UUIDs from the database relationship (empty array when not loaded).
  @JsonKey(
    
    name: r'entity_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? entityTags;



      /// Entity tags from the database relationship (empty array when not loaded).
  @JsonKey(
    
    name: r'entity_tag_map',
    required: false,
    includeIfNull: false,
  )


  final List<GameItemEntityTagMapInner>? entityTagMap;



      /// Generated from SInteractionPointParams
  @JsonKey(
    
    name: r'interactions',
    required: false,
    includeIfNull: false,
  )


  final List<String>? interactions;



      /// Item ports derived from stdItem.Ports.
  @JsonKey(
    
    name: r'ports',
    required: false,
    includeIfNull: false,
  )


  final List<ItemPort>? ports;



  @Deprecated('heat has been deprecated')
  @JsonKey(
    
    name: r'heat',
    required: false,
    includeIfNull: false,
  )


  final ItemHeatConnection? heat;



  @JsonKey(
    
    name: r'temperature',
    required: false,
    includeIfNull: false,
  )


  final ItemTemperature? temperature;



  @Deprecated('power has been deprecated')
  @JsonKey(
    
    name: r'power',
    required: false,
    includeIfNull: false,
  )


  final ItemPowerConnection? power;



  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final ItemDistortion? distortion;



  @JsonKey(
    
    name: r'durability',
    required: false,
    includeIfNull: false,
  )


  final ItemDurability? durability;



  @JsonKey(
    
    name: r'resource_container',
    required: false,
    includeIfNull: false,
  )


  final ResourceContainer? resourceContainer;



  @JsonKey(
    
    name: r'resource_network',
    required: false,
    includeIfNull: false,
  )


  final ResourceNetwork? resourceNetwork;



  @JsonKey(
    
    name: r'emission',
    required: false,
    includeIfNull: false,
  )


  final ItemEmission? emission;



  @JsonKey(
    
    name: r'seat',
    required: false,
    includeIfNull: false,
  )


  final Seat? seat;



  @JsonKey(
    
    name: r'ammunition',
    required: false,
    includeIfNull: false,
  )


  final Ammunition? ammunition;



  @JsonKey(
    
    name: r'temperature_resistance',
    required: false,
    includeIfNull: false,
  )


  final TemperatureResistance? temperatureResistance;



  @JsonKey(
    
    name: r'radiation_resistance',
    required: false,
    includeIfNull: false,
  )


  final RadiationResistance? radiationResistance;



      /// G-force tolerance modifier. Positive values increase tolerance, negative values reduce it. 0 = neutral.
  @JsonKey(
    
    name: r'gforce_resistance',
    required: false,
    includeIfNull: false,
  )


  final double? gforceResistance;



  @JsonKey(
    
    name: r'armor',
    required: false,
    includeIfNull: false,
  )


  final VehicleArmor? armor;



  @JsonKey(
    
    name: r'cooler',
    required: false,
    includeIfNull: false,
  )


  final Cooler? cooler;



  @JsonKey(
    
    name: r'flight_controller',
    required: false,
    includeIfNull: false,
  )


  final FlightController? flightController;



  @JsonKey(
    
    name: r'fuel_tank',
    required: false,
    includeIfNull: false,
  )


  final FuelTank? fuelTank;



  @JsonKey(
    
    name: r'fuel_intake',
    required: false,
    includeIfNull: false,
  )


  final FuelIntake? fuelIntake;



  @JsonKey(
    
    name: r'hacking_chip',
    required: false,
    includeIfNull: false,
  )


  final HackingChip? hackingChip;



  @JsonKey(
    
    name: r'mining_laser',
    required: false,
    includeIfNull: false,
  )


  final MiningLaser? miningLaser;



  @Deprecated('miningModule has been deprecated')
  @JsonKey(
    
    name: r'mining_module',
    required: false,
    includeIfNull: false,
  )


  final MiningModule? miningModule;



  @JsonKey(
    
    name: r'mining_modifier',
    required: false,
    includeIfNull: false,
  )


  final MiningModifier? miningModifier;



      /// Mining gadget currently resolves using the mining_module schema.
  @Deprecated('miningGadget has been deprecated')
  @JsonKey(
    
    name: r'mining_gadget',
    required: false,
    includeIfNull: false,
  )


  final MiningModule? miningGadget;



  @JsonKey(
    
    name: r'quantum_drive',
    required: false,
    includeIfNull: false,
  )


  final QuantumDrive? quantumDrive;



  @JsonKey(
    
    name: r'quantum_interdiction_generator',
    required: false,
    includeIfNull: false,
  )


  final QuantumInterdictionGenerator? quantumInterdictionGenerator;



  @JsonKey(
    
    name: r'self_destruct',
    required: false,
    includeIfNull: false,
  )


  final SelfDestruct? selfDestruct;



  @JsonKey(
    
    name: r'shield',
    required: false,
    includeIfNull: false,
  )


  final Shield? shield;



  @JsonKey(
    
    name: r'shield_controller',
    required: false,
    includeIfNull: false,
  )


  final ShieldController? shieldController;



  @JsonKey(
    
    name: r'jump_drive',
    required: false,
    includeIfNull: false,
  )


  final JumpDrive? jumpDrive;



  @JsonKey(
    
    name: r'thruster',
    required: false,
    includeIfNull: false,
  )


  final Thruster? thruster;



  @JsonKey(
    
    name: r'power_plant',
    required: false,
    includeIfNull: false,
  )


  final PowerPlant? powerPlant;



  @JsonKey(
    
    name: r'radar',
    required: false,
    includeIfNull: false,
  )


  final Radar? radar;



  @JsonKey(
    
    name: r'cargo_grid',
    required: false,
    includeIfNull: false,
  )


  final ItemInventory? cargoGrid;



  @JsonKey(
    
    name: r'clothing',
    required: false,
    includeIfNull: false,
  )


  final GameItemClothing? clothing;



      /// FPS Armor
  @JsonKey(
    
    name: r'suit_armor',
    required: false,
    includeIfNull: false,
  )


  final SuitArmor? suitArmor;



  @JsonKey(
    
    name: r'bomb',
    required: false,
    includeIfNull: false,
  )


  final Bomb? bomb;



  @JsonKey(
    
    name: r'missile',
    required: false,
    includeIfNull: false,
  )


  final Missile? missile;



  @JsonKey(
    
    name: r'missile_rack',
    required: false,
    includeIfNull: false,
  )


  final MissileRack? missileRack;



  @JsonKey(
    
    name: r'counter_measure',
    required: false,
    includeIfNull: false,
  )


  final CounterMeasure? counterMeasure;



  @JsonKey(
    
    name: r'emp',
    required: false,
    includeIfNull: false,
  )


  final Emp? emp;



  @JsonKey(
    
    name: r'personal_weapon',
    required: false,
    includeIfNull: false,
  )


  final PersonalWeapon? personalWeapon;



  @JsonKey(
    
    name: r'vehicle_weapon',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeapon? vehicleWeapon;



  @JsonKey(
    
    name: r'melee_weapon',
    required: false,
    includeIfNull: false,
  )


  final MeleeWeapon? meleeWeapon;



  @JsonKey(
    
    name: r'grenade',
    required: false,
    includeIfNull: false,
  )


  final Grenade? grenade;



  @JsonKey(
    
    name: r'knife',
    required: false,
    includeIfNull: false,
  )


  final MeleeWeapon? knife;



  @JsonKey(
    
    name: r'turret',
    required: false,
    includeIfNull: false,
  )


  final Turret? turret;



  @JsonKey(
    
    name: r'tractor_beam',
    required: false,
    includeIfNull: false,
  )


  final TractorBeam? tractorBeam;



  @JsonKey(
    
    name: r'food',
    required: false,
    includeIfNull: false,
  )


  final Food? food;



  @JsonKey(
    
    name: r'medical',
    required: false,
    includeIfNull: false,
  )


  final Medicine? medical;



  @JsonKey(
    
    name: r'weapon_rack',
    required: false,
    includeIfNull: false,
  )


  final WeaponRack? weaponRack;



  @JsonKey(
    
    name: r'weapon_modifier',
    required: false,
    includeIfNull: false,
  )


  final WeaponModifier? weaponModifier;



  @JsonKey(
    
    name: r'salvage_modifier',
    required: false,
    includeIfNull: false,
  )


  final SalvageModifier? salvageModifier;



  @JsonKey(
    
    name: r'iron_sight',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentIronSight? ironSight;



  @JsonKey(
    
    name: r'laser_pointer',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentLaserPointer? laserPointer;



      /// Flashlight profiles keyed by beam type (`narrow`, `wide`) when present.
  @JsonKey(
    
    name: r'flashlight',
    required: false,
    includeIfNull: false,
  )


  final Map<String, WeaponAttachmentFlashlightProfile>? flashlight;



  @JsonKey(
    
    name: r'magazine',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentMagazine? magazine;



  @JsonKey(
    
    name: r'compensator',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentBarrelAttachment? compensator;



  @JsonKey(
    
    name: r'flash_hider',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentBarrelAttachment? flashHider;



  @JsonKey(
    
    name: r'base_variant',
    required: false,
    includeIfNull: false,
  )


  final ItemLink? baseVariant;



  @JsonKey(
    
    name: r'variants',
    required: false,
    includeIfNull: false,
  )


  final List<ItemLink>? variants;



      /// Only returned when `include=related_items` is requested.
  @JsonKey(
    
    name: r'related_items',
    required: false,
    includeIfNull: false,
  )


  final ItemRelatedItems? relatedItems;



      /// Deprecated: shop data is not available in the source files anymore.
  @Deprecated('shops has been deprecated')
  @JsonKey(
    
    name: r'shops',
    required: false,
    includeIfNull: false,
  )


  final List<Object>? shops;



      /// Images from external sources for this item.
  @JsonKey(
    
    name: r'images',
    required: false,
    includeIfNull: false,
  )


  final List<GameItemImagesInner>? images;



  @JsonKey(
    
    name: r'uex_prices',
    required: false,
    includeIfNull: false,
  )


  final GameItemUexPrices? uexPrices;



      /// Only returned when `include=vehicles` is requested. Vehicles that have this item installed.
  @JsonKey(
    
    name: r'vehicles',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleLink>? vehicles;



      /// Web URL for item detail page
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// API URL for item detail endpoint
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Date/time this item's version-specific data was updated.
  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;



      /// Game version code
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameItem &&
      other.uuid == uuid &&
      other.slug == slug &&
      other.name == name &&
      other.className == className &&
      other.classification == classification &&
      other.classificationLabel == classificationLabel &&
      other.description == description &&
      other.size == size &&
      other.mass == mass &&
      other.rarity == rarity &&
      other.eventSource == eventSource &&
      other.isBaseVariant == isBaseVariant &&
      other.isCraftable == isCraftable &&
      other.blueprint == blueprint &&
      other.grade == grade &&
      other.class_ == class_ &&
      other.descriptionData == descriptionData &&
      other.manufacturerDescription == manufacturerDescription &&
      other.manufacturer == manufacturer &&
      other.type == type &&
      other.typeLabel == typeLabel &&
      other.typeWebUrl == typeWebUrl &&
      other.subType == subType &&
      other.subTypeLabel == subTypeLabel &&
      other.position == position &&
      other.maxMounts == maxMounts &&
      other.maxMissiles == maxMissiles &&
      other.maxBombs == maxBombs &&
      other.minSize == minSize &&
      other.maxSize == maxSize &&
      other.dimension == dimension &&
      other.inventory == inventory &&
      other.tags == tags &&
      other.requiredTags == requiredTags &&
      other.entityTags == entityTags &&
      other.entityTagMap == entityTagMap &&
      other.interactions == interactions &&
      other.ports == ports &&
      other.heat == heat &&
      other.temperature == temperature &&
      other.power == power &&
      other.distortion == distortion &&
      other.durability == durability &&
      other.resourceContainer == resourceContainer &&
      other.resourceNetwork == resourceNetwork &&
      other.emission == emission &&
      other.seat == seat &&
      other.ammunition == ammunition &&
      other.temperatureResistance == temperatureResistance &&
      other.radiationResistance == radiationResistance &&
      other.gforceResistance == gforceResistance &&
      other.armor == armor &&
      other.cooler == cooler &&
      other.flightController == flightController &&
      other.fuelTank == fuelTank &&
      other.fuelIntake == fuelIntake &&
      other.hackingChip == hackingChip &&
      other.miningLaser == miningLaser &&
      other.miningModule == miningModule &&
      other.miningModifier == miningModifier &&
      other.miningGadget == miningGadget &&
      other.quantumDrive == quantumDrive &&
      other.quantumInterdictionGenerator == quantumInterdictionGenerator &&
      other.selfDestruct == selfDestruct &&
      other.shield == shield &&
      other.shieldController == shieldController &&
      other.jumpDrive == jumpDrive &&
      other.thruster == thruster &&
      other.powerPlant == powerPlant &&
      other.radar == radar &&
      other.cargoGrid == cargoGrid &&
      other.clothing == clothing &&
      other.suitArmor == suitArmor &&
      other.bomb == bomb &&
      other.missile == missile &&
      other.missileRack == missileRack &&
      other.counterMeasure == counterMeasure &&
      other.emp == emp &&
      other.personalWeapon == personalWeapon &&
      other.vehicleWeapon == vehicleWeapon &&
      other.meleeWeapon == meleeWeapon &&
      other.grenade == grenade &&
      other.knife == knife &&
      other.turret == turret &&
      other.tractorBeam == tractorBeam &&
      other.food == food &&
      other.medical == medical &&
      other.weaponRack == weaponRack &&
      other.weaponModifier == weaponModifier &&
      other.salvageModifier == salvageModifier &&
      other.ironSight == ironSight &&
      other.laserPointer == laserPointer &&
      other.flashlight == flashlight &&
      other.magazine == magazine &&
      other.compensator == compensator &&
      other.flashHider == flashHider &&
      other.baseVariant == baseVariant &&
      other.variants == variants &&
      other.relatedItems == relatedItems &&
      other.shops == shops &&
      other.images == images &&
      other.uexPrices == uexPrices &&
      other.vehicles == vehicles &&
      other.webUrl == webUrl &&
      other.link == link &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        uuid.hashCode +
        (slug == null ? 0 : slug.hashCode) +
        name.hashCode +
        className.hashCode +
        classification.hashCode +
        (classificationLabel == null ? 0 : classificationLabel.hashCode) +
        (description == null ? 0 : description.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (mass == null ? 0 : mass.hashCode) +
        (rarity == null ? 0 : rarity.hashCode) +
        eventSource.hashCode +
        isBaseVariant.hashCode +
        isCraftable.hashCode +
        (blueprint == null ? 0 : blueprint.hashCode) +
        (grade == null ? 0 : grade.hashCode) +
        (class_ == null ? 0 : class_.hashCode) +
        (descriptionData == null ? 0 : descriptionData.hashCode) +
        (manufacturerDescription == null ? 0 : manufacturerDescription.hashCode) +
        (manufacturer == null ? 0 : manufacturer.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (typeLabel == null ? 0 : typeLabel.hashCode) +
        (typeWebUrl == null ? 0 : typeWebUrl.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (subTypeLabel == null ? 0 : subTypeLabel.hashCode) +
        (position == null ? 0 : position.hashCode) +
        (maxMounts == null ? 0 : maxMounts.hashCode) +
        (maxMissiles == null ? 0 : maxMissiles.hashCode) +
        (maxBombs == null ? 0 : maxBombs.hashCode) +
        (minSize == null ? 0 : minSize.hashCode) +
        (maxSize == null ? 0 : maxSize.hashCode) +
        dimension.hashCode +
        (inventory == null ? 0 : inventory.hashCode) +
        (tags == null ? 0 : tags.hashCode) +
        (requiredTags == null ? 0 : requiredTags.hashCode) +
        (entityTags == null ? 0 : entityTags.hashCode) +
        (entityTagMap == null ? 0 : entityTagMap.hashCode) +
        (interactions == null ? 0 : interactions.hashCode) +
        (ports == null ? 0 : ports.hashCode) +
        (heat == null ? 0 : heat.hashCode) +
        (temperature == null ? 0 : temperature.hashCode) +
        (power == null ? 0 : power.hashCode) +
        (distortion == null ? 0 : distortion.hashCode) +
        (durability == null ? 0 : durability.hashCode) +
        (resourceContainer == null ? 0 : resourceContainer.hashCode) +
        (resourceNetwork == null ? 0 : resourceNetwork.hashCode) +
        (emission == null ? 0 : emission.hashCode) +
        (seat == null ? 0 : seat.hashCode) +
        (ammunition == null ? 0 : ammunition.hashCode) +
        (temperatureResistance == null ? 0 : temperatureResistance.hashCode) +
        (radiationResistance == null ? 0 : radiationResistance.hashCode) +
        (gforceResistance == null ? 0 : gforceResistance.hashCode) +
        (armor == null ? 0 : armor.hashCode) +
        (cooler == null ? 0 : cooler.hashCode) +
        (flightController == null ? 0 : flightController.hashCode) +
        (fuelTank == null ? 0 : fuelTank.hashCode) +
        (fuelIntake == null ? 0 : fuelIntake.hashCode) +
        (hackingChip == null ? 0 : hackingChip.hashCode) +
        (miningLaser == null ? 0 : miningLaser.hashCode) +
        (miningModule == null ? 0 : miningModule.hashCode) +
        (miningModifier == null ? 0 : miningModifier.hashCode) +
        (miningGadget == null ? 0 : miningGadget.hashCode) +
        (quantumDrive == null ? 0 : quantumDrive.hashCode) +
        (quantumInterdictionGenerator == null ? 0 : quantumInterdictionGenerator.hashCode) +
        (selfDestruct == null ? 0 : selfDestruct.hashCode) +
        (shield == null ? 0 : shield.hashCode) +
        (shieldController == null ? 0 : shieldController.hashCode) +
        (jumpDrive == null ? 0 : jumpDrive.hashCode) +
        (thruster == null ? 0 : thruster.hashCode) +
        (powerPlant == null ? 0 : powerPlant.hashCode) +
        (radar == null ? 0 : radar.hashCode) +
        (cargoGrid == null ? 0 : cargoGrid.hashCode) +
        (clothing == null ? 0 : clothing.hashCode) +
        (suitArmor == null ? 0 : suitArmor.hashCode) +
        (bomb == null ? 0 : bomb.hashCode) +
        (missile == null ? 0 : missile.hashCode) +
        (missileRack == null ? 0 : missileRack.hashCode) +
        (counterMeasure == null ? 0 : counterMeasure.hashCode) +
        (emp == null ? 0 : emp.hashCode) +
        (personalWeapon == null ? 0 : personalWeapon.hashCode) +
        (vehicleWeapon == null ? 0 : vehicleWeapon.hashCode) +
        (meleeWeapon == null ? 0 : meleeWeapon.hashCode) +
        (grenade == null ? 0 : grenade.hashCode) +
        (knife == null ? 0 : knife.hashCode) +
        (turret == null ? 0 : turret.hashCode) +
        (tractorBeam == null ? 0 : tractorBeam.hashCode) +
        (food == null ? 0 : food.hashCode) +
        (medical == null ? 0 : medical.hashCode) +
        (weaponRack == null ? 0 : weaponRack.hashCode) +
        (weaponModifier == null ? 0 : weaponModifier.hashCode) +
        (salvageModifier == null ? 0 : salvageModifier.hashCode) +
        (ironSight == null ? 0 : ironSight.hashCode) +
        (laserPointer == null ? 0 : laserPointer.hashCode) +
        (flashlight == null ? 0 : flashlight.hashCode) +
        (magazine == null ? 0 : magazine.hashCode) +
        (compensator == null ? 0 : compensator.hashCode) +
        (flashHider == null ? 0 : flashHider.hashCode) +
        (baseVariant == null ? 0 : baseVariant.hashCode) +
        (variants == null ? 0 : variants.hashCode) +
        (relatedItems == null ? 0 : relatedItems.hashCode) +
        (shops == null ? 0 : shops.hashCode) +
        (images == null ? 0 : images.hashCode) +
        uexPrices.hashCode +
        (vehicles == null ? 0 : vehicles.hashCode) +
        webUrl.hashCode +
        link.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory GameItem.fromJson(Map<String, dynamic> json) => _$GameItemFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Item rarity from stdItem.Rarity. Only present when the item has rarity data.
enum GameItemRarityEnum {
    /// Item rarity from stdItem.Rarity. Only present when the item has rarity data.
@JsonValue(r'Common')
common(r'Common'),
    /// Item rarity from stdItem.Rarity. Only present when the item has rarity data.
@JsonValue(r'Uncommon')
uncommon(r'Uncommon'),
    /// Item rarity from stdItem.Rarity. Only present when the item has rarity data.
@JsonValue(r'Rare')
rare(r'Rare'),
    /// Item rarity from stdItem.Rarity. Only present when the item has rarity data.
@JsonValue(r'Epic')
epic(r'Epic'),
    /// Item rarity from stdItem.Rarity. Only present when the item has rarity data.
@JsonValue(r'Legendary')
legendary(r'Legendary');

const GameItemRarityEnum(this.value);

final String value;

@override
String toString() => value;
}


