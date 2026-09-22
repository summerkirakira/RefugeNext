import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/services/desktop_rsi_webview.dart';
import 'package:refuge_next/src/services/rsi_session_service.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  const windows = MethodChannel('mixin.one/desktop_multi_window');
  const channels = MethodChannel('mixin.one/desktop_multi_window/channels');
  const codec = StandardMethodCodec();
  final browserArgs = <Map<String, dynamic>>[];
  final invalidated = <String>[];
  final registered = <String>{};
  var failCreation = false;

  Future<Object?> fromBrowser(String channel, String method,
      [Object? arguments]) async {
    final response = Completer<ByteData?>();
    await binding.defaultBinaryMessenger.handlePlatformMessage(
      channels.name,
      codec.encodeMethodCall(MethodCall('methodCall', {
        'channel': channel,
        'method': method,
        'arguments': arguments,
      })),
      response.complete,
    );
    return codec.decodeEnvelope((await response.future)!);
  }

  setUp(() {
    browserArgs.clear();
    invalidated.clear();
    registered.clear();
    failCreation = false;
    binding.defaultBinaryMessenger.setMockMethodCallHandler(channels,
        (call) async {
      final args = call.arguments as Map;
      switch (call.method) {
        case 'registerMethodHandler':
          registered.add(args['channel'] as String);
        case 'unregisterMethodHandler':
          registered.remove(args['channel']);
        case 'invokeMethod':
          if (args['method'] == 'invalidate') {
            invalidated.add(args['channel'] as String);
          }
      }
      return null;
    });
    binding.defaultBinaryMessenger.setMockMethodCallHandler(windows,
        (call) async {
      if (call.method == 'createWindow') {
        if (failCreation) throw PlatformException(code: 'create_failed');
        final args = jsonDecode(call.arguments['arguments'] as String)
            as Map<String, dynamic>;
        browserArgs.add(args);
        expect(call.arguments['hiddenAtLaunch'], true);
        expect(await fromBrowser(args['channel'] as String, 'ready'), true);
        return 'window-${browserArgs.length}';
      }
      return [];
    });
  });

  test('独立窗口分别回传关闭结果，创建参数不包含账号凭证', () async {
    final first = await DesktopRsiWebview.instance.open(
        url: 'https://example.com/first', authenticated: false, dark: true);
    final second = await DesktopRsiWebview.instance
        .open(url: 'https://example.com/second', authenticated: false);
    expect(browserArgs.first.keys.toSet(), {'type', 'url', 'channel', 'dark'});
    expect(browserArgs.first['dark'], true);
    final channel1 = browserArgs.first['channel'] as String;
    final channel2 = browserArgs.last['channel'] as String;
    expect(await fromBrowser(channel1, 'sync'), {'success': true});
    await fromBrowser(channel2, 'closed', false);
    expect(await second.closed, false);
    await fromBrowser(channel1, 'closed', true);
    expect(await first.closed, true);
    await Future<void>.delayed(Duration.zero);
    expect(registered, isEmpty);
  });

  test('切换账号关闭所有共享 Cookie 的旧窗口并返回失败', () async {
    final first = await DesktopRsiWebview.instance.open(
        url: 'https://robertsspaceindustries.com/account/pledges',
        authenticated: true);
    final public = await DesktopRsiWebview.instance
        .open(url: 'https://example.com', authenticated: false);
    await RsiSessionService.instance.reset();
    expect(await first.closed, false);
    expect(await public.closed, false);
    expect(invalidated.length, 2);
    await Future<void>.delayed(Duration.zero);
    expect(registered, isEmpty);
  });

  test('创建失败注销通道，下次打开仍然可用', () async {
    failCreation = true;
    await expectLater(
        DesktopRsiWebview.instance
            .open(url: 'https://example.com', authenticated: false),
        throwsA(isA<PlatformException>()));
    await Future<void>.delayed(Duration.zero);
    expect(registered, isEmpty);
    failCreation = false;
    final handle = await DesktopRsiWebview.instance
        .open(url: 'https://example.com', authenticated: false);
    await fromBrowser(browserArgs.single['channel'] as String, 'closed', true);
    expect(await handle.closed, true);
  });
}
