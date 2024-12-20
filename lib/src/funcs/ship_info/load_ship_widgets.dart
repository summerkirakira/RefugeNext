import 'package:flutter/cupertino.dart';
import 'package:refuge_next/src/datasource/models/ship_info/missile.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/cooler.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/life_support.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/missile.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/power_plant.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/qd.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/radar.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/shield.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/turret.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_components/weapon.dart';

import '../../datasource/models/ship_info/ship.dart';
import '../../repo/ship_info.dart';
import '../../widgets/ship_info/ship_components/missile_racks.dart';

String formatNumber(double number, {int fractionDigits = 1}) {
  // 判断是否为整数
  if (number == number.roundToDouble()) {
    // 是整数，直接转换为整数字符串
    return number.toInt().toString();
  } else {
    // 不是整数，保留一位小数
    return number.toStringAsFixed(fractionDigits);
  }
}


String formatPortSizes(List<Port> ports) {
  // 1. 统计每个maxSize的数量
  Map<int, int> sizeCount = {};
  for (var port in ports) {
    sizeCount[port.maxSize] = (sizeCount[port.maxSize] ?? 0) + 1;
  }

  // 2. 按maxSize排序
  var sortedSizes = sizeCount.keys.toList()..sort();

  // 3. 构建输出字符串
  return sortedSizes.map((size) =>
  '${sizeCount[size]}xS$size'
  ).join(' ');
}



CoolerListItem getCoolerWidget(Cooler cooler) {

  final shipInfoRepo = ShipInfoRepo();

  final name = cooler.chineseName ?? cooler.name;
  final coolingMass = cooler.heat.mass;
  final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(cooler.manufacturer!);
  final size = cooler.size;
  final manufacturerName = manufacturer != null ? manufacturer.chineseName ?? manufacturer.name : '未知制造商';


  return CoolerListItem(
    name: name,
    coolingValue: formatNumber(coolingMass),
    manufacturer: manufacturerName,
    size: size,
    energyCount: formatNumber(cooler.resourceConnection.standardResourceUnits),
  );
}


ShieldListItem getShieldWidget(Shield shield) {
  final shipInfoRepo = ShipInfoRepo();

  final name = shield.chineseName ?? shield.name;
  final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(shield.manufacturer!)!;
  final size = shield.size;
  final manufacturerName = manufacturer.chineseName ?? manufacturer.name;

  return ShieldListItem(
    name: name,
    manufacturer: manufacturerName,
    size: size,
    shieldStrength: formatNumber(shield.health),
    energyCount: formatNumber(shield.resourceConnection.standardResourceUnits),
    fullyChargedTime: 20.7,
  );
}

LifeSupportListItem getLifeSupportWidget(LifeSupport lifeSupport) {

    final shipInfoRepo = ShipInfoRepo();

    final name = lifeSupport.chineseName ?? lifeSupport.name;
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(lifeSupport.manufacturer!)!;
    final size = lifeSupport.size;
    final manufacturerName = manufacturer.chineseName ?? manufacturer.name;

    return LifeSupportListItem(
      name: name,
      manufacturer: manufacturerName,
      size: size,
      energyCount: formatNumber(lifeSupport.resourceConnection.standardResourceUnits),
    );
}

PowerPlantListItem getPowerPlantWidget(PowerPlant powerPlant) {

    final shipInfoRepo = ShipInfoRepo();

    final name = powerPlant.chineseName ?? powerPlant.name;
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(powerPlant.manufacturer!);
    final size = powerPlant.size;
    final manufacturerName = manufacturer != null ? manufacturer.chineseName ?? manufacturer.name : '未知制造商';

    return PowerPlantListItem(
      name: name,
      manufacturer: manufacturerName,
      size: size,
      energyCount: formatNumber(powerPlant.resourceConnection.standardResourceUnits),
      powerGen: powerPlant.power.powerDraw.toInt().toString(),
    );
}

RadarListItem getRadarWidget(Radar radar) {

    final shipInfoRepo = ShipInfoRepo();

    final name = radar.chineseName ?? radar.name;
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(radar.manufacturer!);
    final size = radar.size;
    final manufacturerName = manufacturer != null ? manufacturer.chineseName ?? manufacturer.name : '未知制造商';

    return RadarListItem(
      name: name,
      manufacturer: manufacturerName,
      size: size,
      energyCount: formatNumber(radar.resourceConnection.standardResourceUnits),
    );
}


WeaponListItem getWeaponWidget(VehicleWeapon weapon) {

    final shipInfoRepo = ShipInfoRepo();

    final name = weapon.chineseName ?? weapon.name;
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(weapon.manufacturer!);
    final size = weapon.size;
    final manufacturerName = manufacturer != null ? manufacturer.chineseName ?? manufacturer.name : '未知制造商';

    double dps = 0;
    
    if (weapon.ammo != null) {
      dps = weapon.ammo!.damage.damageBiochemical
          + weapon.ammo!.damage.damageEnergy
          + weapon.ammo!.damage.damageDistortion
          + weapon.ammo!.damage.damageThermal
          + weapon.ammo!.damage.damagePhysical
          + weapon.ammo!.damage.damageStun;
      final fireRate = weapon.fireModes[0].fireRate ?? 0;
      final ammoCost = weapon.fireModes[0].ammoCost ?? 0;
      dps = dps * fireRate * ammoCost / 60;
    }
    
    return WeaponListItem(
      name: name,
      manufacturer: manufacturerName,
      size: size,
      energyCount: formatNumber(weapon.resourceConnection.standardResourceUnits),
      dps: dps.toInt().toString(),
      ammoText: "预计DPS",
    );
}


