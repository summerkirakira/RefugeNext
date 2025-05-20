import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:refuge_next/src/datasource/models/cirno/property.dart';
import 'package:package_info_plus/package_info_plus.dart';
// IMPORT PACKAGE
import 'package:ota_update/ota_update.dart';
import 'package:quickalert/quickalert.dart';
import 'toast.dart';
import 'package:url_launcher/url_launcher.dart';


void updateApp(String downloadUrl, void Function(OtaEvent) callback) {
  try {
    //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
    showToast(message: "正在下载更新...");
    OtaUpdate()
        .execute(
      downloadUrl,
      // OPTIONAL
      destinationFilename: 'flutter_refuge.apk',
      //OPTIONAL, ANDROID ONLY - ABILITY TO VALIDATE CHECKSUM OF FILE:
      // sha256checksum: "d6da28451a1e15cf7a75f2c3f151befad3b80ad0bb232ab15c20897e54f21478",
    ).listen(
          (OtaEvent event) {
        callback(event);
      },
    );
  } catch (e) {
    print('Failed to make OTA update. Details: $e');
  }
}

void onAndroidUpdateConfirmClicked(RefugeVersionProperty property) {
  updateApp(property.appUrl, (event) {});
}

void onIosUpdateConfirmClicked(RefugeVersionProperty property) {
  Uri url = Uri.parse("https://apps.apple.com/app/%E6%98%9F%E6%B2%B3%E9%81%BF%E9%9A%BE%E6%89%80/id6474789222");
  launchUrl(url);
}

void onConfirmClicked(RefugeVersionProperty property) {
  if (Platform.isAndroid) {
    onAndroidUpdateConfirmClicked(property);
  } else if (Platform.isIOS) {
    onIosUpdateConfirmClicked(property);
  } else {
    showToast(message: "前往QQ群获取最新版本~");
  }
}


Future<void> showUpdateDialog(BuildContext context, RefugeVersionProperty property) async {
  final packageInfo = await PackageInfo.fromPlatform();
  final currentBuildCode = packageInfo.buildNumber;
  final latestVersion = property.versionCode;

  if (latestVersion <= int.parse(currentBuildCode)) {
    return;
  }

  QuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    title: "发现新版本(${property.versionName})",
    text: property.updateContent,
    confirmBtnText: "立即更新",
    cancelBtnText: "取消",
    onConfirmBtnTap: () {
      onConfirmClicked(property);
      Navigator.of(context).pop();
    }
  );

}