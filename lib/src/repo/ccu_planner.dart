import '../datasource/data_model.dart';
import '../network/cirno/property/property.dart' show ShipAlias;
import '../widgets/hangar/ccu_optimizor/utils.dart'
    show UpgradeSettings, getValidateUpdateShips, updateUpgradeSteps;
import 'ship_alias.dart';

/// 把前端 CCU 规划（updateUpgradeSteps）封装成 AI 工具可调用的形式：
/// 传入起点/终点 ShipAlias.id（由服务端 RAG 按船名解析得到），返回结构化升级路径。
/// 寻路在服务端；客户端只构建配置、转换结果。用机库 + 回购 CCU，不用历史 WB。
class CcuPlanner {
  final MainDataModel _model;

  CcuPlanner(this._model);

  Future<Map<String, dynamic>> planUpgrade(Map<String, dynamic> args) async {
    final fromId = _asInt(args['from_ship_id'], -1);
    final toId = _asInt(args['to_ship_id'], -1);

    // 确保 ShipAlias 已加载（getValidateUpdateShips 是同步读取）。
    await ShipAliasRepo().getShipAliases();
    final ships = getValidateUpdateShips();

    final from = _shipById(ships, fromId);
    final to = _shipById(ships, toId);
    if (from == null || to == null) {
      return {
        'ok': false,
        'error': 'ship_not_found',
        'from_found': from != null,
        'to_found': to != null,
      };
    }

    if (from.getHighestSku() >= to.getHighestSku()) {
      return {'ok': false, 'error': '目标舰船价格必须高于起始舰船'};
    }

    final settings =
        UpgradeSettings(useHangar: true, useBuyback: true, useHistory: false);
    final steps = await updateUpgradeSteps(
      settings,
      from.id,
      to.id,
      _model.rawHangarItems,
      _model.rawBuybackItems,
      const [],
      const [],
    );

    if (steps.isEmpty) {
      return {'ok': false, 'error': 'no_path_found'};
    }

    final total = steps.fold<int>(0, (sum, e) => sum + e.cost);
    return {
      'ok': true,
      'from': from.chineseName ?? from.name,
      'to': to.chineseName ?? to.name,
      'total_cost_usd': (total / 100).toStringAsFixed(2),
      'steps': steps
          .map((s) => {
                'from': s.fromProduct,
                'to': s.toProduct,
                'cost_usd': (s.cost / 100).toStringAsFixed(2),
                'source': s.tags.isNotEmpty ? s.tags.first : '常规升级',
              })
          .toList(),
    };
  }
}

ShipAlias? _shipById(List<ShipAlias> ships, int id) {
  if (id < 0) return null;
  for (final ship in ships) {
    if (ship.id == id) return ship;
  }
  return null;
}

int _asInt(Object? v, int fallback) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? fallback;
  return fallback;
}
