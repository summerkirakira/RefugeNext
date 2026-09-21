import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:refuge_next/src/datasource/models/ccu_plan.dart';
import 'package:refuge_next/src/network/cirno/property/property.dart';
import 'package:refuge_next/src/repo/ccu_plan_storage.dart';
import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/services/ccu_planning_service.dart';
import 'package:refuge_next/src/services/rsi_session_service.dart';
import 'package:refuge_next/src/repo/ship_upgrade.dart';
import 'package:refuge_next/src/datasource/models/buyback.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/ccu_optimizor_page.dart';

const step = CcuOffer(
    id: 'store:1:2:8',
    fromShipId: 1,
    toShipId: 2,
    source: 'store_wb',
    cost: 1255,
    availability: 'verified',
    quotedAt: 1800000000,
    skuId: 8);
const plan = CcuPlan(
    scenario: 'current',
    steps: [step],
    ownedCost: 0,
    additionalCost: 1255,
    totalCost: 1255,
    regularCost: 3000,
    savings: 1745,
    pendingSteps: 0);

void main() {
  test('live catalog IDs do not collide with legacy upgrade IDs', () {
    final ships = [
      ShipAlias(
          id: 1, name: 'Aurora Mk I ES', alias: [], skus: [], upgradeId: 285),
      ShipAlias(
          id: 2,
          name: 'F7C-S Hornet Ghost Mk II',
          alias: [],
          skus: [],
          upgradeId: 999),
      ShipAlias(id: 3, name: 'Ambiguous', alias: ['Shared'], skus: []),
      ShipAlias(id: 4, name: 'Other', alias: ['Shared'], skus: []),
    ];
    expect(
        matchLiveCcuShips(ships, [
          {'id': 1, 'name': 'Aurora Mk I ES'},
          {'id': 285, 'name': 'F7C-S Hornet Ghost Mk II'},
          {'id': 999, 'name': 'Unknown'},
          {'id': 10, 'name': 'Shared'},
        ]),
        {1: 1, 285: 2});
    expect(
        matchLiveCcuShips(ships, [
          {'id': 1, 'name': 'Aurora Mk I ES'},
          {'id': 2, 'name': 'Aurora Mk I ES'},
        ]),
        isEmpty);
  });
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('saved slots and preferences are separated by account', () async {
    final storage = CcuPlanStorage();
    await storage.save(
        'Alice',
        0,
        const SavedCcuPlan(
            fromId: 1,
            toId: 2,
            settings: CcuSettings(objective: 'total'),
            plan: plan,
            excludedSourcePairs: [
              CcuSourcePair(fromShipId: 1, toShipId: 2, source: 'hangar'),
            ],
            requiredIds: [
              'store:1:2:8'
            ]));
    expect(await storage.load('Bob', 0), isNull);
    final saved = (await storage.load('Alice', 0))!;
    expect(saved.settings.objective, 'total');
    expect(saved.plan.steps.single.skuId, 8);
    expect(saved.plan.creditEligibleCost, 0);
    expect(saved.plan.cashOnlyCost, 1255);
    expect(saved.requiredIds, ['store:1:2:8']);
    expect(saved.excludedSourcePairs,
        [const CcuSourcePair(fromShipId: 1, toShipId: 2, source: 'hangar')]);
    final oldJson = saved.toJson()..remove('excluded_source_pairs');
    expect(SavedCcuPlan.fromJson(oldJson).excludedSourcePairs, isEmpty);
    await storage.saveSettings('Alice', const CcuSettings(useHangar: false));
    expect((await storage.settings('Alice')).useHangar, isFalse);
    expect((await storage.settings('Bob')).useHangar, isTrue);
  });

  test('response roundtrip retains the exact selected offer and cents', () {
    final response = CcuPlanResult.fromJson({
      'status': 'ok',
      'plans': [plan.toJson()]
    });
    expect(response.plans.single.steps.single.id, step.id);
    expect(response.plans.single.additionalCost, 1255);
    expect(ccuMoney(1255), '\$12.55');
    expect(step.freshAt(DateTime.fromMillisecondsSinceEpoch(1800000301 * 1000)),
        isFalse);
  });

  test('payment split includes estimates and classifies WB by source', () {
    final steps = [
      for (final (source, cost) in [
        ('hangar', 1111),
        ('store', 1255),
        ('buyback', 2490),
        ('standard', 3350),
        ('store_wb', 1495),
        ('history_wb', 505),
      ])
        CcuOffer(
            id: source,
            fromShipId: 1,
            toShipId: 2,
            source: source,
            cost: cost,
            title: 'Warbond Edition'),
    ];
    final mixed = CcuPlan(
        scenario: 'waiting',
        steps: steps,
        ownedCost: 1111,
        additionalCost: 9095,
        totalCost: 10206,
        regularCost: 12000,
        savings: 1794,
        pendingSteps: 3);
    for (final value in [mixed, CcuPlan.fromJson(mixed.toJson())]) {
      expect(value.creditEligibleCost, 7095);
      expect(value.cashOnlyCost, 2000);
      expect(
          value.creditEligibleCost + value.cashOnlyCost, value.additionalCost);
    }
    expect(mixed.toJson().containsKey('credit_eligible_cost'), isFalse);
    expect(mixed.toJson().containsKey('cash_only_cost'), isFalse);
  });

  test('owned and zero-cost upgrades add no purchase budget', () {
    final free = CcuPlan(
        scenario: 'current',
        steps: [
          const CcuOffer(
              id: 'owned',
              fromShipId: 1,
              toShipId: 2,
              source: 'hangar',
              cost: 500),
          const CcuOffer(
              id: 'free',
              fromShipId: 2,
              toShipId: 3,
              source: 'store_wb',
              cost: 0),
        ],
        ownedCost: 500,
        additionalCost: 0,
        totalCost: 500,
        regularCost: 1000,
        savings: 500,
        pendingSteps: 0);
    expect(free.creditEligibleCost, 0);
    expect(free.cashOnlyCost, 0);
  });

  testWidgets('cost summary separates money already owned from money to buy',
      (tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: CcuCostSummary(plan: plan))));
    expect(find.text('补入金额'), findsOneWidget);
    expect(find.text('\$12.55'), findsWidgets);
    expect(find.text('机库已有'), findsOneWidget);
    expect(find.text('\$0.00'), findsNWidgets(2));
    expect(find.text('可用信用点'), findsOneWidget);
    expect(find.text('仅现金'), findsOneWidget);
    expect(find.textContaining('成本说明'), findsNothing);
  });

  final ships = [
    ShipAlias(
        id: 1,
        name: 'A',
        alias: [],
        skus: [Sku(title: '', price: 1000)],
        upgradeId: 10),
    ShipAlias(
        id: 2,
        name: 'B',
        alias: [],
        skus: [Sku(title: '', price: 4000)],
        upgradeId: 20)
  ];
  final catalogRows = [
    {'id': 101, 'name': 'A', 'msrp': 1000, 'skus': []},
    {
      'id': 202,
      'name': 'B',
      'msrp': 4000,
      'skus': [
        {
          'id': 8,
          'title': 'Standard',
          'price': 4000,
          'available': true,
          'unlimitedStock': true
        },
        {
          'id': 9,
          'title': 'Warbond',
          'price': 3000,
          'available': true,
          'unlimitedStock': true
        },
        {
          'id': 10,
          'title': 'Unknown price',
          'available': true,
          'unlimitedStock': true
        },
        {
          'id': 11,
          'price': 3500,
          'available': false,
          'unlimitedStock': false,
          'availableStock': 0
        },
      ]
    },
  ];
  ShipUpgradeCatalog catalog(
          {String currency = 'USD',
          bool anonymous = false,
          List<dynamic>? targets,
          bool includeTargets = true}) =>
      ShipUpgradeCatalog({
        'ships': catalogRows,
        if (includeTargets) 'to': {'ships': targets ?? catalogRows},
        'app': {
          'isAnonymous': anonymous,
          'pricing': {'currencyCode': currency, 'isTaxInclusive': false},
        }
      }, DateTime.fromMillisecondsSinceEpoch(1800000000000));

  test('filtered targets compute standard and WB differences with stock checks',
      () {
    final offers = catalogStoreOffers(
        catalog().upgradeTargets!,
        {101: 1, 202: 2},
        {1: 1000, 2: 4000, 3: 3000},
        1,
        2,
        {1: 1000, 2: 4000, 3: 3000},
        catalog().loadedAt);
    final standard = offers.firstWhere((o) => o.id == 'store:1:2:8');
    final wb = offers.firstWhere((o) => o.id == 'store:1:2:9');
    expect(standard.cost, 3000);
    expect(wb.cost, 2000);
    expect(wb.source, 'store_wb');
    expect(wb.availability, 'verified');
    expect(wb.quotedAt, 1800000000);
    expect(offers.any((o) => o.id == 'store:3:2:9'), isFalse);
    expect(offers.firstWhere((o) => o.id == 'store:1:2:10').availability,
        'unknown');
    expect(offers.any((o) => o.id == 'store:1:2:11'), isFalse);
    expect(offers.any((o) => o.fromShipId == 2), isFalse);
  });

  test('filtered SKU stock and availability must explicitly permit a purchase',
      () {
    final offers = catalogStoreOffers(
        [
          {
            'id': 202,
            'skus': [
              {
                'id': 1,
                'price': 3000,
                'available': false,
                'unlimitedStock': true
              },
              {
                'id': 2,
                'price': 3000,
                'available': true,
                'unlimitedStock': false,
                'availableStock': 0
              },
              {
                'id': 3,
                'price': 3000,
                'available': true,
                'unlimitedStock': false,
                'availableStock': -1
              },
              {
                'id': 4,
                'price': 3000,
                'available': true,
                'unlimitedStock': false,
                'availableStock': 2
              },
              {'id': 5, 'price': 3000, 'available': true},
              {'id': 6, 'price': 3000, 'unlimitedStock': true},
            ],
          },
        ],
        {101: 1, 202: 2},
        {1: 1000, 2: 4000},
        1,
        2,
        {1: 1000, 2: 4000},
        catalog().loadedAt);
    expect(offers.map((o) => o.skuId), [4, 5, 6]);
    expect(
        offers.map((o) => o.availability), ['verified', 'unknown', 'unknown']);
  });

  for (final variant in [
    'standard-only',
    'filtered-price',
    'empty',
    'missing',
    'malformed'
  ]) {
    test('planning uses filtered targets instead of raw catalog: $variant',
        () async {
      await RsiSessionService.instance.reset(handle: 'Alice');
      final targets = switch (variant) {
        'standard-only' => [
            {
              'id': 202,
              'skus': [
                {
                  'id': 8,
                  'title': 'Standard',
                  'price': 4000,
                  'available': true,
                  'unlimitedStock': true
                }
              ]
            }
          ],
        'filtered-price' => [
            {
              'id': 202,
              'skus': [
                {
                  'id': 9,
                  'title': 'Warbond',
                  'price': 3200,
                  'available': true,
                  'unlimitedStock': true
                }
              ]
            }
          ],
        'malformed' => [
            {'id': 202}
          ],
        _ => <dynamic>[],
      };
      Map<String, dynamic>? payload;
      var loads = 0;
      final service = CcuPlanningService(catalogLoader: (_) async {
        loads++;
        return catalog(targets: targets, includeTargets: variant != 'missing');
      }, submit: (value, _) async {
        payload = value;
        return const CcuPlanResult(status: 'ok');
      });
      final result = await service.plan(
          account: 'Alice',
          ships: ships,
          hangar: [],
          buyback: [],
          fromId: 1,
          toId: 2,
          settings: const CcuSettings(),
          cancelToken: CancelToken());
      final offers = payload!['offers'] as List;
      if (variant == 'standard-only') {
        expect(offers.single['sku_id'], 8);
        expect(offers.single['source'], 'store');
      } else if (variant == 'filtered-price') {
        expect(offers.single['sku_id'], 9);
        expect(offers.single['cost'], 2200);
        expect(offers.single['availability'], 'verified');
      } else {
        expect(offers, isEmpty);
      }
      final invalid = variant == 'missing' || variant == 'malformed';
      expect(payload!['quotes_complete'], !invalid);
      expect(result.diagnostics.any((d) => d.contains('缺少当前可升级')), invalid);
      expect(loads, 1);
    });
  }

  test('catalog requires authenticated net USD data', () {
    expect(catalog().hasUsdNetPrices, isTrue);
    expect(catalog(currency: 'EUR').hasUsdNetPrices, isFalse);
    expect(catalog(anonymous: true).hasUsdNetPrices, isFalse);
  });

  BuybackItem buybackItem() => BuybackItem(
      id: 77,
      title: 'Upgrade - A to B',
      image: '',
      date: 0,
      contains: '',
      alsoContains: '',
      insertTime: 0,
      isUpgrade: true,
      url: null,
      number: 2,
      idList: [77, 78],
      price: 1255,
      formShipUpgradeId: 10,
      toShipUpgradeId: 20,
      toSkuId: 8);

  test('buybacks use existing reference prices and exact inventory copies', () {
    final item = buybackItem();
    final offers =
        localBuybackOffers([item], ships, {}, {1: 1000, 2: 4000}, 1, 2, []);
    expect(offers.map((o) => o.itemId), [77, 78]);
    expect(
        offers.every((o) =>
            o.cost == 1255 &&
            o.quotedAt == null &&
            o.availability == 'unknown'),
        isTrue);
    item.price = 0;
    expect(
        localBuybackOffers([item], ships, {}, {1: 1000, 2: 4000}, 1, 2, [])
            .first
            .cost,
        3000);
  });

  test(
      'planning uses one catalog loader and current local buybacks on every run',
      () async {
    await RsiSessionService.instance.reset(handle: 'Alice');
    final loads = <bool>[];
    final payloads = <Map<String, dynamic>>[];
    final service = CcuPlanningService(catalogLoader: (refresh) async {
      loads.add(refresh);
      return catalog();
    }, submit: (payload, _) async {
      payloads.add(payload);
      return const CcuPlanResult(status: 'ok');
    });
    final item = buybackItem();
    for (var i = 0; i < 3; i++) {
      item.price = 1255 + i;
      await service.plan(
          account: 'Alice',
          ships: ships,
          hangar: [],
          buyback: [item],
          fromId: 1,
          toId: 2,
          settings: CcuSettings(objective: i == 1 ? 'total' : 'additional'),
          cancelToken: CancelToken(),
          refresh: i == 2);
      final offers = payloads.last['offers'] as List;
      expect(offers.where((o) => o['source'] == 'buyback').length, 2);
      expect(
          offers.firstWhere((o) => o['source'] == 'buyback')['cost'], 1255 + i);
      expect(offers.firstWhere((o) => o['id'] == 'store:1:2:9')['cost'], 2000);
    }
    expect(loads, [false, false, true]);
  });

  test('store failure still plans from existing buybacks', () async {
    await RsiSessionService.instance.reset(handle: 'Alice');
    Map<String, dynamic>? payload;
    final service = CcuPlanningService(
        catalogLoader: (_) async => throw StateError('offline'),
        submit: (value, _) async {
          payload = value;
          return const CcuPlanResult(status: 'ok');
        });
    await service.plan(
        account: 'Alice',
        ships: ships,
        hangar: [],
        buyback: [buybackItem()],
        fromId: 1,
        toId: 2,
        settings: const CcuSettings(),
        cancelToken: CancelToken());
    expect(payload!['quotes_complete'], isFalse);
    expect((payload!['offers'] as List).map((o) => o['cost']), [1255, 1255]);
  });
  test('legacy slots remain unclaimed until explicitly saved', () async {
    final aliases = ShipAliasRepo().getShipAliasesSync();
    aliases.addAll(ships);
    try {
      final legacy = jsonEncode([
        jsonEncode({
          'fromShip': 10,
          'toShip': 20,
          'fromProduct': 'A',
          'toProduct': 'B',
          'cost': 1255,
          'tags': ['机库中']
        })
      ]);
      SharedPreferences.setMockInitialValues({'vip.kirakira.steps[0]': legacy});
      final storage = CcuPlanStorage();
      final saved = (await storage.load('Alice', 0))!;
      expect(saved.legacy, isTrue);
      expect(saved.plan.ownedCost, 1255);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getKeys(), {'vip.kirakira.steps[0]'});
      await storage.save('Alice', 0, saved);
      expect((await storage.load('Alice', 0))!.legacy, isFalse);
      expect((await storage.load('Bob', 0))!.legacy, isTrue);
      expect(prefs.getString('vip.kirakira.steps[0]'), legacy);
    } finally {
      aliases.clear();
    }
  });

  test('service submits source switches and retries incomplete quote runs',
      () async {
    await RsiSessionService.instance.reset(handle: 'Alice');
    var calls = 0;
    Map<String, dynamic>? submitted;
    final service = CcuPlanningService(
        quoteLoader: (s, b, f, t, useBuyback, token, check, progress) async {
      calls++;
      expect(useBuyback, isFalse);
      return CcuQuoteSnapshot(
          {1: 1000, 2: 4000}, [], ['partial'], false, DateTime.now());
    }, submit: (payload, _) async {
      submitted = payload;
      return const CcuPlanResult(status: 'ok', plans: [plan]);
    });
    for (var i = 0; i < 2; i++) {
      final result = await service.plan(
          account: 'Alice',
          ships: ships,
          hangar: [],
          buyback: [],
          fromId: 1,
          toId: 2,
          settings: const CcuSettings(useHangar: false, useBuyback: false),
          cancelToken: CancelToken(),
          requiredIds: ['fixed'],
          excludedSourcePairs: const [
            CcuSourcePair(fromShipId: 1, toShipId: 2, source: 'store_wb'),
          ],
          excludedPairs: [
            [1, 2]
          ]);
      expect(result.diagnostics, ['partial']);
    }
    expect(calls, 2);
    expect(submitted!['use_hangar'], isFalse);
    expect(submitted!['required_offer_ids'], ['fixed']);
    expect(submitted!['excluded_pairs'], [
      [1, 2]
    ]);
    expect(submitted!['excluded_source_pairs'], [
      {'from_ship_id': 1, 'to_ship_id': 2, 'source': 'store_wb'}
    ]);
    expect(submitted!['quotes_complete'], isFalse);
  });

  test('account switch rejects a response issued under the previous account',
      () async {
    await RsiSessionService.instance.reset(handle: 'Alice');
    final ready = Completer<void>();
    final response = Completer<CcuPlanResult>();
    final service = CcuPlanningService(
        quoteLoader: (s, b, f, t, enabled, token, check, progress) async =>
            CcuQuoteSnapshot({1: 1000, 2: 4000}, [], [], true, DateTime.now()),
        submit: (_, token) {
          ready.complete();
          return response.future;
        });
    final future = service.plan(
        account: 'Alice',
        ships: ships,
        hangar: [],
        buyback: [],
        fromId: 1,
        toId: 2,
        settings: const CcuSettings(),
        cancelToken: CancelToken());
    final assertion = expectLater(future, throwsA(isA<RsiSessionChanged>()));
    await ready.future;
    await RsiSessionService.instance.reset(handle: 'Bob');
    response.complete(const CcuPlanResult(status: 'ok', plans: [plan]));
    await assertion;
  });
}
