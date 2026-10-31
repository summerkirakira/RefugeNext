import 'dart:async';
import 'package:refuge_next/src/datasource/models/shop/upgrade_ship_info.dart';
import 'package:refuge_next/src/widgets/shop/upgrade_shop/upgrade_controller.dart';

UpgradeShipInfo upgradeShip(int id, String name, int price,
        {bool owned = false}) =>
    UpgradeShipInfo(id: id, name: name, msrp: price, owned: owned)
      ..chineseName = id == 1
          ? '起点舰船'
          : id == 2
              ? '另一艘起点'
              : '目标舰船';

class FakeUpgradeGateway implements UpgradeGateway {
  final sources = [
    upgradeShip(1, 'Origin One', 10000, owned: true),
    upgradeShip(2, 'Other Source', 15000)
  ];
  int surcharge = 17, filters = 0, tokens = 0, applications = 0;
  bool failFilter = false,
      failApply = false,
      failToken = false,
      available = true,
      missingQuote = false;
  Completer<void>? pending;
  @override
  Future<UpgradeOptions> initialize() => filter(null, null);
  @override
  Future<UpgradeOptions> filter(int? fromId, int? skuId) async {
    filters++;
    if (pending != null) await pending!.future;
    if (failFilter) throw StateError('报价加载失败');
    final source =
        fromId == null ? null : sources.firstWhere((s) => s.id == fromId);
    final target = upgradeShip(3, 'Target Ship', 20000)
      ..skus = [
        Skus(
            id: 30,
            title: 'Standard Edition',
            price: 20000,
            upgradePrice: source == null || missingQuote
                ? null
                : 20000 - source.msrp! + surcharge,
            available: available,
            unlimitedStock: true),
        Skus(
            id: 31,
            title: 'Warbond Edition',
            price: 18000,
            upgradePrice: source == null || missingQuote
                ? null
                : 18000 - source.msrp! + surcharge,
            available: available,
            unlimitedStock: true),
      ];
    return UpgradeOptions(sources, [target]);
  }

  @override
  Future<String> createToken(int fromId, int skuId) async {
    tokens++;
    if (failToken) throw StateError('升级凭证未生成');
    return 'test-token';
  }

  @override
  Future<void> applyToken(String token) async {
    applications++;
    if (failApply) throw StateError('无法确认购物车响应');
  }
}

Future<UpgradeController> readyUpgrade(FakeUpgradeGateway gateway) async {
  final c = UpgradeController(gateway);
  await c.load();
  await c.selectTo(c.options!.to.first);
  await c.selectFrom(c.options!.from.first);
  return c;
}
