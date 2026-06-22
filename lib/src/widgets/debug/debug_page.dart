import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart'
    show
        GameVehicle,
        ShipMatrixVehicle,
        GameItem,
        Blueprint,
        MissionIndex,
        GameStarmapLocation;
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/ship_matrix.dart';
import 'package:refuge_next/src/repo/shield.dart';
import 'package:refuge_next/src/repo/quantum_drive.dart';
import 'package:refuge_next/src/repo/power_plant.dart';
import 'package:refuge_next/src/repo/cooler.dart';
import 'package:refuge_next/src/repo/personal_weapon.dart';
import 'package:refuge_next/src/repo/weapon_attachment.dart';
import 'package:refuge_next/src/repo/blueprint.dart';
import 'package:refuge_next/src/repo/mission.dart';
import 'package:refuge_next/src/repo/location.dart';
import 'package:refuge_next/src/widgets/debug/vehicle_card_test_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/shield_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/quantum_drive_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/power_plant_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/cooler_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/personal_weapon_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/weapon_attachment_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/mission_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/location_detail_page.dart';
import 'package:refuge_next/src/widgets/debug/versioned_repo_test_page.dart';

/// 通用开发测试中心。
///
/// 汇集各功能模块的调试/测试子页面入口,新增测试项时往 [_entries]
/// 里加一条 [DebugEntry] 即可。版本化仓库直接复用
/// [VersionedRepoTestPage],只需提供 repo 与条目展示 builder。
/// 仅作开发调试用,后续可整体移除或隐藏。
class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  /// GameVehicle 类条目的统一展示(全部/地面/悬浮载具共用)。
  static Widget _gameVehicleTile(BuildContext context, GameVehicle vehicle) {
    return ListTile(
      dense: true,
      title: Text(vehicle.name ?? vehicle.className ?? '未知'),
      subtitle: Text(
        '${vehicle.manufacturer?.name ?? ''} · '
        '${vehicle.className ?? ''}',
      ),
      trailing: vehicle.cargoCapacity != null
          ? Text('${vehicle.cargoCapacity} SCU')
          : null,
    );
  }

  static final List<DebugEntry> _entries = [
    DebugEntry(
      icon: Icons.rocket_launch_outlined,
      title: 'Ship Matrix',
      subtitle: '官网船只矩阵:拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<ShipMatrixVehicle>(
        title: 'Ship Matrix',
        repo: ShipMatrixRepo(),
        itemBuilder: (context, vehicle) => ListTile(
          dense: true,
          leading: Text('${vehicle.id ?? '-'}'),
          title: Text(vehicle.name ?? '未知'),
          subtitle: Text(
            '${vehicle.manufacturer?.name ?? ''} · '
            '${vehicle.productionStatus?.zhCN ?? vehicle.productionStatus?.enEN ?? ''}',
          ),
          trailing: vehicle.msrp != null
              ? Text('\$${vehicle.msrp!.toStringAsFixed(0)}')
              : null,
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.rocket_outlined,
      title: 'Game Vehicle',
      subtitle: '全部游戏内载具实测数据:拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<GameVehicle>(
        title: 'Game Vehicle',
        repo: GameVehicleRepo(),
        itemBuilder: _gameVehicleTile,
        // 「拉取全量船」:由测试页驱动分页拉取并整组保存
        fetchPage: (page) => GameVehicleRepo().fetchPage(page),
        saveItems: (items) => GameVehicleRepo().saveAll(items),
      ),
    ),
    DebugEntry(
      icon: Icons.directions_car_outlined,
      title: 'Ground Vehicle',
      subtitle: '地面载具:Game Vehicle 全集的内存过滤视图(共享存储)',
      builder: (context) => VersionedRepoTestPage<GameVehicle>(
        title: 'Ground Vehicle',
        repo: GroundVehicleRepo(),
        itemBuilder: _gameVehicleTile,
      ),
    ),
    DebugEntry(
      icon: Icons.two_wheeler_outlined,
      title: 'Gravlev Vehicle',
      subtitle: '悬浮载具:Game Vehicle 全集的内存过滤视图(共享存储)',
      builder: (context) => VersionedRepoTestPage<GameVehicle>(
        title: 'Gravlev Vehicle',
        repo: GravlevVehicleRepo(),
        itemBuilder: _gameVehicleTile,
      ),
    ),
    DebugEntry(
      icon: Icons.info_outline,
      title: '载具详情',
      subtitle: '仿 wiki 网页的单船详情(本地数据,可搜索舰船名)',
      builder: (context) => const VehicleDetailPage(),
    ),
    DebugEntry(
      icon: Icons.style_outlined,
      title: 'AI 舰船卡片',
      subtitle: '敲定 show_item_card 的卡片样式',
      builder: (context) => const VehicleCardTestPage(),
    ),
    DebugEntry(
      icon: Icons.verified_user_outlined,
      title: '护盾详情',
      subtitle: '仿 wiki 的单护盾详情(本地数据,可切换护盾)',
      builder: (context) => const ShieldDetailPage(),
    ),
    DebugEntry(
      icon: Icons.shield_outlined,
      title: 'Shield',
      subtitle: '舰船护盾组件:拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<GameItem>(
        title: 'Shield',
        repo: ShieldRepo(),
        itemBuilder: (context, item) => ListTile(
          dense: true,
          title: Text(item.name ?? item.className ?? '未知'),
          subtitle: Text(
            '${item.manufacturer?.name ?? ''} · S${item.size ?? '-'} · '
            'HP ${item.shield?.maxHealth?.toStringAsFixed(0) ?? '-'}',
          ),
          trailing: item.shield?.regenRate != null
              ? Text('${item.shield!.regenRate!.toStringAsFixed(0)}/s')
              : null,
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.bolt_outlined,
      title: '量子引擎详情',
      subtitle: '仿 wiki 的单量子引擎详情(本地数据,可切换)',
      builder: (context) => const QuantumDriveDetailPage(),
    ),
    DebugEntry(
      icon: Icons.rocket_launch_outlined,
      title: 'Quantum Drive',
      subtitle: '量子引擎组件:拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<GameItem>(
        title: 'Quantum Drive',
        repo: QuantumDriveRepo(),
        itemBuilder: (context, item) => ListTile(
          dense: true,
          title: Text(item.name ?? item.className ?? '未知'),
          subtitle: Text(
            '${item.manufacturer?.name ?? ''} · S${item.size ?? '-'} · '
            '跳跃 ${item.quantumDrive?.jumpRangeFormatted ?? '-'}',
          ),
          trailing: item.quantumDrive?.fuelRate != null
              ? Text('${item.quantumDrive!.fuelRate!.toStringAsFixed(0)}/s')
              : null,
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.electric_bolt_outlined,
      title: '发电机详情',
      subtitle: '仿 wiki 的单发电机详情(本地数据,可切换)',
      builder: (context) => const PowerPlantDetailPage(),
    ),
    DebugEntry(
      icon: Icons.ac_unit_outlined,
      title: '冷却器详情',
      subtitle: '仿 wiki 的单冷却器详情(本地数据,可切换)',
      builder: (context) => const CoolerDetailPage(),
    ),
    DebugEntry(
      icon: Icons.gps_fixed,
      title: 'FPS武器详情',
      subtitle: '仿 wiki 的单武器详情(本地数据,可切换)',
      builder: (context) => const PersonalWeaponDetailPage(),
    ),
    DebugEntry(
      icon: Icons.build_circle_outlined,
      title: '武器配件详情',
      subtitle: '仿 wiki 的单配件详情(本地数据,可切换)',
      builder: (context) => const AttachmentDetailPage(),
    ),
    DebugEntry(
      icon: Icons.assignment_outlined,
      title: '任务详情',
      subtitle: '仿 wiki 的单任务详情(本地+自动拉详情,可切换)',
      builder: (context) => const MissionDetailPage(),
    ),
    DebugEntry(
      icon: Icons.place_outlined,
      title: '地点详情',
      subtitle: '仿 wiki 的单地点详情(本地数据,可切换)',
      builder: (context) => const LocationDetailPage(),
    ),
    DebugEntry(
      icon: Icons.power_outlined,
      title: 'Power Plant',
      subtitle: '发电机组件:拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<GameItem>(
        title: 'Power Plant',
        repo: PowerPlantRepo(),
        itemBuilder: (context, item) => ListTile(
          dense: true,
          title: Text(item.name ?? item.className ?? '未知'),
          subtitle: Text(
            '${item.manufacturer?.name ?? ''} · S${item.size ?? '-'} · '
            '输出 ${item.powerPlant?.powerOutput?.toStringAsFixed(0) ?? '-'}',
          ),
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.ac_unit_outlined,
      title: 'Cooler',
      subtitle: '冷却器组件:拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<GameItem>(
        title: 'Cooler',
        repo: CoolerRepo(),
        itemBuilder: (context, item) => ListTile(
          dense: true,
          title: Text(item.name ?? item.className ?? '未知'),
          subtitle: Text(
            '${item.manufacturer?.name ?? ''} · S${item.size ?? '-'} · '
            '制冷 ${item.cooler?.coolingRate?.toStringAsFixed(0) ?? '-'}',
          ),
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.gps_fixed,
      title: 'Personal Weapon',
      subtitle: '随身武器(FPS):拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<GameItem>(
        title: 'Personal Weapon',
        repo: PersonalWeaponRepo(),
        itemBuilder: (context, item) => ListTile(
          dense: true,
          title: Text(item.name ?? item.className ?? '未知'),
          subtitle: Text(
            '${item.manufacturer?.name ?? ''} · ${item.personalWeapon?.type ?? ''}'
            '${item.personalWeapon?.rpm != null ? ' · ${item.personalWeapon!.rpm!.toStringAsFixed(0)} rpm' : ''}',
          ),
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.build_circle_outlined,
      title: 'Weapon Attachment',
      subtitle: '武器配件(不含弹匣/导弹):拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<GameItem>(
        title: 'Weapon Attachment',
        repo: WeaponAttachmentRepo(),
        itemBuilder: (context, item) => ListTile(
          dense: true,
          title: Text(item.name ?? item.className ?? '未知'),
          subtitle: Text(
            '${item.manufacturer?.name ?? ''} · S${item.size ?? '-'}'
            '${item.subType != null ? ' · ${item.subTypeLabel ?? item.subType}' : ''}',
          ),
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.description_outlined,
      title: 'Blueprint',
      subtitle: '蓝图(制造配方):拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<Blueprint>(
        title: 'Blueprint',
        repo: BlueprintRepo(),
        itemBuilder: (context, bp) => ListTile(
          dense: true,
          title: Text(bp.outputName ?? bp.key ?? '未知'),
          subtitle: Text(
            '${bp.outputClass ?? ''} · 原料 ${bp.ingredientCount ?? '-'} · '
            '${bp.craftTimeLabel ?? ''}',
          ),
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.assignment_outlined,
      title: 'Mission',
      subtitle: '任务:拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<MissionIndex>(
        title: 'Mission',
        repo: MissionRepo(),
        itemBuilder: (context, m) => ListTile(
          dense: true,
          title: Text(m.title ?? m.debugName ?? '未知'),
          subtitle: Text(
            '${m.missionGiver ?? ''}'
            '${m.rewardMax != null ? ' · ${m.rewardMax} ${m.rewardCurrency ?? ''}' : ''}'
            '${m.hasBlueprints == true ? ' · 含蓝图' : ''}',
          ),
        ),
      ),
    ),
    DebugEntry(
      icon: Icons.place_outlined,
      title: 'Location',
      subtitle: '地点:拉取/按游戏版本存储/切换/读取',
      builder: (context) => VersionedRepoTestPage<GameStarmapLocation>(
        title: 'Location',
        repo: LocationRepo(),
        itemBuilder: (context, l) => ListTile(
          dense: true,
          title: Text(l.name ?? l.designation ?? '未知'),
          subtitle: Text(
            '${l.type?.name ?? ''}'
            '${l.system != null ? ' · ${l.system}' : ''}'
            '${(l.missionCount ?? 0) > 0 ? ' · 任务 ${l.missionCount}' : ''}',
          ),
        ),
      ),
    ),
    // 在此追加新的测试入口。
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('测试中心')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _entries.length,
        itemBuilder: (context, index) {
          final entry = _entries[index];
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 1,
              ),
            ),
            child: ListTile(
              leading: Icon(entry.icon, color: Theme.of(context).primaryColor),
              title: Text(
                entry.title,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                entry.subtitle,
                style: const TextStyle(fontSize: 12),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: entry.builder),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// 测试中心的一个入口项。
class DebugEntry {
  final IconData icon;
  final String title;
  final String subtitle;
  final WidgetBuilder builder;

  DebugEntry({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.builder,
  });
}
