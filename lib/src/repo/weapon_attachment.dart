import '../network/wiki/wiki_api.dart';
import 'base/versioned_list_repo.dart';

/// 武器配件仓库。
///
/// 走 `getItemsApi().listWeaponAttachments(...)`(`/api/weapon-attachments`,已按
/// type=WeaponAttachment 限定,**不含弹匣/导弹**,无需 filter[type])。元素为
/// `GameItem`。数据落盘于 `wiki/weapon_attachments/<版本码>.json`;端点支持 `version`,
/// [refresh] 可指定历史版本补拉。
class WeaponAttachmentRepo extends VersionedListRepo<GameItem> {
  static final WeaponAttachmentRepo _instance =
      WeaponAttachmentRepo._internal();

  WeaponAttachmentRepo._internal()
      : super(
          dirName: 'wiki/weapon_attachments',
          versionPrefKey: 'app.weapon_attachment.selected_version',
          fromJsonElement: GameItem.fromJson,
          toJsonElement: (e) => e.toJson(),
        );

  factory WeaponAttachmentRepo() => _instance;

  static const int _pageSize = 200;

  /// 防御性分页上限,防止 API 异常导致死循环。
  static const int _maxPages = 20;

  @override
  Future<String?> fetchLatestVersion() =>
      WikiApiClient().getDefaultGameVersionCode();

  /// 从 Wiki API 分页拉取指定游戏版本的全量武器配件数据,写入本地并切换到该版本。
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
      final res = await api.listWeaponAttachments(
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

  /// 当前选中版本的全部武器配件;本地无数据返回空列表(不触发网络请求)。
  Future<List<GameItem>> getWeaponAttachments() => getItems();

  GameItem? getByUuidSync(String uuid) {
    for (final a in itemsSync) {
      if (a.uuid == uuid) {
        return a;
      }
    }
    return null;
  }
}
