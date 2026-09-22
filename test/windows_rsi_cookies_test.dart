import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as web;
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/services/windows_webview_environment.dart';

class _Environment extends web.PlatformWebViewEnvironment {
  _Environment()
      : super.implementation(
            const web.PlatformWebViewEnvironmentCreationParams());
  String? version;
  web.WebViewEnvironmentSettings? createdSettings;
  @override
  String get id => 'shared-environment';
  @override
  Future<String?> getAvailableVersion(
          {String? browserExecutableFolder}) async =>
      version;
  @override
  Future<web.PlatformWebViewEnvironment> create(
      {web.WebViewEnvironmentSettings? settings}) async {
    createdSettings = settings;
    return this;
  }
}

class _Cookies extends web.PlatformCookieManager {
  _Cookies()
      : super.implementation(const web.PlatformCookieManagerCreationParams());
  final writes = <Map<String, Object?>>[];
  final deletes = <String>[];
  var result = true;
  @override
  Future<bool> setCookie(
      {required web.WebUri url,
      required String name,
      required String value,
      String path = '/',
      String? domain,
      int? expiresDate,
      int? maxAge,
      bool? isSecure,
      bool? isHttpOnly,
      web.HTTPCookieSameSitePolicy? sameSite,
      web.PlatformInAppWebViewController? iosBelow11WebViewController,
      web.PlatformInAppWebViewController? webViewController}) async {
    writes.add({
      'name': name,
      'value': value,
      'domain': domain,
      'path': path,
      'maxAge': maxAge,
      'secure': isSecure,
      'httpOnly': isHttpOnly,
      'sameSite': sameSite
    });
    return result;
  }

  @override
  Future<bool> deleteCookie(
      {required web.WebUri url,
      required String name,
      String path = '/',
      String? domain,
      web.PlatformInAppWebViewController? iosBelow11WebViewController,
      web.PlatformInAppWebViewController? webViewController}) async {
    deletes.add(name);
    return result;
  }

  @override
  Future<bool> deleteAllCookies() async => result;
  @override
  Future<List<web.Cookie>> getCookies(
          {required web.WebUri url,
          web.PlatformInAppWebViewController? iosBelow11WebViewController,
          web.PlatformInAppWebViewController? webViewController}) async =>
      [
        web.Cookie(name: 'root', value: 'a%2B+b==', path: '/'),
        web.Cookie(name: 'nested', value: 'c=d', path: '/account'),
      ];
}

class _Platform extends web.InAppWebViewPlatform {
  final environment = _Environment();
  final cookies = _Cookies();
  @override
  web.PlatformWebViewEnvironment createPlatformWebViewEnvironmentStatic() =>
      environment;
  @override
  web.PlatformCookieManager createPlatformCookieManager(
      web.PlatformCookieManagerCreationParams params) {
    expect(params.webViewEnvironment?.id, 'shared-environment');
    return cookies;
  }
}

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  final platform = _Platform();
  final origin = Uri.parse('https://robertsspaceindustries.com');
  late Directory support;
  setUpAll(() async {
    support = await Directory.systemTemp.createTemp('refuge-browser-test-');
    web.InAppWebViewPlatform.instance = platform;
    binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/path_provider'),
        (_) async => support.path);
  });
  tearDownAll(() => support.delete(recursive: true));
  setUp(() {
    platform.cookies.writes.clear();
    platform.cookies.deletes.clear();
    platform.cookies.result = true;
  });

  test('缺少 Runtime 可以重试，环境位于用户数据目录且复用', () async {
    await expectLater(WindowsWebviewEnvironment.ensure(),
        throwsA(isA<WebviewRuntimeUnavailable>()));
    platform.environment.version = '123.0';
    final first = await WindowsWebviewEnvironment.ensure();
    expect(identical(first, await WindowsWebviewEnvironment.ensure()), true);
    expect(platform.environment.createdSettings!.userDataFolder,
        '${support.path}/rsi_webview');
  });

  test('写入保留原始凭证和 Cookie 属性，Max-Age 优先于过期日期', () async {
    await WindowsRsiCookies.write(origin, [
      'Rsi-Token=a%2B+b==; Path=/account; Domain=.robertsspaceindustries.com; '
          'Secure; HttpOnly; SameSite=Lax; Max-Age=3600; '
          'Expires=Thu, 01 Jan 1970 00:00:00 GMT'
    ]);
    expect(platform.cookies.writes.single, {
      'name': 'Rsi-Token',
      'value': 'a%2B+b==',
      'path': '/account',
      'domain': '.robertsspaceindustries.com',
      'maxAge': 3600,
      'secure': true,
      'httpOnly': true,
      'sameSite': web.HTTPCookieSameSitePolicy.LAX,
    });
    expect(platform.cookies.deletes, isEmpty);
    expect(await WindowsRsiCookies.read(origin), 'nested=c=d; root=a%2B+b==');
  });

  test('过期和空 Cookie 删除，错误域名不写入', () async {
    await WindowsRsiCookies.write(origin, [
      'empty=',
      'expired=value; Max-Age=0',
      'past=value; Expires=Thu, 01 Jan 1970 00:00:00 GMT',
    ]);
    expect(platform.cookies.deletes, ['empty', 'expired', 'past']);
    await expectLater(
        WindowsRsiCookies.write(origin, ['Rsi-Token=bad; Domain=example.com']),
        throwsArgumentError);
    await expectLater(
        WindowsRsiCookies.read(Uri.parse('http://robertsspaceindustries.com')),
        throwsArgumentError);
    expect(platform.cookies.writes, isEmpty);
  });

  test('平台写入和清理失败不能报告成功', () async {
    platform.cookies.result = false;
    await expectLater(
        WindowsRsiCookies.write(origin, ['Rsi-Token=value']), throwsStateError);
    await expectLater(WindowsRsiCookies.clear(), throwsStateError);
  });
}
