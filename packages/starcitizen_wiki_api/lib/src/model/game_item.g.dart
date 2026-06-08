// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameItem _$GameItemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'GameItem',
  json,
  ($checkedConvert) {
    final val = GameItem(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      classification: $checkedConvert('classification', (v) => v as String?),
      classificationLabel: $checkedConvert(
        'classification_label',
        (v) => v as String?,
      ),
      description: $checkedConvert(
        'description',
        (v) => v == null
            ? null
            : GameItemDescription.fromJson(v as Map<String, dynamic>),
      ),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      mass: $checkedConvert('mass', (v) => (v as num?)?.toDouble()),
      rarity: $checkedConvert(
        'rarity',
        (v) => $enumDecodeNullable(_$GameItemRarityEnumEnumMap, v),
      ),
      eventSource: $checkedConvert(
        'event_source',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      isBaseVariant: $checkedConvert('is_base_variant', (v) => v as bool?),
      isCraftable: $checkedConvert('is_craftable', (v) => v as bool?),
      blueprint: $checkedConvert(
        'blueprint',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameItemBlueprintInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      grade: $checkedConvert('grade', (v) => v as String?),
      class_: $checkedConvert('class', (v) => v as String?),
      descriptionData: $checkedConvert(
        'description_data',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => ItemDescriptionData.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      manufacturerDescription: $checkedConvert(
        'manufacturer_description',
        (v) => v as String?,
      ),
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => v == null
            ? null
            : ManufacturerLink.fromJson(v as Map<String, dynamic>),
      ),
      type: $checkedConvert('type', (v) => v as String?),
      typeLabel: $checkedConvert('type_label', (v) => v as String?),
      typeWebUrl: $checkedConvert('type_web_url', (v) => v as String?),
      subType: $checkedConvert('sub_type', (v) => v as String?),
      subTypeLabel: $checkedConvert('sub_type_label', (v) => v as String?),
      position: $checkedConvert('position', (v) => v as String?),
      maxMounts: $checkedConvert('max_mounts', (v) => (v as num?)?.toInt()),
      maxMissiles: $checkedConvert('max_missiles', (v) => (v as num?)?.toInt()),
      maxBombs: $checkedConvert('max_bombs', (v) => (v as num?)?.toInt()),
      minSize: $checkedConvert('min_size', (v) => (v as num?)?.toInt()),
      maxSize: $checkedConvert('max_size', (v) => (v as num?)?.toInt()),
      dimension: $checkedConvert(
        'dimension',
        (v) => v == null
            ? null
            : ItemDimension.fromJson(v as Map<String, dynamic>),
      ),
      inventory: $checkedConvert(
        'inventory',
        (v) => v == null
            ? null
            : ItemInventory.fromJson(v as Map<String, dynamic>),
      ),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      requiredTags: $checkedConvert(
        'required_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      entityTags: $checkedConvert(
        'entity_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      entityTagMap: $checkedConvert(
        'entity_tag_map',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  GameItemEntityTagMapInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      interactions: $checkedConvert(
        'interactions',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      ports: $checkedConvert(
        'ports',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemPort.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      heat: $checkedConvert(
        'heat',
        (v) => v == null
            ? null
            : ItemHeatConnection.fromJson(v as Map<String, dynamic>),
      ),
      temperature: $checkedConvert(
        'temperature',
        (v) => v == null
            ? null
            : ItemTemperature.fromJson(v as Map<String, dynamic>),
      ),
      power: $checkedConvert(
        'power',
        (v) => v == null
            ? null
            : ItemPowerConnection.fromJson(v as Map<String, dynamic>),
      ),
      distortion: $checkedConvert(
        'distortion',
        (v) => v == null
            ? null
            : ItemDistortion.fromJson(v as Map<String, dynamic>),
      ),
      durability: $checkedConvert(
        'durability',
        (v) => v == null
            ? null
            : ItemDurability.fromJson(v as Map<String, dynamic>),
      ),
      resourceContainer: $checkedConvert(
        'resource_container',
        (v) => v == null
            ? null
            : ResourceContainer.fromJson(v as Map<String, dynamic>),
      ),
      resourceNetwork: $checkedConvert(
        'resource_network',
        (v) => v == null
            ? null
            : ResourceNetwork.fromJson(v as Map<String, dynamic>),
      ),
      emission: $checkedConvert(
        'emission',
        (v) =>
            v == null ? null : ItemEmission.fromJson(v as Map<String, dynamic>),
      ),
      seat: $checkedConvert(
        'seat',
        (v) => v == null ? null : Seat.fromJson(v as Map<String, dynamic>),
      ),
      ammunition: $checkedConvert(
        'ammunition',
        (v) =>
            v == null ? null : Ammunition.fromJson(v as Map<String, dynamic>),
      ),
      temperatureResistance: $checkedConvert(
        'temperature_resistance',
        (v) => v == null
            ? null
            : TemperatureResistance.fromJson(v as Map<String, dynamic>),
      ),
      radiationResistance: $checkedConvert(
        'radiation_resistance',
        (v) => v == null
            ? null
            : RadiationResistance.fromJson(v as Map<String, dynamic>),
      ),
      gforceResistance: $checkedConvert(
        'gforce_resistance',
        (v) => (v as num?)?.toDouble(),
      ),
      armor: $checkedConvert(
        'armor',
        (v) =>
            v == null ? null : VehicleArmor.fromJson(v as Map<String, dynamic>),
      ),
      cooler: $checkedConvert(
        'cooler',
        (v) => v == null ? null : Cooler.fromJson(v as Map<String, dynamic>),
      ),
      flightController: $checkedConvert(
        'flight_controller',
        (v) => v == null
            ? null
            : FlightController.fromJson(v as Map<String, dynamic>),
      ),
      fuelTank: $checkedConvert(
        'fuel_tank',
        (v) => v == null ? null : FuelTank.fromJson(v as Map<String, dynamic>),
      ),
      fuelIntake: $checkedConvert(
        'fuel_intake',
        (v) =>
            v == null ? null : FuelIntake.fromJson(v as Map<String, dynamic>),
      ),
      hackingChip: $checkedConvert(
        'hacking_chip',
        (v) =>
            v == null ? null : HackingChip.fromJson(v as Map<String, dynamic>),
      ),
      miningLaser: $checkedConvert(
        'mining_laser',
        (v) =>
            v == null ? null : MiningLaser.fromJson(v as Map<String, dynamic>),
      ),
      miningModule: $checkedConvert(
        'mining_module',
        (v) =>
            v == null ? null : MiningModule.fromJson(v as Map<String, dynamic>),
      ),
      miningModifier: $checkedConvert(
        'mining_modifier',
        (v) => v == null
            ? null
            : MiningModifier.fromJson(v as Map<String, dynamic>),
      ),
      miningGadget: $checkedConvert(
        'mining_gadget',
        (v) =>
            v == null ? null : MiningModule.fromJson(v as Map<String, dynamic>),
      ),
      quantumDrive: $checkedConvert(
        'quantum_drive',
        (v) =>
            v == null ? null : QuantumDrive.fromJson(v as Map<String, dynamic>),
      ),
      quantumInterdictionGenerator: $checkedConvert(
        'quantum_interdiction_generator',
        (v) => v == null
            ? null
            : QuantumInterdictionGenerator.fromJson(v as Map<String, dynamic>),
      ),
      selfDestruct: $checkedConvert(
        'self_destruct',
        (v) =>
            v == null ? null : SelfDestruct.fromJson(v as Map<String, dynamic>),
      ),
      shield: $checkedConvert(
        'shield',
        (v) => v == null ? null : Shield.fromJson(v as Map<String, dynamic>),
      ),
      shieldController: $checkedConvert(
        'shield_controller',
        (v) => v == null
            ? null
            : ShieldController.fromJson(v as Map<String, dynamic>),
      ),
      jumpDrive: $checkedConvert(
        'jump_drive',
        (v) => v == null ? null : JumpDrive.fromJson(v as Map<String, dynamic>),
      ),
      thruster: $checkedConvert(
        'thruster',
        (v) => v == null ? null : Thruster.fromJson(v as Map<String, dynamic>),
      ),
      powerPlant: $checkedConvert(
        'power_plant',
        (v) =>
            v == null ? null : PowerPlant.fromJson(v as Map<String, dynamic>),
      ),
      radar: $checkedConvert(
        'radar',
        (v) => v == null ? null : Radar.fromJson(v as Map<String, dynamic>),
      ),
      cargoGrid: $checkedConvert(
        'cargo_grid',
        (v) => v == null
            ? null
            : ItemInventory.fromJson(v as Map<String, dynamic>),
      ),
      clothing: $checkedConvert(
        'clothing',
        (v) => v == null
            ? null
            : GameItemClothing.fromJson(v as Map<String, dynamic>),
      ),
      suitArmor: $checkedConvert(
        'suit_armor',
        (v) => v == null ? null : SuitArmor.fromJson(v as Map<String, dynamic>),
      ),
      bomb: $checkedConvert(
        'bomb',
        (v) => v == null ? null : Bomb.fromJson(v as Map<String, dynamic>),
      ),
      missile: $checkedConvert(
        'missile',
        (v) => v == null ? null : Missile.fromJson(v as Map<String, dynamic>),
      ),
      missileRack: $checkedConvert(
        'missile_rack',
        (v) =>
            v == null ? null : MissileRack.fromJson(v as Map<String, dynamic>),
      ),
      counterMeasure: $checkedConvert(
        'counter_measure',
        (v) => v == null
            ? null
            : CounterMeasure.fromJson(v as Map<String, dynamic>),
      ),
      emp: $checkedConvert(
        'emp',
        (v) => v == null ? null : Emp.fromJson(v as Map<String, dynamic>),
      ),
      personalWeapon: $checkedConvert(
        'personal_weapon',
        (v) => v == null
            ? null
            : PersonalWeapon.fromJson(v as Map<String, dynamic>),
      ),
      vehicleWeapon: $checkedConvert(
        'vehicle_weapon',
        (v) => v == null
            ? null
            : VehicleWeapon.fromJson(v as Map<String, dynamic>),
      ),
      meleeWeapon: $checkedConvert(
        'melee_weapon',
        (v) =>
            v == null ? null : MeleeWeapon.fromJson(v as Map<String, dynamic>),
      ),
      grenade: $checkedConvert(
        'grenade',
        (v) => v == null ? null : Grenade.fromJson(v as Map<String, dynamic>),
      ),
      knife: $checkedConvert(
        'knife',
        (v) =>
            v == null ? null : MeleeWeapon.fromJson(v as Map<String, dynamic>),
      ),
      turret: $checkedConvert(
        'turret',
        (v) => v == null ? null : Turret.fromJson(v as Map<String, dynamic>),
      ),
      tractorBeam: $checkedConvert(
        'tractor_beam',
        (v) =>
            v == null ? null : TractorBeam.fromJson(v as Map<String, dynamic>),
      ),
      food: $checkedConvert(
        'food',
        (v) => v == null ? null : Food.fromJson(v as Map<String, dynamic>),
      ),
      medical: $checkedConvert(
        'medical',
        (v) => v == null ? null : Medicine.fromJson(v as Map<String, dynamic>),
      ),
      weaponRack: $checkedConvert(
        'weapon_rack',
        (v) =>
            v == null ? null : WeaponRack.fromJson(v as Map<String, dynamic>),
      ),
      weaponModifier: $checkedConvert(
        'weapon_modifier',
        (v) => v == null
            ? null
            : WeaponModifier.fromJson(v as Map<String, dynamic>),
      ),
      salvageModifier: $checkedConvert(
        'salvage_modifier',
        (v) => v == null
            ? null
            : SalvageModifier.fromJson(v as Map<String, dynamic>),
      ),
      ironSight: $checkedConvert(
        'iron_sight',
        (v) => v == null
            ? null
            : WeaponAttachmentIronSight.fromJson(v as Map<String, dynamic>),
      ),
      laserPointer: $checkedConvert(
        'laser_pointer',
        (v) => v == null
            ? null
            : WeaponAttachmentLaserPointer.fromJson(v as Map<String, dynamic>),
      ),
      flashlight: $checkedConvert(
        'flashlight',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
            k,
            WeaponAttachmentFlashlightProfile.fromJson(
              e as Map<String, dynamic>,
            ),
          ),
        ),
      ),
      magazine: $checkedConvert(
        'magazine',
        (v) => v == null
            ? null
            : WeaponAttachmentMagazine.fromJson(v as Map<String, dynamic>),
      ),
      compensator: $checkedConvert(
        'compensator',
        (v) => v == null
            ? null
            : WeaponAttachmentBarrelAttachment.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      flashHider: $checkedConvert(
        'flash_hider',
        (v) => v == null
            ? null
            : WeaponAttachmentBarrelAttachment.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      baseVariant: $checkedConvert(
        'base_variant',
        (v) => v == null ? null : ItemLink.fromJson(v as Map<String, dynamic>),
      ),
      variants: $checkedConvert(
        'variants',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      relatedItems: $checkedConvert(
        'related_items',
        (v) => v == null
            ? null
            : ItemRelatedItems.fromJson(v as Map<String, dynamic>),
      ),
      shops: $checkedConvert(
        'shops',
        (v) => (v as List<dynamic>?)?.map((e) => e as Object).toList(),
      ),
      images: $checkedConvert(
        'images',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameItemImagesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      uexPrices: $checkedConvert(
        'uex_prices',
        (v) => v == null
            ? null
            : GameItemUexPrices.fromJson(v as Map<String, dynamic>),
      ),
      vehicles: $checkedConvert(
        'vehicles',
        (v) => (v as List<dynamic>?)
            ?.map((e) => VehicleLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'className': 'class_name',
    'classificationLabel': 'classification_label',
    'eventSource': 'event_source',
    'isBaseVariant': 'is_base_variant',
    'isCraftable': 'is_craftable',
    'class_': 'class',
    'descriptionData': 'description_data',
    'manufacturerDescription': 'manufacturer_description',
    'typeLabel': 'type_label',
    'typeWebUrl': 'type_web_url',
    'subType': 'sub_type',
    'subTypeLabel': 'sub_type_label',
    'maxMounts': 'max_mounts',
    'maxMissiles': 'max_missiles',
    'maxBombs': 'max_bombs',
    'minSize': 'min_size',
    'maxSize': 'max_size',
    'requiredTags': 'required_tags',
    'entityTags': 'entity_tags',
    'entityTagMap': 'entity_tag_map',
    'resourceContainer': 'resource_container',
    'resourceNetwork': 'resource_network',
    'temperatureResistance': 'temperature_resistance',
    'radiationResistance': 'radiation_resistance',
    'gforceResistance': 'gforce_resistance',
    'flightController': 'flight_controller',
    'fuelTank': 'fuel_tank',
    'fuelIntake': 'fuel_intake',
    'hackingChip': 'hacking_chip',
    'miningLaser': 'mining_laser',
    'miningModule': 'mining_module',
    'miningModifier': 'mining_modifier',
    'miningGadget': 'mining_gadget',
    'quantumDrive': 'quantum_drive',
    'quantumInterdictionGenerator': 'quantum_interdiction_generator',
    'selfDestruct': 'self_destruct',
    'shieldController': 'shield_controller',
    'jumpDrive': 'jump_drive',
    'powerPlant': 'power_plant',
    'cargoGrid': 'cargo_grid',
    'suitArmor': 'suit_armor',
    'missileRack': 'missile_rack',
    'counterMeasure': 'counter_measure',
    'personalWeapon': 'personal_weapon',
    'vehicleWeapon': 'vehicle_weapon',
    'meleeWeapon': 'melee_weapon',
    'tractorBeam': 'tractor_beam',
    'weaponRack': 'weapon_rack',
    'weaponModifier': 'weapon_modifier',
    'salvageModifier': 'salvage_modifier',
    'ironSight': 'iron_sight',
    'laserPointer': 'laser_pointer',
    'flashHider': 'flash_hider',
    'baseVariant': 'base_variant',
    'relatedItems': 'related_items',
    'uexPrices': 'uex_prices',
    'webUrl': 'web_url',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$GameItemToJson(GameItem instance) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'slug': ?instance.slug,
  'name': ?instance.name,
  'class_name': ?instance.className,
  'classification': ?instance.classification,
  'classification_label': ?instance.classificationLabel,
  'description': ?instance.description?.toJson(),
  'size': ?instance.size,
  'mass': ?instance.mass,
  'rarity': ?_$GameItemRarityEnumEnumMap[instance.rarity],
  'event_source': ?instance.eventSource,
  'is_base_variant': ?instance.isBaseVariant,
  'is_craftable': ?instance.isCraftable,
  'blueprint': ?instance.blueprint?.map((e) => e.toJson()).toList(),
  'grade': ?instance.grade,
  'class': ?instance.class_,
  'description_data': ?instance.descriptionData
      ?.map((e) => e.toJson())
      .toList(),
  'manufacturer_description': ?instance.manufacturerDescription,
  'manufacturer': ?instance.manufacturer?.toJson(),
  'type': ?instance.type,
  'type_label': ?instance.typeLabel,
  'type_web_url': ?instance.typeWebUrl,
  'sub_type': ?instance.subType,
  'sub_type_label': ?instance.subTypeLabel,
  'position': ?instance.position,
  'max_mounts': ?instance.maxMounts,
  'max_missiles': ?instance.maxMissiles,
  'max_bombs': ?instance.maxBombs,
  'min_size': ?instance.minSize,
  'max_size': ?instance.maxSize,
  'dimension': ?instance.dimension?.toJson(),
  'inventory': ?instance.inventory?.toJson(),
  'tags': ?instance.tags,
  'required_tags': ?instance.requiredTags,
  'entity_tags': ?instance.entityTags,
  'entity_tag_map': ?instance.entityTagMap?.map((e) => e.toJson()).toList(),
  'interactions': ?instance.interactions,
  'ports': ?instance.ports?.map((e) => e.toJson()).toList(),
  'heat': ?instance.heat?.toJson(),
  'temperature': ?instance.temperature?.toJson(),
  'power': ?instance.power?.toJson(),
  'distortion': ?instance.distortion?.toJson(),
  'durability': ?instance.durability?.toJson(),
  'resource_container': ?instance.resourceContainer?.toJson(),
  'resource_network': ?instance.resourceNetwork?.toJson(),
  'emission': ?instance.emission?.toJson(),
  'seat': ?instance.seat?.toJson(),
  'ammunition': ?instance.ammunition?.toJson(),
  'temperature_resistance': ?instance.temperatureResistance?.toJson(),
  'radiation_resistance': ?instance.radiationResistance?.toJson(),
  'gforce_resistance': ?instance.gforceResistance,
  'armor': ?instance.armor?.toJson(),
  'cooler': ?instance.cooler?.toJson(),
  'flight_controller': ?instance.flightController?.toJson(),
  'fuel_tank': ?instance.fuelTank?.toJson(),
  'fuel_intake': ?instance.fuelIntake?.toJson(),
  'hacking_chip': ?instance.hackingChip?.toJson(),
  'mining_laser': ?instance.miningLaser?.toJson(),
  'mining_module': ?instance.miningModule?.toJson(),
  'mining_modifier': ?instance.miningModifier?.toJson(),
  'mining_gadget': ?instance.miningGadget?.toJson(),
  'quantum_drive': ?instance.quantumDrive?.toJson(),
  'quantum_interdiction_generator': ?instance.quantumInterdictionGenerator
      ?.toJson(),
  'self_destruct': ?instance.selfDestruct?.toJson(),
  'shield': ?instance.shield?.toJson(),
  'shield_controller': ?instance.shieldController?.toJson(),
  'jump_drive': ?instance.jumpDrive?.toJson(),
  'thruster': ?instance.thruster?.toJson(),
  'power_plant': ?instance.powerPlant?.toJson(),
  'radar': ?instance.radar?.toJson(),
  'cargo_grid': ?instance.cargoGrid?.toJson(),
  'clothing': ?instance.clothing?.toJson(),
  'suit_armor': ?instance.suitArmor?.toJson(),
  'bomb': ?instance.bomb?.toJson(),
  'missile': ?instance.missile?.toJson(),
  'missile_rack': ?instance.missileRack?.toJson(),
  'counter_measure': ?instance.counterMeasure?.toJson(),
  'emp': ?instance.emp?.toJson(),
  'personal_weapon': ?instance.personalWeapon?.toJson(),
  'vehicle_weapon': ?instance.vehicleWeapon?.toJson(),
  'melee_weapon': ?instance.meleeWeapon?.toJson(),
  'grenade': ?instance.grenade?.toJson(),
  'knife': ?instance.knife?.toJson(),
  'turret': ?instance.turret?.toJson(),
  'tractor_beam': ?instance.tractorBeam?.toJson(),
  'food': ?instance.food?.toJson(),
  'medical': ?instance.medical?.toJson(),
  'weapon_rack': ?instance.weaponRack?.toJson(),
  'weapon_modifier': ?instance.weaponModifier?.toJson(),
  'salvage_modifier': ?instance.salvageModifier?.toJson(),
  'iron_sight': ?instance.ironSight?.toJson(),
  'laser_pointer': ?instance.laserPointer?.toJson(),
  'flashlight': ?instance.flashlight?.map((k, e) => MapEntry(k, e.toJson())),
  'magazine': ?instance.magazine?.toJson(),
  'compensator': ?instance.compensator?.toJson(),
  'flash_hider': ?instance.flashHider?.toJson(),
  'base_variant': ?instance.baseVariant?.toJson(),
  'variants': ?instance.variants?.map((e) => e.toJson()).toList(),
  'related_items': ?instance.relatedItems?.toJson(),
  'shops': ?instance.shops,
  'images': ?instance.images?.map((e) => e.toJson()).toList(),
  'uex_prices': ?instance.uexPrices?.toJson(),
  'vehicles': ?instance.vehicles?.map((e) => e.toJson()).toList(),
  'web_url': ?instance.webUrl,
  'link': ?instance.link,
  'updated_at': ?instance.updatedAt?.toIso8601String(),
  'version': ?instance.version,
};

const _$GameItemRarityEnumEnumMap = {
  GameItemRarityEnum.common: 'Common',
  GameItemRarityEnum.uncommon: 'Uncommon',
  GameItemRarityEnum.rare: 'Rare',
  GameItemRarityEnum.epic: 'Epic',
  GameItemRarityEnum.legendary: 'Legendary',
};
