// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicle _$GameVehicleFromJson(Map<String, dynamic> json) => $checkedCreate(
  'GameVehicle',
  json,
  ($checkedConvert) {
    final val = GameVehicle(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      gameName: $checkedConvert('game_name', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      portTags: $checkedConvert(
        'port_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => v == null
            ? null
            : ManufacturerLink.fromJson(v as Map<String, dynamic>),
      ),
      sizeClass: $checkedConvert('size_class', (v) => (v as num?)?.toInt()),
      dimension: $checkedConvert(
        'dimension',
        (v) => v == null
            ? null
            : GameVehicleDimension.fromJson(v as Map<String, dynamic>),
      ),
      sizes: $checkedConvert(
        'sizes',
        (v) => v == null
            ? null
            : GameVehicleSizes.fromJson(v as Map<String, dynamic>),
      ),
      emission: $checkedConvert(
        'emission',
        (v) => v == null
            ? null
            : GameVehicleEmission.fromJson(v as Map<String, dynamic>),
      ),
      mass: $checkedConvert('mass', (v) => v as num?),
      massHull: $checkedConvert('mass_hull', (v) => v as num?),
      massLoadout: $checkedConvert('mass_loadout', (v) => v as num?),
      massTotal: $checkedConvert('mass_total', (v) => v as num?),
      cargoCapacity: $checkedConvert('cargo_capacity', (v) => v as num?),
      oreCapacity: $checkedConvert('ore_capacity', (v) => v as num?),
      cargoGrids: $checkedConvert(
        'cargo_grids',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemInventory.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      cargoLimits: $checkedConvert(
        'cargo_limits',
        (v) => v == null
            ? null
            : GameVehicleCargoLimits.fromJson(v as Map<String, dynamic>),
      ),
      maxScuBox: $checkedConvert('max_scu_box', (v) => (v as num?)?.toInt()),
      vehicleInventory: $checkedConvert('vehicle_inventory', (v) => v as num?),
      inventoryContainers: $checkedConvert(
        'inventory_containers',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemInventory.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      weaponStorage: $checkedConvert(
        'weapon_storage',
        (v) => v == null
            ? null
            : VehicleWeaponStorage.fromJson(v as Map<String, dynamic>),
      ),
      suitStorage: $checkedConvert(
        'suit_storage',
        (v) => v == null
            ? null
            : VehicleSuitStorage.fromJson(v as Map<String, dynamic>),
      ),
      crew: $checkedConvert(
        'crew',
        (v) => v == null
            ? null
            : GameVehicleCrew.fromJson(v as Map<String, dynamic>),
      ),
      maxMedicalTier: $checkedConvert('max_medical_tier', (v) => v as String?),
      seating: $checkedConvert(
        'seating',
        (v) => v == null
            ? null
            : GameVehicleSeating.fromJson(v as Map<String, dynamic>),
      ),
      isVehicle: $checkedConvert('is_vehicle', (v) => v as bool?),
      isGravlev: $checkedConvert('is_gravlev', (v) => v as bool?),
      isSpaceship: $checkedConvert('is_spaceship', (v) => v as bool?),
      health: $checkedConvert('health', (v) => v as num?),
      shieldHp: $checkedConvert('shield_hp', (v) => v as num?),
      shieldFaceType: $checkedConvert('shield_face_type', (v) => v as String?),
      shield: $checkedConvert(
        'shield',
        (v) => v == null
            ? null
            : GameVehicleShield.fromJson(v as Map<String, dynamic>),
      ),
      weaponSnapshot: $checkedConvert(
        'weapon_snapshot',
        (v) => v == null
            ? null
            : GameVehicleWeaponSnapshot.fromJson(v as Map<String, dynamic>),
      ),
      speed: $checkedConvert(
        'speed',
        (v) => v == null
            ? null
            : GameVehicleSpeed.fromJson(v as Map<String, dynamic>),
      ),
      agility: $checkedConvert(
        'agility',
        (v) => v == null
            ? null
            : GameVehicleAgility.fromJson(v as Map<String, dynamic>),
      ),
      noFuelParams: $checkedConvert(
        'no_fuel_params',
        (v) => v == null
            ? null
            : FlightNoFuelParams.fromJson(v as Map<String, dynamic>),
      ),
      afterburner: $checkedConvert(
        'afterburner',
        (v) => v == null
            ? null
            : GameVehicleAfterburner.fromJson(v as Map<String, dynamic>),
      ),
      fuel: $checkedConvert(
        'fuel',
        (v) => v == null
            ? null
            : GameVehicleFuel.fromJson(v as Map<String, dynamic>),
      ),
      quantum: $checkedConvert(
        'quantum',
        (v) => v == null
            ? null
            : GameVehicleQuantum.fromJson(v as Map<String, dynamic>),
      ),
      drive: $checkedConvert(
        'drive',
        (v) => v == null
            ? null
            : GameVehicleDrive.fromJson(v as Map<String, dynamic>),
      ),
      armor: $checkedConvert(
        'armor',
        (v) =>
            v == null ? null : VehicleArmor.fromJson(v as Map<String, dynamic>),
      ),
      propulsion: $checkedConvert(
        'propulsion',
        (v) => v == null
            ? null
            : GameVehiclePropulsion.fromJson(v as Map<String, dynamic>),
      ),
      weaponry: $checkedConvert(
        'weaponry',
        (v) => v == null
            ? null
            : GameVehicleWeaponry.fromJson(v as Map<String, dynamic>),
      ),
      insurance: $checkedConvert(
        'insurance',
        (v) => v == null
            ? null
            : GameVehicleInsurance.fromJson(v as Map<String, dynamic>),
      ),
      damageLimits: $checkedConvert(
        'damage_limits',
        (v) => v == null
            ? null
            : GameVehicleDamageLimits.fromJson(v as Map<String, dynamic>),
      ),
      ports: $checkedConvert(
        'ports',
        (v) => (v as List<dynamic>?)
            ?.map((e) => GameVehiclePort.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      hardpoints: $checkedConvert(
        'hardpoints',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameVehicleHardpoint.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      parts: $checkedConvert(
        'parts',
        (v) => (v as List<dynamic>?)
            ?.map((e) => GameVehiclePart.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      turrets: $checkedConvert(
        'turrets',
        (v) => v == null
            ? null
            : GameVehicleTurrets.fromJson(v as Map<String, dynamic>),
      ),
      crossSection: $checkedConvert(
        'cross_section',
        (v) => v == null
            ? null
            : GameVehicleCrossSection.fromJson(v as Map<String, dynamic>),
      ),
      crossSectionMax: $checkedConvert('cross_section_max', (v) => v as num?),
      signature: $checkedConvert(
        'signature',
        (v) => v == null
            ? null
            : GameVehicleSignature.fromJson(v as Map<String, dynamic>),
      ),
      cooling: $checkedConvert(
        'cooling',
        (v) => v == null
            ? null
            : GameVehicleCooling.fromJson(v as Map<String, dynamic>),
      ),
      power: $checkedConvert(
        'power',
        (v) => v == null
            ? null
            : GameVehiclePower.fromJson(v as Map<String, dynamic>),
      ),
      powerPools: $checkedConvert(
        'power_pools',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
            k,
            GameVehiclePowerPoolsValue.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
      penetrationMultiplier: $checkedConvert(
        'penetration_multiplier',
        (v) => v == null
            ? null
            : GameVehiclePenetrationMultiplier.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      relayNetwork: $checkedConvert(
        'relay_network',
        (v) => v == null
            ? null
            : VehicleRelayNetwork.fromJson(v as Map<String, dynamic>),
      ),
      career: $checkedConvert('career', (v) => v as String?),
      role: $checkedConvert('role', (v) => v as String?),
      gameDescription: $checkedConvert(
        'game_description',
        (v) => v == null
            ? null
            : GameVehicleGameDescription.fromJson(v as Map<String, dynamic>),
      ),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      description: $checkedConvert(
        'description',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      chassisId: $checkedConvert('chassis_id', (v) => (v as num?)?.toInt()),
      shipmatrixName: $checkedConvert('shipmatrix_name', (v) => v as String?),
      foci: $checkedConvert(
        'foci',
        (v) => (v as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      productionStatus: $checkedConvert(
        'production_status',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      productionNote: $checkedConvert(
        'production_note',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      type: $checkedConvert(
        'type',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      msrp: $checkedConvert('msrp', (v) => v as num?),
      pledgeUrl: $checkedConvert('pledge_url', (v) => v as String?),
      loaner: $checkedConvert(
        'loaner',
        (v) => (v as List<dynamic>?)
            ?.map((e) => VehicleLoaner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      skus: $checkedConvert(
        'skus',
        (v) => (v as List<dynamic>?)
            ?.map((e) => VehicleSku.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      components: $checkedConvert(
        'components',
        (v) => (v as List<dynamic>?)
            ?.map((e) => VehicleComponent.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      uexPrices: $checkedConvert(
        'uex_prices',
        (v) => v == null
            ? null
            : GameVehicleUexPrices.fromJson(v as Map<String, dynamic>),
      ),
      images: $checkedConvert(
        'images',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameVehicleImagesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      updatedAt: $checkedConvert('updated_at', (v) => v as String?),
      version: $checkedConvert('version', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'gameName': 'game_name',
    'className': 'class_name',
    'portTags': 'port_tags',
    'sizeClass': 'size_class',
    'massHull': 'mass_hull',
    'massLoadout': 'mass_loadout',
    'massTotal': 'mass_total',
    'cargoCapacity': 'cargo_capacity',
    'oreCapacity': 'ore_capacity',
    'cargoGrids': 'cargo_grids',
    'cargoLimits': 'cargo_limits',
    'maxScuBox': 'max_scu_box',
    'vehicleInventory': 'vehicle_inventory',
    'inventoryContainers': 'inventory_containers',
    'weaponStorage': 'weapon_storage',
    'suitStorage': 'suit_storage',
    'maxMedicalTier': 'max_medical_tier',
    'isVehicle': 'is_vehicle',
    'isGravlev': 'is_gravlev',
    'isSpaceship': 'is_spaceship',
    'shieldHp': 'shield_hp',
    'shieldFaceType': 'shield_face_type',
    'weaponSnapshot': 'weapon_snapshot',
    'noFuelParams': 'no_fuel_params',
    'damageLimits': 'damage_limits',
    'crossSection': 'cross_section',
    'crossSectionMax': 'cross_section_max',
    'powerPools': 'power_pools',
    'penetrationMultiplier': 'penetration_multiplier',
    'relayNetwork': 'relay_network',
    'gameDescription': 'game_description',
    'webUrl': 'web_url',
    'chassisId': 'chassis_id',
    'shipmatrixName': 'shipmatrix_name',
    'productionStatus': 'production_status',
    'productionNote': 'production_note',
    'pledgeUrl': 'pledge_url',
    'uexPrices': 'uex_prices',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$GameVehicleToJson(
  GameVehicle instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'game_name': ?instance.gameName,
  'slug': ?instance.slug,
  'class_name': ?instance.className,
  'port_tags': ?instance.portTags,
  'manufacturer': ?instance.manufacturer?.toJson(),
  'size_class': ?instance.sizeClass,
  'dimension': ?instance.dimension?.toJson(),
  'sizes': ?instance.sizes?.toJson(),
  'emission': ?instance.emission?.toJson(),
  'mass': ?instance.mass,
  'mass_hull': ?instance.massHull,
  'mass_loadout': ?instance.massLoadout,
  'mass_total': ?instance.massTotal,
  'cargo_capacity': ?instance.cargoCapacity,
  'ore_capacity': ?instance.oreCapacity,
  'cargo_grids': ?instance.cargoGrids?.map((e) => e.toJson()).toList(),
  'cargo_limits': ?instance.cargoLimits?.toJson(),
  'max_scu_box': ?instance.maxScuBox,
  'vehicle_inventory': ?instance.vehicleInventory,
  'inventory_containers': ?instance.inventoryContainers
      ?.map((e) => e.toJson())
      .toList(),
  'weapon_storage': ?instance.weaponStorage?.toJson(),
  'suit_storage': ?instance.suitStorage?.toJson(),
  'crew': ?instance.crew?.toJson(),
  'max_medical_tier': ?instance.maxMedicalTier,
  'seating': ?instance.seating?.toJson(),
  'is_vehicle': ?instance.isVehicle,
  'is_gravlev': ?instance.isGravlev,
  'is_spaceship': ?instance.isSpaceship,
  'health': ?instance.health,
  'shield_hp': ?instance.shieldHp,
  'shield_face_type': ?instance.shieldFaceType,
  'shield': ?instance.shield?.toJson(),
  'weapon_snapshot': ?instance.weaponSnapshot?.toJson(),
  'speed': ?instance.speed?.toJson(),
  'agility': ?instance.agility?.toJson(),
  'no_fuel_params': ?instance.noFuelParams?.toJson(),
  'afterburner': ?instance.afterburner?.toJson(),
  'fuel': ?instance.fuel?.toJson(),
  'quantum': ?instance.quantum?.toJson(),
  'drive': ?instance.drive?.toJson(),
  'armor': ?instance.armor?.toJson(),
  'propulsion': ?instance.propulsion?.toJson(),
  'weaponry': ?instance.weaponry?.toJson(),
  'insurance': ?instance.insurance?.toJson(),
  'damage_limits': ?instance.damageLimits?.toJson(),
  'ports': ?instance.ports?.map((e) => e.toJson()).toList(),
  'hardpoints': ?instance.hardpoints?.map((e) => e.toJson()).toList(),
  'parts': ?instance.parts?.map((e) => e.toJson()).toList(),
  'turrets': ?instance.turrets?.toJson(),
  'cross_section': ?instance.crossSection?.toJson(),
  'cross_section_max': ?instance.crossSectionMax,
  'signature': ?instance.signature?.toJson(),
  'cooling': ?instance.cooling?.toJson(),
  'power': ?instance.power?.toJson(),
  'power_pools': ?instance.powerPools?.map((k, e) => MapEntry(k, e.toJson())),
  'penetration_multiplier': ?instance.penetrationMultiplier?.toJson(),
  'relay_network': ?instance.relayNetwork?.toJson(),
  'career': ?instance.career,
  'role': ?instance.role,
  'game_description': ?instance.gameDescription?.toJson(),
  'web_url': ?instance.webUrl,
  'link': ?instance.link,
  'description': ?instance.description?.toJson(),
  'id': ?instance.id,
  'chassis_id': ?instance.chassisId,
  'shipmatrix_name': ?instance.shipmatrixName,
  'foci': ?instance.foci?.map((e) => e.toJson()).toList(),
  'production_status': ?instance.productionStatus?.toJson(),
  'production_note': ?instance.productionNote?.toJson(),
  'type': ?instance.type?.toJson(),
  'msrp': ?instance.msrp,
  'pledge_url': ?instance.pledgeUrl,
  'loaner': ?instance.loaner?.map((e) => e.toJson()).toList(),
  'skus': ?instance.skus?.map((e) => e.toJson()).toList(),
  'components': ?instance.components?.map((e) => e.toJson()).toList(),
  'uex_prices': ?instance.uexPrices?.toJson(),
  'images': ?instance.images?.map((e) => e.toJson()).toList(),
  'updated_at': ?instance.updatedAt,
  'version': ?instance.version,
};
