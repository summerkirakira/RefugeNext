import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 舰船护盾仓库（`/api/vehicle-items` 中 type=Shield 的物品）。
///
/// 数据落盘于 `wiki/shields/<版本码>.json`；元素为完整 [GameItem]
/// （含嵌套 `shield` 字段及顶层 name/manufacturer/uuid 等元数据）。
/// 端点支持 `version` 参数，[refresh] 可指定历史版本补拉旧数据。
class ShieldRepo extends VersionedListRepo<GameItem> {
  static final ShieldRepo _instance = ShieldRepo._internal();

  ShieldRepo._internal()
      : super(
          dirName: 'wiki/shields',
          versionPrefKey: 'app.shield.selected_version',
          fromJsonElement: GameItem.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory ShieldRepo() => _instance;

  static const int _pageSize = 200;

  /// 防御性分页上限,防止 API 异常导致死循环。
  static const int _maxPages = 20;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  /// 从 Wiki API 分页拉取指定游戏版本的全量护盾数据,写入本地并切换到该版本。
  ///
  /// [version] 为 null 时拉取服务端默认(最新)版本;
  /// 也可传历史版本码补拉旧版本数据。拉取结果为空时不覆盖本地已有数据。
  @override
  Future<void> refresh({String? version}) async {
    final targetVersion = version ?? await fetchLatestVersion() ?? 'unknown';

    final api = WikiApiClient().api.getItemsApi();
    final all = <GameItem>[];
    var page = 1;
    while (page <= _maxPages) {
      final res = await api.listVehicleItems(
        // 显式传 null 压掉 legacy `page` 参数(见 GameVehicleRepo 说明)
        page: null,
        pageLeftSquareBracketNumberRightSquareBracket: page,
        pageLeftSquareBracketSizeRightSquareBracket: _pageSize,
        filterLeftSquareBracketTypeRightSquareBracket: 'Shield',
        version: version,
      );
      final body = res.data;
      final items = body?.data ?? const <GameItem>[];
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

  /// 当前选中版本的全部护盾;本地无数据返回空列表(不触发网络请求)。
  Future<List<GameItem>> getShields() => getItems();

  GameItem? getByUuidSync(String uuid) {
    for (final s in itemsSync) {
      if (s.uuid == uuid) {
        return s;
      }
    }
    return null;
  }
}
