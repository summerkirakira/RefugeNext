import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/ship_info.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_info_card.dart';

/// AI 舰船卡片样式测试页:渲染 [VehicleInfoCard] 列表用于敲定外观。
/// 数据来自本地 GameVehicleRepo,点击卡片跳载具详情页。
class VehicleCardTestPage extends StatefulWidget {
  const VehicleCardTestPage({super.key});

  @override
  State<VehicleCardTestPage> createState() => _VehicleCardTestPageState();
}

class _VehicleCardTestPageState extends State<VehicleCardTestPage> {
  List<GameVehicle> _all = [];
  String _query = '';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.wait([
      GameVehicleRepo().getVehicles(),
      ShipInfoRepo().getShips(),
    ]).then((results) {
      if (!mounted) return;
      setState(() {
        _all = results[0] as List<GameVehicle>;
        _loading = false;
      });
    });
  }

  List<GameVehicle> get _filtered {
    if (_query.isEmpty) return _all;
    final lower = _query.toLowerCase();
    return _all
        .where((v) =>
            (v.name?.toLowerCase().contains(lower) ?? false) ||
            (v.className?.toLowerCase().contains(lower) ?? false))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI 舰船卡片')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: '搜索舰船名 / 类名',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _all.isEmpty
                    ? const Center(
                        child: Text('本地暂无数据,请先在 Game Vehicle 测试页拉取'))
                    : ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: _filtered.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 4),
                        itemBuilder: (context, index) => Align(
                          alignment: Alignment.centerLeft,
                          // 卡片最大宽度 600px
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: VehicleInfoCard(vehicle: _filtered[index]),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
