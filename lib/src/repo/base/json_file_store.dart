import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:synchronized/synchronized.dart';

import '../../utils/storage_path.dart';

/// 通用 JSON 本地文件存储。
///
/// 封装各 Repo 重复的样板:文件路径解析、读写、内存缓存、锁、
/// 原子写入(临时文件 + rename)、元数据(schemaVersion / updatedAt)。
/// 通过组合使用:Repo 持有一个 [JsonFileStore] 字段并委托读写,
/// 自身仍保持单例 factory 模式。
///
/// 磁盘格式(信封):
/// ```json
/// {"schemaVersion": 1, "updatedAt": "2026-06-11T12:00:00.000Z", "data": ...}
/// ```
/// 兼容旧格式:文件内容若为裸 List/Map(无信封),直接作为 data 解析,
/// 此时 [lastUpdated] 为 null。
class JsonFileStore<T> {
  JsonFileStore({
    required this.fileName,
    required this.fromJson,
    required this.toJson,
    this.schemaVersion = 1,
    Future<String> Function()? directoryPath,
  }) : _directoryPath = directoryPath ?? StoragePath.getAppDataPath;

  /// 相对存储根目录的文件名,可包含子目录,如 `wiki/ship_matrix/4.2.json`。
  final String fileName;

  /// 从信封内 `data` 字段反序列化为 [T]。
  final T Function(Object? json) fromJson;

  /// 将 [T] 序列化为可 jsonEncode 的对象(写入信封 `data` 字段)。
  final Object? Function(T value) toJson;

  /// 数据结构版本;磁盘上的版本不一致时视为无数据(由上层触发刷新重建)。
  final int schemaVersion;

  /// 存储根目录解析函数,默认 [StoragePath.getAppDataPath];测试时可注入临时目录。
  final Future<String> Function() _directoryPath;

  final Lock _lock = Lock();
  T? _cache;
  DateTime? _updatedAt;

  /// 同步获取内存缓存(尚未加载/写入过则为 null)。
  T? get cached => _cache;

  Future<File> get _file async {
    final dir = await _directoryPath();
    return File(p.join(dir, fileName));
  }

  /// 读取数据:优先内存缓存,其次磁盘;
  /// 文件缺失/解析失败/schemaVersion 不符均返回 null。
  Future<T?> read() {
    return _lock.synchronized(() async {
      if (_cache != null) {
        return _cache;
      }
      return _readFromDisk();
    });
  }

  /// 原子写入磁盘(先写 `.tmp` 再 rename)并更新内存缓存与 updatedAt。
  Future<void> write(T value) {
    return _lock.synchronized(() async {
      final file = await _file;
      await file.parent.create(recursive: true);

      final now = DateTime.now();
      final envelope = <String, dynamic>{
        'schemaVersion': schemaVersion,
        'updatedAt': now.toIso8601String(),
        'data': toJson(value),
      };

      final tmp = File('${file.path}.tmp');
      await tmp.writeAsString(jsonEncode(envelope), flush: true);
      await tmp.rename(file.path);

      _cache = value;
      _updatedAt = now;
    });
  }

  /// 数据最后落盘时间;无数据或旧格式(裸 List/Map)文件返回 null。
  Future<DateTime?> lastUpdated() {
    return _lock.synchronized(() async {
      if (_cache == null) {
        await _readFromDisk();
      }
      return _updatedAt;
    });
  }

  /// 删除本地文件并清空内存缓存。
  Future<void> clear() {
    return _lock.synchronized(() async {
      _cache = null;
      _updatedAt = null;
      try {
        final file = await _file;
        if (await file.exists()) {
          await file.delete();
        }
      } catch (e) {
        // 删除失败不影响内存状态
      }
    });
  }

  /// 从磁盘读取并填充缓存;调用方须已持有 [_lock]。
  Future<T?> _readFromDisk() async {
    try {
      final file = await _file;
      final contents = await file.readAsString();
      final decoded = jsonDecode(contents);

      Object? data;
      DateTime? updatedAt;
      if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
        // 信封格式
        final version = decoded['schemaVersion'];
        if (version is int && version != schemaVersion) {
          return null;
        }
        final updatedAtRaw = decoded['updatedAt'];
        if (updatedAtRaw is String) {
          updatedAt = DateTime.tryParse(updatedAtRaw);
        }
        data = decoded['data'];
      } else {
        // 兼容旧格式:裸 List/Map
        data = decoded;
      }

      final value = fromJson(data);
      _cache = value;
      _updatedAt = updatedAt;
      return value;
    } catch (e) {
      return null;
    }
  }

  /// 便捷构造:元素类型为 [E] 的列表存储。
  static JsonFileStore<List<E>> list<E>({
    required String fileName,
    required E Function(Map<String, dynamic> json) fromJsonElement,
    required Object? Function(E element) toJsonElement,
    int schemaVersion = 1,
    Future<String> Function()? directoryPath,
  }) {
    return JsonFileStore<List<E>>(
      fileName: fileName,
      fromJson: (json) => (json as List)
          .map((e) => fromJsonElement(e as Map<String, dynamic>))
          .toList(),
      toJson: (value) => value.map(toJsonElement).toList(),
      schemaVersion: schemaVersion,
      directoryPath: directoryPath,
    );
  }
}
