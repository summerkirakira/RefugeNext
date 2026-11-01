import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive_io.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../desktop_rsi_webview.dart';
import '../../funcs/tray_manager_service.dart';
import 'app_update_backend.dart';
import 'desktop_archive.dart';
import 'update_shutdown.dart';
import '../database_service.dart';
import '../../repo/user.dart';
import 'windows_update_installer.dart';

const desktopUpdateChannel =
    MethodChannel('vip.kirakira.refuge_next/app_update');

/// Desktop releases are independent of the Android/account configuration API.
AppRelease parseDesktopRelease(
    Map<String, dynamic> json, String platform, String architecture) {
  final release = AppRelease.fromJson(json);
  final uri = Uri.tryParse(release.url);
  if (json['schemaVersion'] != 1 ||
      release.platform != platform ||
      release.architecture != architecture ||
      release.code < 1 ||
      !RegExp(r'^\d+\.\d+\.\d+$').hasMatch(release.name) ||
      release.size == null ||
      release.size! < 1 ||
      release.sha256 == null ||
      !RegExp(r'^[a-f0-9]{64}$').hasMatch(release.sha256!) ||
      uri == null ||
      uri.scheme != 'https' ||
      uri.host.isEmpty ||
      !uri.path.endsWith('.zip')) {
    throw const FormatException('桌面更新清单无效');
  }
  return release;
}

bool isNewerDesktopRelease(AppRelease release, InstalledApp installed) {
  final a = release.name.split('.').map(int.parse).toList();
  final b = installed.name.split('.').map(int.parse).toList();
  if (a.length != 3 || b.length != 3) throw const FormatException('版本号无效');
  for (var i = 0; i < 3; i++) {
    if (a[i] != b[i]) return a[i] > b[i];
  }
  return release.code > installed.code;
}

class DesktopUpdateBackend extends AppUpdateBackend {
  DesktopUpdateBackend({Dio? client})
      : _client = client ??
            Dio(BaseOptions(
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 30)));
  final Dio _client;
  bool _trayStopped = false;
  String get platform => Platform.isWindows ? 'windows' : 'macos';
  String get architecture => Platform.isWindows ? 'x64' : 'arm64';
  @override
  bool get requiresRestart => true;
  @override
  bool isNewer(AppRelease release, InstalledApp installed) =>
      isNewerDesktopRelease(release, installed);

  @override
  Future<InstalledApp> installedApp() async {
    final info = await PackageInfo.fromPlatform();
    return InstalledApp(
        info.packageName, info.version, int.parse(info.buildNumber));
  }

  @override
  Future<Directory> directory() async {
    if (Platform.isMacOS) {
      return Directory(
          (await desktopUpdateChannel.invokeMethod<String>('directory'))!);
    }
    return Directory(p.join(
        (await getApplicationSupportDirectory()).path, 'updates', platform));
  }

  @override
  Future<AppRelease> latest({required bool refresh}) async {
    if (Platform.isMacOS &&
        await desktopUpdateChannel.invokeMethod<bool>('supportsMacOSUpdate') !=
            true) {
      throw const UpdateUnavailable('当前更新仅支持 Apple Silicon 独立发行版');
    }
    try {
      final response = await _client.get<Object>(
          'https://image.biaoju.site/starcitizen/app/$platform/$architecture/latest.json',
          options: Options(headers: {'Cache-Control': 'no-cache'}));
      final data = response.data is String
          ? jsonDecode(response.data as String)
          : response.data;
      return parseDesktopRelease(
          Map<String, dynamic>.from(data as Map), platform, architecture);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw const UpdateUnavailable('暂无可用更新包');
      }
      rethrow;
    }
  }

  @override
  Future<void> download(String url, String destination, CancelToken cancel,
      void Function(int, int) progress) async {
    await _client.download(url, destination,
        cancelToken: cancel, onReceiveProgress: progress, deleteOnError: true);
  }

  @override
  Future<bool> validatePackage(
      String path, AppRelease release, InstalledApp installed) async {
    if (release.platform != platform || release.architecture != architecture) {
      return false;
    }
    final file = File(path);
    if (await file.length() != release.size ||
        (await sha256.bind(file.openRead()).first).toString() !=
            release.sha256) {
      return false;
    }
    await Isolate.run(() => inspectDesktopArchive(path, release));
    return true;
  }

  @override
  Future<ApkIdentity> inspect(String path) =>
      throw UnsupportedError('Desktop bundle');
  @override
  Future<bool> canInstall() async => true;
  @override
  Future<void> openPermissionSettings() async {}
  @override
  Future<void> install(String path) =>
      throw UnsupportedError('Release metadata required');

  @override
  Future<void> installRelease(String path, AppRelease release) async {
    if (Platform.isWindows) {
      final prepared =
          await WindowsUpdateInstaller().prepareAndLaunch(release, path);
      try {
        await _prepareExit();
        await prepared.commit();
        await desktopUpdateChannel.invokeMethod<void>('exitForUpdate');
      } catch (_) {
        await prepared.cancel();
        await _restoreAfterFailedExit();
        rethrow;
      }
    } else {
      final entries =
          await Isolate.run(() => inspectDesktopArchive(path, release));
      final prepared = await desktopUpdateChannel
          .invokeMapMethod<String, dynamic>('prepareMacOSUpdate', {
        'zipPath': path,
        'size': release.size,
        'sha256': release.sha256,
        'version': release.name,
        'buildNumber': release.code,
        'entries': entries
      });
      final transaction = prepared?['transactionPath'];
      if (transaction is! String) throw const FormatException('更新器未能就绪');
      try {
        await _prepareExit();
        await desktopUpdateChannel.invokeMethod<void>(
            'commitMacOSUpdate', {'transactionPath': transaction});
      } catch (_) {
        await desktopUpdateChannel.invokeMethod<void>(
            'cancelMacOSUpdate', {'transactionPath': transaction});
        rethrow;
      }
    }
  }

  Future<void> _prepareExit() async {
    // Account/config writes are awaited by their owners. Browser windows must
    // finish synchronizing before we bypass the normal hide-to-tray close.
    await DesktopRsiWebview.instance
        .closeForUpdate()
        .timeout(const Duration(seconds: 15));
    await UpdateShutdown.flush().timeout(const Duration(seconds: 15));
    await UserRepo().flushPendingWrites();
    await DatabaseService.instance.close();
    await TrayManagerService().dispose();
    _trayStopped = true;
  }

  Future<void> _restoreAfterFailedExit() async {
    if (!_trayStopped) return;
    try {
      await TrayManagerService().initialize();
      _trayStopped = false;
    } catch (_) {
      // Preserve the original installer failure; the main window remains open.
    }
  }

  @override
  Future<String?> previousResult() async {
    final root = await directory();
    final pointer = File(p.join(root.path, 'last-transaction.json'));
    if (!await pointer.exists()) return null;
    final id = (jsonDecode(await pointer.readAsString()) as Map)['id'];
    if (id is! String || !RegExp(r'^[a-f0-9]{32}$').hasMatch(id)) return null;
    final result = File(p.join(root.path, 'transactions', id, 'result.json'));
    if (!await result.exists()) return null;
    final value = jsonDecode(await result.readAsString()) as Map;
    return value['state'] == 'failed'
        ? '上次更新未完成：${value['message'] ?? '请重试'}'
        : null;
  }
}

