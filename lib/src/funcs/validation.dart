import 'dart:io';

import 'package:local_auth/local_auth.dart';
import 'package:refuge_next/src/funcs/toast.dart';


Future<bool> isBiometricsAvailable() async {
  final localAuth = LocalAuthentication();
  return await localAuth.canCheckBiometrics;
}


Future<bool> authenticateWithBiometrics({required String reason}) async {

  final localAuth = LocalAuthentication();
  try {
    return await localAuth.authenticate(
      localizedReason: reason,
    );
  } catch (e) {

    if (Platform.isAndroid || Platform.isIOS) {
      // Android or iOS specific error handling
      showToast(message: "此设备不支持安全验证，敏感机库操作已被避难所拒绝QAQ~请设置手机密码后再试~");
    } else if (Platform.isMacOS) {
      // Desktop specific error handling
      showToast(message: "此设备不支持安全验证，敏感机库操作已被避难所拒绝QAQ~请设置电脑PIN码后再试~");
    } else {
      // Other platforms
      showToast(message: "此设备不支持安全验证，敏感机库操作已被避难所拒绝QAQ~请设置设备密码后再试~");
    }
    return false;
  }
}