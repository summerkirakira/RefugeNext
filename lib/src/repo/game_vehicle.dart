import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 游戏内载具(GameVehicle)仓库。
///
/// 从 Star Citizen Wiki API `/api/vehicles` 分页拉取游戏内载具数据
/// (含飞船/地面载具/悬浮载具,带护盾、武器、燃料等实测参数),
/// 按游戏版本持久化到本地 `wiki/game_vehicles/<版本码>.json`,
/// 版本管理/切换/更新检测由 [VersionedListRepo] 统一提供。
///
/// 与 Ship Matrix 不同,该端点**支持** `version` 参数,
/// 因此 [refresh] 可指定任意游戏版本补拉历史数据,不限于最新版本。
class GameVehicleRepo extends VersionedListRepo<GameVehicle> {
  static final GameVehicleRepo _instance = GameVehicleRepo._internal();

  GameVehicleRepo._internal()
      : super(
          dirName: 'wiki/game_vehicles',
          versionPrefKey: 'app.game_vehicle.selected_version',
          fromJsonElement: GameVehicle.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory GameVehicleRepo() => _instance;

  static const int _pageSize = 200;

  /// 防御性分页上限,防止 API 异常导致死循环。
  static const int _maxPages = 20;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  // --- 数据访问 ---

  /// 获取当前选中版本的全部载具;本地无数据返回空列表(不触发网络请求)。
  Future<List<GameVehicle>> getVehicles() => getItems();

  List<GameVehicle> getVehiclesSync() => itemsSync;

  GameVehicle? getByUuidSync(String uuid) {
    for (final vehicle in itemsSync) {
      if (vehicle.uuid == uuid) {
        return vehicle;
      }
    }
    return null;
  }

  /// 按显示名称精确查找(忽略大小写)。
  GameVehicle? getByNameSync(String name) {
    final lower = name.toLowerCase();
    for (final vehicle in itemsSync) {
      if (vehicle.name?.toLowerCase() == lower) {
        return vehicle;
      }
    }
    return null;
  }

  /// 按类名(className,如 `AEGS_Gladius`)精确查找(忽略大小写)。
  GameVehicle? getByClassNameSync(String className) {
    final lower = className.toLowerCase();
    for (final vehicle in itemsSync) {
      if (vehicle.className?.toLowerCase() == lower) {
        return vehicle;
      }
    }
    return null;
  }

  /// 按名称模糊搜索(忽略大小写,包含匹配)。
  List<GameVehicle> searchByNameSync(String keyword) {
    final lower = keyword.toLowerCase();
    return itemsSync
        .where((v) =>
            (v.name?.toLowerCase().contains(lower) ?? false) ||
            (v.className?.toLowerCase().contains(lower) ?? false))
        .toList();
  }

  Future<GameVehicle?> getByUuid(String uuid) async {
    await getItems();
    return getByUuidSync(uuid);
  }

  Future<GameVehicle?> getByName(String name) async {
    await getItems();
    return getByNameSync(name);
  }

  // --- 刷新 ---

  /// 从 Wiki API 分页拉取指定游戏版本的全量载具数据,写入本地并切换到该版本。
  ///
  /// [version] 为 null 时拉取服务端默认(最新)版本;
  /// 也可传历史版本码(如 `4.1`)补拉旧版本数据。
  /// 拉取结果为空时不覆盖本地已有数据。
  @override
  Future<void> refresh({String? version}) async {
    final targetVersion =
        version ?? await fetchLatestVersion() ?? 'unknown';

    final api = WikiApiClient().api.getVehiclesApi();
    final all = <GameVehicle>[];
    var page = 1;
    while (page <= _maxPages) {
      final res = await api.listVehicles(
        pageLeftSquareBracketNumberRightSquareBracket: page,
        pageLeftSquareBracketSizeRightSquareBracket: _pageSize,
        version: version,
      );
      final body = res.data;
      final items = body?.data ?? const <GameVehicle>[];
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
}
