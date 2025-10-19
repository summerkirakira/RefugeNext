import 'dart:async';

import 'package:refuge_next/src/datasource/models/ship_info/manufacturer.dart';
import 'package:refuge_next/src/datasource/models/ship_info/missile.dart';
import 'package:refuge_next/src/datasource/models/ship_info/ship.dart';

import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/storage_path.dart';


class ShipInfoRepo {
  static final ShipInfoRepo _instance = ShipInfoRepo._internal();
  ShipInfoRepo._internal();

  factory ShipInfoRepo() => _instance;

  List<Ship> _ships = [];
  List<Armor> _armors = [];
  List<Shield> _shields = [];
  List<CargoGrid> _cargoGrids = [];
  List<Controller> _controllers = [];
  List<Cooler> _coolers = [];
  List<FuelIntake> _fuelIntakes = [];
  List<FuelTank> _fuelTanks = [];
  List<MissileRack> _missileRacks = [];
  List<PowerPlant> _powerPlants = [];
  List<PersonalStorage> _personalStorages = [];
  List<QuantumDrive> _quantumDrives = [];
  List<SelfDestruct> _selfDestructs = [];
  List<Thruster> _thrusters = [];
  List<Turret> _turrets = [];
  List<VehicleWeapon> _vehicleWeapons = [];
  List<VehicleAmmo> _vehicleAmmos = [];
  List<Skin> _skins = [];
  List<Manufacturer> _manufacturers = [];
  List<LifeSupport> _lifeSupports = [];
  List<Radar> _radars = [];
  List<Missile> _missiles = [];


  Future<String> get _localPath async {
    final appDataPath = await StoragePath.getAppDataPath();
    return "$appDataPath/ship_info/components";
  }

  Future<File> get _shipPath async {
    final path = await _localPath;
    return File('$path/ship.json');
  }

  Future<File> get _armorPath async {
    final path = await _localPath;
    return File('$path/armor.json');
  }

  Future<File> get _shieldPath async {
    final path = await _localPath;
    return File('$path/shield.json');
  }

  Future<File> get _cargoGridPath async {
    final path = await _localPath;
    return File('$path/cargo_grid.json');
  }

  Future<File> get _controllerPath async {
    final path = await _localPath;
    return File('$path/controller.json');
  }

  Future<File> get _coolerPath async {
    final path = await _localPath;
    return File('$path/cooler.json');
  }

  Future<File> get _fuelIntakePath async {
    final path = await _localPath;
    return File('$path/fuel_intake.json');
  }

  Future<File> get _fuelTankPath async {
    final path = await _localPath;
    return File('$path/fuel_tank.json');
  }

  Future<File> get _missileRackPath async {
    final path = await _localPath;
    return File('$path/missile_rack.json');
  }

  Future<File> get _powerPlantPath async {
    final path = await _localPath;
    return File('$path/power_plant.json');
  }

  Future<File> get _personalStoragePath async {
    final path = await _localPath;
    return File('$path/personal_storage.json');
  }

  Future<File> get _quantumDrivePath async {
    final path = await _localPath;
    return File('$path/qd.json');
  }

  Future<File> get _selfDestructPath async {
    final path = await _localPath;
    return File('$path/self_destruct.json');
  }

  Future<File> get _thrusterPath async {
    final path = await _localPath;
    return File('$path/thruster.json');
  }

  Future<File> get _turretPath async {
    final path = await _localPath;
    return File('$path/turret.json');
  }

  Future<File> get _vehicleWeaponPath async {
    final path = await _localPath;
    return File('$path/vehicle_weapon.json');
  }

  Future<File> get _vehicleAmmoPath async {
    final path = await _localPath;
    return File('$path/vehicle_ammo.json');
  }

  Future<File> get _skinPath async {
    final path = await _localPath;
    return File('$path/skin.json');
  }

  Future<File> get _manufacturerPath async {
    final path = await _localPath;
    return File('$path/manufacture.json');
  }

  Future<File> get _lifeSupportPath async {
    final path = await _localPath;
    return File('$path/life_support.json');
  }

