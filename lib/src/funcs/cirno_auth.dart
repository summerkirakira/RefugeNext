import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:refuge_next/src/services/android.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:refuge_next/src/datasource/models/cirno/property.dart';
import 'package:refuge_next/src/network/cirno/cirno_api.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String> getCirnoUUID() async {
  final prefs = await SharedPreferences.getInstance();
  String? uuid = prefs.getString('vip.kirakira.refuge_next/cirno_uuid');
  if (uuid != null) {
    return uuid;
  }
  // if the platform is Android, use channel first
  if (Platform.isAndroid && uuid == null) {
    uuid = await SharedPreferencesPlatform.getUUID();
    if (uuid != null) {
      prefs.setString('vip.kirakira.refuge_next/cirno_uuid', uuid);
      return uuid;
    }
  }
  // if the platform is not Android or the channel failed, use uuid package
  uuid = Uuid().v4();
  prefs.setString('vip.kirakira.refuge_next/cirno_uuid', uuid);
  return uuid;
}

Future<String> getDeviceModel() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String model = '';

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      model = iosInfo.utsname.machine;
    }
  } catch (e) {
    debugPrint('Error getting device info: $e');
  }

  return model;
}

Future<DeviceInfo> getDeviceInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return DeviceInfo(
    version: "${packageInfo.version} (${packageInfo.buildNumber})",
    androidVersion: await getDeviceModel(),
    systemModel: Platform.operatingSystemVersion,
  );
}

class CirnoAuth {
  CirnoAuth._() : _loadProperty = null;

  @visibleForTesting
  CirnoAuth.forTesting(Future<RefugeVersionProperty> Function() loadProperty)
      : _loadProperty = loadProperty;

  final Future<RefugeVersionProperty> Function()? _loadProperty;

  static CirnoAuth? _instance;
  late String _uuid;
  RefugeVersionProperty? _property;
  bool _initialized = false;
  final List<Function> _afterInit = [];
  Future<void>? _request;
  static Future<CirnoAuth>? _instanceLoading;

  static Future<CirnoAuth> getInstance() =>
      _instanceLoading ??= _createInstance();

  static Future<CirnoAuth> _createInstance() async {
    final auth = _instance ??= CirnoAuth._();
    try {
      await auth._initialize();
      return auth;
    } catch (_) {
      _instanceLoading = null;
      rethrow;
    }
  }

  static CirnoAuth? get instance => _instance;

  Future<void> _initialize() async {
    _uuid = await getCirnoUUID();
  }

  Future<void> initialize() =>
      _initialized ? Future.value() : getRefugeVersion();

  void addAfterInit(Function func) {
    if (_initialized) {
      func();
    } else {
      _afterInit.add(func);
    }
  }

  Future<void> getRefugeVersion() =>
      _request ??= _fetchProperty().whenComplete(() => _request = null);

  Future<void> _fetchProperty() async {
    if (_loadProperty != null) {
      _property = await _loadProperty();
    } else {
      final deviceInfo = await getDeviceInfo();
      _property = await CirnoApiClient().getRefugeVersion(deviceInfo.version,
          deviceInfo.androidVersion, deviceInfo.systemModel);
    }
    _initialized = true;
    final callbacks = List<Function>.of(_afterInit);
    _afterInit.clear();
    for (final callback in callbacks) {
      callback();
    }
  }

  /// 刷新订阅状态和配置信息
  Future<void> refreshProperty() async {
    await getRefugeVersion();
  }

  String get uuid => _uuid;

  RefugeVersionProperty? get property => _property;

  bool get isInitialized => _initialized;
}
