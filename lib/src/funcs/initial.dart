import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/filtered_ship_upgrade.dart';

import '../network/api_service.dart';
import '../repo/hangar.dart';
import '../repo/user.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/graphql/catalog.dart' show CatalogReq;
import '../network/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repo/user.dart';
import '../repo/translation.dart';
import '../network/cirno/cirno_api.dart';

import '../repo/ship_alias.dart';

import '../repo/buyback.dart';
import '../network/graphql/init_ship_upgrade.dart';
import '../network/graphql/filtered_ship_upgrade.dart';

import 'package:refuge_next/src/funcs/shop/cart.dart';




Future<void> mustStartup() async {

  await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('zh_CN', null);
  String storageLocation = (await getApplicationDocumentsDirectory()).path;
  await FastCachedImageConfig.init(subDir: storageLocation, clearCacheAfter: const Duration(days: 15));


  // if is light theme
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // 设置状态栏为透明
    statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为深色
  ));

  await userInit();


}

Future<void> userInit() async {

  final prefs = await SharedPreferences.getInstance();
  final userRepo = UserRepo();

  String? handle = prefs.getString('vip.kirakira.user.handle');
  String? device = prefs.getString('vip.kirakira.user.device');

  if (handle == null) {
    return;
  }

  final user = await userRepo.getUser(handle: handle);
  if (user == null) {
    return;
  }

  final rsiApiClient = RsiApiClient();

  if (device != null) {
    rsiApiClient.setRSIDevice(device: device);
  }
  rsiApiClient.setRSIToken(token: user.rsiToken);

  final cirnoClient = CirnoApiClient();

  // final translation = await cirnoClient.getTranslationMap("https://image.biaoju.site/starcitizen/translation/test_translation.json");

  final translationRepo = TranslationRepo();

  // await translationRepo.writeTranslation(translation, 0);

  await translationRepo.readTranslation();
  //
  // final a = await translationRepo.getTranslation('Paints');

  final shipAliases = await cirnoClient.getShipAliases("https://image.biaoju.site/starcitizen/formatted_ship_alias.1.1.6.json");

  final shipAliasRepo = ShipAliasRepo();
  await shipAliasRepo.writeShipAliases(shipAliases, 0);
  // final a = await shipAliasRepo.getShipAlias('Carrack');
  // print(a);


  // final buybackRepo = BuybackRepo();
  // await buybackRepo.readBuybackItems();
  // final items = await buybackRepo.refreshBuybackItems();
  // print(items);

  // await rsiApiClient.setAuthToken();
  // await rsiApiClient.setContextToken();
  // final result = await InitShipUpgrade().execute();
  // final c = await FilterUpgradeShip(fromId: null, toId: 14609).execute();
  // final d = 1;
}


Future<void> startup() async {
  final rsiApiClient = RsiApiClient();
  await rsiApiClient.refreshCsrfToken();



  await setCurrency();


}