import 'package:dio/dio.dart';

import '../datasource/data_model.dart';
import '../datasource/models/ccu_plan.dart';
import '../services/ccu_planning_service.dart';
import 'ship_alias.dart';
import 'translation.dart';

/// AI 与页面共用商店 CCU 目录及 V3 计算，机库和回购使用现有数据。
class CcuPlanner {
  CcuPlanner(this._model);
  final MainDataModel _model;

  Future<Map<String, dynamic>> planUpgrade(Map<String, dynamic> args) async {
    final fromId = int.tryParse('${args['from_ship_id']}');
    final toId = int.tryParse('${args['to_ship_id']}');
    final account = _model.currentUser?.handle;
    if (account == null) return {'ok': false, 'error': '请先登录 RSI 账号'};
    final ships = (await ShipAliasRepo().getShipAliases())
        .where((e) => e.upgradeId != null && e.getHighestSku() > 0)
        .toList();
    final ids = ships.map((e) => e.id).toSet();
    if (!ids.contains(fromId) || !ids.contains(toId)) {
      return {
        'ok': false,
        'error': 'ship_not_found',
        'from_found': ids.contains(fromId),
        'to_found': ids.contains(toId)
      };
    }
    final settings = CcuSettings(
        objective: args['objective'] == 'total' ? 'total' : 'additional',
        useHistory: args['use_history'] == true);
    final result = await CcuPlanningService.instance.plan(
        account: account,
        ships: ships,
        hangar: _model.rawHangarItems,
        buyback: _model.rawBuybackItems,
        fromId: fromId!,
        toId: toId!,
        settings: settings,
        cancelToken: CancelToken());
    if (result.plans.isEmpty) {
      return {
        'ok': false,
        'error': result.status,
        'message': result.message,
        'diagnostics': result.diagnostics
      };
    }
    String name(int id) {
      final ship = ships.firstWhere((s) => s.id == id);
      return ship.chineseName ??
          TranslationRepo().getTranslationSync(ship.name);
    }

    Map<String, dynamic> shape(CcuPlan plan) => {
          ...plan.toJson(),
          'from': name(fromId),
          'to': name(toId),
          'total_cost_usd': (plan.totalCost / 100).toStringAsFixed(2),
          'additional_cost_usd': (plan.additionalCost / 100).toStringAsFixed(2),
          'owned_cost_usd': (plan.ownedCost / 100).toStringAsFixed(2),
          'steps': plan.steps
              .map((s) => {
                    ...s.toJson(),
                    'from': name(s.fromShipId),
                    'to': name(s.toShipId),
                    'source_label': s.sourceLabel,
                    'cost_usd': (s.cost / 100).toStringAsFixed(2)
                  })
              .toList(),
        };
    return {
      'ok': true,
      ...shape(result.plans.first),
      'objective': settings.objective,
      'plans': result.plans.map(shape).toList(),
      'diagnostics': result.diagnostics,
      'cost_basis':
          'USD，税前升级链成本，不含起始舰船；机库部分为账面成本，回购使用本地参考价。waiting 方案包含等待或待核实步骤。'
    };
  }
}
