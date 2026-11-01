import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:refuge_next/src/services/update/app_update_backend.dart';

class UpdateBackendFake extends AppUpdateBackend {
  UpdateBackendFake(this.folder);
  final Directory folder;
  InstalledApp current = const InstalledApp('test.refuge', '4.6.2', 442);
  AppRelease release = const AppRelease(
      code: 443,
      name: '4.6.3',
      url: 'https://example.test/refuge.apk',
      notes: '修复机库可礼物状态。by.妖精');
  ApkIdentity identity = const ApkIdentity('test.refuge', 443);
  int checks = 0, downloads = 0, installs = 0, settings = 0;
  bool permission = true, failCheck = false, failDownload = false;
  bool failInstall = false, failSettings = false, failInspect = false;
  bool unknownSize = false;
  Object? downloadError;
  Object? checkError;
  Completer<void>? checkGate, downloadGate;
  void Function(int, int)? progress;

  @override
  Future<InstalledApp> installedApp() async => current;
  @override
  Future<Directory> directory() async => folder;
  @override
  Future<AppRelease> latest({required bool refresh}) async {
    checks++;
    await checkGate?.future;
    if (checkError != null) throw checkError!;
    if (failCheck) throw const SocketException('offline');
    return release;
  }

  @override
  Future<void> download(String url, String path, CancelToken cancel,
      void Function(int, int) onProgress) async {
    downloads++;
    progress = onProgress;
    onProgress(2, unknownSize ? -1 : 4);
    if (downloadGate != null) {
      await Future.any([
        downloadGate!.future,
        cancel.whenCancel.then((error) => throw error),
      ]);
    }
    if (downloadError != null) throw downloadError!;
    if (failDownload) throw const SocketException('offline');
    if (cancel.isCancelled) throw cancel.cancelError!;
    await File(path).writeAsBytes([1, 2, 3, 4]);
    onProgress(4, unknownSize ? -1 : 4);
  }

  @override
  Future<ApkIdentity> inspect(String path) async {
    if (failInspect) throw const FormatException('unreadable archive');
    return identity;
  }

  @override
  Future<bool> canInstall() async => permission;
  @override
  Future<void> openPermissionSettings() async {
    settings++;
    if (failSettings) throw StateError('No permission screen');
  }

  @override
  Future<void> install(String path) async {
    if (failInstall) throw StateError('No installer');
    installs++;
  }
}
