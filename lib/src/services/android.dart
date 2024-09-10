import 'package:flutter/services.dart';

class SharedPreferencesPlatform {
  static const MethodChannel _channel = MethodChannel('vip.kirakira.refuge_next/get_uuid');

  static Future<String?> getUUID() async {
    try {
      final String? value = await _channel.invokeMethod('getValue', {});
      return value;
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'.");
      return null;
    }
  }
}
