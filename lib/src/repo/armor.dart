import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 护甲(FPS 角色护甲)仓库。
///
/// 走 `getItemsApi().listArmor(...)`(`/api/armor`,已按 FPS.Armor.* 分类限定,
/// 无需再传 filter)。元素为完整 [GameItem](含嵌套 `armor` 字段)。数据落盘于
/// `wiki/armor/<版本码>.json`;端点支持 `version`,[refresh] 可指定历史版本补拉。
class ArmorRepo extends VersionedListRepo<GameItem> {
  static final ArmorRepo _instance = ArmorRepo._internal();

  ArmorRepo._internal()
      : super(
          dirName: 'wiki/armor',
          versionPrefKey: 'app.armor.selected_version',
          fromJsonElement: GameItem.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory ArmorRepo() => _instance;

  static const int _pageSize = 200;

  /// 防御性分页上限,防止 API 异常导致死循环。
  static const int _maxPages = 20;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  /// 从 Wiki API 分页拉取指定游戏版本的全量护甲数据,写入本地并切换到该版本。
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
      final res = await api.listArmor(
        // 显式传 null 压掉 legacy `page` 参数(见 GameVehicleRepo 说明)
        page: null,
        pageLeftSquareBracketNumberRightSquareBracket: page,
        pageLeftSquareBracketSizeRightSquareBracket: _pageSize,
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

  /// 当前选中版本的全部护甲;本地无数据返回空列表(不触发网络请求)。
  Future<List<GameItem>> getArmors() => getItems();

  GameItem? getByUuidSync(String uuid) {
    for (final a in itemsSync) {
      if (a.uuid == uuid) {
        return a;
      }
    }
    return null;
  }
}
