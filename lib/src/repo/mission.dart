import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 任务仓库。
///
/// 走 `getMissionsApi().listMissions(...)`,元素为 [MissionIndex]
/// (列表端点返回的较轻索引模型;完整 `Mission` 需 `getMission` 单查)。
/// 数据落盘于 `wiki/missions/<版本码>.json`;端点支持 `version`,
/// [refresh] 可指定历史版本补拉旧数据。
class MissionRepo extends VersionedListRepo<MissionIndex> {
  static final MissionRepo _instance = MissionRepo._internal();

  MissionRepo._internal()
      : super(
          dirName: 'wiki/missions',
          versionPrefKey: 'app.mission.selected_version',
          fromJsonElement: MissionIndex.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory MissionRepo() => _instance;

  static const int _pageSize = 200;

  /// 任务较多,放宽防御性分页上限(正常仍靠 meta.lastPage 收尾)。
  static const int _maxPages = 100;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  /// 从 Wiki API 分页拉取指定游戏版本的全量任务数据,写入本地并切换到该版本。
  ///
  /// [version] 为 null 时拉取服务端默认(最新)版本;
  /// 也可传历史版本码补拉旧版本数据。拉取结果为空时不覆盖本地已有数据。
  @override
  Future<void> refresh({String? version}) async {
    final targetVersion = version ?? await fetchLatestVersion() ?? 'unknown';

    final api = WikiApiClient().api.getMissionsApi();
    final all = <MissionIndex>[];
    var page = 1;
    while (page <= _maxPages) {
      final res = await api.listMissions(
        // 显式传 null 压掉 legacy `page` 参数(见 GameVehicleRepo 说明)
        page: null,
        pageLeftSquareBracketNumberRightSquareBracket: page,
        pageLeftSquareBracketSizeRightSquareBracket: _pageSize,
        version: version,
      );
      final body = res.data;
      final items = body?.data ?? const <MissionIndex>[];
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

  /// 当前选中版本的全部任务;本地无数据返回空列表(不触发网络请求)。
  Future<List<MissionIndex>> getMissions() => getItems();

  MissionIndex? getByUuidSync(String uuid) {
    for (final m in itemsSync) {
      if (m.uuid == uuid) {
        return m;
      }
    }
    return null;
  }

  /// 按内部 debug_name 精确匹配(解锁任务等只带 debug_name 的场景)。
  MissionIndex? findByDebugNameSync(String debugName) {
    for (final m in itemsSync) {
      if (m.debugName == debugName) return m;
    }
    return null;
  }

  /// 按显示名匹配(debug_name 未命中时兜底)。
  MissionIndex? findByTitleSync(String title) {
    for (final m in itemsSync) {
      if (m.title == title) return m;
    }
    return null;
  }

  /// 拉取单个任务的**完整详情**(`/api/missions/{identifier}` → 完整 [Mission])。
  ///
  /// 列表端点返回的是较轻的 [MissionIndex],奖励物品/地点明细/冷却时限/战斗 spawns
  /// 等完整字段需调本方法。失败返回 null。
  Future<Mission?> fetchDetail(String identifier, {String? version}) async {
    try {
      final res = await WikiApiClient()
          .api
          .getMissionsApi()
          .getMission(mission: identifier, version: version);
      return res.data?.data;
    } catch (e) {
      return null;
    }
  }
}
