import 'base/versioned_list_repo.dart';
import 'blueprint.dart';
import 'cooler.dart';
import 'game_vehicle.dart';
import 'location.dart';
import 'mission.dart';
import 'personal_weapon.dart';
import 'power_plant.dart';
import 'quantum_drive.dart';
import 'shield.dart';
import 'vehicle_weapon.dart';
import 'weapon_attachment.dart';

/// 一个可统一刷新的 wiki 数据集条目。
///
/// 把「显示名 + 版本化仓库 + 版本感知刷新」三者绑在一起,作为
/// [WikiDataSync] 和数据管理面板的单一数据源。新增一类 wiki 数据时,
/// 只需在 [kWikiDatasets] 里追加一行。
class WikiDataset {
  /// 面板/角标上显示的中文名(载具/蓝图/任务/护甲/地点…)。
  final String name;

  /// 底层版本化仓库,用于查状态:`listLocalVersions()` / `getSelectedVersion()`。
  final VersionedItemsRepo repo;

  /// 版本感知刷新(各仓库 `refresh({String? version})` 的 tear-off)。
  ///
  /// 不直接用 [repo] 的 `refresh()` 是因为基类接口的 `refresh()` 不带
  /// version 参数(为兼容 `ShipMatrixRepo` 等无版本语义的实现),这里显式
  /// 绑定到子类带 version 的方法。
  final Future<void> Function({String? version}) refresh;

  const WikiDataset({
    required this.name,
    required this.repo,
    required this.refresh,
  });
}

/// 全部可统一「下载缺失/有更新」的 wiki 数据集(单一数据源)。
///
/// 仅收录继承 [VersionedListRepo] 且 `refresh({String? version})` 签名一致的
/// 版本化仓库。刻意排除:
/// - `ShipMatrixRepo`(RSI 舰船矩阵,`refresh()` 无 version 参数,版本语义不同);
/// - `ShipAliasRepo`(非版本化仓库,自带 int 版本号);
/// - `GroundVehicleRepo` / `GravlevVehicleRepo`(`GameVehicleRepo` 的过滤视图,无独立存储)。
final List<WikiDataset> kWikiDatasets = [
  WikiDataset(name: '载具', repo: GameVehicleRepo(), refresh: GameVehicleRepo().refresh),
  WikiDataset(name: '载具武器', repo: VehicleWeaponRepo(), refresh: VehicleWeaponRepo().refresh),
  WikiDataset(name: '个人武器', repo: PersonalWeaponRepo(), refresh: PersonalWeaponRepo().refresh),
  WikiDataset(name: '配件', repo: WeaponAttachmentRepo(), refresh: WeaponAttachmentRepo().refresh),
  WikiDataset(name: '护盾', repo: ShieldRepo(), refresh: ShieldRepo().refresh),
  WikiDataset(name: '冷却器', repo: CoolerRepo(), refresh: CoolerRepo().refresh),
  WikiDataset(name: '发电机', repo: PowerPlantRepo(), refresh: PowerPlantRepo().refresh),
  WikiDataset(name: '量子引擎', repo: QuantumDriveRepo(), refresh: QuantumDriveRepo().refresh),
  // 护甲(Armor)暂不纳入下载。
  WikiDataset(name: '蓝图', repo: BlueprintRepo(), refresh: BlueprintRepo().refresh),
  WikiDataset(name: '任务', repo: MissionRepo(), refresh: MissionRepo().refresh),
  WikiDataset(name: '地点', repo: LocationRepo(), refresh: LocationRepo().refresh),
];
