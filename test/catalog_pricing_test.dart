import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';
import 'package:refuge_next/src/funcs/shop/catalog_price.dart';
import 'package:refuge_next/src/funcs/search.dart';
import 'package:refuge_next/src/repo/catalog.dart';
import 'package:refuge_next/src/repo/shop_catalog_cache.dart';
import 'package:refuge_next/src/widgets/shop/shop_page/catalog_detail_bottomsheet.dart';
import 'package:refuge_next/src/widgets/shop/shop_page/catalog_purchase_controller.dart';
import 'package:refuge_next/src/widgets/shop/shop_page/shop_item_widget.dart';

CatalogProperty sample(String id,
    {int regular = 6000,
    int? discounted,
    bool warbond = false,
    String title = 'First Flight Pack'}) {
  final raw = <String, dynamic>{
    'id': id, 'name': title, 'title': title, 'subtitle': 'Package', 'url': '',
    'excerpt': 'Product description', 'type': 'sku',
    'media': {
      'thumbnail': {'slideshow': '', 'storeSmall': ''}
    },
    'nativePrice': {'amount': regular, 'discounted': discounted},
    // Intentionally different: UI and sorting must both use native USD prices.
    'price': {'amount': regular + 10000, 'taxDescription': <String>[]},
    'stock': {'unlimited': true, 'show': true},
    'isWarbond': warbond, 'isPackage': true, 'isVip': false,
    'tags': [
      {'name': 'Limited Time'}
    ],
  };
  ShopCatalogCache().readItem(raw);
  return CatalogProperty.fromJson(raw);
}

class _Paths extends PathProviderPlatform {
  _Paths(this.path);
  final String path;
  @override
  Future<String> getApplicationDocumentsPath() async => path;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('official sale semantics, no discount, free and invalid values', () {
    expect(CatalogPrice(original: 6000, discounted: 4500).current, 4500);
    expect(CatalogPrice(original: 6000, discounted: 4500).savingsPercent, 25);
    for (final value in [null, -1, 6000, 7000]) {
      final price = CatalogPrice(original: 6000, discounted: value);
      expect(price.current, 6000);
      expect(price.hasDiscount, isFalse);
      expect(price.savingsPercent, isNull);
    }
    final free = CatalogPrice(original: 6000, discounted: 0);
    expect(free.current, 0);
    expect(free.savingsPercent, 100);
    expect(CatalogPrice(original: 0, discounted: 0).savingsPercent, isNull);
    expect(catalogMoney(1920), '\$19.20');
  });

  test('Warbond is independent of discount and uses explicit flag', () {
    final warbond = sample('wb', regular: 27500, warbond: true);
    expect(CatalogPrice.forItem(warbond).current, 27500);
    expect(CatalogPrice.forItem(warbond).hasDiscount, isFalse);
    expect(isShopItemFlags(warbond, ['warbond']), isTrue);
    final sale =
        sample('sale', discounted: 4500, title: 'Warbond in name only');
    expect(CatalogPrice.forItem(sale).hasDiscount, isTrue);
    expect(isShopItemFlags(sale, ['warbond']), isFalse);
    final both = sample('both', discounted: 4500, warbond: true);
    expect(CatalogPrice.forItem(both).hasDiscount, isTrue);
    expect(isShopItemFlags(both, ['warbond']), isTrue);
  });

  test(
      'sorting and ranges use discounted native price, not regular or taxed price',
      () {
    final sale = sample('range-sale', regular: 12000, discounted: 9000);
    final regular = sample('range-regular', regular: 10000);
    expect(isShopPriceRange(sale, ['0-100']), isTrue);
    expect(isShopPriceRange(sale, ['100-500']), isFalse);
    expect(sortShopByPrice([regular, sale], true).map((i) => i.id),
        ['range-sale', 'range-regular']);
    expect(sortShopByPrice([sale, regular], false).map((i) => i.id),
        ['range-regular', 'range-sale']);
  });

