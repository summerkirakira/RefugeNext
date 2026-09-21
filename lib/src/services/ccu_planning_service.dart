import 'package:dio/dio.dart';

import '../datasource/models/buyback.dart';
import '../datasource/models/ccu_plan.dart';
import '../datasource/models/hangar.dart';
import '../network/cirno/cirno_api.dart';
import '../network/cirno/property/property.dart';
import 'rsi_session_service.dart';
import '../repo/ship_upgrade.dart';

class CcuQuoteSnapshot {
  const CcuQuoteSnapshot(this.prices, this.offers, this.diagnostics,
      this.complete, this.createdAt);
  final Map<int, int> prices;
  final List<CcuOffer> offers;
  final List<String> diagnostics;
  final bool complete;
  final DateTime createdAt;
}

typedef CcuQuoteLoader = Future<CcuQuoteSnapshot> Function(
    List<ShipAlias>,
    List<BuybackItem>,
    int,
    int,
    bool,
    CancelToken,
    void Function(),
    void Function(String)?);
typedef CcuPlanTransport = Future<CcuPlanResult> Function(
    Map<String, dynamic>, CancelToken);

/// Shared by the planner page and the AI tool. No purchases occur here.
class CcuPlanningService {
  CcuPlanningService(
      {CcuQuoteLoader? quoteLoader,
      CcuPlanTransport? submit,
      Future<ShipUpgradeCatalog> Function(bool refresh)? catalogLoader})
      : _quoteLoader = quoteLoader,
        _submit = submit,
        _catalogLoader = catalogLoader;
  static final instance = CcuPlanningService();
  final CcuQuoteLoader? _quoteLoader;
  final CcuPlanTransport? _submit;
  final Future<ShipUpgradeCatalog> Function(bool refresh)? _catalogLoader;

  Future<CcuPlanResult> plan(
      {required String account,
      required List<ShipAlias> ships,
      required List<HangarItem> hangar,
      required List<BuybackItem> buyback,
      required int fromId,
      required int toId,
      required CcuSettings settings,
      required CancelToken cancelToken,
      List<String> requiredIds = const [],
      List<String> excludedIds = const [],
      List<List<int>> excludedPairs = const [],
      List<CcuSourcePair> excludedSourcePairs = const [],
      bool refresh = false,
      void Function(String)? onProgress}) async {
    final session = RsiSessionService.instance;
    final generation = session.generation;
    void check() {
      session.assertGeneration(generation);
      if (session.account != account) throw RsiSessionChanged();
      if (cancelToken.isCancelled) throw StateError('规划已取消');
    }

    check();
    final localPrices = {
      for (final ship in ships) ship.id: ship.getHighestSku()
    };
    if (!localPrices.containsKey(fromId) || !localPrices.containsKey(toId)) {
      throw StateError('舰船资料尚未加载，请稍后重试');
    }
    final snapshot = _quoteLoader != null
        ? await _quoteLoader(ships, buyback, fromId, toId, settings.useBuyback,
            cancelToken, check, onProgress)
        : await _collect(ships, buyback, fromId, toId, settings.useBuyback,
            check, onProgress,
            refresh: refresh);
    check();
    final owned = settings.useHangar ? hangarOffers(hangar) : <CcuOffer>[];
    final skippedOwned = settings.useHangar
        ? hangar
            .where((e) =>
                e.isUpgrade &&
                (!e.canUpgrade || e.fromShip == null || e.toShip == null))
            .length
        : 0;
    check();
    onProgress?.call('计算升级方案…');
    final payload = <String, dynamic>{
      'from_ship_id': fromId,
      'to_ship_id': toId,
      ...settings.toJson(),
      'ships': snapshot.prices.entries
          .map((e) => {'id': e.key, 'value': e.value})
          .toList(),
      'offers': [...owned, ...snapshot.offers].map((e) => e.toJson()).toList(),
      'required_offer_ids': requiredIds,
      'excluded_offer_ids': excludedIds,
      'excluded_pairs': excludedPairs,
      'excluded_source_pairs':
          excludedSourcePairs.map((e) => e.toJson()).toList(),
      'quotes_complete': snapshot.complete,
      'limit': 3,
    };
    try {
      final response = await (_submit ?? CirnoApiClient().getCcuPlansV3)(
          payload, cancelToken);
      check();
      return CcuPlanResult(
          status: response.status,
          message: response.message,
          plans: response.plans,
          diagnostics: <String>{
            if (skippedOwned > 0) '$skippedOwned 个机库升级缺少舰船信息或不允许应用，未参与规划',
            ...snapshot.diagnostics,
            ...response.diagnostics
          }.toList());
    } on DioException catch (error) {
      check();
      if (error.response?.statusCode == 404 ||
          error.response?.statusCode == 405) {
        throw StateError('服务端尚未支持新版 CCU 规划，请更新服务端后重试');
      }
      rethrow;
    }
  }

