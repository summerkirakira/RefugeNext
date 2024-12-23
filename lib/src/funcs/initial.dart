import 'package:refuge_next/src/datasource/models/cirno/property.dart';
import 'package:refuge_next/src/funcs/zip_downloader.dart';
import 'package:refuge_next/src/repo/hangar_log.dart';

import '../network/api_service.dart';
import '../repo/ship_info.dart';
import '../repo/user.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repo/translation.dart';
import '../network/cirno/cirno_api.dart';

import '../repo/ship_alias.dart';

import 'package:refuge_next/src/funcs/shop/cart.dart';
import 'package:refuge_next/src/funcs/cirno_auth.dart';
import './theme.dart';




Future<void> mustStartup() async {

  await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('zh_CN', null);
  String storageLocation = (await getApplicationDocumentsDirectory()).path;
  await FastCachedImageConfig.init(subDir: storageLocation, clearCacheAfter: const Duration(days: 15));

  await authStartup();
  await userInit();
  await initThemeManager();
}

Future<void> initThemeManager() async {
  await ThemeManager().init();
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

Future<void> updateShipInfo(RefugeVersionProperty latestVersion) async {
  final shipInfoRepo = ShipInfoRepo();
  final version = await shipInfoRepo.getShipInfoVersion();
  if (version >= latestVersion.shipInfoVersionCode) {
    return;
  }
  await downloadAndExtractFile(url: latestVersion.shipInfoUrl, extractPath: "ship_info/components");
  await shipInfoRepo.writeShipInfoVersion(latestVersion.shipInfoVersionCode);
}

Future<void> setVip() async {
  final cirnoAuth = await CirnoAuth.getInstance();
  if (cirnoAuth.isInitialized) {
    if (!cirnoAuth.property!.isVip) {
      await ThemeManager.setTheme(false, 'blue');
    }
  }
}


Future<void> startup() async {
  final rsiApiClient = RsiApiClient();
  final cirnoAuth = await CirnoAuth.getInstance();
  try {
    await rsiApiClient.refreshCsrfToken();
    await cirnoAuth.initialize();

    await updateShipAlias(cirnoAuth.property!);
    await updateTranslation(cirnoAuth.property!);
    await updateShipInfo(cirnoAuth.property!);

    await setCurrency();
    await setVip();


    // final repo = HangarLogRepo();
    // await repo.refreshHangarLogs();
    
    // await downloadAndExtractFile(url: "https://image.biaoju.site/starcitizen/refuge_next/ship_info/ship_details.0.0.3.zip", extractPath: "ship_info/components");



  } catch (e) {
    print('Error during startup: $e');
  }

}