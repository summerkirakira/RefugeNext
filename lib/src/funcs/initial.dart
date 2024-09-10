import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/models/cirno/property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/filtered_ship_upgrade.dart';
import 'package:refuge_next/src/funcs/app_update.dart';

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
import 'package:refuge_next/src/services/android.dart';
import 'package:refuge_next/src/funcs/cirno_auth.dart';
import 'package:ota_update/ota_update.dart';




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

  await authStartup();
  await userInit();
}

Future<void> authStartup() async {
  await CirnoAuth.getInstance();
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
}


Future<void> updateTranslation(RefugeVersionProperty latestVersion) async {
  final cirnoClient = CirnoApiClient();
  final translationRepo = TranslationRepo();
  final version = await translationRepo.getTranslationVersion();
  if (version >= latestVersion.translationVersionCode) {
    return;
  }
  final translation = await cirnoClient.getTranslationMap(latestVersion.translationUrl);
  await translationRepo.writeTranslation(translation, latestVersion.translationVersionCode);
}

Future<void> updateShipAlias(RefugeVersionProperty latestVersion) async {
  final cirnoClient = CirnoApiClient();
  final shipAliasRepo = ShipAliasRepo();
  final version = await shipAliasRepo.getShipAliasesVersion();
  if (version >= latestVersion.shipAliasVersionCode) {
    return;
  }
  final shipAliases = await cirnoClient.getShipAliases(latestVersion.shipAliasUrl);
  await shipAliasRepo.writeShipAliases(shipAliases, latestVersion.shipAliasVersionCode);
}


Future<void> startup() async {
  final rsiApiClient = RsiApiClient();
  final cirnoAuth = await CirnoAuth.getInstance();
  try {
    await rsiApiClient.refreshCsrfToken();
    await cirnoAuth.initialize();

    await updateShipAlias(cirnoAuth.property);
    await updateTranslation(cirnoAuth.property);

    await setCurrency();


  } catch (e) {
    print('Error during startup: $e');
  }

}