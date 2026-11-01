// Isolated process fixture. Never ship this entry point.
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:refuge_next/src/services/update/app_update_backend.dart';
import 'package:refuge_next/src/services/update/windows_update_installer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const configPath = String.fromEnvironment('REFUGE_WINDOWS_UPDATE_FIXTURE');
  if (!Platform.isWindows || configPath.isEmpty) {
    throw StateError('Fixture only');
  }
  final config = jsonDecode(await File(configPath).readAsString()) as Map;
  final support = Directory(config['supportPath'] as String);
  final info = await PackageInfo.fromPlatform();
  final build = int.parse(info.buildNumber);
  final release =
      AppRelease.fromJson(Map<String, dynamic>.from(config['release'] as Map));
  sqfliteFfiInit();
  final db = await databaseFactoryFfi
      .openDatabase(p.join(support.path, 'database.sqlite'));
  await db.execute('CREATE TABLE IF NOT EXISTS fixture (value TEXT NOT NULL)');
  if ((await db.rawQuery('SELECT value FROM fixture')).isEmpty) {
    await db.rawInsert('INSERT INTO fixture VALUES (?)', ['更新后保留的用户数据']);
  }
  final value =
      (await db.rawQuery('SELECT value FROM fixture')).single['value'];
  await db.close();
  await File(p.join(support.path, 'started-$build.json')).writeAsString(
      jsonEncode({
        'pid': pid,
        'buildNumber': build,
        'databaseValue': value,
        'layout':
            await File(p.join(support.path, 'layout.json')).readAsString(),
      }),
      flush: true);
  if (config['failBuild'] == build) exit(7);
  runApp(MaterialApp(
      home:
          Scaffold(body: Center(child: Text('更新测试 ${info.version}+$build')))));
  final attempted = File(p.join(support.path, 'attempted'));
  if (build == release.code || await attempted.exists()) return;
  await attempted.writeAsString('apply', flush: true);
  await Future<void>.delayed(const Duration(seconds: 1));
  final installer = WindowsUpdateInstaller(
      supportDirectory: () async => support,
      launcher: config['mode'] == 'tampered'
          ? (helper, requestPath) async {
              final request =
                  jsonDecode(await File(requestPath).readAsString()) as Map;
              await File(
                      p.join(request['stagedPath'] as String, 'data', 'app.so'))
                  .writeAsString('tampered');
              await Process.start(helper, [requestPath],
                  mode: ProcessStartMode.detached);
            }
          : null);
  try {
    final prepared =
        await installer.prepareAndLaunch(release, config['zipPath'] as String);
    if (config['mode'] != 'uncommitted') await prepared.commit();
    await const MethodChannel('vip.kirakira.refuge_next/app_update')
        .invokeMethod<void>('exitForUpdate');
  } catch (error, stack) {
    await File(p.join(support.path, 'apply-error.txt'))
        .writeAsString('$error\n$stack');
  }
}
