import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 蓝图(制造配方)仓库。
///
/// 走专用端点 `getBlueprintsApi().listBlueprints(...)`,元素为 [Blueprint]
/// (独立实体,非 GameItem)。数据落盘于 `wiki/blueprints/<版本码>.json`;
/// 端点支持 `version` 参数,[refresh] 可指定历史版本补拉旧数据。
class BlueprintRepo extends VersionedListRepo<Blueprint> {
  static final BlueprintRepo _instance = BlueprintRepo._internal();

  BlueprintRepo._internal()
      : super(
          dirName: 'wiki/blueprints',
          versionPrefKey: 'app.blueprint.selected_version',
          fromJsonElement: Blueprint.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory BlueprintRepo() => _instance;

  static const int _pageSize = 200;

  /// 蓝图较多,放宽防御性分页上限(正常仍靠 meta.lastPage 收尾)。
  static const int _maxPages = 100;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  /// 从 Wiki API 分页拉取指定游戏版本的全量蓝图数据,写入本地并切换到该版本。
  ///
  /// [version] 为 null 时拉取服务端默认(最新)版本;
  /// 也可传历史版本码补拉旧版本数据。拉取结果为空时不覆盖本地已有数据。
  @override
  Future<void> refresh({String? version}) async {
    final targetVersion = version ?? await fetchLatestVersion() ?? 'unknown';

    final api = WikiApiClient().api.getBlueprintsApi();
    final all = <Blueprint>[];
    var page = 1;
    while (page <= _maxPages) {
      final res = await api.listBlueprints(
        // 显式传 null 压掉 legacy `page` 参数(见 GameVehicleRepo 说明)
        page: null,
        pageLeftSquareBracketNumberRightSquareBracket: page,
        pageLeftSquareBracketSizeRightSquareBracket: _pageSize,
        version: version,
      );
      final body = res.data;
      final items = body?.data ?? const <Blueprint>[];
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

  /// 当前选中版本的全部蓝图;本地无数据返回空列表(不触发网络请求)。
  Future<List<Blueprint>> getBlueprints() => getItems();

  Blueprint? getByUuidSync(String uuid) {
    for (final b in itemsSync) {
      if (b.uuid == uuid) {
        return b;
      }
    }
    return null;
  }

  /// 按产物物品 UUID 查找蓝图(取首个匹配;同一物品可能有多条配方)。
  Blueprint? findByOutputItemUuidSync(String uuid) {
    for (final b in itemsSync) {
      if (b.outputItemUuid == uuid) {
        return b;
      }
    }
    return null;
  }

  /// 拉取单个蓝图的**详情**(`/api/blueprints/{identifier}`)。
  ///
  /// 列表端点不返回 `unlockingMissions` / `requirementGroups` / `tiers` 等
  /// (spec 标注 "Only included on blueprint detail responses"),需要这些字段时
  /// 按 uuid/key 调本方法补拉。失败返回 null。
  Future<Blueprint?> fetchDetail(String identifier, {String? version}) async {
    try {
      final res = await WikiApiClient()
          .api
          .getBlueprintsApi()
          .getBlueprint(blueprint: identifier, version: version);
      return res.data?.data;
    } catch (e) {
      return null;
    }
  }
}
