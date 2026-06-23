import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/cooler.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/personal_weapon.dart';
import 'package:refuge_next/src/repo/power_plant.dart';
import 'package:refuge_next/src/repo/quantum_drive.dart';
import 'package:refuge_next/src/repo/shield.dart';
import 'package:refuge_next/src/repo/vehicle_weapon.dart';
import 'package:refuge_next/src/repo/weapon_attachment.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/cooler_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart'
    show gameItemDisplayName;
import 'package:refuge_next/src/widgets/ship_info_neo/personal_weapon_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/power_plant_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/quantum_drive_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/shield_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_detail_page.dart'
    show vehicleDisplayName;
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_weapon_info_card.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/weapon_attachment_info_card.dart';

/// 一条可搜索条目:中文名 + 英文名(预存小写用于匹配)+ 卡片构建器。
class _Entry {
  _Entry(String cn, String en, this.cardBuilder)
      : cnLower = cn.toLowerCase(),
        enLower = en.toLowerCase();
  final String cnLower;
  final String enLower;
  final WidgetBuilder cardBuilder;

  bool matches(String q) => cnLower.contains(q) || enLower.contains(q);
}

/// 数据库全局搜索:跨所有类别(本地已下载数据),按中/英文名匹配。
class DatabaseSearchPage extends StatefulWidget {
  const DatabaseSearchPage({super.key});

  @override
  State<DatabaseSearchPage> createState() => _DatabaseSearchPageState();
}

class _DatabaseSearchPageState extends State<DatabaseSearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<_Entry> _entries = const [];
  bool _loading = true;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final results = await Future.wait([
        GameVehicleRepo().getVehicles(),
        VehicleWeaponRepo().getVehicleWeapons(),
        PersonalWeaponRepo().getPersonalWeapons(),
        WeaponAttachmentRepo().getWeaponAttachments(),
        ShieldRepo().getShields(),
        CoolerRepo().getCoolers(),
        PowerPlantRepo().getPowerPlants(),
        QuantumDriveRepo().getQuantumDrives(),
      ]);
      final entries = <_Entry>[];

      // 载具(GameVehicle)
      for (final v in results[0] as List<GameVehicle>) {
        entries.add(_Entry(vehicleDisplayName(v), v.name ?? '',
            (_) => VehicleInfoCard(vehicle: v)));
      }
      // 其余各类别(GameItem)→ 对应卡片
      void addItems(List<GameItem> items, Widget Function(GameItem) card) {
        for (final it in items) {
          entries.add(_Entry(
              gameItemDisplayName(it), it.name ?? '', (_) => card(it)));
        }
      }

      addItems(results[1] as List<GameItem>,
          (it) => VehicleWeaponInfoCard(item: it));
      addItems(results[2] as List<GameItem>,
          (it) => PersonalWeaponInfoCard(item: it));
      addItems(results[3] as List<GameItem>,
          (it) => WeaponAttachmentInfoCard(item: it));
      addItems(results[4] as List<GameItem>, (it) => ShieldInfoCard(item: it));
      addItems(results[5] as List<GameItem>, (it) => CoolerInfoCard(item: it));
      addItems(
          results[6] as List<GameItem>, (it) => PowerPlantInfoCard(item: it));
      addItems(results[7] as List<GameItem>,
          (it) => QuantumDriveInfoCard(item: it));

      if (!mounted) return;
      setState(() {
        _entries = entries;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          controller: _controller,
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: '搜索物品(中 / 英文名)',
            border: InputBorder.none,
            suffixIcon: _query.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                      setState(() => _query = '');
                    },
                  ),
          ),
          onChanged: (v) => setState(() => _query = v.trim().toLowerCase()),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_query.isEmpty) {
      return const Center(
        child: Text('输入关键词搜索', style: TextStyle(color: Colors.grey)),
      );
    }
    final results = _entries.where((e) => e.matches(_query)).toList();
    if (results.isEmpty) {
      return const Center(
        child: Text('无匹配结果', style: TextStyle(color: Colors.grey)),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('${results.length} 个结果',
                style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
            itemCount: results.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) => results[index].cardBuilder(context),
          ),
        ),
      ],
    );
  }
}
