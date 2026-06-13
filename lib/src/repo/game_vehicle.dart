import '../network/wiki/wiki_api.dart';
import 'base/filtered_repo_view.dart';
import 'base/versioned_list_repo.dart';

/// GameVehicle 通用查询方法。
///
/// 基于 [VersionedItemsRepo] 的数据访问接口实现,
/// 全集仓库 [GameVehicleRepo] 与各过滤视图(地面/悬浮载具)均可混入。
mixin GameVehicleQueries on VersionedItemsRepo<GameVehicle> {
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
}

/// 游戏内载具全集仓库(`/api/vehicles`:飞船 + 地面 + 悬浮载具)。
///
/// 唯一持有存储的载具仓库,数据落盘于 `wiki/game_vehicles/<版本码>.json`;
/// 地面/悬浮载具仓库([GroundVehicleRepo] / [GravlevVehicleRepo])
/// 是它的内存过滤视图,不重复存储、不重复拉取。
///
/// 端点支持 `version` 参数,[refresh] 可指定任意游戏版本补拉历史数据。
class GameVehicleRepo extends VersionedListRepo<GameVehicle>
    with GameVehicleQueries {
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
        // 显式传 null 压掉 legacy `page` 参数(生成代码默认 1 且总会发送),
        // 服务端会优先 legacy 参数导致 page[number]/page[size] 被忽略
        page: null,
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

  /// 模型字段为 final,经 JSON 重建一个替换了 ports 的新实例。
  static GameVehicle _withPorts(
      GameVehicle vehicle, List<GameVehiclePort> ports) {
    final json = vehicle.toJson();
    json['ports'] = ports.map((p) => p.toJson()).toList();
    return GameVehicle.fromJson(json);
  }

  /// 拉取一页全集载具列表(供测试页分页拉取驱动)。
  /// 返回该页数据;[version] 为 null 时取服务端默认版本。
  Future<List<GameVehicle>> fetchPage(int page,
      {int pageSize = _pageSize, String? version}) async {
    final res = await WikiApiClient().api.getVehiclesApi().listVehicles(
          // 见 refresh 中说明:必须压掉 legacy `page` 参数
          page: null,
          pageLeftSquareBracketNumberRightSquareBracket: page,
          pageLeftSquareBracketSizeRightSquareBracket: pageSize,
          version: version,
        );
    return res.data?.data?.toList() ?? <GameVehicle>[];
  }

  /// 将整组数据写入指定版本并切换(供测试页分页拉取完成后保存);
  /// [version] 为 null 时取最新游戏版本码。
  Future<void> saveAll(List<GameVehicle> items, {String? version}) async {
    if (items.isEmpty) {
      return;
    }
    final target = version ?? await fetchLatestVersion() ?? 'unknown';
    await saveAndSelect(target, items);
  }

  /// 单船详情并发数(过高易触发 API 限流)。
  static const int _detailConcurrency = 4;

  /// 为当前选中版本的**所有**载具补全嵌套装载(逐船调用单船端点)。
  ///
  /// 已补全的船自动跳过,中断后重跑可断点续传;单船失败静默保留
  /// 扁平 ports。全部处理完后一次性落盘。约 290 个请求,
  /// 耗时一至数分钟,[onProgress] 回调 (已处理数, 总数) 供 UI 显示进度。
  Future<void> enrichAllPorts(
      {void Function(int done, int total)? onProgress}) async {
    final version = await getSelectedVersion();
    if (version == null) {
      return;
    }
    final items = List<GameVehicle>.of(await getItems());
    if (items.isEmpty) {
      return;
    }
    final api = WikiApiClient().api.getVehiclesApi();
    final total = items.length;
    var done = 0;

    Future<void> enrichOne(int index) async {
      final v = items[index];
      final uuid = v.uuid;
      final hasNested =
          v.ports?.any((p) => p.ports?.isNotEmpty ?? false) ?? false;
      if (uuid != null && !hasNested) {
        try {
          final res =
              await api.getVehicle(identifier: uuid, version: version);
          final ports = res.data?.data?.ports;
          if (ports != null && ports.isNotEmpty) {
            items[index] = _withPorts(v, ports);
          }
        } catch (e) {
          // 单船失败:保留扁平 ports,下次重跑再补
        }
      }
      done++;
      onProgress?.call(done, total);
    }

    for (var i = 0; i < items.length; i += _detailConcurrency) {
      await Future.wait([
        for (var j = i; j < i + _detailConcurrency && j < items.length; j++)
          enrichOne(j),
      ]);
    }

    await saveAndSelect(version, items);
  }

  /// 用单船端点返回的完整 ports(含嵌套装载,如导弹架上的导弹)替换
  /// 当前选中版本中对应载具的 ports 字段,并持久化到本地版本文件。
  ///
  /// 列表端点的 ports 是扁平的(无子槽位),嵌套装载只有
  /// `/api/vehicles/{identifier}` 提供;详情页按需拉取后调本方法写回,
  /// 一次拉取永久生效。注意 [refresh] 全量重拉会用扁平 ports 覆盖
  /// 已补全的数据(下次进详情页会重新补全)。
  ///
  /// 返回更新后的载具实例;本地无该载具或无选中版本返回 null。
  Future<GameVehicle?> updateVehiclePorts(
      String uuid, List<GameVehiclePort> ports) async {
    final version = await getSelectedVersion();
    if (version == null) {
      return null;
    }
    final items = await getItems();
    final index = items.indexWhere((v) => v.uuid == uuid);
    if (index < 0) {
      return null;
    }
    final updated = _withPorts(items[index], ports);
    await saveAndSelect(version, [...items]..[index] = updated);
    return updated;
  }
}

/// 地面载具仓库:[GameVehicleRepo] 全集的内存过滤视图,无独立存储。
///
/// 过滤条件与服务端 `/api/ground-vehicles` 一致:
/// is_vehicle=true 且非悬浮、非飞船。
class GroundVehicleRepo extends FilteredRepoView<GameVehicle>
    with GameVehicleQueries {
  static final GroundVehicleRepo _instance = GroundVehicleRepo._internal();

  GroundVehicleRepo._internal()
      : super(
          source: GameVehicleRepo(),
          predicate: (v) =>
              v.isVehicle == true &&
              v.isGravlev != true &&
              v.isSpaceship != true,
        );

  factory GroundVehicleRepo() => _instance;
}

/// 悬浮载具仓库:[GameVehicleRepo] 全集的内存过滤视图,无独立存储。
///
/// 过滤条件与服务端 `/api/gravlev-vehicles` 一致:is_gravlev=true。
class GravlevVehicleRepo extends FilteredRepoView<GameVehicle>
    with GameVehicleQueries {
  static final GravlevVehicleRepo _instance = GravlevVehicleRepo._internal();

  GravlevVehicleRepo._internal()
      : super(
          source: GameVehicleRepo(),
          predicate: (v) => v.isGravlev == true,
        );

  factory GravlevVehicleRepo() => _instance;
}
