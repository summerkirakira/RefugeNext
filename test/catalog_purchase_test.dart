import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/widgets/shop/shop_page/catalog_detail_bottomsheet.dart';
import 'package:refuge_next/src/widgets/shop/shop_page/catalog_purchase_controller.dart';
import 'package:refuge_next/src/network/graphql/shop/catalog_purchase_availability.dart';

CatalogProperty product({String? chinese, String? excerpt, int price = 1525}) =>
    CatalogProperty(
        id: 'sku',
        name: 'PTV',
        title: 'PTV小车',
        subtitle: '单船',
        url: '',
        excerpt: excerpt,
        chineseExcerpt: chinese,
        type: '',
        media: const Media(thumbnail: ImageUrl(slideshow: '', storeSmall: '')),
        price: Price(amount: price, taxDescription: []),
        stock: const Stock(unlimited: true, show: true),
        nativePrice: NativePrice(amount: price),
        isWarbond: false,
        isPackage: false,
        isVip: false);

Future<void> launch(WidgetTester tester, CatalogPurchaseController purchase,
    {CatalogProperty? item,
    Size size = const Size(390, 844),
    double scale = 1,
    double keyboard = 0,
    Brightness brightness = Brightness.light}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  tester.view.viewInsets = FakeViewPadding(bottom: keyboard);
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
                  onPressed: () => showCatalogItemDetail(
                      context, item ?? product(),
                      purchase: purchase),
                  child: const Text('open'),
                ))),
  ));
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('limited sale already in cart opens cart without another add',
      (tester) async {
    var adds = 0, opens = 0;
    final purchase = CatalogPurchaseController(
      loadAvailability: () async =>
          const CatalogPurchaseAvailability(minimum: 1, maximum: 1, inCart: 1),
      add: (_) async {
        adds++;
      },
      prepareCart: () async => () {
        opens++;
      },
    );
    await launch(tester, purchase, size: const Size(320, 760), scale: 1.4);
    expect(find.text('购物车已有 1 件，已达本单上限'), findsOneWidget);
    expect(find.text('加入购物车'), findsNothing);
    expect(purchase.added, isFalse);
    await tester.tap(find.text('打开购物车'));
    await tester.pumpAndSettle();
    expect([adds, opens], [0, 1]);
    expect(tester.takeException(), isNull);
  });

  testWidgets('limited sale permits one item and disables the increment',
      (tester) async {
    final quantities = <int>[];
    final purchase = CatalogPurchaseController(
      loadAvailability: () async =>
          const CatalogPurchaseAvailability(minimum: 1, maximum: 1, inCart: 0),
      add: (q) async {
        quantities.add(q);
      },
      prepareCart: () async => () {},
    );
    await launch(tester, purchase);
    expect(
        tester
            .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.add))
            .onPressed,
        isNull);
    final input = find.byKey(const ValueKey('catalog-quantity'));
    await tester.enterText(input, '2');
    await tester.pumpAndSettle();
    expect(find.text('当前可添加 1 件'), findsOneWidget);
    expect(
        tester
            .widget<FilledButton>(find.byKey(const ValueKey('catalog-add')))
            .onPressed,
        isNull);
    await tester.enterText(input, '1');
    await tester.pumpAndSettle();
    await tester.tap(find.text('加入购物车'));
    await tester.pumpAndSettle();
    expect(quantities, [1]);
    expect(tester.takeException(), isNull);
  });

  test('cart changes require quantity confirmation, never silently add less',
      () async {
    var inCart = 0, adds = 0, opens = 0;
    final purchase = CatalogPurchaseController(
      loadAvailability: () async =>
          CatalogPurchaseAvailability(minimum: 1, maximum: 3, inCart: inCart),
      add: (_) async {
        adds++;
      },
      prepareCart: () async => () {
        opens++;
      },
    );
    addTearDown(purchase.dispose);
    await purchase.initialize();
    purchase.quantityText.text = '3';
    inCart = 2;
    await purchase.submit(() {});
    expect(adds, 0);
    expect(purchase.maximumQuantity, 1);
    expect(purchase.error, contains('可购数量已变化'));
    // The cart filled in another view: open it without adding again.
    inCart = 3;
    await purchase.submit(() {});
    expect([adds, opens], [0, 1]);
    expect(purchase.added, isFalse);
  });

  test('failed availability check retries without submitting a purchase',
      () async {
    var checks = 0, adds = 0;
    final purchase = CatalogPurchaseController(
      loadAvailability: () async {
        if (++checks == 1) throw Exception('offline');
        return const CatalogPurchaseAvailability(
            minimum: 1, maximum: 1, inCart: 0);
      },
      add: (_) async {
        adds++;
      },
      prepareCart: () async => () {},
    );
    addTearDown(purchase.dispose);
    await purchase.initialize();
    expect(purchase.ready, isFalse);
    await purchase.submit(() {});
    expect(purchase.ready, isTrue);
    expect(adds, 0);
    await purchase.submit(() {});
    expect(adds, 1);
  });

  test('pending add cannot repeat; failed cart load retries only the cart',
      () async {
    final pending = Completer<void>();
    var adds = 0, loads = 0, opens = 0, closes = 0;
    final purchase = CatalogPurchaseController(add: (q) {
      adds++;
      expect(q, 1);
      return pending.future;
    }, prepareCart: () async {
      loads++;
      if (loads == 1) throw Exception('offline');
      return () {
        opens++;
      };
    });
    addTearDown(purchase.dispose);
    final first = purchase.submit(() {
      closes++;
    });
    await purchase.submit(() {
      closes++;
    });
    expect(adds, 1);
    pending.complete();
    await first;
    expect(purchase.added, isTrue);
    expect(purchase.error, contains('商品已加入'));
    expect(opens, 0);
    purchase.step(1);
    expect(purchase.quantity, 1);
    await purchase.submit(() {
      closes++;
    });
    expect([adds, loads, closes, opens], [1, 2, 1, 1]);
  });

  test('failed add preserves quantity; disposed view ignores late completion',
      () async {
    var loads = 0;
    final purchase = CatalogPurchaseController(
        add: (_) async => throw Exception('sold out'),
        prepareCart: () async {
          loads++;
          return () {};
        });
    purchase.step(1);
    await purchase.submit(() {});
    expect(purchase.quantity, 2);
    expect(purchase.added, isFalse);
    expect(purchase.busy, isFalse);
    expect(purchase.error, contains('sold out'));
    expect(loads, 0);
    purchase.dispose();
    final pending = Completer<void>();
    final closed = CatalogPurchaseController(
        add: (_) => pending.future,
        prepareCart: () async {
          loads++;
          return () {};
        });
    final submit = closed.submit(() => fail('closed view must not navigate'));
    closed.dispose();
    pending.complete();
    await submit;
    expect(loads, 0);
  });

  testWidgets('quantity bounds, validation, subtotal and description fallback',
      (tester) async {
    final purchase = CatalogPurchaseController(
        add: (_) async {}, prepareCart: () async => () {});
    await launch(tester, purchase,
        item: product(chinese: ' ', excerpt: 'English description. ' * 40));
    final input = find.byKey(const ValueKey('catalog-quantity'));
    final add = find.byKey(const ValueKey('catalog-add'));
    expect(purchase.quantity, 1);
    expect(find.text('\$15.25'), findsNWidgets(2));
    expect(
        tester
            .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.remove))
            .onPressed,
        isNull);
    await tester.tap(find.widgetWithIcon(IconButton, Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('\$30.50'), findsOneWidget);
    await tester.enterText(input, '5');
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.add))
            .onPressed,
        isNull);
    for (final invalid in ['', '0', '6']) {
      await tester.enterText(input, invalid);
      await tester.pumpAndSettle();
      expect(find.text('请输入 1～5 的整数'), findsOneWidget);
      expect(tester.widget<FilledButton>(add).onPressed, isNull);
    }
    await tester.enterText(input, '3');
    await tester.pumpAndSettle();
    expect(find.text('\$45.75'), findsOneWidget);
    expect(tester.widget<FilledButton>(add).onPressed, isNotNull);
    expect(find.text('展开'), findsNothing);
    expect(find.text('收起'), findsNothing);
    final description = find.textContaining('English description');
    expect(tester.widget<Text>(description).maxLines, isNull);
    expect(find.text('最终应付以购物车为准'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
      'busy locks closing and duplicate add; cart failure has its own retry',
      (tester) async {
    final pending = Completer<void>();
    var adds = 0, loads = 0, opens = 0;
    final purchase = CatalogPurchaseController(add: (_) {
      adds++;
      return pending.future;
    }, prepareCart: () async {
      loads++;
      if (loads == 1) throw Exception('offline');
      return () {
        opens++;
      };
    });
    await launch(tester, purchase,
        item: product(chinese: '中文简介', excerpt: 'English'));
    expect(find.text('中文简介'), findsOneWidget);
    expect(find.text('English'), findsNothing);
    await tester.tap(find.text('加入购物车'));
    await tester.pump();
    expect(find.text('正在添加…'), findsOneWidget);
    expect(
        tester
            .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.close))
            .onPressed,
        isNull);
    expect(
        tester
            .widget<TextField>(find.byKey(const ValueKey('catalog-quantity')))
            .enabled,
        isFalse);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('正在添加…'), findsOneWidget);
    pending.complete();
    await tester.pumpAndSettle();
    expect(find.text('重新打开购物车'), findsOneWidget);
    await tester.tap(find.text('重新打开购物车'));
    await tester.pumpAndSettle();
    expect([adds, loads, opens], [1, 2, 1]);
    expect(find.byKey(const ValueKey('catalog-quantity')), findsNothing);
    expect(tester.takeException(), isNull);
  });

  for (final brightness in Brightness.values) {
    testWidgets('narrow screen, large text and keyboard fit ($brightness)',
        (tester) async {
      final purchase = CatalogPurchaseController(
          add: (_) async {}, prepareCart: () async => () {});
      await launch(tester, purchase,
          size: const Size(320, 760), scale: 1.4, brightness: brightness);
      final input = find.byKey(const ValueKey('catalog-quantity'));
      await Scrollable.ensureVisible(tester.element(input), alignment: .4);
      await tester.pumpAndSettle();
      await tester.tap(input);
      await tester.pumpAndSettle();
      tester.view.viewInsets = const FakeViewPadding(bottom: 250);
      await tester.pumpAndSettle();
      expect(
          tester.getBottomLeft(input).dy,
          lessThan(tester
              .getTopLeft(find.byKey(const ValueKey('catalog-subtotal')))
              .dy));
      expect(find.byKey(const ValueKey('catalog-add')).hitTestable(),
          findsOneWidget);
      expect(find.text('商品介绍'), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.tap(find.widgetWithIcon(IconButton, Icons.close));
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('catalog-quantity')), findsNothing);
    });
  }
}
