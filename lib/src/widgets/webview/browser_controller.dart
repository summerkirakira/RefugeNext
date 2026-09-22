import 'package:flutter_inappwebview/flutter_inappwebview.dart' as windows;
import 'package:webview_flutter/webview_flutter.dart';

/// 桌面 WebView2 和现有 WebKit/Android 浏览器共用导航界面。
abstract class BrowserController {
  Future<void> loadRequest(Uri uri);
  Future<void> loadHtmlString(String html);
  Future<void> reload();
  Future<bool> canGoBack();
  Future<bool> canGoForward();
  Future<void> goBack();
  Future<void> goForward();
  Future<String?> getTitle();
}

class FlutterBrowserController implements BrowserController {
  FlutterBrowserController(this.controller);
  final WebViewController controller;
  @override
  Future<void> loadRequest(Uri uri) => controller.loadRequest(uri);
  @override
  Future<void> loadHtmlString(String html) => controller.loadHtmlString(html);
  @override
  Future<void> reload() => controller.reload();
  @override
  Future<bool> canGoBack() => controller.canGoBack();
  @override
  Future<bool> canGoForward() => controller.canGoForward();
  @override
  Future<void> goBack() => controller.goBack();
  @override
  Future<void> goForward() => controller.goForward();
  @override
  Future<String?> getTitle() => controller.getTitle();
}

class WindowsBrowserController implements BrowserController {
  WindowsBrowserController(this.controller);
  final windows.InAppWebViewController controller;
  @override
  Future<void> loadRequest(Uri uri) => controller.loadUrl(
      urlRequest: windows.URLRequest(url: windows.WebUri(uri.toString())));
  @override
  Future<void> loadHtmlString(String html) => controller.loadData(data: html);
  @override
  Future<void> reload() => controller.reload();
  @override
  Future<bool> canGoBack() => controller.canGoBack();
  @override
  Future<bool> canGoForward() => controller.canGoForward();
  @override
  Future<void> goBack() => controller.goBack();
  @override
  Future<void> goForward() => controller.goForward();
  @override
  Future<String?> getTitle() => controller.getTitle();
}
