import 'versioned_list_repo.dart';

/// 版本化仓库的内存过滤视图。
///
/// 不持有独立存储:版本管理与刷新全部委托给 [source](共享其本地文件、
/// 选中版本与内存缓存),仅在读取数据时按 [predicate] 过滤。
/// 适用于「源仓库是全集、视图是子集」的场景,
/// 如 GroundVehicleRepo / GravlevVehicleRepo 之于 GameVehicleRepo。
///
/// 注意:因共享同一份底层状态,通过视图 [switchVersion] / [refresh]
/// 会同时影响源仓库及其它视图(反之亦然)。
class FilteredRepoView<E> implements VersionedItemsRepo<E> {
  FilteredRepoView({
    required this.source,
    required this.predicate,
  });

  /// 持有真实存储的源仓库。
  final VersionedItemsRepo<E> source;

  /// 过滤谓词:返回 true 的条目对本视图可见。
  final bool Function(E item) predicate;

  @override
  List<E> get itemsSync => source.itemsSync.where(predicate).toList();

  @override
  Future<List<E>> getItems() async =>
      (await source.getItems()).where(predicate).toList();

  @override
  Future<String?> getSelectedVersion() => source.getSelectedVersion();

  @override
  Future<void> switchVersion(String version) => source.switchVersion(version);

  @override
  Future<List<String>> listLocalVersions() => source.listLocalVersions();

  @override
  Future<DateTime?> lastUpdated(String version) => source.lastUpdated(version);

  @override
  Future<void> deleteVersion(String version) => source.deleteVersion(version);

  @override
  Future<String?> fetchLatestVersion() => source.fetchLatestVersion();

  @override
  Future<bool> checkForUpdate() => source.checkForUpdate();

  @override
  Future<void> refresh() => source.refresh();
}
