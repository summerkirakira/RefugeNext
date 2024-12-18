import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/funcs/ship_info/load_ship_info.dart';
import 'package:refuge_next/src/repo/ship_info.dart';

import '../../datasource/data_model.dart';

class ShipSimpleInfoItem extends StatelessWidget {
  final String title;

  // final Widget leading;
  final Widget trailing;

  const ShipSimpleInfoItem(
      {Key? key,
      // required this.leading,
      required this.title,
      required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        children: [
          // leading,
          // SizedBox(width: 10),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Spacer(),
          trailing,
        ],
      ),
    );
  }
}

class GeneralShipInfoWidget extends StatefulWidget {
  const GeneralShipInfoWidget({Key? key}) : super(key: key);

  @override
  _GeneralShipInfoWidgetState createState() => _GeneralShipInfoWidgetState();
}

class _GeneralShipInfoWidgetState extends State<GeneralShipInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final ShipInfoRepo shipInfoRepo = ShipInfoRepo();

    final selectedShipInfo =
        Provider.of<MainDataModel>(context).currentShipInfo!;

    final size = selectedShipInfo.size;

    final manufacturer = shipInfoRepo
        .getManufacturerByReferenceSync(selectedShipInfo.manufacturer!)!;

    final shipRole = selectedShipInfo.vehicle.vehicleRole;
    final shipName = selectedShipInfo.chineseName;
    final shipEnglishName = selectedShipInfo.name;
    final shipDescription =
        selectedShipInfo.vehicle.vehicleDescription.split("\\n").last;
    final shipCareer = selectedShipInfo.vehicle.vehicleCareer;

    final shipSizeX = selectedShipInfo.vehicle.maxBoundingBoxSize.x.floor();
    final shipSizeY = selectedShipInfo.vehicle.maxBoundingBoxSize.y.floor();
    final shipSizeZ = selectedShipInfo.vehicle.maxBoundingBoxSize.z.floor();

    final flightParams = getFlightParams(selectedShipInfo);

    final crewSize = selectedShipInfo.vehicle.crewSize;
    final damageMax =
        selectedShipInfo.vehicle.vehicleHullDamageNormalizationValue.floor();
    final shipMass = selectedShipInfo.mass.floor();

    final scmSpeed = flightParams?.scmSpeed;
    final scmBoostSpeedForward = flightParams?.boostSpeedForward.floor();
    final scmBoostSpeedBackward = flightParams?.boostSpeedBackward.floor();
    final maxPitch = flightParams?.maxAngularVelocity.x.floor();
    final maxYaw = flightParams?.maxAngularVelocity.y.floor();
    final maxRoll = flightParams?.maxAngularVelocity.z.floor();

    final maxPitchAfterBoost = flightParams == null
        ? 0
        : (maxPitch! * flightParams.afterburner.afterburnAngAccelMultiplier.x)
            .floor();
    final maxYawAfterBoost = flightParams == null
        ? 0
        : (maxYaw! * flightParams.afterburner.afterburnAngAccelMultiplier.y)
            .floor();
    final maxRollAfterBoost = flightParams == null
        ? 0
        : (maxRoll! * flightParams.afterburner.afterburnAngAccelMultiplier.z)
            .floor();

    final navMaxSpeed = flightParams?.maxSpeed;

    final fuel = calculateFuelTanks(selectedShipInfo.fuelTanks);
    final qtFuel = calculateQtFuelTanks(selectedShipInfo.fuelTanks);

    final fuelIntake = caculateFuelIntake(selectedShipInfo.fuelIntakes);

    final selfDestructTime = selectedShipInfo.selfDestruct!.data.time.floor();
    final selfDestructDamage =
        selectedShipInfo.selfDestruct!.data.damage.floor();

    final valueTextStyles = TextStyle(fontSize: 16);

    final valueTextStylesBold =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    final valueTextStylesBoldColored = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange);

    return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("简介",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(shipDescription, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    ShipSimpleInfoItem(
                        title: "职能",
                        trailing: Text("$shipRole / $shipCareer",
                            style: valueTextStylesBold)),
                    ShipSimpleInfoItem(
                        title: "制造商",
                        trailing: Text(manufacturer.chineseName!,
                            style: valueTextStylesBold)),
                    ShipSimpleInfoItem(
                        title: "等级",
                        trailing: Text("S$size", style: valueTextStylesBold)),
                    ShipSimpleInfoItem(
                        title: "尺寸",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$shipSizeX", style: valueTextStylesBold),
                            Text(" x ", style: valueTextStylesBoldColored),
                            Text("$shipSizeY", style: valueTextStylesBold),
                            Text(" x ", style: valueTextStylesBoldColored),
                            Text("$shipSizeZ", style: valueTextStylesBold),
                            Text(" m", style: valueTextStyles),
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "舰员人数",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$crewSize", style: valueTextStylesBold),
                            Text(" 人", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "SCM速度",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$scmSpeed", style: valueTextStylesBold),
                            Text(" m/s", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "SCM前向加力速度",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$scmBoostSpeedForward",
                                style: valueTextStylesBold),
                            Text(" m/s", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "SCM后向加力速度",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$scmBoostSpeedBackward",
                                style: valueTextStylesBold),
                            Text(" m/s", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "最大NAV速度",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$navMaxSpeed", style: valueTextStylesBold),
                            Text(" m/s", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "俯仰/偏航/滚转",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$maxPitch", style: valueTextStylesBold),
                            Text(" / ", style: valueTextStylesBoldColored),
                            Text("$maxYaw", style: valueTextStylesBold),
                            Text(" / ", style: valueTextStylesBoldColored),
                            Text("$maxRoll", style: valueTextStylesBold),
                            Text(" deg/s", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "加力角速度",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$maxPitchAfterBoost",
                                style: valueTextStylesBold),
                            Text(" / ", style: valueTextStylesBoldColored),
                            Text("$maxYawAfterBoost",
                                style: valueTextStylesBold),
                            Text(" / ", style: valueTextStylesBoldColored),
                            Text("$maxRollAfterBoost",
                                style: valueTextStylesBold),
                            Text(" deg/s", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "舰体强度",
                        trailing:
                            Text("$damageMax", style: valueTextStylesBold)),
                    ShipSimpleInfoItem(
                        title: "质量",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$shipMass", style: valueTextStylesBold),
                            Text(" kg", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "氢燃料",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$fuel", style: valueTextStylesBold),
                            Text(" l", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "量子燃料",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$qtFuel", style: valueTextStylesBold),
                            Text(" l", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "燃料提取",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$fuelIntake", style: valueTextStylesBold),
                            Text(" l/s", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "自爆时间",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$selfDestructTime",
                                style: valueTextStylesBold),
                            Text(" s", style: valueTextStyles)
                          ],
                        )),
                    ShipSimpleInfoItem(
                        title: "自爆伤害",
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$selfDestructDamage",
                                style: valueTextStylesBold),
                            Text(" dmg", style: valueTextStyles)
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
