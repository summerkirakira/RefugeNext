import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/repo/base/json_file_store.dart';
import 'package:refuge_next/src/repo/base/versioned_json_store.dart';

void main() {
  late Directory tempDir;

  Future<String> tempPath() async => tempDir.path;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('json_file_store_test');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  JsonFileStore<List<String>> buildStore({int schemaVersion = 1}) {
    return JsonFileStore<List<String>>(
      fileName: 'items.json',
      fromJson: (json) => (json as List).cast<String>(),
      toJson: (value) => value,
      schemaVersion: schemaVersion,
      directoryPath: tempPath,
    );
  }

  group('JsonFileStore', () {
    test('write → read roundtrip(新实例,验证走磁盘)', () async {
      await buildStore().write(['a', 'b', 'c']);

      // 新实例没有内存缓存,必须从磁盘读
      final store = buildStore();
      expect(store.cached, isNull);
      expect(await store.read(), ['a', 'b', 'c']);
      expect(store.cached, ['a', 'b', 'c']);
    });

    test('磁盘信封格式包含 schemaVersion / updatedAt / data', () async {
      await buildStore().write(['x']);

      final contents =
          await File('${tempDir.path}/items.json').readAsString();
      final Map<String, dynamic> envelope = jsonDecode(contents);
      expect(envelope['schemaVersion'], 1);
      expect(DateTime.tryParse(envelope['updatedAt'] as String), isNotNull);
      expect(envelope['data'], ['x']);
    });

    test('文件缺失 → read 返回 null', () async {
      expect(await buildStore().read(), isNull);
    });

    test('损坏文件 → read 返回 null', () async {
      await File('${tempDir.path}/items.json').writeAsString('{not json!');
      expect(await buildStore().read(), isNull);
    });

    test('schemaVersion 不符 → read 返回 null', () async {
      await buildStore(schemaVersion: 1).write(['a']);
      expect(await buildStore(schemaVersion: 2).read(), isNull);
    });

    test('裸 List 旧格式可解析,lastUpdated 为 null', () async {
      await File('${tempDir.path}/items.json')
          .writeAsString(jsonEncode(['legacy']));

      final store = buildStore();
      expect(await store.read(), ['legacy']);
      expect(await store.lastUpdated(), isNull);
    });

    test('write 后 lastUpdated 非空,且无残留 .tmp 文件', () async {
      final store = buildStore();
      await store.write(['a']);

      expect(await store.lastUpdated(), isNotNull);
      expect(await File('${tempDir.path}/items.json.tmp').exists(), isFalse);
    });

    test('文件名含子目录时自动创建父目录', () async {
      final store = JsonFileStore<List<String>>(
        fileName: 'sub/dir/items.json',
        fromJson: (json) => (json as List).cast<String>(),
        toJson: (value) => value,
        directoryPath: tempPath,
      );
      await store.write(['a']);
      expect(
          await File('${tempDir.path}/sub/dir/items.json').exists(), isTrue);
    });

    test('clear 删除文件并清空缓存', () async {
      final store = buildStore();
      await store.write(['a']);
      await store.clear();

      expect(store.cached, isNull);
      expect(await File('${tempDir.path}/items.json').exists(), isFalse);
      expect(await store.read(), isNull);
    });

    test('list 便捷构造按元素序列化', () async {
      final store = JsonFileStore.list<MapEntry<String, int>>(
        fileName: 'entries.json',
        fromJsonElement: (json) =>
            MapEntry(json['k'] as String, json['v'] as int),
        toJsonElement: (e) => {'k': e.key, 'v': e.value},
        directoryPath: tempPath,
      );
      await store.write(const [MapEntry('a', 1), MapEntry('b', 2)]);

      final loaded = await JsonFileStore.list<MapEntry<String, int>>(
        fileName: 'entries.json',
        fromJsonElement: (json) =>
            MapEntry(json['k'] as String, json['v'] as int),
        toJsonElement: (e) => {'k': e.key, 'v': e.value},
        directoryPath: tempPath,
      ).read();
      expect(loaded, isNotNull);
      expect(loaded!.map((e) => '${e.key}=${e.value}'), ['a=1', 'b=2']);
    });
  });

  group('VersionedJsonStore', () {
    VersionedJsonStore<List<String>> buildVersioned() {
      return VersionedJsonStore.list<String>(
        dirName: 'wiki/test_data',
        fromJsonElement: (json) => json['v'] as String,
        toJsonElement: (e) => {'v': e},
        directoryPath: tempPath,
      );
    }

    test('多版本写入与读取互不干扰', () async {
      final store = buildVersioned();
      await store.write('4.1', ['old']);
      await store.write('4.2', ['new']);

      expect(await store.read('4.1'), ['old']);
      expect(await store.read('4.2'), ['new']);
    });

    test('listLocalVersions 返回升序版本列表', () async {
      final store = buildVersioned();
      expect(await store.listLocalVersions(), isEmpty);

      await store.write('4.2', ['b']);
      await store.write('4.1', ['a']);
      expect(await store.listLocalVersions(), ['4.1', '4.2']);
    });

    test('hasVersion / delete', () async {
      final store = buildVersioned();
      await store.write('4.1', ['a']);

      expect(await store.hasVersion('4.1'), isTrue);
      expect(await store.hasVersion('4.2'), isFalse);

      await store.delete('4.1');
      expect(await store.hasVersion('4.1'), isFalse);
      expect(await store.read('4.1'), isNull);
    });

    test('版本码净化:非法字符替换为下划线', () async {
      expect(VersionedJsonStore.sanitizeVersion('4.2 PTU/live'), '4.2_PTU_live');

      final store = buildVersioned();
      await store.write('4.2 PTU/live', ['a']);
      expect(
          await File('${tempDir.path}/wiki/test_data/4.2_PTU_live.json')
              .exists(),
          isTrue);
      expect(await store.read('4.2 PTU/live'), ['a']);
      expect(await store.listLocalVersions(), ['4.2_PTU_live']);
    });
  });
}
