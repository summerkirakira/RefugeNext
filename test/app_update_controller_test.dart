import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/services/update/app_update_backend.dart';
import 'package:refuge_next/src/services/update/app_update_controller.dart';
import 'support/update_backend_fake.dart';

void main() {
  late Directory dir;
  late UpdateBackendFake backend;
  late AppUpdateController controller;
  setUp(() async {
    dir = await Directory.systemTemp.createTemp('refuge-updater-');
    backend = UpdateBackendFake(dir);
    controller = AppUpdateController(backend);
  });
  tearDown(() async {
    controller.dispose();
    await dir.delete(recursive: true);
  });

  test('concurrent automatic and manual checks share one request', () async {
    backend.checkGate = Completer();
    final first = controller.check(refresh: false);
    final second = controller.check();
    expect(identical(first, second), true);
    backend.checkGate!.complete();
    await first;
    expect(backend.checks, 1);
    expect(controller.phase, UpdatePhase.available);
  });

  test('older or equal releases are up to date, check errors retry', () async {
    backend.failCheck = true;
    await controller.check();
    expect(controller.failure, UpdateFailure.check);
    backend.failCheck = false;
    backend.current = const InstalledApp('test.refuge', '4.6.3', 443);
    controller.dispose();
    controller = AppUpdateController(backend);
    await controller.check();
    expect(controller.phase, UpdatePhase.upToDate);
    expect(controller.release, isNull);
  });

  test(
      'unknown size reports indeterminate progress and duplicate download merges',
      () async {
    await controller.check();
    backend.unknownSize = true;
    backend.downloadGate = Completer();
    final first = controller.download();
    expect(identical(first, controller.download()), true);
    // Wait for the real file journal to be written before the fake transport runs.
    while (backend.progress == null) {
      await Future<void>.delayed(const Duration(milliseconds: 1));
    }
    expect(controller.progress, isNull);
    expect(controller.received, 2);
    backend.downloadGate!.complete();
    expect(await first, true);
    expect(controller.phase, UpdatePhase.ready);
    expect(backend.downloads, 1);
    expect(backend.installs, 0);
  });

  test('cancel cleans partial files and permits another download', () async {
    await controller.check();
    backend.downloadGate = Completer();
    final task = controller.download();
    await controller.cancelDownload();
    expect(await task, false);
    expect(controller.phase, UpdatePhase.available);
    expect(await dir.list().where((f) => f.path.endsWith('.part')).length, 0);
    backend.downloadGate = null;
    expect(await controller.download(), true);
  });

  test('network failure is visible and retry succeeds', () async {
    await controller.check();
    backend.failDownload = true;
    expect(await controller.download(), false);
    expect(controller.failure, UpdateFailure.download);
    expect(controller.error, contains('网络'));
    backend.failDownload = false;
    expect(await controller.download(), true);
  });

  for (final identity in [
    const ApkIdentity('other.package', 443),
    const ApkIdentity('test.refuge', 444)
  ]) {
    test('invalid APK identity ${identity.package}/${identity.code} is removed',
        () async {
      await controller.check();
      backend.identity = identity;
      expect(await controller.download(), false);
      expect(controller.error, contains('目标版本'));
      expect(controller.hasPackage, false);
      expect(await File('${dir.path}/refuge-443.apk').exists(), false);
      await controller.install();
      expect(backend.installs, 0);
    });
  }

  test('permission denied then granted reuses verified package', () async {
    await controller.check();
    await controller.download();
    backend.permission = false;
    await controller.install();
    expect(controller.phase, UpdatePhase.permissionRequired);
    await controller.openPermissionSettings();
    await controller.resumePermission();
    expect(backend.installs, 0);
    backend.permission = true;
    await controller.resumePermission();
    expect(controller.phase, UpdatePhase.installRequested);
    await controller.install(); // User canceled installer and clicked again.
    expect(backend.installs, 2);
    expect(backend.downloads, 1);
  });

  test('installer failure retains package and retries without network',
      () async {
    await controller.check();
    await controller.download();
    backend.failInstall = true;
    await controller.install();
    expect(controller.failure, UpdateFailure.install);
    expect(controller.hasPackage, true);
    backend.failInstall = false;
    await controller.install();
    expect(backend.installs, 1);
    expect(backend.downloads, 1);
  });

  test('permission settings failure is recoverable', () async {
    await controller.check();
    await controller.download();
    backend.permission = false;
    await controller.install();
    backend.failSettings = true;
    expect(await controller.openPermissionSettings(), false);
    expect(controller.failure, UpdateFailure.install);
    expect(controller.hasPackage, true);
  });

  test('completed package survives restart and a failed version request',
      () async {
    await controller.check();
    await controller.download();
    controller.dispose();
    controller = AppUpdateController(backend);
    await controller.initialize();
    expect(controller.phase, UpdatePhase.ready);
    backend.failCheck = true;
    await controller.check();
    expect(controller.phase, UpdatePhase.ready);
    await controller.install();
    expect(backend.installs, 1);
    expect(backend.downloads, 1);
  });

  test('interrupted record recovers without pretending the APK is complete',
      () async {
    await controller.check();
    backend.failDownload = true;
    await controller.download();
    await File('${dir.path}/refuge-443.part').writeAsString('partial');
    controller.dispose();
    controller = AppUpdateController(backend);
    await controller.initialize();
    expect(controller.failure, UpdateFailure.download);
    expect(controller.hasPackage, false);
    expect(await File('${dir.path}/refuge-443.part').exists(), false);
  });

  test('installed update cleans only updater-owned obsolete files', () async {
    await controller.check();
    await controller.download();
    await File('${dir.path}/unrelated.txt').writeAsString('preserve');
    controller.dispose();
    backend.current = const InstalledApp('test.refuge', '4.6.3', 443);
    controller = AppUpdateController(backend);
    await controller.initialize();
    expect(controller.release, isNull);
    expect(await File('${dir.path}/refuge-443.apk').exists(), false);
    expect(await File('${dir.path}/update.json').exists(), false);
    expect(await File('${dir.path}/unrelated.txt').exists(), true);
  });

  test('tampered file is rejected again before installation', () async {
    await controller.check();
    await controller.download();
    await File('${dir.path}/refuge-443.apk').writeAsString('truncated');
    await controller.install();
    expect(backend.installs, 0);
    expect(controller.hasPackage, false);
    expect(controller.failure, UpdateFailure.download);
  });

  test('new release invalidates previous downloaded bytes', () async {
    await controller.check();
    await controller.download();
    backend.release = const AppRelease(
        code: 444,
        name: '4.6.4',
        url: 'https://example.test/new.apk',
        notes: 'new');
    await controller.check();
    expect(controller.phase, UpdatePhase.available);
    expect(controller.hasPackage, false);
    expect(await File('${dir.path}/refuge-443.apk').exists(), false);
  });
  test('archive parse failure at install time requires a new download',
      () async {
    await controller.check();
    await controller.download();
    backend.failInspect = true;
    await controller.install();
    expect(controller.hasPackage, false);
    expect(controller.failure, UpdateFailure.download);
    expect(backend.installs, 0);
  });

  test('unwritable download directory reports storage failure', () async {
    await controller.check();
    await dir.delete(recursive: true);
    await File(dir.path).writeAsString('storage unavailable');
    try {
      expect(await controller.download(), false);
      expect(controller.phase, UpdatePhase.error);
      expect(controller.error, contains('存储'));
    } finally {
      await File(dir.path).delete();
      await dir.create();
    }
  });

  test(
      'disk failure wrapped by download transport reports storage rather than network',
      () async {
    await controller.check();
    backend.downloadError = DioException(
        requestOptions: RequestOptions(),
        error: const FileSystemException('No space left'));
    expect(await controller.download(), false);
    expect(controller.error, contains('存储'));
  });
  test(
      'reopening after permission was granted elsewhere becomes ready without installing',
      () async {
    await controller.check();
    await controller.download();
    backend.permission = false;
    await controller.install();
    backend.permission = true;
    await controller.refreshPermission();
    expect(controller.phase, UpdatePhase.ready);
    expect(backend.installs, 0);
  });
  test(
      'version errors distinguish timeouts, server failures and invalid responses',
      () async {
    backend.checkError = TimeoutException('check');
    await controller.check();
    expect(controller.error, contains('超时'));
    backend.checkError = DioException(
        requestOptions: RequestOptions(),
        response: Response(requestOptions: RequestOptions(), statusCode: 503));
    await controller.check();
    expect(controller.error, contains('503'));
    backend.checkError = const FormatException('invalid version');
    await controller.check();
    expect(controller.error, contains('格式异常'));
  });
}
