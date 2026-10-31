import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/shop/upgrade_ship_info.dart';
import 'package:refuge_next/src/datasource/models/shop/filtered_ship_upgrade.dart';
import 'package:refuge_next/src/repo/ship_upgrade.dart';
import 'package:refuge_next/src/widgets/shop/upgrade_shop/upgrade_controller.dart';
import 'helpers/upgrade_fixtures.dart';

void main() {
  test(
      'Warbond preference selects the actual Warbond SKU, including a single version',
      () async {
    final c = UpgradeController(FakeUpgradeGateway());
    await c.load();
    final target = c.options!.to.first;
    await c.selectTo(target, preferWarbond: true);
    expect(c.sku!.id, 31);
    target.skus = target.skus!.where((s) => s.isWarbond).toList();
    expect(target.skus!.single.isWarbond, isTrue);
    await c.selectTo(target);
    expect(c.sku!.id, 31);
    c.dispose();
  });
  test('target-first and source-first use server quote, not local subtraction',
      () async {
    for (final targetFirst in [true, false]) {
      final gateway = FakeUpgradeGateway();
      final c = UpgradeController(gateway);
      await c.load();
      if (targetFirst) {
        await c.selectTo(c.options!.to.first);
        expect(c.canAdd, isFalse);
        await c.selectFrom(c.options!.from.first);
      } else {
        await c.selectFrom(c.options!.from.first);
        await c.selectTo(c.options!.to.first);
      }
      expect(c.canAdd, isTrue);
      expect(c.sku!.upgradePrice, 10017);
      expect(gateway.filters, 3);
      c.dispose();
    }
  });
  test('changing version and origin updates quote without changing target',
      () async {
    final c = await readyUpgrade(FakeUpgradeGateway());
    await c.selectSku(c.to!.skus!.last);
    expect(c.sku!.isWarbond, isTrue);
    expect(c.sku!.upgradePrice, 8017);
    await c.selectFrom(c.options!.from.last);
    expect(c.sku!.upgradePrice, 3017);
    expect(c.to!.id, 3);
    await c.selectFrom(null);
    expect(c.canAdd, isFalse);
    expect(c.to!.id, 3);
    expect(c.sku!.upgradePrice, isNull);
    c.dispose();
  });
  test(
      'failed choice preserves selections but disables stale quote until retry',
      () async {
    final gateway = FakeUpgradeGateway();
    final c = await readyUpgrade(gateway);
    gateway.failFilter = true;
    await c.selectFrom(c.options!.from.last);
    expect(c.from!.id, 1);
    expect(c.to!.id, 3);
    expect(c.error, isNotNull);
    expect(c.canAdd, isFalse);
    gateway.failFilter = false;
    await c.refreshQuote();
    expect(c.canAdd, isTrue);
    c.dispose();
  });
  test('updated price requires a second explicit add without creating a token',
      () async {
    final gateway = FakeUpgradeGateway();
    final c = await readyUpgrade(gateway);
    gateway.surcharge = 100;
    expect(await c.add(), isFalse);
    expect(gateway.tokens, 0);
    expect(c.sku!.upgradePrice, 10100);
    expect(c.notice, contains('报价已更新'));
    expect(await c.add(), isTrue);
    expect(gateway.applications, 1);
    expect(await c.add(), isFalse);
    expect(gateway.applications, 1);
    c.dispose();
  });
  test('unavailable or missing server quote never submits a purchase',
      () async {
    for (final missing in [true, false]) {
      final gateway = FakeUpgradeGateway();
      final c = await readyUpgrade(gateway);
      gateway.missingQuote = missing;
      gateway.available = missing;
      expect(await c.add(), isFalse);
      expect(c.canAdd, isFalse);
      expect(gateway.tokens, 0);
      c.dispose();
    }
  });
  test('uncertain cart application blocks replay and retains choices',
      () async {
    final gateway = FakeUpgradeGateway();
    final c = await readyUpgrade(gateway);
    gateway.failApply = true;
    expect(await c.add(), isFalse);
    expect(c.needsCartReview, isTrue);
    expect(c.from!.id, 1);
    expect(await c.add(), isFalse);
    expect(gateway.applications, 1);
    c.dispose();
  });
  test('token creation failure allows explicit retry without applying token',
      () async {
    final gateway = FakeUpgradeGateway();
    final c = await readyUpgrade(gateway);
    gateway.failToken = true;
    expect(await c.add(), isFalse);
    expect(c.needsCartReview, isFalse);
    expect(gateway.applications, 0);
    gateway.failToken = false;
    expect(await c.add(), isTrue);
    c.dispose();
  });
  test('double tap and changing selection during add cannot submit twice',
      () async {
    final gateway = FakeUpgradeGateway();
    final c = await readyUpgrade(gateway);
    final gate = Completer<void>();
    gateway.pending = gate;
    final adding = c.add();
    expect(await c.add(), isFalse);
    await c.selectFrom(c.options!.from.last);
    expect(c.from!.id, 1);
    gate.complete();
    expect(await adding, isTrue);
    expect(gateway.tokens, 1);
    expect(gateway.applications, 1);
    c.dispose();
  });
  test('disposing during read does not send a mutation', () async {
    final gateway = FakeUpgradeGateway();
    final c = await readyUpgrade(gateway);
    final gate = Completer<void>();
    gateway.pending = gate;
    final adding = c.add();
    c.dispose();
    gate.complete();
    expect(await adding, isFalse);
    expect(gateway.tokens, 0);
  });
  test('featured records and upgrade price survive response parsing', () {
    final response = FilteredShipResponse.fromJson({
      'data': {
        'from': {'ships': []},
        'to': {
          'featured': [
            {'reason': 'sale', 'shipId': 3}
          ],
          'ships': [
            {
              'id': 3,
              'skus': [
                {'id': 31, 'title': 'Warbond Edition', 'upgradePrice': 8017}
              ]
            }
          ]
        }
      }
    });
    expect(response.data!.to!.featured!.first['shipId'], 3);
    expect(response.data!.to!.ships!.first.skus!.first.upgradePrice, 8017);
  });
  test(
      'missing catalog ship never shifts SKUs onto the next ship or mutates catalog',
      () {
    final repo = ShipUpgradeRepo();
    final previous = repo.shipUpgrade.toList();
    repo.shipUpgrade
      ..clear()
      ..add(upgradeShip(3, 'Target', 20000));
    try {
      final ships = repo.getShipsByIds([
        999,
        3
      ], [
        [Skus(id: 999)],
        [Skus(id: 30)]
      ]);
      expect(ships.single.id, 3);
      expect(ships.single.skus!.single.id, 30);
      expect(repo.shipUpgrade.single.skus, isNull);
      ships.single.name = 'changed';
      expect(repo.shipUpgrade.single.name, 'Target');
    } finally {
      repo.shipUpgrade
        ..clear()
        ..addAll(previous);
    }
  });
}