  Future<CcuQuoteSnapshot> _collect(
      List<ShipAlias> ships,
      List<BuybackItem> buyback,
      int fromId,
      int toId,
      bool useBuyback,
      void Function() check,
      void Function(String)? progress,
      {required bool refresh}) async {
    final prices = {for (final s in ships) s.id: s.getHighestSku()};
    final diagnostics = <String>[];
    final offers = <CcuOffer>[];
    var complete = true;
    var byLiveId = <int, int>{};
    var loadedAt = DateTime.now();
    try {
      progress?.call('读取商店 CCU 目录…');
      final catalog = await (_catalogLoader?.call(refresh) ??
          ShipUpgradeRepo().planningCatalog(refresh: refresh));
      check();
      loadedAt = catalog.loadedAt;
      if (!catalog.hasUsdNetPrices) {
        throw StateError('商店未提供税前美元价格，请检查登录和商店货币设置');
      }
      final liveShips = catalog.data['ships'];
      if (liveShips is! List || liveShips.isEmpty) {
        throw StateError('商店 CCU 目录为空');
      }
      byLiveId = matchLiveCcuShips(ships, liveShips);
      final livePrices = <int, int>{};
      for (final row in liveShips) {
        final id = byLiveId[row['id']];
        final value = row['msrp'];
        if (id != null && value is int && value > 0) {
          prices[id] = value;
          livePrices[id] = value;
        }
      }
      if (prices.entries.any((e) =>
          e.value >= prices[fromId]! &&
          e.value <= prices[toId]! &&
          !livePrices.containsKey(e.key))) {
        complete = false;
        diagnostics.add('部分舰船无法匹配官网目录，仅使用参考船价');
      }
      final upgradeTargets = catalog.upgradeTargets;
      if (upgradeTargets == null) {
        throw StateError('缺少当前可升级的商店 SKU，无法确认在售版本');
      }
      // 一次请求取得资料和升级界面的筛选结果，仅用后者构建商店升级边。
      offers.addAll(catalogStoreOffers(upgradeTargets, byLiveId, livePrices,
          fromId, toId, prices, loadedAt));
    } catch (error) {
      check();
      complete = false;
      diagnostics.add(
          '商店目录读取失败：${error is StateError ? error.message : '网络或登录状态不可用'}');
    }
    check();
    if (useBuyback) {
      offers.addAll(localBuybackOffers(
          buyback, ships, byLiveId, prices, fromId, toId, diagnostics));
    }
    if (offers
        .any((o) => o.source != 'buyback' && o.availability == 'unknown')) {
      complete = false;
      diagnostics.add('部分商店 SKU 缺少价格或库存信息，仅作为待核实候选');
    }
    return CcuQuoteSnapshot(prices, offers, diagnostics, complete, loadedAt);
  }
}

