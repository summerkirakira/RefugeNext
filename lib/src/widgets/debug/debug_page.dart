import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart'
    show GameVehicle, ShipMatrixVehicle;
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/ship_matrix.dart';
import 'package:refuge_next/src/widgets/debug/vehicle_detail_test_page.dart';
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
      builder: (context) => const VehicleDetailTestPage(),
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
