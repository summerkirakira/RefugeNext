import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 船只矩阵(Ship Matrix)仓库。
///
/// 从 Star Citizen Wiki API 分页拉取全部 [ShipMatrixVehicle](约 250–300 条),
/// 按游戏版本持久化到本地 `wiki/ship_matrix/<版本码>.json`,
/// 版本管理/切换/更新检测由 [VersionedListRepo] 统一提供。
///
/// 注意:`/api/shipmatrix/vehicles` 端点不支持 version 参数,Ship Matrix
/// 本身是版本无关的营销数据,"按版本存储"即在版本 X 期间拉取的快照存为
/// X 的数据;切换旧版本只能读本地已有快照,无法补拉历史数据。
class ShipMatrixRepo extends VersionedListRepo<ShipMatrixVehicle> {
  static final ShipMatrixRepo _instance = ShipMatrixRepo._internal();

  ShipMatrixRepo._internal()
      : super(
          dirName: 'wiki/ship_matrix',
          versionPrefKey: 'app.ship_matrix.selected_version',
          fromJsonElement: ShipMatrixVehicle.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory ShipMatrixRepo() => _instance;

  static const int _pageSize = 200;

  /// 防御性分页上限,防止 API 异常导致死循环。
  static const int _maxPages = 20;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  // --- 数据访问 ---

  /// 获取当前选中版本的全部船只;本地无数据返回空列表(不触发网络请求)。
  Future<List<ShipMatrixVehicle>> getVehicles() => getItems();

  List<ShipMatrixVehicle> getVehiclesSync() => itemsSync;

  ShipMatrixVehicle? getByIdSync(int id) {
    for (final vehicle in itemsSync) {
      if (vehicle.id == id) {
        return vehicle;
      }
    }
    return null;
  }

  /// 按名称查找(忽略大小写)。
  ShipMatrixVehicle? getByNameSync(String name) {
    final lower = name.toLowerCase();
    for (final vehicle in itemsSync) {
      if (vehicle.name?.toLowerCase() == lower) {
        return vehicle;
      }
    }
    return null;
  }

  /// 按底盘 ID 查找同系列船只(如同底盘的不同涂装/变体)。
  List<ShipMatrixVehicle> getByChassisIdSync(int chassisId) {
    return itemsSync.where((v) => v.chassisId == chassisId).toList();
  }

  Future<ShipMatrixVehicle?> getById(int id) async {
    await getItems();
    return getByIdSync(id);
  }

  Future<ShipMatrixVehicle?> getByName(String name) async {
    await getItems();
    return getByNameSync(name);
  }

  Future<List<ShipMatrixVehicle>> getByChassisId(int chassisId) async {
    await getItems();
    return getByChassisIdSync(chassisId);
  }

  // --- 刷新 ---

  /// 从 Wiki API 分页拉取全量 Ship Matrix,写入当前最新游戏版本对应的
  /// 本地文件,并切换到该版本。拉取结果为空时不覆盖本地已有数据。
  @override
  Future<void> refresh() async {
    final version = await fetchLatestVersion() ?? 'unknown';

    final api = WikiApiClient().api.getShipMatrixApi();
    final all = <ShipMatrixVehicle>[];
    var page = 1;
    while (page <= _maxPages) {
      final res = await api.listShipMatrixVehicles(
        // 显式传 null 压掉 legacy `page` 参数(生成代码默认 1 且总会发送),
        // 服务端会优先 legacy 参数导致 page[number]/page[size] 被忽略
        page: null,
        pageLeftSquareBracketNumberRightSquareBracket: page,
        pageLeftSquareBracketSizeRightSquareBracket: _pageSize,
      );
      final body = res.data;
      final items = body?.data ?? const <ShipMatrixVehicle>[];
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
    await saveAndSelect(version, all);
  }
}
