import 'dart:convert';
import 'dart:io';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../services/rsi_session_service.dart';
import 'full_screen_webview.dart';

/// 必须在主 App 的账号初始化、托盘和 Windows 单实例检查之前执行。
Future<bool> runDesktopBrowserWindow() async {
  if (!Platform.isMacOS && !Platform.isWindows) return false;
  final window = await WindowController.fromCurrentEngine();
  if (window.arguments.isEmpty) return false;
  final args = jsonDecode(window.arguments) as Map<String, dynamic>;
  if (args['type'] != 'rsi_webview') return false;
  final channel = WindowMethodChannel(args['channel'] as String,
      mode: ChannelMode.unidirectional);
  final valid = ValueNotifier(true);
  var started = false;
  await windowManager.ensureInitialized();
  await window.setWindowMethodHandler((call) async {
    switch (call.method) {
      case 'window_show':
        await windowManager.show();
        await windowManager.focus();
      case 'window_hide':
        await windowManager.hide();
      case 'invalidate':
        valid.value = false;
        if (!started) await _closeBrowserWindow();
    }
    return null;
  });
  try {
    if (await channel.invokeMethod<bool>('ready') != true) {
      await _closeBrowserWindow();
      return true;
    }
  } catch (_) {
    await _closeBrowserWindow();
    return true;
  }
  if (!valid.value) return true;
  started = true;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorSchemeSeed: const Color(0xff519fb5),
      brightness: args['dark'] == true ? Brightness.dark : Brightness.light,
    ),
    home: FullScreenWebView(
      url: args['url'] as String,
      authenticated: false,
      sessionValid: valid,
      synchronize: () async {
        if (!valid.value) throw RsiSessionChanged();
        final result = await channel.invokeMethod<Map>('sync');
        if (result?['success'] != true) {
          if (result?['expired'] == true) throw RsiSessionExpired();
          throw RsiSessionSyncFailed();
        }
      },
      onClose: (success) async {
        try {
          await channel.invokeMethod('closed', success);
        } on WindowChannelException {
          // 主窗口在切换账号时可能已注销通道，仍需关闭旧窗口。
        } finally {
          await _closeBrowserWindow();
        }
      },
    ),
  ));
  await windowManager.waitUntilReadyToShow(
      const WindowOptions(
        size: Size(1100, 780),
        minimumSize: Size(640, 480),
        center: true,
        title: '官网浏览 · 星河避难所',
        titleBarStyle: TitleBarStyle.normal,
      ), () async {
    await windowManager.setPreventClose(true);
    if (valid.value) {
      await windowManager.show();
      await windowManager.focus();
    }
  });
  return true;
}

// destroy() 在 window_manager 中会退出整个进程，子窗口只执行 close()。
Future<void> _closeBrowserWindow() async {
  await windowManager.setPreventClose(false);
  await windowManager.close();
}
