import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart' as prefs;

Future<void> showStarDialog(BuildContext context, {double probability = 0.2}) async {
    final preferences = await prefs.SharedPreferences.getInstance();
    
    // 如果用户已经点击过Star，则不再显示
    if (preferences.getBool('has_starred') ?? false) {
        return;
    }

    // 获取上次显示时间
    final lastShowTime = preferences.getInt('last_star_dialog_time') ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    
    // 如果距离上次显示不足24小时，则不显示
    if (now - lastShowTime < const Duration(hours: 24).inMilliseconds) {
        return;
    }

    // 根据概率决定是否显示弹窗
    if (math.Random().nextDouble() > probability) {
        return;
    }

    // 更新显示时间
    await preferences.setInt('last_star_dialog_time', now);

    QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        title: "给星河避难所一个Star OwO",
        text: "如果觉得避难所对你有帮助，欢迎在GitHub上给咱一个Star支持！",
        confirmBtnText: "去Star",
        cancelBtnText: "取消",
        width: MediaQuery.of(context).size.shortestSide > 400 ? 400 : MediaQuery.of(context).size.shortestSide,
        onConfirmBtnTap: () async {
            await launchUrl(Uri.parse('https://github.com/summerkirakira/RefugeNext'));
            // 记录用户已点击Star
            await preferences.setBool('has_starred', true);
            Navigator.of(context).pop();
        }
    );
}