  Future<File> get _radarPath async {
    final path = await _localPath;
    return File('$path/radar.json');
  }

  Future<File> get _missilePath async {
    final path = await _localPath;
    return File('$path/missile.json');
  }


  Future<int> getShipInfoVersion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('vip.kirakira.ship_info.version') ?? 0;
  }

  Future<void> writeShipInfoVersion(int version) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('vip.kirakira.ship_info.version', version);
  }


  Future<List<Manufacturer>> readManufacturers() async {
    try {
      final file = await _manufacturerPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Manufacturer.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Manufacturer>> getManufacturers() async {
    if (_manufacturers.isNotEmpty) {
      return _manufacturers;
    }
    _manufacturers = await readManufacturers();
    return _manufacturers;
  }


  Future<Manufacturer?> getManufacturerByReference(String ref) async {
    if (_manufacturers.isEmpty) {
      return null;
    }
    for (var manufacturer in _manufacturers) {
      if (manufacturer.ref == ref) {
        return manufacturer;
      }
    }

    return null;
  }


  Manufacturer? getManufacturerByReferenceSync(String ref) {
    if (_manufacturers.isEmpty) {
      return null;
    }
    for (var manufacturer in _manufacturers) {
      if (manufacturer.ref == ref) {
        return manufacturer;
      }
    }

    return null;
  }


  Future<List<LifeSupport>> readLifeSupports() async {
    try {
      final file = await _lifeSupportPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => LifeSupport.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }


  Future<List<LifeSupport>> getLifeSupports() async {
    if (_lifeSupports.isNotEmpty) {
      return _lifeSupports;
    }
    _lifeSupports = await readLifeSupports();
    return _lifeSupports;
  }


  Future<LifeSupport?> getLifeSupportByReference(String ref) async {
    if (_lifeSupports.isEmpty) {
      return null;
    }
    for (var lifeSupport in _lifeSupports) {
      if (lifeSupport.ref == ref) {
        return lifeSupport;
      }
    }

    return null;
  }


  LifeSupport? getLifeSupportByReferenceSync(String ref) {
    if (_lifeSupports.isEmpty) {
      return null;
    }
    for (var lifeSupport in _lifeSupports) {
      if (lifeSupport.ref == ref) {
        return lifeSupport;
      }
    }

    return null;
  }


  Future<List<Radar>> readRadars() async {
    try {
      final file = await _radarPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Radar.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }


  Future<List<Radar>> getRadars() async {
    if (_radars.isNotEmpty) {
      return _radars;
    }
    _radars = await readRadars();
    return _radars;
  }


  Future<Radar?> getRadarByReference(String ref) async {
    if (_radars.isEmpty) {
      return null;
    }
    for (var radar in _radars) {
      if (radar.ref == ref) {
        return radar;
      }
    }

    return null;
  }


  Radar? getRadarByReferenceSync(String ref) {
    if (_radars.isEmpty) {
      return null;
    }
    for (var radar in _radars) {
      if (radar.ref == ref) {
        return radar;
      }
    }

    return null;
  }


  Future<List<Armor>> readArmores() async {
    try {
      final file = await _armorPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Armor.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Armor>> getArmors() async {
    if (_armors.isNotEmpty) {
      return _armors;
    }
    _armors = await readArmores();
    return _armors;
  }

  Future<Armor?> getArmorByReference(String ref) async {
    if (_armors.isEmpty) {
      return null;
    }
    for (var armor in _armors) {
      if (armor.ref == ref) {
        return armor;
      }
    }

    return null;
  }

  Future<List<Shield>> readShields() async {
    try {
      final file = await _shieldPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Shield.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Shield>> getShields() async {
    if (_shields.isNotEmpty) {
      return _shields;
    }
    _shields = await readShields();
    return _shields;
  }

  Future<List<CargoGrid>> readCargoGrids() async {
    try {
      final file = await _cargoGridPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => CargoGrid.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<CargoGrid>> getCargoGrids() async {
    if (_cargoGrids.isNotEmpty) {
      return _cargoGrids;
    }
    _cargoGrids = await readCargoGrids();
    return _cargoGrids;
  }

  Future<CargoGrid?> getCargoGridByReference(String ref) async {
    if (_cargoGrids.isEmpty) {
      return null;
    }
    for (var cargoGrid in _cargoGrids) {
      if (cargoGrid.ref == ref) {
        return cargoGrid;
      }
    }

    return null;
  }


  Future<List<Missile>> readMissiles() async {
    try {
      final file = await _missilePath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Missile.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }


  Future<List<Missile>> getMissiles() async {
    if (_missiles.isNotEmpty) {
      return _missiles;
    }
    _missiles = await readMissiles();
    return _missiles;
  }

  Missile? getMissileByReferenceSync(String ref) {
    if (_missiles.isEmpty) {
      return null;
    }
    for (var missile in _missiles) {
      if (missile.ref == ref) {
        return missile;
      }
    }

    return null;
  }

  Future<List<Controller>> readControllers() async {
    try {
      final file = await _controllerPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Controller.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Controller>> getControllers() async {
    if (_controllers.isNotEmpty) {
      return _controllers;
    }
    _controllers = await readControllers();
    return _controllers;
  }

  Future<Controller?> getControllerByReference(String ref) async {
    if (_controllers.isEmpty) {
      return null;
    }
    for (var controller in _controllers) {
      if (controller.ref == ref) {
        return controller;
      }
    }

    return null;
  }

  Future<List<Cooler>> readCoolers() async {
    try {
      final file = await _coolerPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Cooler.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Cooler>> getCoolers() async {
    if (_coolers.isNotEmpty) {
      return _coolers;
    }
    _coolers = await readCoolers();
    return _coolers;
  }

  Future<Cooler?> getCoolerByReference(String ref) async {
    if (_coolers.isEmpty) {
      return null;
    }
    for (var cooler in _coolers) {
      if (cooler.ref == ref) {
        return cooler;
      }
    }

    return null;
  }

  Future<List<FuelIntake>> readFuelIntakes() async {
    try {
      final file = await _fuelIntakePath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => FuelIntake.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }


  Future<List<FuelIntake>> getFuelIntakes() async {
    if (_fuelIntakes.isNotEmpty) {
      return _fuelIntakes;
    }
    _fuelIntakes = await readFuelIntakes();
    return _fuelIntakes;
  }

  Future<FuelIntake?> getFuelIntakeByReference(String ref) async {
    if (_fuelIntakes.isEmpty) {
      return null;
    }
    for (var fuelIntake in _fuelIntakes) {
      if (fuelIntake.ref == ref) {
        return fuelIntake;
      }
    }

    return null;
  }

  Future<List<FuelTank>> readFuelTanks() async {
    try {
      final file = await _fuelTankPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => FuelTank.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<FuelTank>> getFuelTanks() async {
    if (_fuelTanks.isNotEmpty) {
      return _fuelTanks;
    }
    _fuelTanks = await readFuelTanks();
    return _fuelTanks;
  }

  Future<FuelTank?> getFuelTankByReference(String ref) async {
    if (_fuelTanks.isEmpty) {
      return null;
    }
    for (var fuelTank in _fuelTanks) {
      if (fuelTank.ref == ref) {
        return fuelTank;
      }
    }

    return null;
  }

  Future<List<MissileRack>> readMissileRacks() async {
    try {
      final file = await _missileRackPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => MissileRack.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<MissileRack>> getMissileRacks() async {
    if (_missileRacks.isNotEmpty) {
      return _missileRacks;
    }
    _missileRacks = await readMissileRacks();
    return _missileRacks;
  }

  Future<MissileRack?> getMissileRackByReference(String ref) async {
    if (_missileRacks.isEmpty) {
      return null;
    }
    for (var missileRack in _missileRacks) {
      if (missileRack.ref == ref) {
        return missileRack;
      }
    }

    return null;
  }

  Future<List<PowerPlant>> readPowerPlants() async {
    try {
      final file = await _powerPlantPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => PowerPlant.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<PowerPlant>> getPowerPlants() async {
    if (_powerPlants.isNotEmpty) {
      return _powerPlants;
    }
    _powerPlants = await readPowerPlants();
    return _powerPlants;
  }

  Future<PowerPlant?> getPowerPlantByReference(String ref) async {
    if (_powerPlants.isEmpty) {
      return null;
    }
    for (var powerPlant in _powerPlants) {
      if (powerPlant.ref == ref) {
        return powerPlant;
      }
    }

    return null;
  }

  Future<List<PersonalStorage>> readPersonalStorages() async {
    try {
      final file = await _personalStoragePath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => PersonalStorage.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<PersonalStorage>> getPersonalStorages() async {
    if (_personalStorages.isNotEmpty) {
      return _personalStorages;
    }
    _personalStorages = await readPersonalStorages();
    return _personalStorages;
  }

  Future<PersonalStorage?> getPersonalStorageByReference(String ref) async {
    if (_personalStorages.isEmpty) {
      return null;
    }
    for (var personalStorage in _personalStorages) {
      if (personalStorage.ref == ref) {
        return personalStorage;
      }
    }

    return null;
  }

  Future<List<QuantumDrive>> readQuantumDrives() async {
    try {
      final file = await _quantumDrivePath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => QuantumDrive.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<QuantumDrive>> getQuantumDrives() async {
    if (_quantumDrives.isNotEmpty) {
      return _quantumDrives;
    }
    _quantumDrives = await readQuantumDrives();
    return _quantumDrives;
  }

  Future<QuantumDrive?> getQuantumDriveByReference(String ref) async {
    if (_quantumDrives.isEmpty) {
      return null;
    }
    for (var quantumDrive in _quantumDrives) {
      if (quantumDrive.ref == ref) {
        return quantumDrive;
      }
    }

    return null;
  }

  Future<List<SelfDestruct>> readSelfDestructs() async {
    try {
      final file = await _selfDestructPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => SelfDestruct.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<SelfDestruct>> getSelfDestructs() async {
    if (_selfDestructs.isNotEmpty) {
      return _selfDestructs;
    }
    _selfDestructs = await readSelfDestructs();
    return _selfDestructs;
  }

  Future<SelfDestruct?> getSelfDestructByReference(String ref) async {
    if (_selfDestructs.isEmpty) {
      return null;
    }
    for (var selfDestruct in _selfDestructs) {
      if (selfDestruct.ref == ref) {
        return selfDestruct;
      }
    }

    return null;
  }

  Future<List<Thruster>> readThrusters() async {
    try {
      final file = await _thrusterPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Thruster.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Thruster>> getThrusters() async {
    if (_thrusters.isNotEmpty) {
      return _thrusters;
    }
    _thrusters = await readThrusters();
    return _thrusters;
  }

  Future<Thruster?> getThrusterByReference(String ref) async {
    if (_thrusters.isEmpty) {
      return null;
    }
    for (var thruster in _thrusters) {
      if (thruster.ref == ref) {
        return thruster;
      }
    }

    return null;
  }

  Future<List<Turret>> readTurrets() async {
    try {
      final file = await _turretPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Turret.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Turret>> getTurrets() async {
    if (_turrets.isNotEmpty) {
      return _turrets;
    }
    _turrets = await readTurrets();
    return _turrets;
  }

  Future<Turret?> getTurretByReference(String ref) async {
    if (_turrets.isEmpty) {
      return null;
    }
    for (var turret in _turrets) {
      if (turret.ref == ref) {
        return turret;
      }
    }

    return null;
  }

  Future<List<VehicleWeapon>> readVehicleWeapons() async {
    try {
      final file = await _vehicleWeaponPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => VehicleWeapon.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<VehicleWeapon>> getVehicleWeapons() async {
    if (_vehicleWeapons.isNotEmpty) {
      return _vehicleWeapons;
    }
    _vehicleWeapons = await readVehicleWeapons();
    return _vehicleWeapons;
  }

  Future<VehicleWeapon?> getVehicleWeaponByReference(String ref) async {
    if (_vehicleWeapons.isEmpty) {
      return null;
    }
    for (var vehicleWeapon in _vehicleWeapons) {
      if (vehicleWeapon.ref == ref) {
        return vehicleWeapon;
      }
    }

    return null;
  }

  Future<List<VehicleAmmo>> readVehicleAmmos() async {
    try {
      final file = await _vehicleAmmoPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => VehicleAmmo.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<VehicleAmmo>> getVehicleAmmos() async {
    if (_vehicleAmmos.isNotEmpty) {
      return _vehicleAmmos;
    }
    _vehicleAmmos = await readVehicleAmmos();
    return _vehicleAmmos;
  }

  Future<VehicleAmmo?> getVehicleAmmoByReference(String ref) async {
    if (_vehicleAmmos.isEmpty) {
      return null;
    }
    for (var vehicleAmmo in _vehicleAmmos) {
      if (vehicleAmmo.ref == ref) {
        return vehicleAmmo;
      }
    }

    return null;
  }

  Future<List<Skin>> readSkins() async {
    try {
      final file = await _skinPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => Skin.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Skin>> getSkins() async {
    if (_skins.isNotEmpty) {
      return _skins;
    }
    _skins = await readSkins();
    return _skins;
  }


  Future<Shield?> getShieldByReference(String ref) async {
    if (_shields.isEmpty) {
      return null;
    }
    for (var shield in _shields) {
      if (shield.ref == ref) {
        return shield;
      }
    }

    return null;
  }

  Armor? getArmorByReferenceSync(String ref) {
    if (_armors.isEmpty) {
      return null;
    }
    for (var armor in _armors) {
      if (armor.ref == ref) {
        return armor;
      }
    }

    return null;
  }

  Shield? getShieldByReferenceSync(String ref) {
    if (_shields.isEmpty) {
      return null;
    }
    for (var shield in _shields) {
      if (shield.ref == ref) {
        return shield;
      }
    }

    return null;
  }

  CargoGrid? getCargoGridByReferenceSync(String ref) {
    if (_cargoGrids.isEmpty) {
      return null;
    }
    for (var cargoGrid in _cargoGrids) {
      if (cargoGrid.ref == ref) {
        return cargoGrid;
      }
    }

    return null;
  }

  Controller? getControllerByReferenceSync(String ref) {
    if (_controllers.isEmpty) {
      return null;
    }
    for (var controller in _controllers) {
      if (controller.ref == ref) {
        return controller;
      }
    }

    return null;
  }

  Cooler? getCoolerByReferenceSync(String ref) {
    if (_coolers.isEmpty) {
      return null;
    }
    for (var cooler in _coolers) {
      if (cooler.ref == ref) {
        return cooler;
      }
    }

    return null;
  }

  FuelIntake? getFuelIntakeByReferenceSync(String ref) {
    if (_fuelIntakes.isEmpty) {
      return null;
    }
    for (var fuelIntake in _fuelIntakes) {
      if (fuelIntake.ref == ref) {
        return fuelIntake;
      }
    }

    return null;
  }

  FuelTank? getFuelTankByReferenceSync(String ref) {
    if (_fuelTanks.isEmpty) {
      return null;
    }
    for (var fuelTank in _fuelTanks) {
      if (fuelTank.ref == ref) {
        return fuelTank;
      }
    }

    return null;
  }

  MissileRack? getMissileRackByReferenceSync(String ref) {
    if (_missileRacks.isEmpty) {
      return null;
    }
    for (var missileRack in _missileRacks) {
      if (missileRack.ref == ref) {
        return missileRack;
      }
    }

    return null;
  }

  PowerPlant? getPowerPlantByReferenceSync(String ref) {
    if (_powerPlants.isEmpty) {
      return null;
    }
    for (var powerPlant in _powerPlants) {
      if (powerPlant.ref == ref) {
        return powerPlant;
      }
    }

    return null;
  }

  PersonalStorage? getPersonalStorageByReferenceSync(String ref) {
    if (_personalStorages.isEmpty) {
      return null;
    }
    for (var personalStorage in _personalStorages) {
      if (personalStorage.ref == ref) {
        return personalStorage;
      }
    }

    return null;
  }

  QuantumDrive? getQuantumDriveByReferenceSync(String ref) {
    if (_quantumDrives.isEmpty) {
      return null;
    }
    for (var quantumDrive in _quantumDrives) {
      if (quantumDrive.ref == ref) {
        return quantumDrive;
      }
    }

    return null;
  }

  SelfDestruct? getSelfDestructByReferenceSync(String ref) {
    if (_selfDestructs.isEmpty) {
      return null;
    }
    for (var selfDestruct in _selfDestructs) {
      if (selfDestruct.ref == ref) {
        return selfDestruct;
      }
    }

    return null;
  }

  Thruster? getThrusterByReferenceSync(String ref) {
    if (_thrusters.isEmpty) {
      return null;
    }
    for (var thruster in _thrusters) {
      if (thruster.ref == ref) {
        return thruster;
      }
    }

    return null;
  }

  Turret? getTurretByReferenceSync(String ref) {
    if (_turrets.isEmpty) {
      return null;
    }
    for (var turret in _turrets) {
      if (turret.ref == ref) {
        return turret;
      }
    }

    return null;
  }

  VehicleWeapon? getVehicleWeaponByReferenceSync(String ref) {
    if (_vehicleWeapons.isEmpty) {
      return null;
    }
    for (var vehicleWeapon in _vehicleWeapons) {
      if (vehicleWeapon.ref == ref) {
        return vehicleWeapon;
      }
    }

    return null;
  }

  VehicleAmmo? getVehicleAmmoByReferenceSync(String ref) {
    if (_vehicleAmmos.isEmpty) {
      return null;
    }
    for (var vehicleAmmo in _vehicleAmmos) {
      if (vehicleAmmo.ref == ref) {
        return vehicleAmmo;
      }
    }

    return null;
  }

  Ship? getShipByReferenceSync(String ref) {
    if (_ships.isEmpty) {
      return null;
    }
    for (var ship in _ships) {
      if (ship.ref == ref) {
        return ship;
      }
    }

    return null;
  }

  Skin? getSkinByReferenceSync(String ref) {
    if (_skins.isEmpty) {
      return null;
    }
    for (var skin in _skins) {
      if (skin.ref == ref) {
        return skin;
      }
    }

    return null;
  }


  Future<List<ShipStore>> readShipStore() async {
    try {
      final file = await _shipPath;
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      return json.map((e) => ShipStore.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Ship? convertShipStoreSync(ShipStore shipStore) {
    final armor = getArmorByReferenceSync(shipStore.armor.ref);
    final shields = shipStore.shields.map((e) => getShieldByReferenceSync(e.ref)!).toList();
    final cargoGrids = shipStore.cargos.map((e) => getCargoGridByReferenceSync(e.ref)!).toList();
    final controllers = shipStore.controllers.map((e) => getControllerByReferenceSync(e.ref)!).toList();
    final coolers = shipStore.coolers.map((e) => getCoolerByReferenceSync(e.ref)!).toList();
    final fuelIntakes = shipStore.fuelIntakes.map((e) => getFuelIntakeByReferenceSync(e.ref)!).toList();
    final fuelTanks = shipStore.fuelTanks.map((e) => getFuelTankByReferenceSync(e.ref)!).toList();
    final missileRacks = shipStore.missileRacks.map((e) => getMissileRackByReferenceSync(e.ref)!).toList();
    final powerPlants = shipStore.powerPlants.map((e) => getPowerPlantByReferenceSync(e.ref)!).toList();
    final personalStorage = shipStore.personalStorage != null ? getPersonalStorageByReferenceSync(shipStore.personalStorage!.ref) : null;
    final quantumDrive = shipStore.qd != null ? getQuantumDriveByReferenceSync(shipStore.qd!.ref)! : null;
    final selfDestruct = shipStore.selfDestruct != null ? getSelfDestructByReferenceSync(shipStore.selfDestruct!.ref)! : null;
    final thrusters = shipStore.thrusts.map((e) => getThrusterByReferenceSync(e.ref)!).toList();
    final turrets = shipStore.turrets.map((e) => getTurretByReferenceSync(e.ref)!).toList();
    final vehicleWeapons = shipStore.weapons.map((e) => getVehicleWeaponByReferenceSync(e.ref)!).toList();
    final paints = shipStore.paints.map((e) => getSkinByReferenceSync(e.ref)!).toList();
    final lifeSupport = shipStore.lifeSupport != null ? getLifeSupportByReferenceSync(shipStore.lifeSupport!.ref) : null;
    final radar = shipStore.radar != null ? getRadarByReferenceSync(shipStore.radar!.ref) : null;

    final clonedTurrets = turrets.map((e) => Turret.fromJson(e.toJson())).toList();
    final clonedMissileRacks = missileRacks.map((e) => MissileRack.fromJson(e.toJson())).toList();

    for (var i=0; i<clonedTurrets.length; i++) {
      clonedTurrets[i].loadout = shipStore.turrets[i].loadout;
    }

    for (var i=0; i<clonedMissileRacks.length; i++) {
      clonedMissileRacks[i].loadout = shipStore.missileRacks[i].loadout;
    }

    if (armor == null) {
      return null;
    }


    return Ship(
      armor: armor,
      shields: shields,
      cargos: cargoGrids,
      controllers: controllers,
      coolers: coolers,
      fuelIntakes: fuelIntakes,
      fuelTanks: fuelTanks,
      missileRacks: clonedMissileRacks,
      powerPlants: powerPlants,
      personalStorage: personalStorage,
      qd: quantumDrive,
      selfDestruct: selfDestruct,
      thrusts: thrusters,
      turrets: clonedTurrets,
      weapons: vehicleWeapons,
      ref: shipStore.ref,
      name: shipStore.name,
      chineseName: shipStore.chineseName,
      manufacturer: shipStore.manufacturer,
      type: shipStore.type,
      size: shipStore.size,
      mass: shipStore.mass,
      flare: shipStore.flare,
      hulls: shipStore.hulls,
      paints: paints,
      shipAlias: shipStore.shipAlias,
      shopInfo: shipStore.shopInfo,
      weaponRegenPool: null,
      vehicle: shipStore.vehicle,
      shipNameBinding: shipStore.shipNameBinding,
      lifeSupport: lifeSupport,
      radar: radar,
      weaponFixedPool: shipStore.weaponFixedPool
    );

  }



  Future<List<Ship>> readShip() async {
    await getArmors();
    await getShields();
    await getCargoGrids();
    await getControllers();
    await getCoolers();
    await getFuelIntakes();
    await getFuelTanks();
    await getMissiles();
    await getMissileRacks();
    await getPowerPlants();
    await getPersonalStorages();
    await getQuantumDrives();
    await getSelfDestructs();
    await getThrusters();
    await getTurrets();
    await getVehicleWeapons();
    await getVehicleAmmos();
    await getSkins();
    await getManufacturers();
    await getLifeSupports();
    await getRadars();

    final shipStore = await readShipStore();

    final ships = shipStore.map((e) => convertShipStoreSync(e)).toList();

    _ships = ships.where((e) => e != null).toList().cast<Ship>();

    return _ships;

  }

  Future<List<Ship>> getShips() async {
    if (_ships.isNotEmpty) {
      return _ships;
    }
    _ships = await readShip();
    return _ships;
  }

  List<Ship> getShipsSync() {
    return _ships;
  }

  Future<Ship?> getShipByReference(String ref) async {
    if (_ships.isEmpty) {
      return null;
    }
    for (var ship in _ships) {
      if (ship.ref == ref) {
        return ship;
      }
    }

    return null;
  }

  Future<Ship?> getShipByAliasId(int id) async {
    if (_ships.isEmpty) {
      return null;
    }
    for (var ship in _ships) {
      if (ship.shipAlias == null) {
        continue;
      }
      if (ship.shipAlias!.id == id) {
        return ship;
      }
    }

    return null;
  }
}