import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/network/cirno/property/property.dart'
    show ShipAlias;
import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/repo/translation.dart';

ShipAlias alias(String name) =>
    ShipAlias(id: 1, name: name, alias: [], skus: [], uuid: 'ship');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory directory;
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    directory = await Directory.systemTemp.createTemp('terminal-localization-');
  });
  tearDown(() async {
    if (await directory.exists()) await directory.delete(recursive: true);
  });

  test(
      'dictionary missing or corrupt retains cache, later recovery notifies once',
      () async {
    final repo =
        TranslationRepo.forTesting(directoryPath: () async => directory.path);
    addTearDown(repo.dispose);
    var updates = 0;
    repo.addListener(() => updates++);
    expect(await repo.getTranslations(), isEmpty);
    final file = File('${directory.path}/translation.json');
    await file.writeAsString('{broken');
    expect(await repo.readTranslation(), isEmpty);
    expect(updates, 0);
    await file.writeAsString(jsonEncode({'Eclipse': '日蚀'}));
    await repo.readTranslation();
    expect(repo.getTranslationSync('Eclipse'), '日蚀');
    expect(updates, 1);
    await repo.readTranslation();
    expect(updates, 1);
    await file.writeAsString('{broken');
    await repo.readTranslation();
    expect(repo.getTranslationSync('Eclipse'), '日蚀');
    expect(updates, 1);
  });

  test(
      'overlapping dictionary reads share work and cannot overwrite queued update',
      () async {
    await File('${directory.path}/translation.json')
        .writeAsString('{"Eclipse":"旧译名"}');
    final gate = Completer<void>();
    var reads = 0;
    final repo = TranslationRepo.forTesting(directoryPath: () async {
      reads++;
      await gate.future;
      return directory.path;
    });
    addTearDown(repo.dispose);
    final first = repo.readTranslation();
    final second = repo.readTranslation();
    expect(identical(first, second), isTrue);
    final update = repo.writeTranslation({'Eclipse': '日蚀'}, 7);
    gate.complete();
    await Future.wait([first, second, update]);
    expect(reads, 2);
    expect(repo.getTranslationSync('Eclipse'), '日蚀');
    expect(
        jsonDecode(
            await File('${directory.path}/translation.json').readAsString()),
        {'Eclipse': '日蚀'});
    expect(await repo.getTranslationVersion(), 7);
  });

  test('failed dictionary update keeps memory and version, publishes no update',
      () async {
    var fail = false;
    final repo = TranslationRepo.forTesting(directoryPath: () async {
      if (fail) throw FileSystemException('unavailable');
      return directory.path;
    });
    addTearDown(repo.dispose);
    await repo.writeTranslation({'Eclipse': '日蚀'}, 1);
    var updates = 0;
    repo.addListener(() => updates++);
    fail = true;
    await expectLater(repo.writeTranslation({'Eclipse': '新名称'}, 2),
        throwsA(isA<FileSystemException>()));
    expect(repo.getTranslationSync('Eclipse'), '日蚀');
    expect(await repo.getTranslationVersion(), 1);
    expect(updates, 0);
  });

  test(
      'translation switch loads once and explicit change wins over pending load',
      () async {
    SharedPreferences.setMockInitialValues(
        {'app.settings.enableHangarTranslation': false});
    final repo =
        TranslationRepo.forTesting(directoryPath: () async => directory.path);
    addTearDown(repo.dispose);
    await repo.loadTranslationSetting();
    expect(repo.translationEnabled, isFalse);
    await repo.writeTranslation({'Eclipse': '日蚀'}, 1);
    expect(repo.getTranslationSync('Eclipse'), 'Eclipse');
    repo.setTranslationEnabled(true);
    await repo.loadTranslationSetting();
    expect(repo.getTranslationSync('Eclipse'), '日蚀');
    final pendingRepo =
        TranslationRepo.forTesting(directoryPath: () async => directory.path);
    addTearDown(pendingRepo.dispose);
    final loading = pendingRepo.loadTranslationSetting();
    pendingRepo.setTranslationEnabled(true);
    await loading;
    expect(pendingRepo.translationEnabled, isTrue);
  });

  test(
      'alias reads are deduplicated, late reads cannot replace updated UUID index',
      () async {
    await File('${directory.path}/ship_aliases.json')
        .writeAsString(jsonEncode([alias('Old')]));
    final gate = Completer<void>();
    var reads = 0;
    final repo = ShipAliasRepo.forTesting(directoryPath: () async {
      reads++;
      await gate.future;
      return directory.path;
    });
    addTearDown(repo.dispose);
    final first = repo.readShipAliases();
    final second = repo.readShipAliases();
    expect(identical(first, second), isTrue);
    final update = repo.writeShipAliases([alias('Eclipse')], 9);
    gate.complete();
    await Future.wait([first, second, update]);
    expect(reads, 2);
    expect(repo.getShipAliasByUuidSync('ship')!.name, 'Eclipse');
    expect(await repo.getShipAliasesVersion(), 9);
  });

  test(
      'alias read/write failures preserve valid data and recover on later read',
      () async {
    var fail = false;
    final repo = ShipAliasRepo.forTesting(directoryPath: () async {
      if (fail) throw FileSystemException('unavailable');
      return directory.path;
    });
    addTearDown(repo.dispose);
    expect(await repo.getShipAliases(), isEmpty);
    await repo.writeShipAliases([alias('Eclipse')], 1);
    var updates = 0;
    repo.addListener(() => updates++);
    fail = true;
    await expectLater(repo.writeShipAliases([alias('New')], 2),
        throwsA(isA<FileSystemException>()));
    await repo.readShipAliases();
    expect(repo.getShipAliasByUuidSync('ship')!.name, 'Eclipse');
    expect(await repo.getShipAliasesVersion(), 1);
    expect(updates, 0);
    fail = false;
    await File('${directory.path}/ship_aliases.json')
        .writeAsString(jsonEncode([alias('New')]));
    await repo.readShipAliases();
    expect(repo.getShipAliasByUuidSync('ship')!.name, 'New');
    expect(updates, 1);
  });
}
