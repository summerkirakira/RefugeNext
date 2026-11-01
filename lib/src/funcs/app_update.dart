import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quickalert/quickalert.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/update/app_update_controller.dart';
import '../widgets/update/app_update_sheet.dart';
import 'cirno_auth.dart';
import 'toast.dart';

bool _startupChecked = false;

/// Returns true when an update exists or its UI is already open. The caller
/// suppresses the optional Star prompt for this launch in either case.
Future<bool> checkForAppUpdate(BuildContext context) async {
  if (_startupChecked) return true;
  _startupChecked = true;
  if (AppUpdateController.supported) {
    final controller = AppUpdateController.instance;
    await controller.check(refresh: false);
    final hasUpdate = controller.release != null;
    if (hasUpdate &&
        context.mounted &&
        !isUpdateSheetOpen &&
        (ModalRoute.of(context)?.isCurrent ?? true) &&
        (controller.phase == UpdatePhase.available || controller.hasPackage)) {
      await showAppUpdateSheet(context);
    }
    return hasUpdate || isUpdateSheetOpen;
  }
  // Preserve the existing distribution channels on non-Android platforms.
  try {
    final auth = await CirnoAuth.getInstance();
    await auth.initialize();
    final property = auth.property!;
    final package = await PackageInfo.fromPlatform();
    final code = int.tryParse(package.buildNumber);
    if (code == null || property.versionCode <= code) return false;
    if (!context.mounted || !(ModalRoute.of(context)?.isCurrent ?? true)) {
      return true;
    }
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: '发现新版本(${property.versionName})',
      text: property.updateContent,
      confirmBtnText: '前往下载',
      cancelBtnText: '稍后',
      onConfirmBtnTap: () async {
        Navigator.of(context, rootNavigator: true).pop();
        if (Platform.isIOS || Platform.isMacOS) {
          try {
            final launched = await launchUrl(Uri.parse(
                'https://apps.apple.com/app/%E6%98%9F%E6%B2%B3%E9%81%BF%E9%9A%BE%E6%89%80/id6474789222'));
            if (!launched) showToast(message: '无法打开下载页面，请稍后重试');
          } catch (_) {
            showToast(message: '无法打开下载页面，请稍后重试');
          }
        } else {
          await Clipboard.setData(const ClipboardData(text: '689970313'));
          showToast(message: '已复制群号到剪贴板，QQ群: 689970313');
        }
      },
    );
    return true;
  } catch (_) {
    return false;
  }
}
