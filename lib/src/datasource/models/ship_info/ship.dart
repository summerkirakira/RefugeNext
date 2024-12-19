// To parse this JSON data, do
//
//     final ship = shipFromJson(jsonString);

import 'dart:convert';

Ship shipFromJson(String str) => Ship.fromJson(json.decode(str));

String shipToJson(Ship data) => json.encode(data.toJson());

class Ship {
  Armor armor;
  List<CargoGrid> cargos;
  String? chineseDescription;
  String? chineseName;
  List<Controller> controllers;
  List<Cooler> coolers;
  String? description;
  Flare flare;
  List<FuelIntake> fuelIntakes;
  List<FuelTank> fuelTanks;
  List<Hull> hulls;
  bool? isRealShip;
  LifeSupport? lifeSupport;
  String? manufacturer;
  double mass;
  List<MissileRack> missileRacks;
  String name;
  List<Skin> paints;
  String? path;
  PersonalStorage? personalStorage;
  List<PowerPlant> powerPlants;
  QuantumDrive? qd;
  Radar? radar;
  String ref;
  SelfDestruct? selfDestruct;
  List<Shield> shields;
  ShipAlis? shipAlias;
  ShipNameBinding? shipNameBinding;
  List<ShopInfo> shopInfo;
  int? size;
  List<Thruster> thrusts;
  List<Turret> turrets;
  String? type;
  VehicleComponentParams vehicle;
  int weaponFixedPool;
  WeaponRegenPool? weaponRegenPool;
  List<VehicleWeapon> weapons;

  Ship({
    required this.armor,
    required this.cargos,
    this.chineseDescription,
    required this.chineseName,
    required this.controllers,
    required this.coolers,
    this.description,
    required this.flare,
    required this.fuelIntakes,
    required this.fuelTanks,
    required this.hulls,
    this.isRealShip,
    required this.lifeSupport,
    this.manufacturer,
    required this.mass,
    required this.missileRacks,
    required this.name,
    required this.paints,
    this.path,
    required this.personalStorage,
    required this.powerPlants,
    required this.qd,
    required this.radar,
    required this.ref,
    required this.selfDestruct,
    required this.shields,
    required this.shipAlias,
    required this.shipNameBinding,
    required this.shopInfo,
    this.size,
    required this.thrusts,
    required this.turrets,
    this.type,
    required this.vehicle,
    required this.weaponFixedPool,
    required this.weaponRegenPool,
    required this.weapons,
  });

