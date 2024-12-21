import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/models/ship_info/ship.dart';
import 'package:refuge_next/src/widgets/ship_info/utils/cargo_grid_view.dart';

import '../../datasource/data_model.dart';

int _formatCargoAmount(double amount) {
  return (amount / 1.25).toInt();
}

class CargoInfoItem extends StatelessWidget {
  final String title;

  // final Widget leading;
  final Widget trailing;

  const CargoInfoItem(
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

class CargoPage extends StatefulWidget {
  const CargoPage({Key? key}) : super(key: key);

  @override
  _CargoPageState createState() => _CargoPageState();
}

class _CargoPageState extends State<CargoPage> {

  late Ship ship;

  Widget _buildCargoInfoCard(List<CargoGrid> cargoGrids) {

    if (cargoGrids.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Text("没有货仓信息"),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            for (var cargo in cargoGrids) ...[
              if (cargo.subCargoGrid != null)
                CargoInfoItem(
                  // leading: item.leading,
                  title: "${(cargo.subCargoGrid!.grid.x * cargo.subCargoGrid!.grid.y * cargo.subCargoGrid!.grid.z / 1.953125).toInt()} SCU 货仓",
                  trailing: Row(
                    children: [
                      Text(
                        _formatCargoAmount(cargo.subCargoGrid!.grid.x).toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("x", style: TextStyle(fontSize: 14, color: Colors.orange)),
                      Text(
                        _formatCargoAmount(cargo.subCargoGrid!.grid.y).toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("x", style: TextStyle(fontSize: 14, color: Colors.orange)),
                      Text(
                        _formatCargoAmount(cargo.subCargoGrid!.grid.z).toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
            ]
              
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ship = Provider.of<MainDataModel>(context).currentShipInfo!;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildCargoInfoCard(ship.cargos),
            ],
          )
      ),
    );
  }
}