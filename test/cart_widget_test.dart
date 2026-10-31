import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/widgets/shop/cart/cart.dart';
import 'package:refuge_next/src/widgets/shop/cart/cart_controller.dart';
import 'helpers/cart_fixtures.dart';

Future<void> launchCart(WidgetTester tester, CartController controller,
    {Size size = const Size(390, 844),
    double scale = 1,
    Brightness brightness = Brightness.light}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  addTearDown(tester.view.resetViewInsets);
  await tester.pumpWidget(MaterialApp(
    theme: ThemeData(useMaterial3: false, brightness: brightness),
    builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: TextScaler.linear(scale)),
        child: child!),
    home: Scaffold(
        body: Builder(
            builder: (context) => TextButton(
                  child: const Text('open'),
                  onPressed: () => showCartSheet(context, controller,
                      authenticate: () async => false, openWeb: (_) async {}),
                ))),
  ));
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets(
      'checkout failure stays readable and never hides the recovery action',
      (tester) async {
    final gateway = FakeCartGateway(cartSnapshot())..failCheckout = true;
    final controller = CartController(gateway: gateway, initial: gateway.value);
    await launchCart(tester, controller,
        size: const Size(320, 780), scale: 1.4);
    await controller.checkout(
        authenticate: () async => true, openWeb: () async {}, completed: () {});
    await tester.pumpAndSettle();
    expect(find.text('前往官网检查').hitTestable(), findsOneWidget);
    expect(find.text('查看详情').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.tap(find.text('查看详情'));
    await tester.pumpAndSettle();
    expect(find.text('操作提示'), findsOneWidget);
    await tester.tap(find.text('关闭'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('关闭购物车'));
    await tester.pumpAndSettle();
  });

  testWidgets('sale unit price, line subtotal and server payable are distinct',
      (tester) async {
    final gateway =
        FakeCartGateway(cartSnapshot(items: [cartItem(qty: 2)], total: 9550));
    final controller = CartController(gateway: gateway, initial: gateway.value);
    await launchCart(tester, controller);
    expect(find.text('单价 \$45.00'), findsOneWidget);
    expect(find.text('小计 \$90.00'), findsOneWidget);
    expect(find.text('\$60.00'), findsOneWidget);
    expect(tester.widget<Text>(find.byKey(const ValueKey('cart-payable'))).data,
        '\$95.50');
    expect(tester.takeException(), isNull);
    await tester.tap(find.byTooltip('关闭购物车'));
    await tester.pumpAndSettle();
  });

  testWidgets(
      'limits disable buttons; clearing requires confirmation and empty state closes',
      (tester) async {
    final gateway =
        FakeCartGateway(cartSnapshot(items: [cartItem(maximum: 1)]));
    final controller = CartController(gateway: gateway, initial: gateway.value);
    await launchCart(tester, controller);
    expect(
        tester
            .widget<IconButton>(find.byKey(const ValueKey('increase-sale')))
            .onPressed,
        isNull);
    expect(
        tester
            .widget<IconButton>(find.byKey(const ValueKey('decrease-sale')))
            .onPressed,
        isNull);
    await tester.tap(find.byTooltip('购物车更多操作'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('清空购物车'));
    await tester.pumpAndSettle();
    expect(gateway.clears, 0);
    await tester.tap(find.text('取消'));
    await tester.pumpAndSettle();
    expect(gateway.clears, 0);
    await tester.tap(find.byTooltip('购物车更多操作'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('清空购物车'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('清空'));
    await tester.pumpAndSettle();
    expect(gateway.clears, 1);
    expect(find.text('购物车为空'), findsOneWidget);
    await tester.tap(find.text('继续逛商店'));
    await tester.pumpAndSettle();
    expect(find.text('open'), findsOneWidget);
  });

  testWidgets(
      'quantity input validates; pending credit draft disables checkout',
      (tester) async {
    final gateway = FakeCartGateway(cartSnapshot());
    final controller = CartController(gateway: gateway, initial: gateway.value);
    await launchCart(tester, controller);
    await tester.tap(find.byKey(const ValueKey('quantity-sale')));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('cart-quantity-input')), '6');
    await tester.pumpAndSettle();
    expect(find.text('请输入允许范围内的整数'), findsOneWidget);
    expect(
        tester
            .widget<FilledButton>(find.widgetWithText(FilledButton, '确定'))
            .onPressed,
        isNull);
    await tester.enterText(
        find.byKey(const ValueKey('cart-quantity-input')), '2');
    await tester.pumpAndSettle();
    await tester.tap(find.text('确定'));
    await tester.pumpAndSettle();
    expect(gateway.changes, 1);
    expect(controller.snapshot.count, 2);
    final input = find.byKey(const ValueKey('cart-credit-input'));
    await Scrollable.ensureVisible(tester.element(input), alignment: .3);
    await tester.pumpAndSettle();
    await tester.enterText(input, '10');
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<FilledButton>(find.byKey(const ValueKey('cart-checkout')))
            .onPressed,
        isNull);
    await tester.ensureVisible(find.text('应用'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('应用'));
    await tester.pumpAndSettle();
    expect(gateway.credits, [1000]);
    expect(controller.creditDirty, isFalse);
    expect(tester.takeException(), isNull);
    await tester.tap(find.byTooltip('关闭购物车'));
    await tester.pumpAndSettle();
  });

  for (final brightness in Brightness.values) {
    testWidgets(
        'mixed long-title cart fits narrow large text and keyboard ($brightness)',
        (tester) async {
      final gateway = FakeCartGateway(cartSnapshot(items: [
        cartItem(
            id: 'long',
            title: 'Constellation Mk V Centaurus 及 Magnitude 涂装战争债券组合礼包',
            warbond: true),
        cartItem(id: 'upgrade', upgrade: true),
      ], maximumCredit: 2000));
      final controller =
          CartController(gateway: gateway, initial: gateway.value);
      await launchCart(tester, controller,
          size: const Size(320, 780), scale: 1.4, brightness: brightness);
      expect(find.text('战争债券'), findsOneWidget);
      final input = find.byKey(const ValueKey('cart-credit-input'));
      await Scrollable.ensureVisible(tester.element(input), alignment: .3);
      await tester.pumpAndSettle();
      await tester.tap(input);
      tester.view.viewInsets = const FakeViewPadding(bottom: 240);
      await tester.pumpAndSettle();
      await Scrollable.ensureVisible(tester.element(input), alignment: .3);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(
          tester.getBottomLeft(input).dy,
          lessThan(tester
              .getTopLeft(find.byKey(const ValueKey('cart-payable')))
              .dy));
      expect(find.byKey(const ValueKey('cart-checkout')).hitTestable(),
          findsOneWidget);
      await tester.tap(find.byTooltip('关闭购物车'));
      await tester.pumpAndSettle();
    });
  }

  testWidgets(
      'warbond-only cart explains unavailable credit without a useless input',
      (tester) async {
    final gateway = FakeCartGateway(cartSnapshot(
        items: [cartItem(warbond: true)], applicable: false, maximumCredit: 0));
    final controller = CartController(gateway: gateway, initial: gateway.value);
    await launchCart(tester, controller);
    expect(find.text('战争债券商品不可使用信用点'), findsOneWidget);
    expect(find.byKey(const ValueKey('cart-credit-input')), findsNothing);
    await tester.tap(find.byTooltip('关闭购物车'));
    await tester.pumpAndSettle();
  });
}