/// 输入必须是 to(from: null).ships，不能使用初始化 ships 中未筛选的 SKU。
/// SKU.price 是目标船售价；升级差价由目标 SKU 价格减去起点 MSRP。
List<CcuOffer> catalogStoreOffers(
    List<dynamic> upgradeTargets,
    Map<int, int> byLiveId,
    Map<int, int> livePrices,
    int fromId,
    int toId,
    Map<int, int> prices,
    DateTime loadedAt) {
  final offers = <String, CcuOffer>{};
  for (final source in livePrices.entries) {
    if (source.value < prices[fromId]! || source.value >= prices[toId]!) {
      continue;
    }
    for (final row in upgradeTargets) {
      final target = byLiveId[row['id']];
      final targetPrice = livePrices[target];
      if (target == null ||
          targetPrice == null ||
          targetPrice <= source.value ||
          targetPrice > prices[toId]!) {
        continue;
      }
      for (final sku in row['skus'] as List? ?? []) {
        if (sku is! Map || sku['id'] is! int) continue;
        final price = sku['price'];
        final hasPrice = price is int && price > 0;
        // 同价、倒挂以及源船价格达到 WB 价格的情况不能生成可购 CCU。
        if (hasPrice && price <= source.value) continue;
        final title = sku['title'] as String? ?? '';
        final unavailable = sku['available'] == false ||
            (sku['unlimitedStock'] == false &&
                sku['availableStock'] is num &&
                sku['availableStock'] <= 0);
        if (unavailable) continue;
        final available = sku['available'] == true &&
            (sku['unlimitedStock'] == true ||
                (sku['availableStock'] is num && sku['availableStock'] > 0));
        final id = 'store:${source.key}:$target:${sku['id']}';
        offers[id] = CcuOffer(
            id: id,
            fromShipId: source.key,
            toShipId: target,
            source:
                title.toLowerCase().contains('warbond') ? 'store_wb' : 'store',
            cost: hasPrice ? price - source.value : targetPrice - source.value,
            availability: available && hasPrice ? 'verified' : 'unknown',
            quotedAt: loadedAt.millisecondsSinceEpoch ~/ 1000,
            skuId: sku['id'] as int,
            title: title);
      }
    }
  }
  return offers.values.toList();
}

List<CcuOffer> localBuybackOffers(
    List<BuybackItem> items,
    List<ShipAlias> ships,
    Map<int, int> byLiveId,
    Map<int, int> prices,
    int fromId,
    int toId,
    List<String> diagnostics) {
  final byUpgrade = {
    for (final s in ships)
      if (s.upgradeId != null) s.upgradeId!: s.id
  };
  final offers = <String, CcuOffer>{};
  for (final item in items.where((e) => e.isUpgrade)) {
    final from = byUpgrade[item.formShipUpgradeId] ?? byLiveId[item.formShipId];
    final to = byUpgrade[item.toShipUpgradeId] ?? byLiveId[item.toShipId];
    if (from == null || to == null) {
      diagnostics.add('回购 ${item.id} 无法匹配舰船，未参与规划');
      continue;
    }
    if (prices[from]! < prices[fromId]! || prices[to]! > prices[toId]!) {
      continue;
    }
    for (final id in item.idList.isEmpty ? [item.id] : item.idList) {
      offers['buyback:$id'] = CcuOffer(
          id: 'buyback:$id',
          fromShipId: from,
          toShipId: to,
          source: 'buyback',
          cost: item.price > 0 ? item.price : prices[to]! - prices[from]!,
          itemId: id,
          skuId: item.toSkuId,
          title: item.title);
    }
  }
  return offers.values.toList();
}

/// Match by catalog names/explicit aliases only; ambiguous names fail closed.
Map<int, int> matchLiveCcuShips(
    List<ShipAlias> aliases, List<dynamic> liveShips) {
  String normalize(String value) =>
      value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
  final names = <String, Set<int>>{};
  for (final ship in aliases) {
    for (final name in [ship.name, ...ship.alias]) {
      final key = normalize(name);
      if (key.isNotEmpty) (names[key] ??= {}).add(ship.id);
    }
  }
  final matches = <int, int>{};
  for (final row in liveShips) {
    if (row is! Map || row['id'] is! int || row['name'] is! String) continue;
    final ids = names[normalize(row['name'] as String)];
    if (ids?.length == 1) matches[row['id'] as int] = ids!.single;
  }
  final counts = <int, int>{};
  for (final id in matches.values) {
    counts[id] = (counts[id] ?? 0) + 1;
  }
  matches.removeWhere((_, id) => counts[id] != 1);
  return matches;
}

List<CcuOffer> hangarOffers(List<HangarItem> items) {
  final offers = <String, CcuOffer>{};
  for (final item in items.where((e) => e.isUpgrade && e.canUpgrade)) {
    final f = item.fromShip;
    final t = item.toShip;
    if (f == null || t == null) continue;
    for (final id in item.idList.isEmpty ? [item.id] : item.idList) {
      offers['hangar:$id'] = CcuOffer(
          id: 'hangar:$id',
          fromShipId: f.id,
          toShipId: t.id,
          source: 'hangar',
          cost: item.price,
          availability: 'owned',
          itemId: id,
          title: item.name);
    }
  }
  return offers.values.toList();
}
