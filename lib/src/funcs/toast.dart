import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';

import '../widgets/settings/settings_page.dart';
import 'package:toastification/toastification.dart';

void showToast({required String message}) {
  // Fluttertoast.showToast(
  //   msg: message,
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.TOP,
  //   timeInSecForIosWeb: 1,
  //   backgroundColor: Colors.black,
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );
  // debugPrint("Toast: $message");

  if (message.contains("out of stock")) {
    return;
  }

  if (message.length < 20) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.simple,
      title: Text(message),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 6),
      borderRadius: BorderRadius.circular(12.0),
      dragToClose: true,
    );
  } else {
    if (message.contains("成功")) {
      toastification.show(
        type: ToastificationType.success,
        style: ToastificationStyle.flat,
        title: Text("成功"),
        description: Text(
          message,
        ),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 6),
        borderRadius: BorderRadius.circular(12.0),
        dragToClose: true,
      );
      return;
    } else {
      toastification.show(
        type: ToastificationType.error,
        style: ToastificationStyle.flat,
        title: Text("错误"),
        description: Text(
          message,
        ),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 6),
        borderRadius: BorderRadius.circular(12.0),
        dragToClose: true,
      );
    }
  }
}

void showAlert({required String message}) {
  // Fluttertoast.showToast(
  //   msg: message,
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.TOP,
  //   timeInSecForIosWeb: 1,
  //   backgroundColor: Colors.black,
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );
  if (message.contains("out of stock")) {
    return;
  }
  toastification.show(
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    title: Text("错误"),
    description: Text(
      message,
    ),
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 6),
    borderRadius: BorderRadius.circular(12.0),
    dragToClose: true,
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