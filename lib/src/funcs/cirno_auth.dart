import 'dart:async';

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
    print('Error getting device info: $e');
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
  CirnoAuth._();

  static CirnoAuth? _instance;
  late String _uuid;
  RefugeVersionProperty? _property;
  bool _initialized = false;
  List<Function> _afterInit = [];


  static Future<CirnoAuth> getInstance() async {
    if (_instance == null) {
      _instance = CirnoAuth._();
      await _instance!._initialize();
    }
    return _instance!;
  }

  static CirnoAuth? get instance => _instance;

  Future<void> _initialize() async {
    _uuid = await getCirnoUUID();
  }

  Future<void> initialize() async {
    await getRefugeVersion();
    _initialized = true;
    for (var func in _afterInit) {
      func();
    }
  }

  void addAfterInit(Function func) {
    if (_initialized) {
      func();
    } else {
      _afterInit.add(func);
    }
  }

  Future<void> getRefugeVersion() async {
    final deviceInfo = await getDeviceInfo();
    final property = await CirnoApiClient().getRefugeVersion(deviceInfo.version, deviceInfo.androidVersion, deviceInfo.systemModel);
    _property = property;
  }

  String get uuid => _uuid;

  RefugeVersionProperty? get property => _property;

  bool get isInitialized => _initialized;

}