MissileListItem getMissileWidget(Missile missile) {

    final shipInfoRepo = ShipInfoRepo();

    final name = missile.chineseName ?? missile.name;
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(missile.manufacturer!);
    final size = missile.size;
    final manufacturerName = manufacturer != null ? manufacturer.chineseName ?? manufacturer.name : '未知制造商';

    final damage = missile.damage.damageBiochemical
        + missile.damage.damageEnergy
        + missile.damage.damageDistortion
        + missile.damage.damageThermal
        + missile.damage.damagePhysical
        + missile.damage.damageStun;

    return MissileListItem(
      name: name,
      manufacturer: manufacturerName,
      size: size,
      energyCount: "0",
      damage: damage.toInt().toString(),
      speed: missile.speed.toInt().toString(),
    );
}


Widget getTurretWidget(Turret turret) {
    final shipInfoRepo = ShipInfoRepo();

    final name = turret.chineseName ?? turret.name;
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(turret.manufacturer!);
    final size = turret.size;
    final manufacturerName = manufacturer != null ? manufacturer.chineseName ?? manufacturer.name : '未知制造商';

    final List<VehicleWeapon> weapons = [];
    if (turret.loadout != null) {
      for (final weaponRef in turret.loadout!) {
        final weapon = shipInfoRepo.getVehicleWeaponByReferenceSync(weaponRef);
        if (weapon != null) {
          weapons.add(weapon);
        }
      }
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TurretListItem(
          name: name,
          manufacturer: manufacturerName,
          size: size,
          energyCount: "0",
          loadoutSize: formatPortSizes(turret.ports),
        ),
        for (final weapon in weapons)
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: getWeaponWidget(weapon),
          )
      ],
    );

}

Widget getMissileRackWidget(MissileRack missileRack) {
    final shipInfoRepo = ShipInfoRepo();

    final name = missileRack.chineseName ?? missileRack.name;
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(missileRack.manufacturer!);
    final size = missileRack.size;
    final manufacturerName = manufacturer != null ? manufacturer.chineseName ?? manufacturer.name : '未知制造商';

    final List<Missile> missiles = [];
    if (missileRack.loadout != null) {
      for (final missileRef in missileRack.loadout!) {
        final missile = shipInfoRepo.getMissileByReferenceSync(missileRef);
        if (missile != null) {
          missiles.add(missile);
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MissileRackListItem(
          name: name,
          manufacturer: manufacturerName,
          size: size,
          energyCount: "0",
          loadoutSize: formatPortSizes(missileRack.ports),
        ),
        for (final missile in missiles)
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: getMissileWidget(missile),
          )
      ],
    );
}


QuantumDriveListItem getQuantumDriveWidget(QuantumDrive quantumDrive) {
    final shipInfoRepo = ShipInfoRepo();

    final name = quantumDrive.chineseName ?? quantumDrive.name;
    final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(quantumDrive.manufacturer!);
    final size = quantumDrive.size;
    final manufacturerName = manufacturer != null ? manufacturer.chineseName ?? manufacturer.name : '未知制造商';

    return QuantumDriveListItem(
      name: name,
      manufacturer: manufacturerName,
      size: size,
      energyCount: formatNumber(quantumDrive.resourceConnection.standardResourceUnits),
    );
}


List<int> _getEnergyBricks(ResourceConnection resourceConnection) {
  final energyCount = resourceConnection.standardResourceUnits;
  if (resourceConnection.minimumConsumptionFraction == 0) {
    return List.filled(energyCount.toInt(), 1);
  }
  if (resourceConnection.minimumConsumptionFraction == 1) {
    return [energyCount.toInt()];
  }
  final fraction = resourceConnection.minimumConsumptionFraction > 0.5 ? 1 - resourceConnection.minimumConsumptionFraction : resourceConnection.minimumConsumptionFraction;
  final firstBrickCount = (energyCount * fraction).toInt();
  final secondBrickCount = energyCount - firstBrickCount;
  List<int> bricks = [];
  for (int i = 0; i < firstBrickCount; i++) {
    bricks.add(1);
  }

  bricks.add(secondBrickCount.toInt());
  return bricks;
}

List<int> getEnergyBricks(List<ResourceConnection> resourceConnections) {
  final List<int> bricks = [];
  for (final resourceConnection in resourceConnections) {
    bricks.addAll(_getEnergyBricks(resourceConnection));
  }
  bricks.sort();
  return bricks;
}