  factory Ship.fromJson(Map<String, dynamic> json) => Ship(
    armor: Armor.fromJson(json["armor"]),
    cargos: List<CargoGrid>.from(json["cargos"].map((x) => CargoGrid.fromJson(x))),
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    controllers: List<Controller>.from(json["controllers"].map((x) => Controller.fromJson(x))),
    coolers: List<Cooler>.from(json["coolers"].map((x) => Cooler.fromJson(x))),
    description: json["description"],
    flare: Flare.fromJson(json["flare"]),
    fuelIntakes: List<FuelIntake>.from(json["fuel_intakes"].map((x) => FuelIntake.fromJson(x))),
    fuelTanks: List<FuelTank>.from(json["fuel_tanks"].map((x) => FuelTank.fromJson(x))),
    hulls: List<Hull>.from(json["hulls"].map((x) => Hull.fromJson(x))),
    isRealShip: json["is_real_ship"],
    lifeSupport: json["life_support"] == null ? null : LifeSupport.fromJson(json["life_support"]),
    manufacturer: json["manufacturer"],
    mass: json["mass"]?.toDouble(),
    missileRacks: List<MissileRack>.from(json["missile_racks"].map((x) => MissileRack.fromJson(x))),
    name: json["name"],
    paints: List<Skin>.from(json["paints"].map((x) => Skin.fromJson(x))),
    path: json["path"],
    personalStorage: json["personal_storage"] == null ? null : PersonalStorage.fromJson(json["personal_storage"]),
    powerPlants: List<PowerPlant>.from(json["power_plants"].map((x) => PowerPlant.fromJson(x))),
    qd: json["qd"] == null ? null : QuantumDrive.fromJson(json["qd"]),
    radar: json["radar"] == null ? null : Radar.fromJson(json["radar"]),
    ref: json["ref"],
    selfDestruct: json["self_destruct"] == null ? null : SelfDestruct.fromJson(json["self_destruct"]),
    shields: List<Shield>.from(json["shields"].map((x) => Shield.fromJson(x))),
    shipAlias: json["ship_alias"] == null ? null : ShipAlis.fromJson(json["ship_alias"]),
    shipNameBinding: json["ship_name_binding"] == null ? null : ShipNameBinding.fromJson(json["ship_name_binding"]),
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    thrusts: List<Thruster>.from(json["thrusts"].map((x) => Thruster.fromJson(x))),
    turrets: List<Turret>.from(json["turrets"].map((x) => Turret.fromJson(x))),
    type: json["type"],
    vehicle: VehicleComponentParams.fromJson(json["vehicle"]),
    weaponFixedPool: json["weapon_fixed_pool"],
    weaponRegenPool: json["weapon_regen_pool"] == null ? null : WeaponRegenPool.fromJson(json["weapon_regen_pool"]),
    weapons: List<VehicleWeapon>.from(json["weapons"].map((x) => VehicleWeapon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "armor": armor.toJson(),
    "cargos": List<dynamic>.from(cargos.map((x) => x.toJson())),
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "controllers": List<dynamic>.from(controllers.map((x) => x.toJson())),
    "coolers": List<dynamic>.from(coolers.map((x) => x.toJson())),
    "description": description,
    "flare": flare.toJson(),
    "fuel_intakes": List<dynamic>.from(fuelIntakes.map((x) => x.toJson())),
    "fuel_tanks": List<dynamic>.from(fuelTanks.map((x) => x.toJson())),
    "hulls": List<dynamic>.from(hulls.map((x) => x.toJson())),
    "is_real_ship": isRealShip,
    "life_support": lifeSupport?.toJson(),
    "manufacturer": manufacturer,
    "mass": mass,
    "missile_racks": List<dynamic>.from(missileRacks.map((x) => x.toJson())),
    "name": name,
    "paints": List<dynamic>.from(paints.map((x) => x.toJson())),
    "path": path,
    "personal_storage": personalStorage?.toJson(),
    "power_plants": List<dynamic>.from(powerPlants.map((x) => x.toJson())),
    "qd": qd?.toJson(),
    "radar": radar?.toJson(),
    "ref": ref,
    "self_destruct": selfDestruct?.toJson(),
    "shields": List<dynamic>.from(shields.map((x) => x.toJson())),
    "ship_alias": shipAlias?.toJson(),
    "ship_name_binding": shipNameBinding?.toJson(),
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "thrusts": List<dynamic>.from(thrusts.map((x) => x.toJson())),
    "turrets": List<dynamic>.from(turrets.map((x) => x.toJson())),
    "type": type,
    "vehicle": vehicle.toJson(),
    "weapon_fixed_pool": weaponFixedPool,
    "weapon_regen_pool": weaponRegenPool?.toJson(),
    "weapons": List<dynamic>.from(weapons.map((x) => x.toJson())),
  };
}

class Armor {
  String? chineseDescription;
  String? chineseName;
  ScItemVehicleArmorParamsType data;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  int size;
  String? type;

  Armor({
    this.chineseDescription,
    required this.chineseName,
    required this.data,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    required this.size,
    this.type,
  });

  factory Armor.fromJson(Map<String, dynamic> json) => Armor(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: ScItemVehicleArmorParamsType.fromJson(json["data"]),
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data.toJson(),
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "size": size,
    "type": type,
  };
}

class ScItemVehicleArmorParamsType {
  DamageMultiplier damageMultiplier;
  double signalCrossSection;
  double signalElectromagnetic;
  double signalInfrared;

  ScItemVehicleArmorParamsType({
    required this.damageMultiplier,
    required this.signalCrossSection,
    required this.signalElectromagnetic,
    required this.signalInfrared,
  });

  factory ScItemVehicleArmorParamsType.fromJson(Map<String, dynamic> json) => ScItemVehicleArmorParamsType(
    damageMultiplier: DamageMultiplier.fromJson(json["damageMultiplier"]),
    signalCrossSection: json["signalCrossSection"]?.toDouble(),
    signalElectromagnetic: json["signalElectromagnetic"]?.toDouble(),
    signalInfrared: json["signalInfrared"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "damageMultiplier": damageMultiplier.toJson(),
    "signalCrossSection": signalCrossSection,
    "signalElectromagnetic": signalElectromagnetic,
    "signalInfrared": signalInfrared,
  };
}

class DamageMultiplier {
  double damageBiochemical;
  double damageDistortion;
  double damageEnergy;
  double damagePhysical;
  double damageStun;
  double damageThermal;

  DamageMultiplier({
    required this.damageBiochemical,
    required this.damageDistortion,
    required this.damageEnergy,
    required this.damagePhysical,
    required this.damageStun,
    required this.damageThermal,
  });

  factory DamageMultiplier.fromJson(Map<String, dynamic> json) => DamageMultiplier(
    damageBiochemical: json["DamageBiochemical"]?.toDouble(),
    damageDistortion: json["DamageDistortion"]?.toDouble(),
    damageEnergy: json["DamageEnergy"]?.toDouble(),
    damagePhysical: json["DamagePhysical"]?.toDouble(),
    damageStun: json["DamageStun"]?.toDouble(),
    damageThermal: json["DamageThermal"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "DamageBiochemical": damageBiochemical,
    "DamageDistortion": damageDistortion,
    "DamageEnergy": damageEnergy,
    "DamagePhysical": damagePhysical,
    "DamageStun": damageStun,
    "DamageThermal": damageThermal,
  };
}

class CargoGrid {
  String? chineseDescription;
  String? chineseName;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  int size;
  SubCargoGrid? subCargoGrid;
  String? type;

  CargoGrid({
    this.chineseDescription,
    required this.chineseName,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    required this.size,
    required this.subCargoGrid,
    this.type,
  });

  factory CargoGrid.fromJson(Map<String, dynamic> json) => CargoGrid(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    size: json["size"],
    subCargoGrid: json["sub_cargo_grid"] == null ? null : SubCargoGrid.fromJson(json["sub_cargo_grid"]),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "size": size,
    "sub_cargo_grid": subCargoGrid?.toJson(),
    "type": type,
  };
}

class SubCargoGrid {
  InteriorDimensions grid;
  String path;
  String ref;
  String type;

  SubCargoGrid({
    required this.grid,
    required this.path,
    required this.ref,
    required this.type,
  });

  factory SubCargoGrid.fromJson(Map<String, dynamic> json) => SubCargoGrid(
    grid: InteriorDimensions.fromJson(json["grid"]),
    path: json["path"],
    ref: json["ref"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "grid": grid.toJson(),
    "path": path,
    "ref": ref,
    "type": type,
  };
}

class InteriorDimensions {
  double x;
  double y;
  double z;

  InteriorDimensions({
    required this.x,
    required this.y,
    required this.z,
  });

  factory InteriorDimensions.fromJson(Map<String, dynamic> json) => InteriorDimensions(
    x: json["x"]?.toDouble(),
    y: json["y"]?.toDouble(),
    z: json["z"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
    "z": z,
  };
}

class Controller {
  String? chineseDescription;
  String? chineseName;
  IfcsParamsType? data;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  ScItemShieldEmitterParamsType? shield;
  int size;
  String? type;

  Controller({
    this.chineseDescription,
    required this.chineseName,
    required this.data,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    required this.shield,
    required this.size,
    this.type,
  });

  factory Controller.fromJson(Map<String, dynamic> json) => Controller(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: json["data"] == null ? null : IfcsParamsType.fromJson(json["data"]),
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    shield: json["shield"] == null ? null : ScItemShieldEmitterParamsType.fromJson(json["shield"]),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data?.toJson(),
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "shield": shield?.toJson(),
    "size": size,
    "type": type,
  };
}

class IfcsParamsType {
  Afterburner afterburner;
  double angularAccelDecay;
  double boostSpeedBackward;
  double boostSpeedForward;
  double dragMultiplier;
  double groundTurbulenceAmplitude;
  String intoxicationModifierRef;
  double liftMultiplier;
  double linearAccelDecay;
  Vector3 maxAngularVelocity;
  double maxSpeed;
  Vector3 negativeAngularScale;
  Vector3 negativeLinearScale;
  Vector3 positiveAngularScale;
  Vector3 positiveLinearScale;
  double precisionLandingMultiplier;
  double precisionMaxDistance;
  double precisionMinDistance;
  bool refreshCachesOnLandingMode;
  double scmMaxDragMultiplier;
  double scmSpeed;
  String thrusterImbalanceMessage;
  double torqueDistanceThreshold;
  double torqueImbalanceMultiplier;
  double turbulenceAmplitude;

  IfcsParamsType({
    required this.afterburner,
    required this.angularAccelDecay,
    required this.boostSpeedBackward,
    required this.boostSpeedForward,
    required this.dragMultiplier,
    required this.groundTurbulenceAmplitude,
    required this.intoxicationModifierRef,
    required this.liftMultiplier,
    required this.linearAccelDecay,
    required this.maxAngularVelocity,
    required this.maxSpeed,
    required this.negativeAngularScale,
    required this.negativeLinearScale,
    required this.positiveAngularScale,
    required this.positiveLinearScale,
    required this.precisionLandingMultiplier,
    required this.precisionMaxDistance,
    required this.precisionMinDistance,
    required this.refreshCachesOnLandingMode,
    required this.scmMaxDragMultiplier,
    required this.scmSpeed,
    required this.thrusterImbalanceMessage,
    required this.torqueDistanceThreshold,
    required this.torqueImbalanceMultiplier,
    required this.turbulenceAmplitude,
  });

  factory IfcsParamsType.fromJson(Map<String, dynamic> json) => IfcsParamsType(
    afterburner: Afterburner.fromJson(json["afterburner"]),
    angularAccelDecay: json["angularAccelDecay"]?.toDouble(),
    boostSpeedBackward: json["boostSpeedBackward"]?.toDouble(),
    boostSpeedForward: json["boostSpeedForward"]?.toDouble(),
    dragMultiplier: json["dragMultiplier"]?.toDouble(),
    groundTurbulenceAmplitude: json["groundTurbulenceAmplitude"]?.toDouble(),
    intoxicationModifierRef: json["intoxicationModifierRef"],
    liftMultiplier: json["liftMultiplier"]?.toDouble(),
    linearAccelDecay: json["linearAccelDecay"]?.toDouble(),
    maxAngularVelocity: Vector3.fromJson(json["maxAngularVelocity"]),
    maxSpeed: json["maxSpeed"]?.toDouble(),
    negativeAngularScale: Vector3.fromJson(json["negativeAngularScale"]),
    negativeLinearScale: Vector3.fromJson(json["negativeLinearScale"]),
    positiveAngularScale: Vector3.fromJson(json["positiveAngularScale"]),
    positiveLinearScale: Vector3.fromJson(json["positiveLinearScale"]),
    precisionLandingMultiplier: json["precisionLandingMultiplier"]?.toDouble(),
    precisionMaxDistance: json["precisionMaxDistance"]?.toDouble(),
    precisionMinDistance: json["precisionMinDistance"]?.toDouble(),
    refreshCachesOnLandingMode: json["refreshCachesOnLandingMode"],
    scmMaxDragMultiplier: json["scmMaxDragMultiplier"]?.toDouble(),
    scmSpeed: json["scmSpeed"]?.toDouble(),
    thrusterImbalanceMessage: json["thrusterImbalanceMessage"],
    torqueDistanceThreshold: json["torqueDistanceThreshold"]?.toDouble(),
    torqueImbalanceMultiplier: json["torqueImbalanceMultiplier"]?.toDouble(),
    turbulenceAmplitude: json["turbulenceAmplitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "afterburner": afterburner.toJson(),
    "angularAccelDecay": angularAccelDecay,
    "boostSpeedBackward": boostSpeedBackward,
    "boostSpeedForward": boostSpeedForward,
    "dragMultiplier": dragMultiplier,
    "groundTurbulenceAmplitude": groundTurbulenceAmplitude,
    "intoxicationModifierRef": intoxicationModifierRef,
    "liftMultiplier": liftMultiplier,
    "linearAccelDecay": linearAccelDecay,
    "maxAngularVelocity": maxAngularVelocity.toJson(),
    "maxSpeed": maxSpeed,
    "negativeAngularScale": negativeAngularScale.toJson(),
    "negativeLinearScale": negativeLinearScale.toJson(),
    "positiveAngularScale": positiveAngularScale.toJson(),
    "positiveLinearScale": positiveLinearScale.toJson(),
    "precisionLandingMultiplier": precisionLandingMultiplier,
    "precisionMaxDistance": precisionMaxDistance,
    "precisionMinDistance": precisionMinDistance,
    "refreshCachesOnLandingMode": refreshCachesOnLandingMode,
    "scmMaxDragMultiplier": scmMaxDragMultiplier,
    "scmSpeed": scmSpeed,
    "thrusterImbalanceMessage": thrusterImbalanceMessage,
    "torqueDistanceThreshold": torqueDistanceThreshold,
    "torqueImbalanceMultiplier": torqueImbalanceMultiplier,
    "turbulenceAmplitude": turbulenceAmplitude,
  };
}

class Afterburner {
  Vector3 afterburnAccelMultiplier;
  double afterburnAccelMultiplierControlSurface;
  Vector3 afterburnAngAccelMultiplier;
  double afterburnerCapacitorThresholdRatio;
  double capacitorAfterburnerAngularCost;
  double capacitorAfterburnerIdleCost;
  double capacitorAfterburnerLinearCost;
  String capacitorAssignmentInputOutputRegen;
  String capacitorAssignmentInputOutputRegenNavMode;
  String capacitorAssignmentInputOutputUsage;
  double capacitorMax;
  double capacitorRegenDelayAfterUse;
  double capacitorRegenPerSec;

  Afterburner({
    required this.afterburnAccelMultiplier,
    required this.afterburnAccelMultiplierControlSurface,
    required this.afterburnAngAccelMultiplier,
    required this.afterburnerCapacitorThresholdRatio,
    required this.capacitorAfterburnerAngularCost,
    required this.capacitorAfterburnerIdleCost,
    required this.capacitorAfterburnerLinearCost,
    required this.capacitorAssignmentInputOutputRegen,
    required this.capacitorAssignmentInputOutputRegenNavMode,
    required this.capacitorAssignmentInputOutputUsage,
    required this.capacitorMax,
    required this.capacitorRegenDelayAfterUse,
    required this.capacitorRegenPerSec,
  });

  factory Afterburner.fromJson(Map<String, dynamic> json) => Afterburner(
    afterburnAccelMultiplier: Vector3.fromJson(json["afterburnAccelMultiplier"]),
    afterburnAccelMultiplierControlSurface: json["afterburnAccelMultiplierControlSurface"]?.toDouble(),
    afterburnAngAccelMultiplier: Vector3.fromJson(json["afterburnAngAccelMultiplier"]),
    afterburnerCapacitorThresholdRatio: json["afterburnerCapacitorThresholdRatio"]?.toDouble(),
    capacitorAfterburnerAngularCost: json["capacitorAfterburnerAngularCost"]?.toDouble(),
    capacitorAfterburnerIdleCost: json["capacitorAfterburnerIdleCost"]?.toDouble(),
    capacitorAfterburnerLinearCost: json["capacitorAfterburnerLinearCost"]?.toDouble(),
    capacitorAssignmentInputOutputRegen: json["capacitorAssignmentInputOutputRegen"],
    capacitorAssignmentInputOutputRegenNavMode: json["capacitorAssignmentInputOutputRegenNavMode"],
    capacitorAssignmentInputOutputUsage: json["capacitorAssignmentInputOutputUsage"],
    capacitorMax: json["capacitorMax"]?.toDouble(),
    capacitorRegenDelayAfterUse: json["capacitorRegenDelayAfterUse"]?.toDouble(),
    capacitorRegenPerSec: json["capacitorRegenPerSec"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "afterburnAccelMultiplier": afterburnAccelMultiplier.toJson(),
    "afterburnAccelMultiplierControlSurface": afterburnAccelMultiplierControlSurface,
    "afterburnAngAccelMultiplier": afterburnAngAccelMultiplier.toJson(),
    "afterburnerCapacitorThresholdRatio": afterburnerCapacitorThresholdRatio,
    "capacitorAfterburnerAngularCost": capacitorAfterburnerAngularCost,
    "capacitorAfterburnerIdleCost": capacitorAfterburnerIdleCost,
    "capacitorAfterburnerLinearCost": capacitorAfterburnerLinearCost,
    "capacitorAssignmentInputOutputRegen": capacitorAssignmentInputOutputRegen,
    "capacitorAssignmentInputOutputRegenNavMode": capacitorAssignmentInputOutputRegenNavMode,
    "capacitorAssignmentInputOutputUsage": capacitorAssignmentInputOutputUsage,
    "capacitorMax": capacitorMax,
    "capacitorRegenDelayAfterUse": capacitorRegenDelayAfterUse,
    "capacitorRegenPerSec": capacitorRegenPerSec,
  };
}

class Vector3 {
  double x;
  double y;
  double z;

  Vector3({
    required this.x,
    required this.y,
    required this.z,
  });

  factory Vector3.fromJson(Map<String, dynamic> json) => Vector3(
    x: json["x"]?.toDouble(),
    y: json["y"]?.toDouble(),
    z: json["z"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
    "z": z,
  };
}

class ScItemShieldEmitterParamsType {
  String capacitorAssignmentInputOutputRegen;
  String capacitorAssignmentInputOutputRegenNavMode;
  String capacitorAssignmentInputOutputResistance;
  String faceType;
  double maxElectricalChargeDamageRate;
  double maxReallocation;
  double reconfigurationCooldown;
  String regenerateEffectTag;
  InputOutputMapping? regenMapping;
  InputOutputMapping? resistanceMapping;
  String shieldEffectType;
  String shieldMeshDeprecated;

  ScItemShieldEmitterParamsType({
    required this.capacitorAssignmentInputOutputRegen,
    required this.capacitorAssignmentInputOutputRegenNavMode,
    required this.capacitorAssignmentInputOutputResistance,
    required this.faceType,
    required this.maxElectricalChargeDamageRate,
    required this.maxReallocation,
    required this.reconfigurationCooldown,
    required this.regenerateEffectTag,
    this.regenMapping,
    this.resistanceMapping,
    required this.shieldEffectType,
    required this.shieldMeshDeprecated,
  });

  factory ScItemShieldEmitterParamsType.fromJson(Map<String, dynamic> json) => ScItemShieldEmitterParamsType(
    capacitorAssignmentInputOutputRegen: json["capacitorAssignmentInputOutputRegen"],
    capacitorAssignmentInputOutputRegenNavMode: json["capacitorAssignmentInputOutputRegenNavMode"],
    capacitorAssignmentInputOutputResistance: json["capacitorAssignmentInputOutputResistance"],
    faceType: json["FaceType"],
    maxElectricalChargeDamageRate: json["MaxElectricalChargeDamageRate"]?.toDouble(),
    maxReallocation: json["MaxReallocation"]?.toDouble(),
    reconfigurationCooldown: json["ReconfigurationCooldown"]?.toDouble(),
    regenerateEffectTag: json["regenerateEffectTag"],
    regenMapping: json["regenMapping"] == null ? null : InputOutputMapping.fromJson(json["regenMapping"]),
    resistanceMapping: json["resistanceMapping"] == null ? null : InputOutputMapping.fromJson(json["resistanceMapping"]),
    shieldEffectType: json["shieldEffectType"],
    shieldMeshDeprecated: json["shieldMeshDeprecated"],
  );

  Map<String, dynamic> toJson() => {
    "capacitorAssignmentInputOutputRegen": capacitorAssignmentInputOutputRegen,
    "capacitorAssignmentInputOutputRegenNavMode": capacitorAssignmentInputOutputRegenNavMode,
    "capacitorAssignmentInputOutputResistance": capacitorAssignmentInputOutputResistance,
    "FaceType": faceType,
    "MaxElectricalChargeDamageRate": maxElectricalChargeDamageRate,
    "MaxReallocation": maxReallocation,
    "ReconfigurationCooldown": reconfigurationCooldown,
    "regenerateEffectTag": regenerateEffectTag,
    "regenMapping": regenMapping?.toJson(),
    "resistanceMapping": resistanceMapping?.toJson(),
    "shieldEffectType": shieldEffectType,
    "shieldMeshDeprecated": shieldMeshDeprecated,
  };
}

class InputOutputMapping {
  List<Point> points;

  InputOutputMapping({
    required this.points,
  });

  factory InputOutputMapping.fromJson(Map<String, dynamic> json) => InputOutputMapping(
    points: List<Point>.from(json["points"].map((x) => Point.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "points": List<dynamic>.from(points.map((x) => x.toJson())),
  };
}

class Point {
  Vec2 vec2;

  Point({
    required this.vec2,
  });

  factory Point.fromJson(Map<String, dynamic> json) => Point(
    vec2: Vec2.fromJson(json["Vec2"]),
  );

  Map<String, dynamic> toJson() => {
    "Vec2": vec2.toJson(),
  };
}

class Vec2 {
  double x;
  double y;

  Vec2({
    required this.x,
    required this.y,
  });

  factory Vec2.fromJson(Map<String, dynamic> json) => Vec2(
    x: json["x"]?.toDouble(),
    y: json["y"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
  };
}

class Cooler {
  String? chineseDescription;
  String? chineseName;
  ScItemCoolerParams data;
  String? description;
  SDistortionParamsType? distortion;
  HealthInfo healthInfo;
  EntityComponentHeatConnection heat;
  String? manufacturer;
  String name;
  String? path;
  EntityComponentPowerConnection power;
  String ref;
  ResourceConnection resourceConnection;
  List<ShopInfo> shopInfo;
  int size;
  String? type;

  Cooler({
    this.chineseDescription,
    required this.chineseName,
    required this.data,
    this.description,
    this.distortion,
    required this.healthInfo,
    required this.heat,
    this.manufacturer,
    required this.name,
    this.path,
    required this.power,
    required this.ref,
    required this.resourceConnection,
    required this.shopInfo,
    required this.size,
    this.type,
  });

  factory Cooler.fromJson(Map<String, dynamic> json) => Cooler(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: ScItemCoolerParams.fromJson(json["data"]),
    description: json["description"],
    distortion: json["distortion"] == null ? null : SDistortionParamsType.fromJson(json["distortion"]),
    healthInfo: HealthInfo.fromJson(json["health_info"]),
    heat: EntityComponentHeatConnection.fromJson(json["heat"]),
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    power: EntityComponentPowerConnection.fromJson(json["power"]),
    ref: json["ref"],
    resourceConnection: ResourceConnection.fromJson(json["resource_connection"]),
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data.toJson(),
    "description": description,
    "distortion": distortion?.toJson(),
    "health_info": healthInfo.toJson(),
    "heat": heat.toJson(),
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "power": power.toJson(),
    "ref": ref,
    "resource_connection": resourceConnection.toJson(),
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "type": type,
  };
}

class ScItemCoolerParams {
  double coolingRate;
  double suppressionHeatFactor;
  double suppressionIrFactor;

  ScItemCoolerParams({
    required this.coolingRate,
    required this.suppressionHeatFactor,
    required this.suppressionIrFactor,
  });

  factory ScItemCoolerParams.fromJson(Map<String, dynamic> json) => ScItemCoolerParams(
    coolingRate: json["CoolingRate"]?.toDouble(),
    suppressionHeatFactor: json["SuppressionHeatFactor"]?.toDouble(),
    suppressionIrFactor: json["SuppressionIRFactor"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "CoolingRate": coolingRate,
    "SuppressionHeatFactor": suppressionHeatFactor,
    "SuppressionIRFactor": suppressionIrFactor,
  };
}

class SDistortionParamsType {
  double decayDelay;
  double decayRate;
  double maximum;
  bool powerChangeOnlyAtMaxDistortion;
  double powerRatioAtMaxDistortion;
  double recoveryRatio;
  double warningRatio;

  SDistortionParamsType({
    required this.decayDelay,
    required this.decayRate,
    required this.maximum,
    required this.powerChangeOnlyAtMaxDistortion,
    required this.powerRatioAtMaxDistortion,
    required this.recoveryRatio,
    required this.warningRatio,
  });

  factory SDistortionParamsType.fromJson(Map<String, dynamic> json) => SDistortionParamsType(
    decayDelay: json["DecayDelay"]?.toDouble(),
    decayRate: json["DecayRate"]?.toDouble(),
    maximum: json["Maximum"]?.toDouble(),
    powerChangeOnlyAtMaxDistortion: json["PowerChangeOnlyAtMaxDistortion"],
    powerRatioAtMaxDistortion: json["PowerRatioAtMaxDistortion"]?.toDouble(),
    recoveryRatio: json["RecoveryRatio"]?.toDouble(),
    warningRatio: json["WarningRatio"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "DecayDelay": decayDelay,
    "DecayRate": decayRate,
    "Maximum": maximum,
    "PowerChangeOnlyAtMaxDistortion": powerChangeOnlyAtMaxDistortion,
    "PowerRatioAtMaxDistortion": powerRatioAtMaxDistortion,
    "RecoveryRatio": recoveryRatio,
    "WarningRatio": warningRatio,
  };
}

class HealthInfo {
  DamageResistances damageResistances;
  double health;

  HealthInfo({
    required this.damageResistances,
    required this.health,
  });

  factory HealthInfo.fromJson(Map<String, dynamic> json) => HealthInfo(
    damageResistances: DamageResistances.fromJson(json["damage_resistances"]),
    health: json["health"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "damage_resistances": damageResistances.toJson(),
    "health": health,
  };
}

class DamageResistances {
  double? damageBiochemical;
  double? damageDistortion;
  double? damageEnergy;
  double? damagePhysical;
  double? damageStun;
  double? damageThermal;

  DamageResistances({
    this.damageBiochemical,
    this.damageDistortion,
    this.damageEnergy,
    this.damagePhysical,
    this.damageStun,
    this.damageThermal,
  });

  factory DamageResistances.fromJson(Map<String, dynamic> json) => DamageResistances(
    damageBiochemical: json["damage_biochemical"]?.toDouble(),
    damageDistortion: json["damage_distortion"]?.toDouble(),
    damageEnergy: json["damage_energy"]?.toDouble(),
    damagePhysical: json["damage_physical"]?.toDouble(),
    damageStun: json["damage_stun"]?.toDouble(),
    damageThermal: json["damage_thermal"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "damage_biochemical": damageBiochemical,
    "damage_distortion": damageDistortion,
    "damage_energy": damageEnergy,
    "damage_physical": damagePhysical,
    "damage_stun": damageStun,
    "damage_thermal": damageThermal,
  };
}

class EntityComponentHeatConnection {
  double mass;
  double maxCoolingRate;
  double maxTemperature;
  double minTemperature;
  double misfireMaxTemperature;
  double misfireMinTemperature;
  double overclockThresholdMaxHeat;
  double overclockThresholdMinHeat;
  double overheatTemperature;
  double overpowerHeat;
  double recoveryTemperature;
  double specificHeatCapacity;
  double startCoolingTemperature;
  double startIrTemperature;
  double surfaceArea;
  double temperatureToIr;
  double thermalConductivity;
  double thermalEnergyBase;
  double thermalEnergyDraw;

  EntityComponentHeatConnection({
    required this.mass,
    required this.maxCoolingRate,
    required this.maxTemperature,
    required this.minTemperature,
    required this.misfireMaxTemperature,
    required this.misfireMinTemperature,
    required this.overclockThresholdMaxHeat,
    required this.overclockThresholdMinHeat,
    required this.overheatTemperature,
    required this.overpowerHeat,
    required this.recoveryTemperature,
    required this.specificHeatCapacity,
    required this.startCoolingTemperature,
    required this.startIrTemperature,
    required this.surfaceArea,
    required this.temperatureToIr,
    required this.thermalConductivity,
    required this.thermalEnergyBase,
    required this.thermalEnergyDraw,
  });

  factory EntityComponentHeatConnection.fromJson(Map<String, dynamic> json) => EntityComponentHeatConnection(
    mass: json["Mass"]?.toDouble(),
    maxCoolingRate: json["MaxCoolingRate"]?.toDouble(),
    maxTemperature: json["MaxTemperature"]?.toDouble(),
    minTemperature: json["MinTemperature"]?.toDouble(),
    misfireMaxTemperature: json["MisfireMaxTemperature"]?.toDouble(),
    misfireMinTemperature: json["MisfireMinTemperature"]?.toDouble(),
    overclockThresholdMaxHeat: json["OverclockThresholdMaxHeat"]?.toDouble(),
    overclockThresholdMinHeat: json["OverclockThresholdMinHeat"]?.toDouble(),
    overheatTemperature: json["OverheatTemperature"]?.toDouble(),
    overpowerHeat: json["OverpowerHeat"]?.toDouble(),
    recoveryTemperature: json["RecoveryTemperature"]?.toDouble(),
    specificHeatCapacity: json["SpecificHeatCapacity"]?.toDouble(),
    startCoolingTemperature: json["StartCoolingTemperature"]?.toDouble(),
    startIrTemperature: json["StartIRTemperature"]?.toDouble(),
    surfaceArea: json["SurfaceArea"]?.toDouble(),
    temperatureToIr: json["TemperatureToIR"]?.toDouble(),
    thermalConductivity: json["ThermalConductivity"]?.toDouble(),
    thermalEnergyBase: json["ThermalEnergyBase"]?.toDouble(),
    thermalEnergyDraw: json["ThermalEnergyDraw"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Mass": mass,
    "MaxCoolingRate": maxCoolingRate,
    "MaxTemperature": maxTemperature,
    "MinTemperature": minTemperature,
    "MisfireMaxTemperature": misfireMaxTemperature,
    "MisfireMinTemperature": misfireMinTemperature,
    "OverclockThresholdMaxHeat": overclockThresholdMaxHeat,
    "OverclockThresholdMinHeat": overclockThresholdMinHeat,
    "OverheatTemperature": overheatTemperature,
    "OverpowerHeat": overpowerHeat,
    "RecoveryTemperature": recoveryTemperature,
    "SpecificHeatCapacity": specificHeatCapacity,
    "StartCoolingTemperature": startCoolingTemperature,
    "StartIRTemperature": startIrTemperature,
    "SurfaceArea": surfaceArea,
    "TemperatureToIR": temperatureToIr,
    "ThermalConductivity": thermalConductivity,
    "ThermalEnergyBase": thermalEnergyBase,
    "ThermalEnergyDraw": thermalEnergyDraw,
  };
}

class EntityComponentPowerConnection {
  double decayRateOfEm;
  bool displayedInPoweredItemList;
  bool isOverclockable;
  bool isThrottleable;
  double overclockPerformance;
  double overclockThresholdMax;
  double overclockThresholdMin;
  double overpowerPerformance;
  double powerBase;
  double powerDraw;
  double powerToEm;
  int safeguardPriority;
  double timeToReachDrawRequest;
  double warningDelayTime;
  double warningDisplayTime;

  EntityComponentPowerConnection({
    required this.decayRateOfEm,
    required this.displayedInPoweredItemList,
    required this.isOverclockable,
    required this.isThrottleable,
    required this.overclockPerformance,
    required this.overclockThresholdMax,
    required this.overclockThresholdMin,
    required this.overpowerPerformance,
    required this.powerBase,
    required this.powerDraw,
    required this.powerToEm,
    required this.safeguardPriority,
    required this.timeToReachDrawRequest,
    required this.warningDelayTime,
    required this.warningDisplayTime,
  });

  factory EntityComponentPowerConnection.fromJson(Map<String, dynamic> json) => EntityComponentPowerConnection(
    decayRateOfEm: json["DecayRateOfEM"]?.toDouble(),
    displayedInPoweredItemList: json["DisplayedInPoweredItemList"],
    isOverclockable: json["IsOverclockable"],
    isThrottleable: json["IsThrottleable"],
    overclockPerformance: json["OverclockPerformance"]?.toDouble(),
    overclockThresholdMax: json["OverclockThresholdMax"]?.toDouble(),
    overclockThresholdMin: json["OverclockThresholdMin"]?.toDouble(),
    overpowerPerformance: json["OverpowerPerformance"]?.toDouble(),
    powerBase: json["PowerBase"]?.toDouble(),
    powerDraw: json["PowerDraw"]?.toDouble(),
    powerToEm: json["PowerToEM"]?.toDouble(),
    safeguardPriority: json["SafeguardPriority"],
    timeToReachDrawRequest: json["TimeToReachDrawRequest"]?.toDouble(),
    warningDelayTime: json["WarningDelayTime"]?.toDouble(),
    warningDisplayTime: json["WarningDisplayTime"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "DecayRateOfEM": decayRateOfEm,
    "DisplayedInPoweredItemList": displayedInPoweredItemList,
    "IsOverclockable": isOverclockable,
    "IsThrottleable": isThrottleable,
    "OverclockPerformance": overclockPerformance,
    "OverclockThresholdMax": overclockThresholdMax,
    "OverclockThresholdMin": overclockThresholdMin,
    "OverpowerPerformance": overpowerPerformance,
    "PowerBase": powerBase,
    "PowerDraw": powerDraw,
    "PowerToEM": powerToEm,
    "SafeguardPriority": safeguardPriority,
    "TimeToReachDrawRequest": timeToReachDrawRequest,
    "WarningDelayTime": warningDelayTime,
    "WarningDisplayTime": warningDisplayTime,
  };
}

class ResourceConnection {
  double minimumConsumptionFraction;
  double standardResourceUnits;

  ResourceConnection({
    required this.minimumConsumptionFraction,
    required this.standardResourceUnits,
  });

  factory ResourceConnection.fromJson(Map<String, dynamic> json) => ResourceConnection(
    minimumConsumptionFraction: json["minimumConsumptionFraction"]?.toDouble(),
    standardResourceUnits: json["standardResourceUnits"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "minimumConsumptionFraction": minimumConsumptionFraction,
    "standardResourceUnits": standardResourceUnits,
  };
}

class ShopInfo {
  int basePrice;
  String? chineseLocation;
  String? chineseName;
  String location;
  String name;
  int price;

  ShopInfo({
    required this.basePrice,
    this.chineseLocation,
    this.chineseName,
    required this.location,
    required this.name,
    required this.price,
  });

  factory ShopInfo.fromJson(Map<String, dynamic> json) => ShopInfo(
    basePrice: json["base_price"],
    chineseLocation: json["chinese_location"],
    chineseName: json["chinese_name"],
    location: json["location"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "base_price": basePrice,
    "chinese_location": chineseLocation,
    "chinese_name": chineseName,
    "location": location,
    "name": name,
    "price": price,
  };
}

class Flare {
  double lifetime;
  int number;

  Flare({
    required this.lifetime,
    required this.number,
  });

  factory Flare.fromJson(Map<String, dynamic> json) => Flare(
    lifetime: json["lifetime"]?.toDouble(),
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "lifetime": lifetime,
    "number": number,
  };
}

class FuelIntake {
  String? chineseDescription;
  String? chineseName;
  ScItemFuelIntakeParamsType? data;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  EntityComponentPowerConnection power;
  String ref;
  int size;
  String? type;

  FuelIntake({
    this.chineseDescription,
    required this.chineseName,
    this.data,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.power,
    required this.ref,
    required this.size,
    this.type,
  });

  factory FuelIntake.fromJson(Map<String, dynamic> json) => FuelIntake(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: json["data"] == null ? null : ScItemFuelIntakeParamsType.fromJson(json["data"]),
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    power: EntityComponentPowerConnection.fromJson(json["power"]),
    ref: json["ref"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data?.toJson(),
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "power": power.toJson(),
    "ref": ref,
    "size": size,
    "type": type,
  };
}

class ScItemFuelIntakeParamsType {
  double fuelPushRate;
  double minimumRate;

  ScItemFuelIntakeParamsType({
    required this.fuelPushRate,
    required this.minimumRate,
  });

  factory ScItemFuelIntakeParamsType.fromJson(Map<String, dynamic> json) => ScItemFuelIntakeParamsType(
    fuelPushRate: json["fuelPushRate"]?.toDouble(),
    minimumRate: json["minimumRate"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "fuelPushRate": fuelPushRate,
    "minimumRate": minimumRate,
  };
}

class FuelTank {
  String? chineseDescription;
  String? chineseName;
  ScItemFuelTankParams data;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  List<ShopInfo> shopInfo;
  int size;
  String? type;

  FuelTank({
    this.chineseDescription,
    required this.chineseName,
    required this.data,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    required this.shopInfo,
    required this.size,
    this.type,
  });

  factory FuelTank.fromJson(Map<String, dynamic> json) => FuelTank(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: ScItemFuelTankParams.fromJson(json["data"]),
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data.toJson(),
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "type": type,
  };
}

class ScItemFuelTankParams {
  double capacity;
  double continueFuelAboveLevel;
  double drainRate;
  double fillRate;
  double haltFuelBelowLevel;
  double reserveCapacity;

  ScItemFuelTankParams({
    required this.capacity,
    required this.continueFuelAboveLevel,
    required this.drainRate,
    required this.fillRate,
    required this.haltFuelBelowLevel,
    required this.reserveCapacity,
  });

  factory ScItemFuelTankParams.fromJson(Map<String, dynamic> json) => ScItemFuelTankParams(
    capacity: json["capacity"]?.toDouble(),
    continueFuelAboveLevel: json["continueFuelAboveLevel"]?.toDouble(),
    drainRate: json["drainRate"]?.toDouble(),
    fillRate: json["fillRate"]?.toDouble(),
    haltFuelBelowLevel: json["haltFuelBelowLevel"]?.toDouble(),
    reserveCapacity: json["reserveCapacity"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "capacity": capacity,
    "continueFuelAboveLevel": continueFuelAboveLevel,
    "drainRate": drainRate,
    "fillRate": fillRate,
    "haltFuelBelowLevel": haltFuelBelowLevel,
    "reserveCapacity": reserveCapacity,
  };
}

class Hull {
  double health;
  String name;

  Hull({
    required this.health,
    required this.name,
  });

  factory Hull.fromJson(Map<String, dynamic> json) => Hull(
    health: json["health"]?.toDouble(),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "health": health,
    "name": name,
  };
}

class LifeSupport {
  String? chineseDescription;
  String? chineseName;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  ResourceConnection resourceConnection;
  int size;
  String? type;

  LifeSupport({
    this.chineseDescription,
    required this.chineseName,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    required this.resourceConnection,
    required this.size,
    this.type,
  });

  factory LifeSupport.fromJson(Map<String, dynamic> json) => LifeSupport(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    resourceConnection: ResourceConnection.fromJson(json["resource_connection"]),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "resource_connection": resourceConnection.toJson(),
    "size": size,
    "type": type,
  };
}

class MissileRack {
  String? chineseDescription;
  String? chineseName;
  String? description;
  List<String>? loadout;
  String? manufacturer;
  String name;
  String? path;
  List<Port> ports;
  EntityComponentPowerConnection power;
  String ref;
  List<ShopInfo> shopInfo;
  int size;
  String? type;

  MissileRack({
    this.chineseDescription,
    required this.chineseName,
    this.description,
    this.loadout,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ports,
    required this.power,
    required this.ref,
    required this.shopInfo,
    required this.size,
    this.type,
  });

  factory MissileRack.fromJson(Map<String, dynamic> json) => MissileRack(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    loadout: json["loadout"] == null ? [] : List<String>.from(json["loadout"]!.map((x) => x)),
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ports: List<Port>.from(json["ports"].map((x) => Port.fromJson(x))),
    power: EntityComponentPowerConnection.fromJson(json["power"]),
    ref: json["ref"],
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "loadout": loadout == null ? [] : List<dynamic>.from(loadout!.map((x) => x)),
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ports": List<dynamic>.from(ports.map((x) => x.toJson())),
    "power": power.toJson(),
    "ref": ref,
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "type": type,
  };
}

class Port {
  int maxSize;
  int minSize;
  String name;
  String type;

  Port({
    required this.maxSize,
    required this.minSize,
    required this.name,
    required this.type,
  });

  factory Port.fromJson(Map<String, dynamic> json) => Port(
    maxSize: json["max_size"],
    minSize: json["min_size"],
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "max_size": maxSize,
    "min_size": minSize,
    "name": name,
    "type": type,
  };
}

class Skin {
  String? chineseDescription;
  String? chineseName;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  int? size;
  String? type;

  Skin({
    this.chineseDescription,
    required this.chineseName,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    this.size,
    this.type,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "size": size,
    "type": type,
  };
}

class PersonalStorage {
  String? chineseDescription;
  String? chineseName;
  SInventoryParams data;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  int size;
  String? type;

  PersonalStorage({
    this.chineseDescription,
    required this.chineseName,
    required this.data,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    required this.size,
    this.type,
  });

  factory PersonalStorage.fromJson(Map<String, dynamic> json) => PersonalStorage(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: SInventoryParams.fromJson(json["data"]),
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data.toJson(),
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "size": size,
    "type": type,
  };
}

class SInventoryParams {
  Capacity capacity;

  SInventoryParams({
    required this.capacity,
  });

  factory SInventoryParams.fromJson(Map<String, dynamic> json) => SInventoryParams(
    capacity: Capacity.fromJson(json["capacity"]),
  );

  Map<String, dynamic> toJson() => {
    "capacity": capacity.toJson(),
  };
}

class Capacity {
  int centiScu;

  Capacity({
    required this.centiScu,
  });

  factory Capacity.fromJson(Map<String, dynamic> json) => Capacity(
    centiScu: json["centiSCU"],
  );

  Map<String, dynamic> toJson() => {
    "centiSCU": centiScu,
  };
}

class PowerPlant {
  String? chineseDescription;
  String? chineseName;
  String? description;
  SDistortionParamsType? distortion;
  HealthInfo healthInfo;
  EntityComponentHeatConnection heat;
  String? manufacturer;
  String name;
  String? path;
  EntityComponentPowerConnection power;
  String ref;
  ResourceConnection resourceConnection;
  List<ShopInfo> shopInfo;
  int size;
  String? type;

  PowerPlant({
    this.chineseDescription,
    required this.chineseName,
    this.description,
    this.distortion,
    required this.healthInfo,
    required this.heat,
    this.manufacturer,
    required this.name,
    this.path,
    required this.power,
    required this.ref,
    required this.resourceConnection,
    required this.shopInfo,
    required this.size,
    this.type,
  });

  factory PowerPlant.fromJson(Map<String, dynamic> json) => PowerPlant(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    distortion: json["distortion"] == null ? null : SDistortionParamsType.fromJson(json["distortion"]),
    healthInfo: HealthInfo.fromJson(json["health_info"]),
    heat: EntityComponentHeatConnection.fromJson(json["heat"]),
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    power: EntityComponentPowerConnection.fromJson(json["power"]),
    ref: json["ref"],
    resourceConnection: ResourceConnection.fromJson(json["resource_connection"]),
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "distortion": distortion?.toJson(),
    "health_info": healthInfo.toJson(),
    "heat": heat.toJson(),
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "power": power.toJson(),
    "ref": ref,
    "resource_connection": resourceConnection.toJson(),
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "type": type,
  };
}

class QuantumDrive {
  String? chineseDescription;
  String? chineseName;
  ScItemQuantumDriveParams data;
  String? description;
  SDistortionParamsType? distortion;
  HealthInfo healthInfo;
  EntityComponentHeatConnection heat;
  String? manufacturer;
  String name;
  String? path;
  EntityComponentPowerConnection power;
  String ref;
  ResourceConnection resourceConnection;
  List<ShopInfo> shopInfo;
  int size;
  String? type;

  QuantumDrive({
    this.chineseDescription,
    required this.chineseName,
    required this.data,
    this.description,
    this.distortion,
    required this.healthInfo,
    required this.heat,
    this.manufacturer,
    required this.name,
    this.path,
    required this.power,
    required this.ref,
    required this.resourceConnection,
    required this.shopInfo,
    required this.size,
    this.type,
  });

  factory QuantumDrive.fromJson(Map<String, dynamic> json) => QuantumDrive(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: ScItemQuantumDriveParams.fromJson(json["data"]),
    description: json["description"],
    distortion: json["distortion"] == null ? null : SDistortionParamsType.fromJson(json["distortion"]),
    healthInfo: HealthInfo.fromJson(json["health_info"]),
    heat: EntityComponentHeatConnection.fromJson(json["heat"]),
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    power: EntityComponentPowerConnection.fromJson(json["power"]),
    ref: json["ref"],
    resourceConnection: ResourceConnection.fromJson(json["resource_connection"]),
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data.toJson(),
    "description": description,
    "distortion": distortion?.toJson(),
    "health_info": healthInfo.toJson(),
    "heat": heat.toJson(),
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "power": power.toJson(),
    "ref": ref,
    "resource_connection": resourceConnection.toJson(),
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "type": type,
  };
}

class ScItemQuantumDriveParams {
  double disconnectRange;
  HeatParams heatParams;
  double jumpRange;
  Params params;
  double quantumFuelRequirement;
  SplineJumpParams splineJumpParams;
  String tracePoint;

  ScItemQuantumDriveParams({
    required this.disconnectRange,
    required this.heatParams,
    required this.jumpRange,
    required this.params,
    required this.quantumFuelRequirement,
    required this.splineJumpParams,
    required this.tracePoint,
  });

  factory ScItemQuantumDriveParams.fromJson(Map<String, dynamic> json) => ScItemQuantumDriveParams(
    disconnectRange: json["disconnectRange"]?.toDouble(),
    heatParams: HeatParams.fromJson(json["heatParams"]),
    jumpRange: json["jumpRange"]?.toDouble(),
    params: Params.fromJson(json["params"]),
    quantumFuelRequirement: json["quantumFuelRequirement"]?.toDouble(),
    splineJumpParams: SplineJumpParams.fromJson(json["splineJumpParams"]),
    tracePoint: json["tracePoint"],
  );

  Map<String, dynamic> toJson() => {
    "disconnectRange": disconnectRange,
    "heatParams": heatParams.toJson(),
    "jumpRange": jumpRange,
    "params": params.toJson(),
    "quantumFuelRequirement": quantumFuelRequirement,
    "splineJumpParams": splineJumpParams.toJson(),
    "tracePoint": tracePoint,
  };
}

class HeatParams {
  double inFlightThermalEnergyDraw;
  double postRampDownThermalEnergyDraw;
  double preRampUpThermalEnergyDraw;
  double rampDownThermalEnergyDraw;
  double rampUpThermalEnergyDraw;

  HeatParams({
    required this.inFlightThermalEnergyDraw,
    required this.postRampDownThermalEnergyDraw,
    required this.preRampUpThermalEnergyDraw,
    required this.rampDownThermalEnergyDraw,
    required this.rampUpThermalEnergyDraw,
  });

  factory HeatParams.fromJson(Map<String, dynamic> json) => HeatParams(
    inFlightThermalEnergyDraw: json["inFlightThermalEnergyDraw"]?.toDouble(),
    postRampDownThermalEnergyDraw: json["postRampDownThermalEnergyDraw"]?.toDouble(),
    preRampUpThermalEnergyDraw: json["preRampUpThermalEnergyDraw"]?.toDouble(),
    rampDownThermalEnergyDraw: json["rampDownThermalEnergyDraw"]?.toDouble(),
    rampUpThermalEnergyDraw: json["rampUpThermalEnergyDraw"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "inFlightThermalEnergyDraw": inFlightThermalEnergyDraw,
    "postRampDownThermalEnergyDraw": postRampDownThermalEnergyDraw,
    "preRampUpThermalEnergyDraw": preRampUpThermalEnergyDraw,
    "rampDownThermalEnergyDraw": rampDownThermalEnergyDraw,
    "rampUpThermalEnergyDraw": rampUpThermalEnergyDraw,
  };
}

class Params {
  double calibrationDelayInSeconds;
  double calibrationProcessAngleLimit;
  double calibrationRate;
  double calibrationWarningAngleLimit;
  double cooldownTime;
  double driveSpeed;
  double engageSpeed;
  double interdictionEffectTime;
  double maxCalibrationRequirement;
  double minCalibrationRequirement;
  double shaderNodeEngageVelocity;
  double shaderNodeMaxStrengthVelocity;
  double shaderNodeShutdownVelocity;
  double spoolUpTime;
  double stageOneAccelRate;
  double stageTwoAccelRate;
  double vfxEntryFlashVelocity;
  double vfxExitEffectVelocity;
  double vfxPinchEffectTime;
  double vfxPinchMaxVelocity;
  double vfxSpoolEndVelocity;
  double vfxTrailStartVelocity;
  double vfxTravelEffectEndVelocity;
  double vfxTravelEffectStartVelocity;

  Params({
    required this.calibrationDelayInSeconds,
    required this.calibrationProcessAngleLimit,
    required this.calibrationRate,
    required this.calibrationWarningAngleLimit,
    required this.cooldownTime,
    required this.driveSpeed,
    required this.engageSpeed,
    required this.interdictionEffectTime,
    required this.maxCalibrationRequirement,
    required this.minCalibrationRequirement,
    required this.shaderNodeEngageVelocity,
    required this.shaderNodeMaxStrengthVelocity,
    required this.shaderNodeShutdownVelocity,
    required this.spoolUpTime,
    required this.stageOneAccelRate,
    required this.stageTwoAccelRate,
    required this.vfxEntryFlashVelocity,
    required this.vfxExitEffectVelocity,
    required this.vfxPinchEffectTime,
    required this.vfxPinchMaxVelocity,
    required this.vfxSpoolEndVelocity,
    required this.vfxTrailStartVelocity,
    required this.vfxTravelEffectEndVelocity,
    required this.vfxTravelEffectStartVelocity,
  });

  factory Params.fromJson(Map<String, dynamic> json) => Params(
    calibrationDelayInSeconds: json["calibrationDelayInSeconds"]?.toDouble(),
    calibrationProcessAngleLimit: json["calibrationProcessAngleLimit"]?.toDouble(),
    calibrationRate: json["calibrationRate"]?.toDouble(),
    calibrationWarningAngleLimit: json["calibrationWarningAngleLimit"]?.toDouble(),
    cooldownTime: json["cooldownTime"]?.toDouble(),
    driveSpeed: json["driveSpeed"]?.toDouble(),
    engageSpeed: json["engageSpeed"]?.toDouble(),
    interdictionEffectTime: json["interdictionEffectTime"]?.toDouble(),
    maxCalibrationRequirement: json["maxCalibrationRequirement"]?.toDouble(),
    minCalibrationRequirement: json["minCalibrationRequirement"]?.toDouble(),
    shaderNodeEngageVelocity: json["ShaderNodeEngageVelocity"]?.toDouble(),
    shaderNodeMaxStrengthVelocity: json["ShaderNodeMaxStrengthVelocity"]?.toDouble(),
    shaderNodeShutdownVelocity: json["ShaderNodeShutdownVelocity"]?.toDouble(),
    spoolUpTime: json["spoolUpTime"]?.toDouble(),
    stageOneAccelRate: json["stageOneAccelRate"]?.toDouble(),
    stageTwoAccelRate: json["stageTwoAccelRate"]?.toDouble(),
    vfxEntryFlashVelocity: json["VFXEntryFlashVelocity"]?.toDouble(),
    vfxExitEffectVelocity: json["VFXExitEffectVelocity"]?.toDouble(),
    vfxPinchEffectTime: json["VFXPinchEffectTime"]?.toDouble(),
    vfxPinchMaxVelocity: json["VFXPinchMaxVelocity"]?.toDouble(),
    vfxSpoolEndVelocity: json["VFXSpoolEndVelocity"]?.toDouble(),
    vfxTrailStartVelocity: json["VFXTrailStartVelocity"]?.toDouble(),
    vfxTravelEffectEndVelocity: json["VFXTravelEffectEndVelocity"]?.toDouble(),
    vfxTravelEffectStartVelocity: json["VFXTravelEffectStartVelocity"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "calibrationDelayInSeconds": calibrationDelayInSeconds,
    "calibrationProcessAngleLimit": calibrationProcessAngleLimit,
    "calibrationRate": calibrationRate,
    "calibrationWarningAngleLimit": calibrationWarningAngleLimit,
    "cooldownTime": cooldownTime,
    "driveSpeed": driveSpeed,
    "engageSpeed": engageSpeed,
    "interdictionEffectTime": interdictionEffectTime,
    "maxCalibrationRequirement": maxCalibrationRequirement,
    "minCalibrationRequirement": minCalibrationRequirement,
    "ShaderNodeEngageVelocity": shaderNodeEngageVelocity,
    "ShaderNodeMaxStrengthVelocity": shaderNodeMaxStrengthVelocity,
    "ShaderNodeShutdownVelocity": shaderNodeShutdownVelocity,
    "spoolUpTime": spoolUpTime,
    "stageOneAccelRate": stageOneAccelRate,
    "stageTwoAccelRate": stageTwoAccelRate,
    "VFXEntryFlashVelocity": vfxEntryFlashVelocity,
    "VFXExitEffectVelocity": vfxExitEffectVelocity,
    "VFXPinchEffectTime": vfxPinchEffectTime,
    "VFXPinchMaxVelocity": vfxPinchMaxVelocity,
    "VFXSpoolEndVelocity": vfxSpoolEndVelocity,
    "VFXTrailStartVelocity": vfxTrailStartVelocity,
    "VFXTravelEffectEndVelocity": vfxTravelEffectEndVelocity,
    "VFXTravelEffectStartVelocity": vfxTravelEffectStartVelocity,
  };
}

class SplineJumpParams {
  double calibrationDelayInSeconds;
  double calibrationProcessAngleLimit;
  double calibrationRate;
  double calibrationWarningAngleLimit;
  double cooldownTime;
  double driveSpeed;
  double engageSpeed;
  double interdictionEffectTime;
  double maxCalibrationRequirement;
  double minCalibrationRequirement;
  double shaderNodeEngageVelocity;
  double shaderNodeMaxStrengthVelocity;
  double shaderNodeShutdownVelocity;
  double spoolUpTime;
  double stageOneAccelRate;
  double stageTwoAccelRate;
  double vfxEntryFlashVelocity;
  double vfxExitEffectVelocity;
  double vfxPinchEffectTime;
  double vfxPinchMaxVelocity;
  double vfxSpoolEndVelocity;
  double vfxTrailStartVelocity;
  double vfxTravelEffectEndVelocity;
  double vfxTravelEffectStartVelocity;

  SplineJumpParams({
    required this.calibrationDelayInSeconds,
    required this.calibrationProcessAngleLimit,
    required this.calibrationRate,
    required this.calibrationWarningAngleLimit,
    required this.cooldownTime,
    required this.driveSpeed,
    required this.engageSpeed,
    required this.interdictionEffectTime,
    required this.maxCalibrationRequirement,
    required this.minCalibrationRequirement,
    required this.shaderNodeEngageVelocity,
    required this.shaderNodeMaxStrengthVelocity,
    required this.shaderNodeShutdownVelocity,
    required this.spoolUpTime,
    required this.stageOneAccelRate,
    required this.stageTwoAccelRate,
    required this.vfxEntryFlashVelocity,
    required this.vfxExitEffectVelocity,
    required this.vfxPinchEffectTime,
    required this.vfxPinchMaxVelocity,
    required this.vfxSpoolEndVelocity,
    required this.vfxTrailStartVelocity,
    required this.vfxTravelEffectEndVelocity,
    required this.vfxTravelEffectStartVelocity,
  });

  factory SplineJumpParams.fromJson(Map<String, dynamic> json) => SplineJumpParams(
    calibrationDelayInSeconds: json["calibrationDelayInSeconds"]?.toDouble(),
    calibrationProcessAngleLimit: json["calibrationProcessAngleLimit"]?.toDouble(),
    calibrationRate: json["calibrationRate"]?.toDouble(),
    calibrationWarningAngleLimit: json["calibrationWarningAngleLimit"]?.toDouble(),
    cooldownTime: json["cooldownTime"]?.toDouble(),
    driveSpeed: json["driveSpeed"]?.toDouble(),
    engageSpeed: json["engageSpeed"]?.toDouble(),
    interdictionEffectTime: json["interdictionEffectTime"]?.toDouble(),
    maxCalibrationRequirement: json["maxCalibrationRequirement"]?.toDouble(),
    minCalibrationRequirement: json["minCalibrationRequirement"]?.toDouble(),
    shaderNodeEngageVelocity: json["ShaderNodeEngageVelocity"]?.toDouble(),
    shaderNodeMaxStrengthVelocity: json["ShaderNodeMaxStrengthVelocity"]?.toDouble(),
    shaderNodeShutdownVelocity: json["ShaderNodeShutdownVelocity"]?.toDouble(),
    spoolUpTime: json["spoolUpTime"]?.toDouble(),
    stageOneAccelRate: json["stageOneAccelRate"]?.toDouble(),
    stageTwoAccelRate: json["stageTwoAccelRate"]?.toDouble(),
    vfxEntryFlashVelocity: json["VFXEntryFlashVelocity"]?.toDouble(),
    vfxExitEffectVelocity: json["VFXExitEffectVelocity"]?.toDouble(),
    vfxPinchEffectTime: json["VFXPinchEffectTime"]?.toDouble(),
    vfxPinchMaxVelocity: json["VFXPinchMaxVelocity"]?.toDouble(),
    vfxSpoolEndVelocity: json["VFXSpoolEndVelocity"]?.toDouble(),
    vfxTrailStartVelocity: json["VFXTrailStartVelocity"]?.toDouble(),
    vfxTravelEffectEndVelocity: json["VFXTravelEffectEndVelocity"]?.toDouble(),
    vfxTravelEffectStartVelocity: json["VFXTravelEffectStartVelocity"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "calibrationDelayInSeconds": calibrationDelayInSeconds,
    "calibrationProcessAngleLimit": calibrationProcessAngleLimit,
    "calibrationRate": calibrationRate,
    "calibrationWarningAngleLimit": calibrationWarningAngleLimit,
    "cooldownTime": cooldownTime,
    "driveSpeed": driveSpeed,
    "engageSpeed": engageSpeed,
    "interdictionEffectTime": interdictionEffectTime,
    "maxCalibrationRequirement": maxCalibrationRequirement,
    "minCalibrationRequirement": minCalibrationRequirement,
    "ShaderNodeEngageVelocity": shaderNodeEngageVelocity,
    "ShaderNodeMaxStrengthVelocity": shaderNodeMaxStrengthVelocity,
    "ShaderNodeShutdownVelocity": shaderNodeShutdownVelocity,
    "spoolUpTime": spoolUpTime,
    "stageOneAccelRate": stageOneAccelRate,
    "stageTwoAccelRate": stageTwoAccelRate,
    "VFXEntryFlashVelocity": vfxEntryFlashVelocity,
    "VFXExitEffectVelocity": vfxExitEffectVelocity,
    "VFXPinchEffectTime": vfxPinchEffectTime,
    "VFXPinchMaxVelocity": vfxPinchMaxVelocity,
    "VFXSpoolEndVelocity": vfxSpoolEndVelocity,
    "VFXTrailStartVelocity": vfxTrailStartVelocity,
    "VFXTravelEffectEndVelocity": vfxTravelEffectEndVelocity,
    "VFXTravelEffectStartVelocity": vfxTravelEffectStartVelocity,
  };
}

class Radar {
  String? chineseDescription;
  String? chineseName;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  ResourceConnection resourceConnection;
  int size;
  String? type;

  Radar({
    this.chineseDescription,
    required this.chineseName,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    required this.resourceConnection,
    required this.size,
    this.type,
  });

  factory Radar.fromJson(Map<String, dynamic> json) => Radar(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    resourceConnection: ResourceConnection.fromJson(json["resource_connection"]),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "resource_connection": resourceConnection.toJson(),
    "size": size,
    "type": type,
  };
}

class SelfDestruct {
  String? chineseDescription;
  String? chineseName;
  SscItemSelfDestructComponentParamsType data;
  String? description;
  String? manufacturer;
  String name;
  String? path;
  String ref;
  int size;
  String? type;

  SelfDestruct({
    this.chineseDescription,
    required this.chineseName,
    required this.data,
    this.description,
    this.manufacturer,
    required this.name,
    this.path,
    required this.ref,
    required this.size,
    this.type,
  });

  factory SelfDestruct.fromJson(Map<String, dynamic> json) => SelfDestruct(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: SscItemSelfDestructComponentParamsType.fromJson(json["data"]),
    description: json["description"],
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data.toJson(),
    "description": description,
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "ref": ref,
    "size": size,
    "type": type,
  };
}

class SscItemSelfDestructComponentParamsType {
  double damage;
  double minRadius;
  double radius;
  double time;

  SscItemSelfDestructComponentParamsType({
    required this.damage,
    required this.minRadius,
    required this.radius,
    required this.time,
  });

  factory SscItemSelfDestructComponentParamsType.fromJson(Map<String, dynamic> json) => SscItemSelfDestructComponentParamsType(
    damage: json["damage"]?.toDouble(),
    minRadius: json["minRadius"]?.toDouble(),
    radius: json["radius"]?.toDouble(),
    time: json["time"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "damage": damage,
    "minRadius": minRadius,
    "radius": radius,
    "time": time,
  };
}

class Shield {
  double absorptionPhysicalMax;
  double absorptionPhysicalMin;
  String? chineseDescription;
  String? chineseName;
  String? description;
  SDistortionParamsType? distortion;
  double downRegenDelay;
  int grade;
  double health;
  HealthInfo healthInfo;
  EntityComponentHeatConnection heat;
  String? manufacturer;
  String name;
  String? path;
  EntityComponentPowerConnection power;
  String ref;
  double regen;
  double regenDelay;
  double resistanceMax;
  double resistanceMin;
  ResourceConnection resourceConnection;
  List<ShopInfo> shipInfo;
  int size;
  String? type;

  Shield({
    required this.absorptionPhysicalMax,
    required this.absorptionPhysicalMin,
    this.chineseDescription,
    required this.chineseName,
    this.description,
    this.distortion,
    required this.downRegenDelay,
    required this.grade,
    required this.health,
    required this.healthInfo,
    required this.heat,
    this.manufacturer,
    required this.name,
    this.path,
    required this.power,
    required this.ref,
    required this.regen,
    required this.regenDelay,
    required this.resistanceMax,
    required this.resistanceMin,
    required this.resourceConnection,
    required this.shipInfo,
    required this.size,
    this.type,
  });

  factory Shield.fromJson(Map<String, dynamic> json) => Shield(
    absorptionPhysicalMax: json["absorption_physical_max"]?.toDouble(),
    absorptionPhysicalMin: json["absorption_physical_min"]?.toDouble(),
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    distortion: json["distortion"] == null ? null : SDistortionParamsType.fromJson(json["distortion"]),
    downRegenDelay: json["down_regen_delay"]?.toDouble(),
    grade: json["grade"],
    health: json["health"]?.toDouble(),
    healthInfo: HealthInfo.fromJson(json["health_info"]),
    heat: EntityComponentHeatConnection.fromJson(json["heat"]),
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    power: EntityComponentPowerConnection.fromJson(json["power"]),
    ref: json["ref"],
    regen: json["regen"]?.toDouble(),
    regenDelay: json["regen_delay"]?.toDouble(),
    resistanceMax: json["resistance_max"]?.toDouble(),
    resistanceMin: json["resistance_min"]?.toDouble(),
    resourceConnection: ResourceConnection.fromJson(json["resource_connection"]),
    shipInfo: List<ShopInfo>.from(json["ship_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "absorption_physical_max": absorptionPhysicalMax,
    "absorption_physical_min": absorptionPhysicalMin,
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "distortion": distortion?.toJson(),
    "down_regen_delay": downRegenDelay,
    "grade": grade,
    "health": health,
    "health_info": healthInfo.toJson(),
    "heat": heat.toJson(),
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "power": power.toJson(),
    "ref": ref,
    "regen": regen,
    "regen_delay": regenDelay,
    "resistance_max": resistanceMax,
    "resistance_min": resistanceMin,
    "resource_connection": resourceConnection.toJson(),
    "ship_info": List<dynamic>.from(shipInfo.map((x) => x.toJson())),
    "size": size,
    "type": type,
  };
}

class ShipAlis {
  List<String> alias;
  int id;
  String name;
  List<Sku> skus;

  ShipAlis({
    required this.alias,
    required this.id,
    required this.name,
    required this.skus,
  });

  factory ShipAlis.fromJson(Map<String, dynamic> json) => ShipAlis(
    alias: List<String>.from(json["alias"].map((x) => x)),
    id: json["id"],
    name: json["name"],
    skus: List<Sku>.from(json["skus"].map((x) => Sku.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "alias": List<dynamic>.from(alias.map((x) => x)),
    "id": id,
    "name": name,
    "skus": List<dynamic>.from(skus.map((x) => x.toJson())),
  };
}

class Sku {
  int price;
  String title;

  Sku({
    required this.price,
    required this.title,
  });

  factory Sku.fromJson(Map<String, dynamic> json) => Sku(
    price: json["price"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "title": title,
  };
}

class ShipNameBinding {
  int id;
  String shipName;
  String shipPicName;

  ShipNameBinding({
    required this.id,
    required this.shipName,
    required this.shipPicName,
  });

  factory ShipNameBinding.fromJson(Map<String, dynamic> json) => ShipNameBinding(
    id: json["id"],
    shipName: json["ship_name"],
    shipPicName: json["ship_pic_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ship_name": shipName,
    "ship_pic_name": shipPicName,
  };
}

class Thruster {
  String? chineseDescription;
  String? chineseName;
  ScItemThrusterParamsType data;
  String? description;
  HealthInfo healthInfo;
  EntityComponentHeatConnection heat;
  String? manufacturer;
  String name;
  String? path;
  EntityComponentPowerConnection power;
  String ref;
  List<ShopInfo> shopInfo;
  int size;
  String? type;

  Thruster({
    this.chineseDescription,
    required this.chineseName,
    required this.data,
    this.description,
    required this.healthInfo,
    required this.heat,
    this.manufacturer,
    required this.name,
    this.path,
    required this.power,
    required this.ref,
    required this.shopInfo,
    required this.size,
    this.type,
  });

  factory Thruster.fromJson(Map<String, dynamic> json) => Thruster(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    data: ScItemThrusterParamsType.fromJson(json["data"]),
    description: json["description"],
    healthInfo: HealthInfo.fromJson(json["health_info"]),
    heat: EntityComponentHeatConnection.fromJson(json["heat"]),
    manufacturer: json["manufacturer"],
    name: json["name"],
    path: json["path"],
    power: EntityComponentPowerConnection.fromJson(json["power"]),
    ref: json["ref"],
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "data": data.toJson(),
    "description": description,
    "health_info": healthInfo.toJson(),
    "heat": heat.toJson(),
    "manufacturer": manufacturer,
    "name": name,
    "path": path,
    "power": power.toJson(),
    "ref": ref,
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "type": type,
  };
}

class ScItemThrusterParamsType {
  double fuelBurnRatePer10KNewton;
  double thrustCapacity;
  String thrusterAnimDriver;
  double thrusterStrengthSmooth;

  ScItemThrusterParamsType({
    required this.fuelBurnRatePer10KNewton,
    required this.thrustCapacity,
    required this.thrusterAnimDriver,
    required this.thrusterStrengthSmooth,
  });

  factory ScItemThrusterParamsType.fromJson(Map<String, dynamic> json) => ScItemThrusterParamsType(
    fuelBurnRatePer10KNewton: json["fuelBurnRatePer10KNewton"]?.toDouble(),
    thrustCapacity: json["thrustCapacity"]?.toDouble(),
    thrusterAnimDriver: json["thrusterAnimDriver"],
    thrusterStrengthSmooth: json["thrusterStrengthSmooth"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "fuelBurnRatePer10KNewton": fuelBurnRatePer10KNewton,
    "thrustCapacity": thrustCapacity,
    "thrusterAnimDriver": thrusterAnimDriver,
    "thrusterStrengthSmooth": thrusterStrengthSmooth,
  };
}

class Turret {
  String? chineseDescription;
  String? chineseName;
  String? description;
  bool? isPersonnel;
  List<String>? loadout;
  String? manufacturer;
  double mass;
  int microScu;
  String name;
  String? path;
  List<Port> ports;
  String ref;
  int size;
  String? type;

  Turret({
    this.chineseDescription,
    required this.chineseName,
    this.description,
    this.isPersonnel,
    this.loadout,
    this.manufacturer,
    required this.mass,
    required this.microScu,
    required this.name,
    this.path,
    required this.ports,
    required this.ref,
    required this.size,
    this.type,
  });

  factory Turret.fromJson(Map<String, dynamic> json) => Turret(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    isPersonnel: json["is_personnel"],
    loadout: json["loadout"] == null ? [] : List<String>.from(json["loadout"]!.map((x) => x)),
    manufacturer: json["manufacturer"],
    mass: json["mass"]?.toDouble(),
    microScu: json["micro_scu"],
    name: json["name"],
    path: json["path"],
    ports: List<Port>.from(json["ports"].map((x) => Port.fromJson(x))),
    ref: json["ref"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "is_personnel": isPersonnel,
    "loadout": loadout == null ? [] : List<dynamic>.from(loadout!.map((x) => x)),
    "manufacturer": manufacturer,
    "mass": mass,
    "micro_scu": microScu,
    "name": name,
    "path": path,
    "ports": List<dynamic>.from(ports.map((x) => x.toJson())),
    "ref": ref,
    "size": size,
    "type": type,
  };
}

class VehicleComponentParams {
  int crewSize;
  String inventoryContainerParams;
  String manufacturer;
  Box maxBoundingBoxSize;
  String vehicleCareer;
  String vehicleDefinition;
  String vehicleDescription;
  double vehicleHullDamageNormalizationValue;
  String vehicleImagePath;
  String vehicleName;
  String vehicleRole;

  VehicleComponentParams({
    required this.crewSize,
    required this.inventoryContainerParams,
    required this.manufacturer,
    required this.maxBoundingBoxSize,
    required this.vehicleCareer,
    required this.vehicleDefinition,
    required this.vehicleDescription,
    required this.vehicleHullDamageNormalizationValue,
    required this.vehicleImagePath,
    required this.vehicleName,
    required this.vehicleRole,
  });

  factory VehicleComponentParams.fromJson(Map<String, dynamic> json) => VehicleComponentParams(
    crewSize: json["crewSize"],
    inventoryContainerParams: json["inventoryContainerParams"],
    manufacturer: json["manufacturer"],
    maxBoundingBoxSize: Box.fromJson(json["maxBoundingBoxSize"]),
    vehicleCareer: json["vehicleCareer"],
    vehicleDefinition: json["vehicleDefinition"],
    vehicleDescription: json["vehicleDescription"],
    vehicleHullDamageNormalizationValue: json["vehicleHullDamageNormalizationValue"]?.toDouble(),
    vehicleImagePath: json["vehicleImagePath"],
    vehicleName: json["vehicleName"],
    vehicleRole: json["vehicleRole"],
  );

  Map<String, dynamic> toJson() => {
    "crewSize": crewSize,
    "inventoryContainerParams": inventoryContainerParams,
    "manufacturer": manufacturer,
    "maxBoundingBoxSize": maxBoundingBoxSize.toJson(),
    "vehicleCareer": vehicleCareer,
    "vehicleDefinition": vehicleDefinition,
    "vehicleDescription": vehicleDescription,
    "vehicleHullDamageNormalizationValue": vehicleHullDamageNormalizationValue,
    "vehicleImagePath": vehicleImagePath,
    "vehicleName": vehicleName,
    "vehicleRole": vehicleRole,
  };
}

class Box {
  double x;
  double y;
  double z;

  Box({
    required this.x,
    required this.y,
    required this.z,
  });

  factory Box.fromJson(Map<String, dynamic> json) => Box(
    x: json["x"]?.toDouble(),
    y: json["y"]?.toDouble(),
    z: json["z"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
    "z": z,
  };
}

class WeaponRegenPool {
  int ammoLoad;
  String? chineseDescription;
  String? chineseName;
  String? description;
  String name;
  String? path;
  String ref;
  int regenFillRate;
  int? size;
  String? type;

  WeaponRegenPool({
    required this.ammoLoad,
    this.chineseDescription,
    required this.chineseName,
    this.description,
    required this.name,
    this.path,
    required this.ref,
    required this.regenFillRate,
    this.size,
    this.type,
  });

  factory WeaponRegenPool.fromJson(Map<String, dynamic> json) => WeaponRegenPool(
    ammoLoad: json["ammo_load"],
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    regenFillRate: json["regen_fill_rate"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "ammo_load": ammoLoad,
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "name": name,
    "path": path,
    "ref": ref,
    "regen_fill_rate": regenFillRate,
    "size": size,
    "type": type,
  };
}

class VehicleWeapon {
  VehicleAmmo? ammo;
  String? chineseDescription;
  String? chineseName;
  String? description;
  DistortionInfo? distortion;
  List<FireMode> fireModes;
  HealthInfo? healthInfo;
  HeatInfo? heat;
  int? magazine;
  String? manufacturer;
  double mass;
  int microScu;
  String name;
  String? path;
  List<Port> ports;
  String ref;
  ResourceConnection resourceConnection;
  List<ShopInfo> shopInfo;
  int size;
  String? type;

  VehicleWeapon({
    required this.ammo,
    this.chineseDescription,
    required this.chineseName,
    this.description,
    required this.distortion,
    required this.fireModes,
    required this.healthInfo,
    required this.heat,
    this.magazine,
    this.manufacturer,
    required this.mass,
    required this.microScu,
    required this.name,
    this.path,
    required this.ports,
    required this.ref,
    required this.resourceConnection,
    required this.shopInfo,
    required this.size,
    this.type,
  });

  factory VehicleWeapon.fromJson(Map<String, dynamic> json) => VehicleWeapon(
    ammo: json["ammo"] == null ? null : VehicleAmmo.fromJson(json["ammo"]),
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    description: json["description"],
    distortion: json["distortion"] == null ? null : DistortionInfo.fromJson(json["distortion"]),
    fireModes: List<FireMode>.from(json["fire_modes"].map((x) => FireMode.fromJson(x))),
    healthInfo: json["health_info"] == null ? null : HealthInfo.fromJson(json["health_info"]),
    heat: json["heat"] == null ? null : HeatInfo.fromJson(json["heat"]),
    magazine: json["magazine"],
    manufacturer: json["manufacturer"],
    mass: json["mass"]?.toDouble(),
    microScu: json["micro_scu"],
    name: json["name"],
    path: json["path"],
    ports: List<Port>.from(json["ports"].map((x) => Port.fromJson(x))),
    ref: json["ref"],
    resourceConnection: ResourceConnection.fromJson(json["resource_connection"]),
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "ammo": ammo?.toJson(),
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "description": description,
    "distortion": distortion?.toJson(),
    "fire_modes": List<dynamic>.from(fireModes.map((x) => x.toJson())),
    "health_info": healthInfo?.toJson(),
    "heat": heat?.toJson(),
    "magazine": magazine,
    "manufacturer": manufacturer,
    "mass": mass,
    "micro_scu": microScu,
    "name": name,
    "path": path,
    "ports": List<dynamic>.from(ports.map((x) => x.toJson())),
    "ref": ref,
    "resource_connection": resourceConnection.toJson(),
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "type": type,
  };
}

class VehicleAmmo {
  String? chineseDescription;
  String? chineseName;
  Damage damage;
  DamageDropMinDamage damageDropMinDamage;
  DamageDropMinDistance damageDropMinDistance;
  DamageDropPerMeter damageDropPerMeter;
  String? description;
  double lifetime;
  double mass;
  String name;
  String? path;
  String ref;
  int? size;
  String? type;

  VehicleAmmo({
    this.chineseDescription,
    required this.chineseName,
    required this.damage,
    required this.damageDropMinDamage,
    required this.damageDropMinDistance,
    required this.damageDropPerMeter,
    this.description,
    required this.lifetime,
    required this.mass,
    required this.name,
    this.path,
    required this.ref,
    this.size,
    this.type,
  });

  factory VehicleAmmo.fromJson(Map<String, dynamic> json) => VehicleAmmo(
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    damage: Damage.fromJson(json["damage"]),
    damageDropMinDamage: DamageDropMinDamage.fromJson(json["damage_drop_min_damage"]),
    damageDropMinDistance: DamageDropMinDistance.fromJson(json["damage_drop_min_distance"]),
    damageDropPerMeter: DamageDropPerMeter.fromJson(json["damage_drop_per_meter"]),
    description: json["description"],
    lifetime: json["lifetime"]?.toDouble(),
    mass: json["mass"]?.toDouble(),
    name: json["name"],
    path: json["path"],
    ref: json["ref"],
    size: json["size"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "damage": damage.toJson(),
    "damage_drop_min_damage": damageDropMinDamage.toJson(),
    "damage_drop_min_distance": damageDropMinDistance.toJson(),
    "damage_drop_per_meter": damageDropPerMeter.toJson(),
    "description": description,
    "lifetime": lifetime,
    "mass": mass,
    "name": name,
    "path": path,
    "ref": ref,
    "size": size,
    "type": type,
  };
}

class Damage {
  double damageBiochemical;
  double damageDistortion;
  double damageEnergy;
  double damagePhysical;
  double damageStun;
  double damageThermal;

  Damage({
    required this.damageBiochemical,
    required this.damageDistortion,
    required this.damageEnergy,
    required this.damagePhysical,
    required this.damageStun,
    required this.damageThermal,
  });

  factory Damage.fromJson(Map<String, dynamic> json) => Damage(
    damageBiochemical: json["damage_biochemical"]?.toDouble(),
    damageDistortion: json["damage_distortion"]?.toDouble(),
    damageEnergy: json["damage_energy"]?.toDouble(),
    damagePhysical: json["damage_physical"]?.toDouble(),
    damageStun: json["damage_stun"]?.toDouble(),
    damageThermal: json["damage_thermal"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "damage_biochemical": damageBiochemical,
    "damage_distortion": damageDistortion,
    "damage_energy": damageEnergy,
    "damage_physical": damagePhysical,
    "damage_stun": damageStun,
    "damage_thermal": damageThermal,
  };
}

class DamageDropMinDamage {
  double damageBiochemical;
  double damageDistortion;
  double damageEnergy;
  double damagePhysical;
  double damageStun;
  double damageThermal;

  DamageDropMinDamage({
    required this.damageBiochemical,
    required this.damageDistortion,
    required this.damageEnergy,
    required this.damagePhysical,
    required this.damageStun,
    required this.damageThermal,
  });

  factory DamageDropMinDamage.fromJson(Map<String, dynamic> json) => DamageDropMinDamage(
    damageBiochemical: json["damage_biochemical"]?.toDouble(),
    damageDistortion: json["damage_distortion"]?.toDouble(),
    damageEnergy: json["damage_energy"]?.toDouble(),
    damagePhysical: json["damage_physical"]?.toDouble(),
    damageStun: json["damage_stun"]?.toDouble(),
    damageThermal: json["damage_thermal"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "damage_biochemical": damageBiochemical,
    "damage_distortion": damageDistortion,
    "damage_energy": damageEnergy,
    "damage_physical": damagePhysical,
    "damage_stun": damageStun,
    "damage_thermal": damageThermal,
  };
}

class DamageDropMinDistance {
  double damageBiochemical;
  double damageDistortion;
  double damageEnergy;
  double damagePhysical;
  double damageStun;
  double damageThermal;

  DamageDropMinDistance({
    required this.damageBiochemical,
    required this.damageDistortion,
    required this.damageEnergy,
    required this.damagePhysical,
    required this.damageStun,
    required this.damageThermal,
  });

  factory DamageDropMinDistance.fromJson(Map<String, dynamic> json) => DamageDropMinDistance(
    damageBiochemical: json["damage_biochemical"]?.toDouble(),
    damageDistortion: json["damage_distortion"]?.toDouble(),
    damageEnergy: json["damage_energy"]?.toDouble(),
    damagePhysical: json["damage_physical"]?.toDouble(),
    damageStun: json["damage_stun"]?.toDouble(),
    damageThermal: json["damage_thermal"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "damage_biochemical": damageBiochemical,
    "damage_distortion": damageDistortion,
    "damage_energy": damageEnergy,
    "damage_physical": damagePhysical,
    "damage_stun": damageStun,
    "damage_thermal": damageThermal,
  };
}

class DamageDropPerMeter {
  double damageBiochemical;
  double damageDistortion;
  double damageEnergy;
  double damagePhysical;
  double damageStun;
  double damageThermal;

  DamageDropPerMeter({
    required this.damageBiochemical,
    required this.damageDistortion,
    required this.damageEnergy,
    required this.damagePhysical,
    required this.damageStun,
    required this.damageThermal,
  });

  factory DamageDropPerMeter.fromJson(Map<String, dynamic> json) => DamageDropPerMeter(
    damageBiochemical: json["damage_biochemical"]?.toDouble(),
    damageDistortion: json["damage_distortion"]?.toDouble(),
    damageEnergy: json["damage_energy"]?.toDouble(),
    damagePhysical: json["damage_physical"]?.toDouble(),
    damageStun: json["damage_stun"]?.toDouble(),
    damageThermal: json["damage_thermal"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "damage_biochemical": damageBiochemical,
    "damage_distortion": damageDistortion,
    "damage_energy": damageEnergy,
    "damage_physical": damagePhysical,
    "damage_stun": damageStun,
    "damage_thermal": damageThermal,
  };
}

class DistortionInfo {
  double decayDelay;
  double decayRate;
  double maximum;

  DistortionInfo({
    required this.decayDelay,
    required this.decayRate,
    required this.maximum,
  });

  factory DistortionInfo.fromJson(Map<String, dynamic> json) => DistortionInfo(
    decayDelay: json["decay_delay"]?.toDouble(),
    decayRate: json["decay_rate"]?.toDouble(),
    maximum: json["maximum"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "decay_delay": decayDelay,
    "decay_rate": decayRate,
    "maximum": maximum,
  };
}

class FireMode {
  int? ammoCost;
  int? chargeTime;
  int? fireRate;
  String mode;

  FireMode({
    this.ammoCost,
    this.chargeTime,
    this.fireRate,
    required this.mode,
  });

  factory FireMode.fromJson(Map<String, dynamic> json) => FireMode(
    ammoCost: json["ammoCost"],
    chargeTime: json["chargeTime"],
    fireRate: json["fireRate"],
    mode: json["mode"],
  );

  Map<String, dynamic> toJson() => {
    "ammoCost": ammoCost,
    "chargeTime": chargeTime,
    "fireRate": fireRate,
    "mode": mode,
  };
}

class HeatInfo {
  double mass;
  double maxCoolingRate;
  double maxTemperature;
  double minTemperature;
  double misfireMaxTemperature;
  double misfireMinTemperature;
  double overclockThresholdMaxHeat;
  double overclockThresholdMinHeat;
  double overheatTemperature;
  double overpowerHeat;
  double recoveryTemperature;
  double specificHeatCapacity;
  double startCoolingTemperature;
  double startIrTemperature;
  double surfaceArea;
  double temperatureToIr;
  double thermalConductivity;
  double thermalEnergyBase;
  double thermalEnergyDraw;

  HeatInfo({
    required this.mass,
    required this.maxCoolingRate,
    required this.maxTemperature,
    required this.minTemperature,
    required this.misfireMaxTemperature,
    required this.misfireMinTemperature,
    required this.overclockThresholdMaxHeat,
    required this.overclockThresholdMinHeat,
    required this.overheatTemperature,
    required this.overpowerHeat,
    required this.recoveryTemperature,
    required this.specificHeatCapacity,
    required this.startCoolingTemperature,
    required this.startIrTemperature,
    required this.surfaceArea,
    required this.temperatureToIr,
    required this.thermalConductivity,
    required this.thermalEnergyBase,
    required this.thermalEnergyDraw,
  });

  factory HeatInfo.fromJson(Map<String, dynamic> json) => HeatInfo(
    mass: json["mass"]?.toDouble(),
    maxCoolingRate: json["max_cooling_rate"]?.toDouble(),
    maxTemperature: json["max_temperature"]?.toDouble(),
    minTemperature: json["min_temperature"]?.toDouble(),
    misfireMaxTemperature: json["misfire_max_temperature"]?.toDouble(),
    misfireMinTemperature: json["misfire_min_temperature"]?.toDouble(),
    overclockThresholdMaxHeat: json["overclock_threshold_max_heat"]?.toDouble(),
    overclockThresholdMinHeat: json["overclock_threshold_min_heat"]?.toDouble(),
    overheatTemperature: json["overheat_temperature"]?.toDouble(),
    overpowerHeat: json["overpower_heat"]?.toDouble(),
    recoveryTemperature: json["recovery_temperature"]?.toDouble(),
    specificHeatCapacity: json["specific_heat_capacity"]?.toDouble(),
    startCoolingTemperature: json["start_cooling_temperature"]?.toDouble(),
    startIrTemperature: json["start_ir_temperature"]?.toDouble(),
    surfaceArea: json["surface_area"]?.toDouble(),
    temperatureToIr: json["temperature_to_ir"]?.toDouble(),
    thermalConductivity: json["thermal_conductivity"]?.toDouble(),
    thermalEnergyBase: json["thermal_energy_base"]?.toDouble(),
    thermalEnergyDraw: json["thermal_energy_draw"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "mass": mass,
    "max_cooling_rate": maxCoolingRate,
    "max_temperature": maxTemperature,
    "min_temperature": minTemperature,
    "misfire_max_temperature": misfireMaxTemperature,
    "misfire_min_temperature": misfireMinTemperature,
    "overclock_threshold_max_heat": overclockThresholdMaxHeat,
    "overclock_threshold_min_heat": overclockThresholdMinHeat,
    "overheat_temperature": overheatTemperature,
    "overpower_heat": overpowerHeat,
    "recovery_temperature": recoveryTemperature,
    "specific_heat_capacity": specificHeatCapacity,
    "start_cooling_temperature": startCoolingTemperature,
    "start_ir_temperature": startIrTemperature,
    "surface_area": surfaceArea,
    "temperature_to_ir": temperatureToIr,
    "thermal_conductivity": thermalConductivity,
    "thermal_energy_base": thermalEnergyBase,
    "thermal_energy_draw": thermalEnergyDraw,
  };
}


ShipStore shipStoreFromJson(String str) => ShipStore.fromJson(json.decode(str));

String shipStoreToJson(ShipStore data) => json.encode(data.toJson());

class ShipStore {
  ItemRef armor;
  List<ItemRef> cargos;
  String? chineseDescription;
  String? chineseName;
  List<ItemRef> controllers;
  List<ItemRef> coolers;
  String? description;
  Flare flare;
  List<ItemRef> fuelIntakes;
  List<ItemRef> fuelTanks;
  List<Hull> hulls;
  bool? isRealShip;
  ItemRef? lifeSupport;
  String? manufacturer;
  double mass;
  List<ItemRefWithLoadout> missileRacks;
  String name;
  List<ItemRef> paints;
  String? path;
  ItemRef? personalStorage;
  List<ItemRef> powerPlants;
  ItemRef? qd;
  ItemRef? radar;
  String ref;
  ItemRef? selfDestruct;
  List<ItemRef> shields;
  ShipAlis? shipAlias;
  ShipNameBinding? shipNameBinding;
  List<ShopInfo> shopInfo;
  int? size;
  List<ItemRef> thrusts;
  List<ItemRefWithLoadout> turrets;
  String? type;
  VehicleComponentParams vehicle;
  int weaponFixedPool;
  ItemRef? weaponRegenPool;
  List<ItemRef> weapons;

  ShipStore({
    required this.armor,
    required this.cargos,
    this.chineseDescription,
    required this.chineseName,
    required this.controllers,
    required this.coolers,
    this.description,
    required this.flare,
    required this.fuelIntakes,
    required this.fuelTanks,
    required this.hulls,
    this.isRealShip,
    required this.lifeSupport,
    this.manufacturer,
    required this.mass,
    required this.missileRacks,
    required this.name,
    required this.paints,
    this.path,
    required this.personalStorage,
    required this.powerPlants,
    required this.qd,
    required this.radar,
    required this.ref,
    required this.selfDestruct,
    required this.shields,
    required this.shipAlias,
    required this.shipNameBinding,
    required this.shopInfo,
    this.size,
    required this.thrusts,
    required this.turrets,
    this.type,
    required this.vehicle,
    required this.weaponFixedPool,
    required this.weaponRegenPool,
    required this.weapons,
  });

  factory ShipStore.fromJson(Map<String, dynamic> json) => ShipStore(
    armor: ItemRef.fromJson(json["armor"]),
    cargos: List<ItemRef>.from(json["cargos"].map((x) => ItemRef.fromJson(x))),
    chineseDescription: json["chinese_description"],
    chineseName: json["chinese_name"],
    controllers: List<ItemRef>.from(json["controllers"].map((x) => ItemRef.fromJson(x))),
    coolers: List<ItemRef>.from(json["coolers"].map((x) => ItemRef.fromJson(x))),
    description: json["description"],
    flare: Flare.fromJson(json["flare"]),
    fuelIntakes: List<ItemRef>.from(json["fuel_intakes"].map((x) => ItemRef.fromJson(x))),
    fuelTanks: List<ItemRef>.from(json["fuel_tanks"].map((x) => ItemRef.fromJson(x))),
    hulls: List<Hull>.from(json["hulls"].map((x) => Hull.fromJson(x))),
    isRealShip: json["is_real_ship"],
    lifeSupport: json["life_support"] == null ? null : ItemRef.fromJson(json["life_support"]),
    manufacturer: json["manufacturer"],
    mass: json["mass"]?.toDouble(),
    missileRacks: List<ItemRefWithLoadout>.from(json["missile_racks"].map((x) => ItemRefWithLoadout.fromJson(x))),
    name: json["name"],
    paints: List<ItemRef>.from(json["paints"].map((x) => ItemRef.fromJson(x))),
    path: json["path"],
    personalStorage: json["personal_storage"] == null ? null : ItemRef.fromJson(json["personal_storage"]),
    powerPlants: List<ItemRef>.from(json["power_plants"].map((x) => ItemRef.fromJson(x))),
    qd: json["qd"] == null ? null : ItemRef.fromJson(json["qd"]),
    radar: json["radar"] == null ? null : ItemRef.fromJson(json["radar"]),
    ref: json["ref"],
    selfDestruct: json["self_destruct"] == null ? null : ItemRef.fromJson(json["self_destruct"]),
    shields: List<ItemRef>.from(json["shields"].map((x) => ItemRef.fromJson(x))),
    shipAlias: json["ship_alias"] == null ? null : ShipAlis.fromJson(json["ship_alias"]),
    shipNameBinding: json["ship_name_binding"] == null ? null : ShipNameBinding.fromJson(json["ship_name_binding"]),
    shopInfo: List<ShopInfo>.from(json["shop_info"].map((x) => ShopInfo.fromJson(x))),
    size: json["size"],
    thrusts: List<ItemRef>.from(json["thrusts"].map((x) => ItemRef.fromJson(x))),
    turrets: List<ItemRefWithLoadout>.from(json["turrets"].map((x) => ItemRefWithLoadout.fromJson(x))),
    type: json["type"],
    vehicle: VehicleComponentParams.fromJson(json["vehicle"]),
    weaponFixedPool: json["weapon_fixed_pool"],
    weaponRegenPool: json["weapon_regen_pool"] == null ? null : ItemRef.fromJson(json["weapon_regen_pool"]),
    weapons: List<ItemRef>.from(json["weapons"].map((x) => ItemRef.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "armor": armor.toJson(),
    "cargos": List<dynamic>.from(cargos.map((x) => x.toJson())),
    "chinese_description": chineseDescription,
    "chinese_name": chineseName,
    "controllers": List<dynamic>.from(controllers.map((x) => x.toJson())),
    "coolers": List<dynamic>.from(coolers.map((x) => x.toJson())),
    "description": description,
    "flare": flare.toJson(),
    "fuel_intakes": List<dynamic>.from(fuelIntakes.map((x) => x.toJson())),
    "fuel_tanks": List<dynamic>.from(fuelTanks.map((x) => x.toJson())),
    "hulls": List<dynamic>.from(hulls.map((x) => x.toJson())),
    "is_real_ship": isRealShip,
    "life_support": lifeSupport?.toJson(),
    "manufacturer": manufacturer,
    "mass": mass,
    "missile_racks": List<dynamic>.from(missileRacks.map((x) => x.toJson())),
    "name": name,
    "paints": List<dynamic>.from(paints.map((x) => x.toJson())),
    "path": path,
    "personal_storage": personalStorage?.toJson(),
    "power_plants": List<dynamic>.from(powerPlants.map((x) => x.toJson())),
    "qd": qd?.toJson(),
    "radar": radar?.toJson(),
    "ref": ref,
    "self_destruct": selfDestruct?.toJson(),
    "shields": List<dynamic>.from(shields.map((x) => x.toJson())),
    "ship_alias": shipAlias?.toJson(),
    "ship_name_binding": shipNameBinding?.toJson(),
    "shop_info": List<dynamic>.from(shopInfo.map((x) => x.toJson())),
    "size": size,
    "thrusts": List<dynamic>.from(thrusts.map((x) => x.toJson())),
    "turrets": List<dynamic>.from(turrets.map((x) => x.toJson())),
    "type": type,
    "vehicle": vehicle.toJson(),
    "weapon_fixed_pool": weaponFixedPool,
    "weapon_regen_pool": weaponRegenPool?.toJson(),
    "weapons": List<dynamic>.from(weapons.map((x) => x.toJson())),
  };
}

class ItemRef {
  String ref;

  ItemRef({
    required this.ref,
  });

  factory ItemRef.fromJson(Map<String, dynamic> json) => ItemRef(
    ref: json["ref"],
  );

  Map<String, dynamic> toJson() => {
    "ref": ref,
  };
}

class ItemRefWithLoadout {
  List<String> loadout;
  String ref;

  ItemRefWithLoadout({
    required this.loadout,
    required this.ref,
  });

  factory ItemRefWithLoadout.fromJson(Map<String, dynamic> json) => ItemRefWithLoadout(
    loadout: List<String>.from(json["loadout"].map((x) => x)),
    ref: json["ref"],
  );

  Map<String, dynamic> toJson() => {
    "loadout": List<dynamic>.from(loadout.map((x) => x)),
    "ref": ref,
  };
}