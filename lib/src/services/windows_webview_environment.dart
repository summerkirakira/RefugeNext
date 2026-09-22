import 'dart:io';

import 'package:flutter_inappwebview/flutter_inappwebview.dart' as web;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class WebviewRuntimeUnavailable implements Exception {
  @override
  String toString() => '请先安装 Microsoft Edge WebView2 Runtime，再打开官网';
}

/// 每个引擎创建自己的环境实例，但使用同一用户数据目录共享 Cookie。
class WindowsWebviewEnvironment {
  static Future<web.WebViewEnvironment>? _pending;

  static Future<web.WebViewEnvironment> ensure() => _pending ??= _create();

  static Future<web.WebViewEnvironment> _create() async {
    try {
      if (await web.WebViewEnvironment.getAvailableVersion() == null) {
        throw WebviewRuntimeUnavailable();
      }
      final support = await getApplicationSupportDirectory();
      final directory = Directory(path.join(support.path, 'rsi_webview'));
      await directory.create(recursive: true);
      return await web.WebViewEnvironment.create(
        settings:
            web.WebViewEnvironmentSettings(userDataFolder: directory.path),
      );
    } catch (_) {
      _pending = null;
      rethrow;
    }
  }
}

class WindowsRsiCookies {
  static Future<web.CookieManager> _manager() async =>
      web.CookieManager.instance(
          webViewEnvironment: await WindowsWebviewEnvironment.ensure());

  static void _validate(Uri url) {
    if (url.scheme != 'https' || url.host != 'robertsspaceindustries.com') {
      throw ArgumentError('Unsupported cookie origin');
    }
  }

  static Future<String> read(Uri url) async {
    _validate(url);
    final cookies =
        await (await _manager()).getCookies(url: web.WebUri(url.toString()));
    cookies
        .sort((a, b) => (b.path?.length ?? 0).compareTo(a.path?.length ?? 0));
    return cookies.map((cookie) => '${cookie.name}=${cookie.value}').join('; ');
  }

  static Future<void> write(Uri url, List<String> cookies) async {
    _validate(url);
    final manager = await _manager();
    for (final raw in cookies) {
      // 追加分号使 Dart 同样接受用于删除凭证的空值（例如 Rsi-Token=）。
      final cookie = Cookie.fromSetCookieValue('$raw;');
      if (cookie.domain != null &&
          cookie.domain!.replaceFirst(RegExp(r'^\.'), '') != url.host) {
        throw ArgumentError('Unsupported cookie domain');
      }
      final uri = web.WebUri(url.toString());
      final slash = url.path.lastIndexOf('/');
      final cookiePath = cookie.path?.startsWith('/') == true
          ? cookie.path!
          : slash <= 0
              ? '/'
              : url.path.substring(0, slash);
      final expired = cookie.value.isEmpty ||
          (cookie.maxAge != null && cookie.maxAge! <= 0) ||
          (cookie.maxAge == null &&
              cookie.expires != null &&
              cookie.expires!.isBefore(DateTime.now()));
      final success = expired
          ? await manager.deleteCookie(
              url: uri,
              name: cookie.name,
              domain: cookie.domain ?? url.host,
              path: cookiePath)
          : await manager.setCookie(
              url: uri,
              name: cookie.name,
              value: cookie.value,
              domain: cookie.domain ?? url.host,
              path: cookiePath,
              expiresDate: cookie.expires?.millisecondsSinceEpoch,
              maxAge: cookie.maxAge,
              isSecure: cookie.secure,
              isHttpOnly: cookie.httpOnly,
              sameSite: switch (cookie.sameSite) {
                SameSite.lax => web.HTTPCookieSameSitePolicy.LAX,
                SameSite.strict => web.HTTPCookieSameSitePolicy.STRICT,
                SameSite.none => web.HTTPCookieSameSitePolicy.NONE,
                _ => null,
              },
            );
      if (!success) throw StateError('Cookie write failed');
    }
  }

  static Future<void> clear() async {
    if (!await (await _manager()).deleteAllCookies()) {
      throw StateError('Cookie clear failed');
    }
  }
}
