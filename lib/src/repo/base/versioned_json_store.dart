import 'dart:io';

import 'package:path/path.dart' as p;

import '../../utils/storage_path.dart';
import 'json_file_store.dart';

/// 按版本号(如游戏版本 `4.2`)分文件存储同构数据。
///
/// 目录布局:`<root>/<dirName>/<versionCode>.json`,
/// 每个版本文件复用 [JsonFileStore] 的信封格式与原子写入。
/// 适用于需要保留多份历史快照、并允许在版本间切换的数据
/// (如 Ship Matrix 按游戏版本存档)。
class VersionedJsonStore<T> {
  VersionedJsonStore({
    required this.dirName,
    required this.fromJson,
    required this.toJson,
    this.schemaVersion = 1,
    Future<String> Function()? directoryPath,
  }) : _directoryPath = directoryPath ?? StoragePath.getAppDataPath;

  /// 相对存储根目录的子目录名,如 `wiki/ship_matrix`。
  final String dirName;

  /// 从信封内 `data` 字段反序列化为 [T]。
  final T Function(Object? json) fromJson;

  /// 将 [T] 序列化为可 jsonEncode 的对象。
  final Object? Function(T value) toJson;

  /// 数据结构版本,透传给各版本的 [JsonFileStore]。
  final int schemaVersion;

  final Future<String> Function() _directoryPath;

  /// 各版本对应的 [JsonFileStore] 实例(懒建,持有内存缓存)。
  final Map<String, JsonFileStore<T>> _stores = {};

  /// 版本码净化:仅保留 `[A-Za-z0-9._-]`,其余字符替换为 `_`,
  /// 保证可安全用作文件名。
  static String sanitizeVersion(String version) {
    return version.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
  }

  JsonFileStore<T> _storeFor(String version) {
    final key = sanitizeVersion(version);
    return _stores.putIfAbsent(
      key,
      () => JsonFileStore<T>(
        fileName: p.join(dirName, '$key.json'),
        fromJson: fromJson,
        toJson: toJson,
        schemaVersion: schemaVersion,
        directoryPath: _directoryPath,
      ),
    );
  }

  /// 读取指定版本的数据;无该版本/损坏/schemaVersion 不符返回 null。
  Future<T?> read(String version) => _storeFor(version).read();

  /// 同步获取指定版本的内存缓存(尚未加载过则为 null)。
  T? cached(String version) => _stores[sanitizeVersion(version)]?.cached;

  /// 写入指定版本的数据(原子写入)。
  Future<void> write(String version, T value) =>
      _storeFor(version).write(value);

  /// 指定版本数据的最后落盘时间;无数据返回 null。
  Future<DateTime?> lastUpdated(String version) =>
      _storeFor(version).lastUpdated();

  /// 列出本地已存在的版本码(按文件名扫描,升序排列)。
  Future<List<String>> listLocalVersions() async {
    try {
      final root = await _directoryPath();
      final dir = Directory(p.join(root, dirName));
      if (!await dir.exists()) {
        return [];
      }
      final versions = <String>[];
      await for (final entity in dir.list()) {
        if (entity is File && entity.path.endsWith('.json')) {
          versions.add(p.basenameWithoutExtension(entity.path));
        }
      }
      versions.sort();
      return versions;
    } catch (e) {
      return [];
    }
  }

  /// 本地是否已存在指定版本的数据文件。
  Future<bool> hasVersion(String version) async {
    try {
      final root = await _directoryPath();
      final file =
          File(p.join(root, dirName, '${sanitizeVersion(version)}.json'));
      return file.exists();
    } catch (e) {
      return false;
    }
  }

  /// 删除指定版本的本地数据。
  Future<void> delete(String version) async {
    final key = sanitizeVersion(version);
    final store = _stores.remove(key);
    if (store != null) {
      await store.clear();
      return;
    }
    try {
      final root = await _directoryPath();
      final file = File(p.join(root, dirName, '$key.json'));
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // 删除失败静默忽略,与现有 repo 容错风格一致
    }
  }

  /// 便捷构造:元素类型为 [E] 的列表存储。
  static VersionedJsonStore<List<E>> list<E>({
    required String dirName,
    required E Function(Map<String, dynamic> json) fromJsonElement,
    required Object? Function(E element) toJsonElement,
    int schemaVersion = 1,
    Future<String> Function()? directoryPath,
  }) {
    return VersionedJsonStore<List<E>>(
      dirName: dirName,
      fromJson: (json) => (json as List)
          .map((e) => fromJsonElement(e as Map<String, dynamic>))
          .toList(),
      toJson: (value) => value.map(toJsonElement).toList(),
      schemaVersion: schemaVersion,
      directoryPath: directoryPath,
    );
  }
}
