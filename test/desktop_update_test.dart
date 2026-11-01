import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/services/update/app_update_controller.dart';
import 'package:refuge_next/src/services/update/app_update_backend.dart';
import 'package:refuge_next/src/services/update/desktop_update_backend.dart';
import 'package:refuge_next/src/services/update/windows_update_installer.dart';
import 'package:refuge_next/src/widgets/update/app_update_sheet.dart';

import 'support/update_backend_fake.dart';

class DesktopFake extends UpdateBackendFake {
  DesktopFake(super.folder);
  @override
  bool get requiresRestart => true;
}

void main() {
  final manifest = <String, dynamic>{
    'schemaVersion': 1,
    'platform': 'windows',
    'architecture': 'x64',
    'name': '4.6.3',
    'code': 443,
    'notes': '第一行\n第二行\n\nby.妖精',
    'size': 123,
    'sha256': 'a' * 64,
    'url': 'https://example.test/refuge-4.6.3-443.zip'
  };

  test(
      'desktop manifest retains newlines and enforces platform/architecture/hash',
      () {
    final release = parseDesktopRelease(manifest, 'windows', 'x64');
    expect(release.notes, contains('\n\nby.妖精'));
    expect(AppRelease.fromJson(release.toJson()).sha256, release.sha256);
    for (final change in [
      {'architecture': 'arm64'},
      {'platform': 'macos'},
      {'sha256': 'bad'},
      {'size': 0},
      {'url': 'http://example.test/a.zip'},
      {'schemaVersion': 2}
    ]) {
      expect(
          () => parseDesktopRelease({...manifest, ...change}, 'windows', 'x64'),
          throwsFormatException);
    }
  });

  test('desktop compares semantic version then build, without downgrading', () {
    final release = parseDesktopRelease(manifest, 'windows', 'x64');
    expect(
        isNewerDesktopRelease(
            release, const InstalledApp('refuge', '4.6.2', 999)),
        isTrue);
    expect(
        isNewerDesktopRelease(
            release, const InstalledApp('refuge', '4.7.0', 1)),
        isFalse);
    expect(
        isNewerDesktopRelease(
            release, const InstalledApp('refuge', '4.6.3', 442)),
        isTrue);
    expect(
        isNewerDesktopRelease(
            release, const InstalledApp('refuge', '4.6.3', 443)),
        isFalse);
  });

  test(
      'desktop archive validates identity and Windows extraction rejects traversal',
      () async {
    final root = await Directory.systemTemp.createTemp('refuge-desktop-test-');
    addTearDown(() => root.delete(recursive: true));
    final archive = Archive();
    for (final name in windowsBundleFiles) {
      archive.addFile(ArchiveFile(name, 1, [1]));
    }
    final metadata = utf8.encode(jsonEncode({
      'product': 'refuge_next',
      'platform': 'windows',
      'architecture': 'x64',
      'version': '4.6.3',
      'buildNumber': 443
    }));
    archive
        .addFile(ArchiveFile('refuge-release.json', metadata.length, metadata));
    final zip = File('${root.path}/package.zip');
    await zip.writeAsBytes(ZipEncoder().encode(archive)!);
    final release = parseDesktopRelease(manifest, 'windows', 'x64');
    expect(inspectDesktopArchive(zip.path, release), isNotEmpty);
    expect(
        () => inspectDesktopArchive(zip.path,
            parseDesktopRelease({...manifest, 'code': 444}, 'windows', 'x64')),
        throwsFormatException);
    archive.addFile(ArchiveFile('../outside', 1, [1]));
    await zip.writeAsBytes(ZipEncoder().encode(archive)!);
    expect(() => extractWindowsUpdate(zip.path, '${root.path}/staged'),
        throwsFormatException);
    expect(File('${root.path}/outside').existsSync(), isFalse);
  });

  test(
      'PowerShell separators are normalized and duplicate ZIP entries are rejected',
      () async {
    final root = await Directory.systemTemp.createTemp('refuge-zip-policy-');
    addTearDown(() => root.delete(recursive: true));
    final archive = Archive();
    for (final name in windowsBundleFiles) {
      archive.addFile(ArchiveFile(name.replaceAll('/', r'\'), 1, [1]));
    }
    final bytes = utf8.encode(jsonEncode({
      'product': 'refuge_next',
      'platform': 'windows',
      'architecture': 'x64',
      'version': '4.6.3',
      'buildNumber': 443
    }));
    archive.addFile(ArchiveFile('refuge-release.json', bytes.length, bytes));
    final zip = File('${root.path}/powershell.zip');
    await zip.writeAsBytes(ZipEncoder().encode(archive)!);
    expect(
        inspectDesktopArchive(
            zip.path, parseDesktopRelease(manifest, 'windows', 'x64')),
        isNotEmpty);
    archive.addFile(ArchiveFile('DATA/app.so', 1, [2]));
    await zip.writeAsBytes(ZipEncoder().encode(archive)!);
    expect(
        () => inspectDesktopArchive(
            zip.path, parseDesktopRelease(manifest, 'windows', 'x64')),
        throwsFormatException);
  });

  testWidgets('desktop download waits for explicit restart click',
      (tester) async {
    final root = Directory.systemTemp.createTempSync('refuge-desktop-ui-');
    final backend = DesktopFake(root);
    final controller = AppUpdateController(backend);
    addTearDown(() async {
      controller.dispose();
      root.deleteSync(recursive: true);
    });
    await tester.runAsync(() => controller.check());
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: AppUpdateSheet(controller: controller))));
    await tester.tap(find.text('下载更新'));
    for (var i = 0; i < 200 && controller.busy; i++) {
      await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 5)));
      await tester.pump();
    }
    await tester.pumpAndSettle();
    expect(backend.installs, 0);
    expect(find.text('重启并更新'), findsOneWidget);
    await tester.tap(find.text('重启并更新'));
    for (var i = 0; i < 200 && backend.installs == 0; i++) {
      await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 5)));
      await tester.pump();
    }
    await tester.pumpAndSettle();
    expect(backend.installs, 1);
  });

  test('missing desktop release is unavailable rather than network failure',
      () async {
    final root = await Directory.systemTemp.createTemp('refuge-unavailable-');
    final backend = DesktopFake(root)
      ..checkError = const UpdateUnavailable('暂无可用更新包');
    final controller = AppUpdateController(backend);
    addTearDown(() async {
      controller.dispose();
      await root.delete(recursive: true);
    });
    await controller.check();
    expect(controller.phase, UpdatePhase.unavailable);
    expect(controller.release, isNull);
  });
}
