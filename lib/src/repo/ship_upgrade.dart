import 'package:flutter/foundation.dart';

import '../datasource/models/shop/upgrade_ship_info.dart';
import '../network/api_service.dart';
import '../network/graphql/init_ship_upgrade.dart';
import '../network/graphql/filtered_ship_upgrade.dart';
import 'ship_alias.dart';

class ShipUpgradeCatalog {
  const ShipUpgradeCatalog(this.data, this.loadedAt);
  final Map<String, dynamic> data;
  final DateTime loadedAt;

  /// 与升级界面的 filterShips 一致；初始化 ships 中的 SKU 不代表当前可升级。
  /// 空列表是有效的停售结果，缺失或格式错误则不能作为商店报价依据。
  List<dynamic>? get upgradeTargets {
    final to = data['to'];
    final ships = to is Map ? to['ships'] : null;
    if (ships is! List ||
        ships.any((ship) =>
            ship is! Map || ship['id'] is! int || ship['skus'] is! List)) {
      return null;
    }
    return ships;
  }

  bool get hasUsdNetPrices {
    final app = data['app'];
    return app is Map &&
        app['isAnonymous'] == false &&
        app['pricing'] is Map &&
        app['pricing']['currencyCode'] == 'USD' &&
        app['pricing']['isTaxInclusive'] == false;
  }
}

class ShipUpgradeRepo {
  static final ShipUpgradeRepo _instance = ShipUpgradeRepo._internal();

  ShipUpgradeRepo._internal();

  factory ShipUpgradeRepo() => _instance;

  final RsiApiClient rsiApiClient = RsiApiClient();

  List<UpgradeShipInfo> _shipUpgrade = [];
  ShipUpgradeCatalog? _planningCatalog;

  /// 共用升级界面的目录，不建立账号/路径维度的报价缓存。
  Future<ShipUpgradeCatalog> planningCatalog({bool refresh = false}) async {
    final catalog = _planningCatalog;
    if (refresh ||
        catalog == null ||
        catalog.upgradeTargets == null ||
        DateTime.now().difference(catalog.loadedAt) >=
            const Duration(minutes: 5)) {
      await initShipUpgrade();
    }
    return _planningCatalog ?? (throw StateError('商店 CCU 目录尚未加载'));
  }

  Future<List<UpgradeShipInfo>> initShipUpgrade() async {
    final generation = rsiApiClient.session.generation;
    await rsiApiClient.setAuthToken();
    await rsiApiClient.setContextToken();

    final query = InitShipUpgrade();
    final response = await query.execute();
    rsiApiClient.session.assertGeneration(generation);
    if (response == null) {
      throw StateError('无法读取商店 CCU 目录');
    }
    // 保存基础目录；每次筛选返回独立的舰船与 SKU 快照。
    _planningCatalog = ShipUpgradeCatalog(query.catalogData!, DateTime.now());
    _shipUpgrade = response;
    return response;
  }

  List<UpgradeShipInfo> modifyShipInfo(List<UpgradeShipInfo> ships) {
    final shipAliasRepo = ShipAliasRepo();
    for (final ship in ships) {
      ship.shipAlias = shipAliasRepo.getShipAliasSync(ship.name!);
    }

    ships.sort((a, b) {
      if (a.shipAlias != null && b.shipAlias != null) {
        return -a.shipAlias!
            .getHighestSku()
            .compareTo(b.shipAlias!.getHighestSku());
      }
      return 0;
    });

    return ships;
  }

  Future<List<List<UpgradeShipInfo>>> filterShipUpgrade(
      int? fromId, int? toId) async {
    final generation = rsiApiClient.session.generation;
    final response =
        await FilterUpgradeShip(fromId: fromId, toId: toId).execute();
    rsiApiClient.session.assertGeneration(generation);

    List<int> fromIds = [];
    List<int> toIds = [];

    if (response.data!.from != null) {
      fromIds = response.data!.from!.ships!.map((e) => e.id!).toList();
    }
    toIds = response.data!.to!.ships!.map((e) => e.id!).toList();

    final toSkus = response.data!.to!.ships!.map((e) => e.skus!).toList();

    List<UpgradeShipInfo> fromShips = getShipsByIds(fromIds, null);
    List<UpgradeShipInfo> toShips = getShipsByIds(toIds, toSkus);

    return [modifyShipInfo(fromShips), modifyShipInfo(toShips)];
  }

  List<UpgradeShipInfo> getShipsByIds(
      List<int> idList, List<List<Skus>>? toSkus) {
    final upgradeMap = {for (var ship in _shipUpgrade) ship.id: ship};
    final ships = <UpgradeShipInfo>[];
    for (var i = 0; i < idList.length; i++) {
      final source = upgradeMap[idList[i]];
      if (source == null) {
        debugPrint('Ship with ID ${idList[i]} not found in upgrade catalog.');
        continue;
      }
      // Do not mutate the shared catalog or match SKU arrays after dropping IDs.
      final ship = UpgradeShipInfo.fromJson(source.toJson());
      if (toSkus != null) {
        ship.skus =
            toSkus[i].map((sku) => Skus.fromJson(sku.toJson())).toList();
      }
      ships.add(ship);
    }
    return ships;
  }

  List<UpgradeShipInfo> get shipUpgrade => _shipUpgrade;
}
