import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 随身武器(FPS 武器)仓库。
///
/// 走 `getItemsApi().listWeapons(...)`(`/api/weapons`,已按 type=WeaponPersonal
/// 限定,无需再传 filter[type])。元素为完整 [GameItem](含嵌套 `personalWeapon`
/// 字段)。数据落盘于 `wiki/personal_weapons/<版本码>.json`;端点支持 `version`,
/// [refresh] 可指定历史版本补拉。
class PersonalWeaponRepo extends VersionedListRepo<GameItem> {
  static final PersonalWeaponRepo _instance = PersonalWeaponRepo._internal();

  PersonalWeaponRepo._internal()
      : super(
          dirName: 'wiki/personal_weapons',
          versionPrefKey: 'app.personal_weapon.selected_version',
          fromJsonElement: GameItem.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory PersonalWeaponRepo() => _instance;

  static const int _pageSize = 200;

  /// 防御性分页上限,防止 API 异常导致死循环。
  static const int _maxPages = 20;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  /// 从 Wiki API 分页拉取指定游戏版本的全量随身武器数据,写入本地并切换到该版本。
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
      final res = await api.listWeapons(
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

  /// 当前选中版本的全部随身武器;本地无数据返回空列表(不触发网络请求)。
  Future<List<GameItem>> getPersonalWeapons() => getItems();

  GameItem? getByUuidSync(String uuid) {
    for (final w in itemsSync) {
      if (w.uuid == uuid) {
        return w;
      }
    }
    return null;
  }

  /// 已解析的配件物品缓存(按 uuid,跨武器共用,避免重复拉取)。
  static final Map<String, GameItem> _attachCache = {};

  /// 取已解析的配件完整 [GameItem](优先 [_attachCache],未命中再 getItem)。
  /// 供「配件」页点击跳转到配件详情页用。
  Future<GameItem?> resolveAttachment(String uuid) async =>
      _attachCache[uuid] ?? await _fetchItem(uuid);

  /// 单个物品详情(用于解析挂点 `equipped_item_uuid` 指向的配件)。失败返回 null。
  Future<GameItem?> _fetchItem(String identifier) async {
    try {
      final res =
          await WikiApiClient().api.getItemsApi().getItem(identifier: identifier);
      return res.data?.data;
    } catch (e) {
      return null;
    }
  }

  /// 解析武器各挂点的默认配件并写回本地。
  ///
  /// 列表/详情端点的 `equipped_item` 都为 null,但挂点带 `equipped_item_uuid`
  /// (指向默认装上的配件)。本方法按 uuid 拉取配件物品(getItem),把名称/尺寸/制造商
  /// 等注入挂点的 `equipped_item`,再落盘。返回更新后的武器;
  /// 已解析过 / 无默认配件 / 失败时返回 null。
  Future<GameItem?> enrichPorts(GameItem item) async {
    final uuid = item.uuid;
    if (uuid == null) return null;
    final ports = item.ports;
    if (ports == null || ports.isEmpty) return null;
    if (ports.any((p) => p.equippedItem != null)) return null; // 已注入过

    final ids = <String>{
      for (final p in ports)
        if (p.equippedItemUuid != null && p.equippedItem == null)
          p.equippedItemUuid!,
    };
    if (ids.isEmpty) return null; // 该武器无默认配件

    for (final id in ids) {
      if (_attachCache.containsKey(id)) continue;
      final att = await _fetchItem(id);
      if (att != null) _attachCache[id] = att;
    }

    // 重建 ports json,把解析到的配件注入 equipped_item。
    final json = item.toJson();
    final portsJson = (json['ports'] as List?) ?? const [];
    var changed = false;
    for (final pj in portsJson) {
      if (pj is! Map) continue;
      final pid = pj['equipped_item_uuid'];
      if (pid is! String || pj['equipped_item'] != null) continue;
      final att = _attachCache[pid];
      if (att == null) continue;
      pj['equipped_item'] = {
        'uuid': att.uuid,
        'name': att.name,
        'size': att.size,
        'grade': att.grade,
        'type': att.type,
        'sub_type': att.subType,
        if (att.manufacturer != null)
          'manufacturer': att.manufacturer!.toJson(),
      };
      changed = true;
    }
    if (!changed) return null;

    final updated = GameItem.fromJson(json);
    final version = await getSelectedVersion();
    if (version != null) {
      final items = await getItems();
      final i = items.indexWhere((e) => e.uuid == uuid);
      if (i >= 0) {
        await saveAndSelect(version, [...items]..[i] = updated);
      }
    }
    return updated;
  }
}
