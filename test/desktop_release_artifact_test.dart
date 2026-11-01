import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/services/update/desktop_update_backend.dart';

void main() {
  final archive = Platform.environment['REFUGE_DESKTOP_ZIP'];
  final manifest = Platform.environment['REFUGE_DESKTOP_MANIFEST'];
  test('real release archive passes client validation including ZIP headers',
      () async {
    final raw = jsonDecode(await File(manifest!).readAsString())
        as Map<String, dynamic>;
    final release = parseDesktopRelease(
        raw, raw['platform'] as String, raw['architecture'] as String);
    final file = File(archive!);
    expect(await file.length(), release.size);
    expect(
        (await sha256.bind(file.openRead()).first).toString(), release.sha256);
    expect(inspectDesktopArchive(file.path, release), isNotEmpty);
  },
      skip: archive == null || manifest == null
          ? 'Set REFUGE_DESKTOP_ZIP and REFUGE_DESKTOP_MANIFEST'
          : false);
}
