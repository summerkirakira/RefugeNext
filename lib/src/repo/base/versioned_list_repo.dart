import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'versioned_json_store.dart';

/// 按游戏版本管理的列表型仓库基类。
///
/// 在 [VersionedJsonStore] 之上统一处理各版本化仓库重复的逻辑:
/// 选中版本的持久化(SharedPreferences)、版本切换、本地版本列表、
/// 当前版本数据的内存缓存、更新检测。
///
/// 子类(如 ShipMatrixRepo / GameVehicleRepo)只需:
/// 1. 传入 dirName / versionPrefKey / 元素序列化函数;
/// 2. 实现 [fetchLatestVersion](通常调 WikiApiClient 拿默认游戏版本);
/// 3. 实现 [refresh],拉取数据后调用 [saveAndSelect] 落盘并切换;
/// 4. 按需添加领域查询方法(基于 [itemsSync])。
abstract class VersionedListRepo<E> {
  VersionedListRepo({
    required String dirName,
    required String versionPrefKey,
    required E Function(Map<String, dynamic> json) fromJsonElement,
    required Object? Function(E element) toJsonElement,
    int schemaVersion = 1,
  })  : _versionPrefKey = versionPrefKey,
        _store = VersionedJsonStore.list<E>(
          dirName: dirName,
          fromJsonElement: fromJsonElement,
          toJsonElement: toJsonElement,
          schemaVersion: schemaVersion,
        );

  final VersionedJsonStore<List<E>> _store;
  final String _versionPrefKey;

  /// 当前选中的版本码(净化后)。
  String? _selectedVersion;

  /// 当前选中版本数据的内存缓存。
  List<E> _items = [];

  /// 同步获取当前选中版本的数据(未加载过则为空列表)。
  List<E> get itemsSync => _items;

  // --- 版本管理 ---

  /// 获取当前选中的版本码;
  /// 未选过则回退到本地已有的最新版本(并写入 prefs),本地无数据返回 null。
  Future<String?> getSelectedVersion() async {
    if (_selectedVersion != null) {
      return _selectedVersion;
    }
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_versionPrefKey);
    if (saved != null && await _store.hasVersion(saved)) {
      _selectedVersion = saved;
      return saved;
    }
    final locals = await listLocalVersions();
    if (locals.isEmpty) {
      return null;
    }
    await switchVersion(locals.last);
    return _selectedVersion;
  }

  /// 切换到指定版本并加载该版本数据(仅限本地已有版本,否则抛出 [ArgumentError])。
  Future<void> switchVersion(String version) async {
    final key = VersionedJsonStore.sanitizeVersion(version);
    if (!await _store.hasVersion(key)) {
      throw ArgumentError('本地不存在版本 $version 的数据');
    }
    _selectedVersion = key;
    _items = await _store.read(key) ?? [];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_versionPrefKey, key);
  }

  /// 列出本地已存储的版本码(升序)。
  Future<List<String>> listLocalVersions() => _store.listLocalVersions();

  /// 指定版本数据的最后落盘时间;无数据返回 null。
  Future<DateTime?> lastUpdated(String version) => _store.lastUpdated(version);

  /// 删除指定版本的本地数据。
  Future<void> deleteVersion(String version) => _store.delete(version);

  /// 获取最新可用的版本码(通常来自 Wiki API 的默认游戏版本);失败返回 null。
  Future<String?> fetchLatestVersion();

  /// 检测是否有新版本可刷新:最新版本本地无数据 → true。
  /// UI 可据此提示用户或直接调用 [refresh]。
  Future<bool> checkForUpdate() async {
    final latest = await fetchLatestVersion();
    if (latest == null) {
      return false;
    }
    return !await _store.hasVersion(latest);
  }

  // --- 数据访问 ---

  /// 获取当前选中版本的全部数据;本地无数据返回空列表(不触发网络请求)。
  Future<List<E>> getItems() async {
    if (_items.isNotEmpty) {
      return _items;
    }
    final version = await getSelectedVersion();
    if (version == null) {
      return [];
    }
    _items = await _store.read(version) ?? [];
    return _items;
  }

  // --- 刷新 ---

  /// 从远端拉取全量数据并写入本地;由子类实现,
  /// 拉取成功后应调用 [saveAndSelect]。
  Future<void> refresh();

  /// 将 [items] 写入 [version] 对应的本地文件,并切换到该版本
  /// (含 prefs 持久化)。供子类 [refresh] 实现使用。
  @protected
  Future<void> saveAndSelect(String version, List<E> items) async {
    await _store.write(version, items);
    _selectedVersion = VersionedJsonStore.sanitizeVersion(version);
    _items = items;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_versionPrefKey, _selectedVersion!);
  }
}
