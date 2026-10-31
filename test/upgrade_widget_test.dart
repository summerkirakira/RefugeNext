import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/network/cirno/property/property.dart'
    show ShipAlias;
import 'package:refuge_next/src/widgets/shop/cart/cart.dart';
import 'package:refuge_next/src/widgets/shop/cart/cart_controller.dart';
import 'package:refuge_next/src/widgets/shop/upgrade_shop/upgrade_controller.dart';
import 'package:refuge_next/src/widgets/shop/upgrade_shop/upgrade_page.dart';
import 'package:refuge_next/src/widgets/shop/upgrade_shop/ship_select_bottomsheet.dart';
import 'helpers/upgrade_fixtures.dart';
import 'helpers/cart_fixtures.dart';

Future<void> launch(WidgetTester tester, UpgradeController c,
    {Size size = const Size(390, 844),
    double scale = 1,
    Brightness brightness = Brightness.light,
    Future<void> Function(BuildContext)? openCart}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(MaterialApp(
      theme: ThemeData(useMaterial3: false, brightness: brightness),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(scale)),
          child: child!),
      home: UpgradePage(controller: c, openCart: openCart ?? (_) async {})));
  await tester.pumpAndSettle();
}

void main() {
  for (final failFirst in [false, true]) {
    testWidgets('cart replaces upgrade route, with loading retry: $failFirst',
        (tester) async {
      final gateway = FakeUpgradeGateway();
      final c = await readyUpgrade(gateway);
      addTearDown(c.dispose);
      final loading = Completer<void>();
      var attempts = 0;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              child: const Text('商店入口'),
              onPressed: () =>
                  Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (_) => UpgradePage(
                  controller: c,
                  openCart: (context) async {
                    attempts++;
                    await loading.future;
                    if (failFirst && attempts == 1) throw StateError('network');
                    if (!context.mounted) return;
                    final cart = FakeCartGateway(cartSnapshot(items: []));
                    unawaited(showCartSheet(context,
                        CartController(gateway: cart, initial: cart.value)));
                  },
                ),
              )),
            ),
          ),
        ),
      ));
      await tester.tap(find.text('商店入口'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey('upgrade-add')));
      await tester.pump();
      expect(find.byType(UpgradePage), findsOneWidget);
      expect(find.text('正在打开购物车'), findsOneWidget);
      loading.complete();
      await tester.pumpAndSettle();
      if (failFirst) {
        expect(find.byType(UpgradePage), findsOneWidget);
        expect(find.text('购物车暂时无法加载，请再打开一次'), findsOneWidget);
        await tester.tap(find.byKey(const ValueKey('upgrade-add')));
        await tester.pumpAndSettle();
      }
      expect(find.byType(CartContent), findsOneWidget);
      expect(find.byType(UpgradePage, skipOffstage: false), findsNothing);
      expect(gateway.applications, 1);
      if (failFirst) {
        await tester.binding.handlePopRoute();
      } else {
        await tester.tap(find.byTooltip('关闭购物车'));
      }
      await tester.pumpAndSettle();
      expect(find.text('商店入口').hitTestable(), findsOneWidget);
      expect(find.byType(CartContent), findsNothing);
      expect(find.byType(UpgradePage, skipOffstage: false), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('catalog loading leaves back navigation available',
      (tester) async {
    final gateway = FakeUpgradeGateway();
    final gate = Completer<void>();
    gateway.pending = gate;
    final c = UpgradeController(gateway);
    await tester.pumpWidget(MaterialApp(home: UpgradePage(controller: c)));
    await tester.pump();
    expect(tester.widget<PopScope>(find.byType(PopScope)).canPop, isTrue);
    gate.complete();
    await tester.pumpAndSettle();
    await tester.pumpWidget(const SizedBox());
    c.dispose();
  });
  for (final brightness in Brightness.values) {
    for (final size in [const Size(320, 780), const Size(840, 1000)]) {
      testWidgets(
          'quote and add remain visible at $size in $brightness with large text',
          (tester) async {
        final c = await readyUpgrade(FakeUpgradeGateway());
        await launch(tester, c, size: size, scale: 1.4, brightness: brightness);
        expect(find.byKey(const ValueKey('upgrade-price')).hitTestable(),
            findsOneWidget);
        expect(
            tester
                .widget<Text>(find.byKey(const ValueKey('upgrade-price')))
                .data,
            '\$100.17');
        expect(find.byKey(const ValueKey('upgrade-add')).hitTestable(),
            findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
        c.dispose();
      });
    }
  }
  testWidgets('cart open failure offers opening again without re-adding',
      (tester) async {
    final gateway = FakeUpgradeGateway();
    final c = await readyUpgrade(gateway);
    var cartCalls = 0;
    await launch(tester, c, openCart: (_) async {
      cartCalls++;
      throw StateError('network');
    });
    await tester.tap(find.byKey(const ValueKey('upgrade-add')));
    await tester.pumpAndSettle();
    expect(c.added, isTrue);
    expect(find.text('打开购物车'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('upgrade-add')));
    await tester.pumpAndSettle();
    expect(cartCalls, 2);
    expect(gateway.applications, 1);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
    c.dispose();
  });
  testWidgets('uncertain addition asks to inspect cart and never replays',
      (tester) async {
    final gateway = FakeUpgradeGateway()..failApply = true;
    final c = await readyUpgrade(gateway);
    var cartCalls = 0;
    await launch(tester, c, openCart: (_) async {
      cartCalls++;
    });
    await tester.tap(find.byKey(const ValueKey('upgrade-add')));
    await tester.pumpAndSettle();
    expect(find.text('检查购物车'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('upgrade-add')));
    await tester.pumpAndSettle();
    expect(cartCalls, 1);
    expect(gateway.applications, 1);
    await tester.pumpWidget(const SizedBox());
    c.dispose();
  });
  testWidgets('picker searches English Chinese aliases and owned filter',
      (tester) async {
    final gateway = FakeUpgradeGateway();
    gateway.sources.first.shipAlias =
        ShipAlias(id: 1, name: 'Origin One', alias: ['starter'], skus: []);
    final state = ShipPickerState();
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: UpgradeShipPicker(
                ships: gateway.sources,
                source: true,
                currency: 'USD',
                state: state))));
    await tester.pumpAndSettle();
    for (final term in ['ORIGIN', '起点舰船', 'starter']) {
      await tester.enterText(find.byType(TextField), term);
      await tester.pumpAndSettle();
      expect(find.byWidgetPredicate((w) => w is Text && w.data == '起点舰船'),
          findsOneWidget);
      expect(find.text('另一艘起点'), findsNothing);
    }
    await tester.enterText(find.byType(TextField), '');
    await tester.tap(find.widgetWithText(ChoiceChip, '已拥有'));
    await tester.pumpAndSettle();
    expect(find.text('另一艘起点'), findsNothing);
    expect(state.restricted, isTrue);
    await tester.tap(find.widgetWithText(ChoiceChip, '全部'));
    await tester.pumpAndSettle();
    expect(find.text('另一艘起点'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets(
      'target card and picker keep MSRP when Warbond changes the upgrade quote',
      (tester) async {
    final c = await readyUpgrade(FakeUpgradeGateway());
    await launch(tester, c);
    final target = find.byKey(const ValueKey('upgrade-to'));
    expect(find.descendant(of: target, matching: find.text('价格 \$200.00')),
        findsOneWidget);
    await c.selectSku(c.to!.skus!.firstWhere((sku) => sku.isWarbond));
    await tester.pumpAndSettle();
    expect(find.descendant(of: target, matching: find.text('价格 \$200.00')),
        findsOneWidget);
    expect(
        tester.widget<Text>(find.byKey(const ValueKey('upgrade-price'))).data,
        '\$80.17');
    await tester.tap(target);
    await tester.pumpAndSettle();
    final picker = find.byType(UpgradeShipPicker);
    expect(find.descendant(of: picker, matching: find.text('\$200')),
        findsOneWidget);
    await tester.tap(find.widgetWithText(ChoiceChip, '战争债券'));
    await tester.pumpAndSettle();
    expect(find.descendant(of: picker, matching: find.text('\$200')),
        findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
    c.dispose();
  });
  testWidgets(
      'changing source uses searchable sheet and preserves search on reopening',
      (tester) async {
    final c = await readyUpgrade(FakeUpgradeGateway());
    await launch(tester, c);
    await tester.tap(find.byKey(const ValueKey('upgrade-from')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Other');
    await tester.pumpAndSettle();
    await tester.tap(find.text('另一艘起点'));
    await tester.pumpAndSettle();
    expect(c.from!.id, 2);
    expect(find.text('价格 \$200.00'), findsOneWidget);
    expect(
        tester.widget<Text>(find.byKey(const ValueKey('upgrade-price'))).data,
        '\$50.17');
    await tester.tap(find.byKey(const ValueKey('upgrade-from')));
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        'Other');
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
    c.dispose();
  });
}
