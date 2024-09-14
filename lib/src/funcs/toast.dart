import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';

import '../widgets/settings/settings_page.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showAlert({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}


void showVipAlert({required BuildContext context, bool move = false}) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: '诶嘿嘿',
      text: '未找到有效的避难所Premium订阅，前往设置开启吧~',
      onConfirmBtnTap: () {
        if (move) {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => SettingsPage()));
        } else {
          Navigator.of(context).pop();
        }

      }
  );
}