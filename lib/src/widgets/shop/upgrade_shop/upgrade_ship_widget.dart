import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../datasource/data_model.dart';
import '../cart/cart.dart';
import 'upgrade_page.dart';

Future<void> onPressUpgrade(BuildContext context) async {
  final developerMode = context.read<MainDataModel>().isDevMode;
  await Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => UpgradePage(developerMode: developerMode)));
}

Future<void> onPressCart(BuildContext context) => showCartBottomSheet(context);
