import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 地点仓库。
///
/// 走 `getStarmapApi().listLocations(...)`,元素为 [GameStarmapLocation]
/// (含管辖/归属/设施/资源/层级/关联任务等)。数据落盘于
/// `wiki/locations/<版本码>.json`;端点支持 `version`,[refresh] 可指定历史版本补拉。
class LocationRepo extends VersionedListRepo<GameStarmapLocation> {
  static final LocationRepo _instance = LocationRepo._internal();

  LocationRepo._internal()
      : super(
          dirName: 'wiki/locations',
          versionPrefKey: 'app.location.selected_version',
          fromJsonElement: GameStarmapLocation.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory LocationRepo() => _instance;

  static const int _pageSize = 200;

  /// 地点较多,放宽防御性分页上限(正常仍靠 meta.lastPage 收尾)。
  static const int _maxPages = 100;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  /// 从 Wiki API 分页拉取指定游戏版本的全量地点数据,写入本地并切换到该版本。
  ///
  /// [version] 为 null 时拉取服务端默认(最新)版本;
  /// 也可传历史版本码补拉旧版本数据。拉取结果为空时不覆盖本地已有数据。
  @override
  Future<void> refresh({String? version}) async {
    final targetVersion = version ?? await fetchLatestVersion() ?? 'unknown';

    final api = WikiApiClient().api.getStarmapApi();
    final all = <GameStarmapLocation>[];
    var page = 1;
    while (page <= _maxPages) {
      final res = await api.listLocations(
        // 显式传 null 压掉 legacy `page` 参数(见 GameVehicleRepo 说明)
        page: null,
        pageLeftSquareBracketNumberRightSquareBracket: page,
        pageLeftSquareBracketSizeRightSquareBracket: _pageSize,
        version: version,
      );
      final body = res.data;
      final items = body?.data ?? const <GameStarmapLocation>[];
      all.addAll(items);

      final lastPage = body?.meta?.lastPage;
      if (items.isEmpty ||
          items.length < _pageSize ||
          (lastPage != null && page >= lastPage)) {
        break;
      }
      page++;
    }

    if (all.isEmpty) {
      return;
    }
    await saveAndSelect(targetVersion, all);
  }

  /// 当前选中版本的全部地点;本地无数据返回空列表(不触发网络请求)。
  Future<List<GameStarmapLocation>> getLocations() => getItems();

  GameStarmapLocation? getByUuidSync(String uuid) {
    for (final l in itemsSync) {
      if (l.uuid == uuid) {
        return l;
      }
    }
    return null;
  }
}