/// Read in an isolate. No extraction occurs here. Native Mac policy rechecks
/// every path/link before ditto; the Windows extractor rejects all links.
List<Map<String, Object>> inspectDesktopArchive(
    String path, AppRelease release) {
  final input = InputFileStream(path);
  try {
    final archive =
        readDesktopZip(input, windows: release.platform == 'windows');
    if (archive.length > 20000) throw const FormatException('更新包文件过多');
    var expanded = 0;
    final entries = <Map<String, Object>>[];
    final names = <String>{};
    for (final entry in archive) {
      expanded += entry.size;
      final name = entry.name;
      final normalized =
          name.endsWith('/') ? name.substring(0, name.length - 1) : name;
      if (expanded > 1024 * 1024 * 1024 ||
          name.contains('\\') ||
          name.startsWith('/') ||
          normalized
              .split('/')
              .any((s) => s.isEmpty || s == '.' || s == '..') ||
          !names.add(normalized.toLowerCase())) {
        throw const FormatException('更新包路径或大小无效');
      }
      if (release.platform == 'windows' && entry.isSymbolicLink) {
        throw const FormatException('Windows 更新包包含链接');
      }
      entries.add({
        'path': name,
        'size': entry.size,
        if (entry.isSymbolicLink) 'link': entry.nameOfLinkedFile
      });
    }
    final prefix =
        release.platform == 'macos' ? '星河避难所.app/Contents/Resources/' : '';
    final metadata = archive.findFile('${prefix}refuge-release.json');
    if (metadata == null || metadata.size > 4096 || metadata.isSymbolicLink) {
      throw const FormatException('更新包缺少版本信息');
    }
    final value = jsonDecode(utf8.decode(metadata.content as List<int>)) as Map;
    if (value['product'] != 'refuge_next' ||
        value['version'] != release.name ||
        value['buildNumber'] != release.code ||
        value['platform'] != release.platform ||
        value['architecture'] != release.architecture) {
      throw const FormatException('安装包与目标版本不符');
    }
    if (release.platform == 'windows') {
      for (final name in windowsBundleFiles) {
        if (archive.findFile(name) == null) {
          throw FormatException('更新包缺少 $name');
        }
      }
    }
    return entries;
  } finally {
    input.closeSync();
  }
}
