import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/network/api_service.dart';

import 'full_screen_webview.dart';


Map<String, String> getRsiHeaders() {
  RsiApiClient rsiApiClient = RsiApiClient();
  return rsiApiClient.getHeaders();
}

void openRsiWebview({ required BuildContext context, bool replace = false, required String url}) {

  if (Platform.isIOS) {
    showAlert(message: 'iOS设备暂不支持此功能QAQ');
    return;
  }

  final headers = getRsiHeaders();

  if (replace) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => FullScreenWebView(url: url, headers: headers,),
      ),
    );
    return;
  } else {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => FullScreenWebView(url: url, headers: headers,),
      ),
    );
  }

}


void openRsiCartWebview({ required BuildContext context, bool replace = false}) {
  final String url = 'https://robertsspaceindustries.com/store/pledge/cart';
  openRsiWebview(context: context, replace: replace, url: url);
}

void openRsiHangarWebview({ required BuildContext context, bool replace = false, int page = 1}) {
  final String url = 'https://robertsspaceindustries.com/account/pledges?page=$page';
  openRsiWebview(context: context, replace: replace, url: url);
}