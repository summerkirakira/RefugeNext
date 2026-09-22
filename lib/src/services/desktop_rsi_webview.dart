import 'dart:async';
import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/services.dart';

import '../funcs/rsi_web_session.dart';
import 'rsi_session_service.dart';

class DesktopBrowserHandle {
  DesktopBrowserHandle(this.closed);
  final Future<bool> closed;
}

/// 所有窗口只通过主引擎校验账号；跨窗口参数不传递 Token 或密码。
class DesktopRsiWebview {
  DesktopRsiWebview._() {
    _session.addListener(_accountChanged);
    onWindowsChanged.listen((_) => _checkClosedWindows());
  }

  static final instance = DesktopRsiWebview._();
  final _session = RsiSessionService.instance;
  final _windows = <String, _BrowserSession>{};
  int _nextId = 0;

  Future<DesktopBrowserHandle> open(
      {required String url,
      required bool authenticated,
      bool dark = false}) async {
    final id = '${DateTime.now().microsecondsSinceEpoch}-${_nextId++}';
    final channel = WindowMethodChannel('refuge/rsi_browser/$id',
        mode: ChannelMode.unidirectional);
    final browser =
        _BrowserSession(_session.generation, authenticated, channel);
    _windows[id] = browser;
    try {
      await channel
          .setMethodCallHandler((call) => _handleCall(id, browser, call));
      browser.controller = await WindowController.create(WindowConfiguration(
        arguments: jsonEncode({
          'type': 'rsi_webview',
          'url': url,
          'channel': channel.name,
          'dark': dark
        }),
        hiddenAtLaunch: true,
      ));
      await browser.ready.future.timeout(const Duration(seconds: 30));
      if (!_valid(id, browser)) await _invalidate(browser);
      return DesktopBrowserHandle(browser.closed.future);
    } catch (_) {
      await _invalidate(browser);
      _complete(id, browser, false);
      rethrow;
    }
  }

  bool _valid(String id, _BrowserSession browser) =>
      _windows[id] == browser && browser.generation == _session.generation;

  Future<void> _invalidate(_BrowserSession browser) async {
    try {
      await browser.controller?.invokeMethod('invalidate');
    } catch (_) {}
  }

  void _accountChanged() {
    for (final entry in _windows.entries.toList()) {
      if (!_valid(entry.key, entry.value)) {
        unawaited(_invalidate(entry.value));
        _complete(entry.key, entry.value, false);
      }
    }
  }

  void _complete(String id, _BrowserSession browser, bool success) {
    if (!browser.ready.isCompleted) browser.ready.complete();
    if (!browser.closed.isCompleted) browser.closed.complete(success);
    _windows.remove(id);
    // 保留当前 RPC 的返回；下一轮事件再注销该窗口通道。
    scheduleMicrotask(() => browser.channel.setMethodCallHandler(null));
  }

  Future<bool> _sync(String id, _BrowserSession browser) async {
    if (!_valid(id, browser)) return false;
    if (!browser.authenticated) return true;
    if (browser.syncing != null) return browser.syncing!;
    final future = () async {
      await synchronizeRsiWebSession(verifyIdentity: true);
      return _valid(id, browser);
    }();
    browser.syncing = future;
    try {
      return await future;
    } finally {
      browser.syncing = null;
    }
  }

  Future<Object?> _handleCall(
      String id, _BrowserSession browser, MethodCall call) async {
    switch (call.method) {
      case 'ready':
        if (!browser.ready.isCompleted) browser.ready.complete();
        return _valid(id, browser);
      case 'sync':
        try {
          return {'success': await _sync(id, browser)};
        } catch (error) {
          return {'success': false, 'expired': error is RsiSessionExpired};
        }
      case 'closed':
        _complete(id, browser, call.arguments == true && _valid(id, browser));
        return null;
      default:
        throw MissingPluginException('Unknown browser window event');
    }
  }

  Future<void> _checkClosedWindows() async {
    try {
      final ids = (await WindowController.getAll())
          .map((window) => window.windowId)
          .toSet();
      for (final entry in _windows.entries.toList()) {
        final browser = entry.value;
        if (browser.controller == null ||
            ids.contains(browser.controller!.windowId)) {
          continue;
        }
        var success = false;
        try {
          success = await _sync(entry.key, browser);
        } catch (_) {}
        if (_windows[entry.key] == browser) {
          _complete(entry.key, browser, success);
        }
      }
    } catch (_) {
      // 窗口关闭的显式回调仍会完成流程。
    }
  }
}

class _BrowserSession {
  _BrowserSession(this.generation, this.authenticated, this.channel);
  final int generation;
  final bool authenticated;
  final WindowMethodChannel channel;
  final closed = Completer<bool>();
  final ready = Completer<void>();
  WindowController? controller;
  Future<bool>? syncing;
}
