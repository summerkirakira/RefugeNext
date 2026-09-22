import 'dart:io';

import 'package:flutter/services.dart';

import 'windows_webview_environment.dart';

abstract interface class RsiCookieStore {
  Future<String> read(Uri url);
  Future<void> write(Uri url, List<String> cookies);
  Future<void> clear();
}

/// 使用原生 Cookie 存储，保留 HttpOnly 和未经二次编码的值。
class NativeRsiCookieStore implements RsiCookieStore {
  static const _channel = MethodChannel('vip.kirakira.refuge_next/rsi_cookies');

  static bool get isSupported =>
      Platform.isAndroid ||
      Platform.isIOS ||
      Platform.isMacOS ||
      Platform.isWindows;

  @override
  Future<String> read(Uri url) async => Platform.isWindows
      ? await WindowsRsiCookies.read(url)
      : await _channel.invokeMethod<String>('read', {'url': url.toString()}) ??
          '';

  @override
  Future<void> write(Uri url, List<String> cookies) => Platform.isWindows
      ? WindowsRsiCookies.write(url, cookies)
      : _channel.invokeMethod<void>('write', {
          'url': url.toString(),
          'cookies': cookies,
        });

  @override
  Future<void> clear() => Platform.isWindows
      ? WindowsRsiCookies.clear()
      : _channel.invokeMethod<void>('clear');
}

Map<String, String> parseRsiCookieHeader(String header) {
  final result = <String, String>{};
  for (final part in header.split(';')) {
    final separator = part.indexOf('=');
    if (separator <= 0) continue;
    final name = part.substring(0, separator).trim();
    final value = part.substring(separator + 1).trim();
    if (result.containsKey(name) && result[name] != value) {
      throw const FormatException('网页存在冲突的同名 Cookie');
    }
    result[name] = value;
  }
  return result;
}
