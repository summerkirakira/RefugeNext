import '../network/api_service.dart';
import '../repo/hangar.dart';
import '../repo/user.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/graphql/catalog.dart' show CatalogReq;




Future<void> mustStartup() async {

  await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('zh_CN', null);
  String storageLocation = (await getApplicationDocumentsDirectory()).path;
  await FastCachedImageConfig.init(subDir: storageLocation, clearCacheAfter: const Duration(days: 15));


  // if is light theme
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // 设置状态栏为透明
    statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为深色
  ));


}

Future<void> startup() async {
  final rsiApiClient = RsiApiClient();
  await rsiApiClient.refreshCsrfToken();
  final hangarRepo = HangarRepo();
  // final items = await hangarRepo.refreshHangarItems();

  final userRepo = UserRepo();
  final user = await userRepo.getUser(handle: "Cirnobaka");
  final a = 1;

}