  test(
      'catalog disk round trip preserves extras; legacy cache remains readable',
      () async {
    final oldPaths = PathProviderPlatform.instance;
    final directory = await Directory.systemTemp.createTemp('catalog-pricing-');
    PathProviderPlatform.instance = _Paths(directory.path);
    SharedPreferences.setMockInitialValues({});
    try {
      final repo = CatalogRepo();
      await repo.readCatalogs();
      final sale =
          sample('disk-sale', regular: 12000, discounted: 9000, warbond: true);
      final regular = sample('disk-regular', regular: 10000);
      final file = await repo.writeCatalogs({
        '45': [regular, sale]
      });
      final raw = jsonDecode(await file.readAsString());
      expect(raw['45'][1]['nativePrice']['discounted'], 9000);
      // Drop the process cache before reloading from the actual JSON file.
      final cache = ShopCatalogCache();
      cache.putDiscounted(sale.id, null);
      cache.putTags(sale.id, []);
      final restored = (await repo.readCatalogs())['45']!;
      expect(restored.map((i) => i.id), ['disk-sale', 'disk-regular']);
      expect(CatalogPrice.forItem(restored.first).current, 9000);
      expect(restored.first.isWarbond, isTrue);
      expect(cache.tagsFor(sale.id), ['Limited Time']);
      // Old files have neither field; they must not reuse stale promotion values.
      await file.writeAsString(jsonEncode({
        '45': [sale.toJson()]
      }));
      final legacy = (await repo.readCatalogs())['45']!.single;
      expect(CatalogPrice.forItem(legacy).current, 12000);
      expect(cache.tagsFor(sale.id), isEmpty);
      // Explicit null in a fresh response also removes an expired promotion.
      cache.putDiscounted(sale.id, 9000);
      cache.readItem({
        'id': sale.id,
        'nativePrice': {'amount': 12000, 'discounted': null}
      });
      expect(CatalogPrice.forItem(sale).hasDiscount, isFalse);
    } finally {
      PathProviderPlatform.instance = oldPaths;
      await directory.delete(recursive: true);
    }
  });

  for (final brightness in Brightness.values) {
    testWidgets(
        'card fits long title, Warbond and discount at large text ($brightness)',
        (tester) async {
      tester.view.physicalSize = const Size(320, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final item = sample('layout-${brightness.name}',
          discounted: 4500,
          warbond: true,
          title: 'Constellation Mk V Centaurus 超长的舰船商品名称');
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(brightness: brightness, useMaterial3: false),
        home: MediaQuery(
            data: MediaQueryData(
                size: const Size(320, 1000),
                textScaler: TextScaler.linear(1.6)),
            child: Scaffold(
                body: ListView(children: [
              ShopItemWidget(
                  catalogProperty: item, catalogTypes: CatalogTypes.package)
            ]))),
      ));
      await tester.pumpAndSettle();
      expect(find.text('战争债券'), findsOneWidget);
      expect(find.text('省 25%'), findsOneWidget);
      expect(find.text('\$45'), findsOneWidget);
      expect(tester.widget<Text>(find.text('\$60')).style!.decoration,
          TextDecoration.lineThrough);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('detail and quantity subtotal share the list sale price',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final item = sample('detail-sale', discounted: 4500, warbond: true);
    final purchase = CatalogPurchaseController(
        add: (_) async {}, prepareCart: () async => () {});
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Builder(
                builder: (context) => TextButton(
                      onPressed: () => showCatalogItemDetail(context, item,
                          purchase: purchase),
                      child: const Text('open'),
                    )))));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('战争债券'), findsOneWidget);
    expect(find.text('省 25%'), findsOneWidget);
    expect(find.text('\$45'), findsNWidgets(2));
    expect(find.text('\$60'), findsOneWidget);
    final plus = find.widgetWithIcon(IconButton, Icons.add);
    await Scrollable.ensureVisible(tester.element(plus), alignment: .5);
    await tester.pumpAndSettle();
    await tester.tap(plus);
    await tester.pumpAndSettle();
    expect(find.text('\$90'), findsOneWidget);
    expect(find.text('最终应付以购物车为准'), findsNothing);
    expect(find.text('每次可添加 1～5 件'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
