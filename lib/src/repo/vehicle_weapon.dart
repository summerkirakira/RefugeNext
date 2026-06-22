import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 载具武器(舰船武器)仓库。
///
/// 走 `getItemsApi().listVehicleWeapons(...)`(`/api/vehicle-weapons`,已按
/// type=WeaponGun 限定,无需再传 filter[type])。元素为完整 [GameItem](含嵌套
/// `vehicleWeapon` 字段)。数据落盘于 `wiki/vehicle_weapons/<版本码>.json`;
/// 端点支持 `version`,[refresh] 可指定历史版本补拉。
class VehicleWeaponRepo extends VersionedListRepo<GameItem> {
  static final VehicleWeaponRepo _instance = VehicleWeaponRepo._internal();

  VehicleWeaponRepo._internal()
      : super(
          dirName: 'wiki/vehicle_weapons',
          versionPrefKey: 'app.vehicle_weapon.selected_version',
          fromJsonElement: GameItem.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory VehicleWeaponRepo() => _instance;

  static const int _pageSize = 200;

  /// 防御性分页上限,防止 API 异常导致死循环。
  static const int _maxPages = 20;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  /// 从 Wiki API 分页拉取指定游戏版本的全量载具武器数据,写入本地并切换到该版本。
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
      final res = await api.listVehicleWeapons(
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

  /// 当前选中版本的全部载具武器;本地无数据返回空列表(不触发网络请求)。
  Future<List<GameItem>> getVehicleWeapons() => getItems();

  GameItem? getByUuidSync(String uuid) {
    for (final w in itemsSync) {
      if (w.uuid == uuid) {
        return w;
      }
    }
    return null;
  }
}
