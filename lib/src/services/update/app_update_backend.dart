import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../datasource/models/cirno/property.dart';
import '../../funcs/cirno_auth.dart';

class AppRelease {
  const AppRelease(
      {required this.code,
      required this.name,
      required this.url,
      required this.notes,
      this.platform,
      this.architecture,
      this.size,
      this.sha256});
  final int code;
  final String name;
  final String url;
  final String notes;
  final String? platform, architecture, sha256;
  final int? size;

  bool get desktop => platform == 'windows' || platform == 'macos';
  String get extension => desktop ? 'zip' : 'apk';

  factory AppRelease.fromProperty(RefugeVersionProperty value) => AppRelease(
        code: value.versionCode,
        name: value.versionName,
        url: value.appUrl,
        notes: value.updateContent,
      );
  factory AppRelease.fromJson(Map<String, dynamic> json) => AppRelease(
        code: json['code'] as int,
        name: json['name'] as String,
        url: json['url'] as String,
        notes: json['notes'] as String,
        platform: json['platform'] as String?,
        architecture: json['architecture'] as String?,
        size: json['size'] as int?,
        sha256: json['sha256'] as String?,
      );
  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'url': url,
        'notes': notes,
        if (platform != null) 'platform': platform,
        if (architecture != null) 'architecture': architecture,
        if (size != null) 'size': size,
        if (sha256 != null) 'sha256': sha256,
      };
}

class InstalledApp {
  const InstalledApp(this.package, this.name, this.code);
  final String package;
  final String name;
  final int code;
}

class ApkIdentity {
  const ApkIdentity(this.package, this.code);
  final String package;
  final int code;
}

class UpdateUnavailable implements Exception {
  const UpdateUnavailable(this.message);
  final String message;
}

abstract class AppUpdateBackend {
  bool get requiresRestart => false;
  bool isNewer(AppRelease release, InstalledApp installed) =>
      release.code > installed.code;
  Future<String?> previousResult() async => null;
  Future<bool> validatePackage(
      String path, AppRelease release, InstalledApp installed) async {
    final identity = await inspect(path);
    return identity.package == installed.package &&
        identity.code == release.code;
  }

  Future<void> installRelease(String path, AppRelease release) => install(path);

  Future<InstalledApp> installedApp();
  Future<Directory> directory();
  Future<AppRelease> latest({required bool refresh});
  Future<void> download(String url, String destination, CancelToken cancel,
      void Function(int received, int total) progress);
  Future<ApkIdentity> inspect(String path);
  Future<bool> canInstall();
  Future<void> openPermissionSettings();
  Future<void> install(String path);
}

class AndroidUpdateBackend extends AppUpdateBackend {
  static const channel = MethodChannel('vip.kirakira.refuge_next/app_update');
  final Dio _downloadClient = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
  ));

  @override
  Future<InstalledApp> installedApp() async {
    final info = await PackageInfo.fromPlatform();
    final code = int.tryParse(info.buildNumber);
    if (code == null) throw const FormatException('Invalid installed version');
    return InstalledApp(info.packageName, info.version, code);
  }

  @override
  Future<Directory> directory() async =>
      Directory((await channel.invokeMethod<String>('directory'))!);

  @override
  Future<AppRelease> latest({required bool refresh}) async {
    final auth = await CirnoAuth.getInstance();
    if (refresh) {
      await auth.refreshProperty();
    } else {
      await auth.initialize();
    }
    return AppRelease.fromProperty(auth.property!);
  }

  @override
  Future<void> download(String url, String destination, CancelToken cancel,
      void Function(int, int) progress) async {
    // A separate client deliberately omits account and device credentials.
    await _downloadClient.download(
      url,
      destination,
      cancelToken: cancel,
      onReceiveProgress: progress,
      deleteOnError: true,
    );
  }

  @override
  Future<ApkIdentity> inspect(String path) async {
    final result = await channel
        .invokeMapMethod<String, dynamic>('inspect', {'path': path});
    return ApkIdentity(result!['packageName'] as String,
        (result['versionCode'] as num).toInt());
  }

  @override
  Future<bool> canInstall() async =>
      await channel.invokeMethod<bool>('canInstall') ?? false;
  @override
  Future<void> openPermissionSettings() =>
      channel.invokeMethod<void>('openPermissionSettings');
  @override
  Future<void> install(String path) =>
      channel.invokeMethod<void>('install', {'path': path});
}
