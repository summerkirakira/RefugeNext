import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/cirno/property/property.dart';


class CcuStepProperties {
  final ShipAlias fromShip;
  final ShipAlias toShip;
  final int price;
  final bool isWarbond;
  final bool isHangar;
  final bool isBuyback;


  CcuStepProperties({
    required this.fromShip,
    required this.toShip,
    required this.price,
    required this.isWarbond,
    required this.isHangar,
    required this.isBuyback,
  });
}


class CcuStepWidget extends StatelessWidget {
  final CcuStepProperties properties;
  final Function(CcuStepProperties) onSelected;

  CcuStepWidget({
    required this.properties,
    required this.onSelected,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      ],
    );
  }
}