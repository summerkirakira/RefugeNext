import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';
import 'package:refuge_next/src/datasource/models/shop_search_property.dart';
import 'package:refuge_next/src/funcs/search.dart';
import 'package:refuge_next/src/widgets/shop/shop_filter_bar.dart';
import 'package:refuge_next/src/widgets/shop/shop_filter_options.dart';
import 'package:refuge_next/src/widgets/shop/shop_search_bottomsheet.dart';
import 'package:refuge_next/src/widgets/shop/shop_page/shop_page.dart';
import 'catalog_pricing_test.dart' show sample;

class _Model extends MainDataModel {
  final catalog = <CatalogTypes, List<CatalogProperty>>{};
  @override
  Future<void> initUser() async {}
  @override
  Future<void> initialize() async {}
  @override
  Future<void> refreshCatalog(CatalogTypes type) async {}
  @override
  List<CatalogProperty> getCataLog(CatalogTypes type) =>
      processShopSearch(catalog[type] ?? [], shopSearchProperty);
}

Future<void> _launch(WidgetTester tester, _Model model,
    {Size size = const Size(390, 844),
    Brightness brightness = Brightness.light,
    double scale = 1}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  addTearDown(tester.view.resetViewInsets);
  await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
    value: model,
    child: MaterialApp(
      theme: ThemeData(useMaterial3: false, brightness: brightness),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: TextScaler.linear(scale)),
        child: child!,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Builder(
                builder: (context) => TextButton(
                      onPressed: () => showShopSearch(context),
                      child: const Text('搜索入口'),
                    )),
            bottom: const TabBar(tabs: [Tab(text: '舰船分类'), Tab(text: '涂装分类')]),
          ),
          body: const TabBarView(children: [
            CatalogPage(catalogTypes: CatalogTypes.standAloneShip),
            CatalogPage(catalogTypes: CatalogTypes.paints),
          ]),
        ),
      ),
    ),
  ));
  await tester.pumpAndSettle();
}

Future<void> tapKey(WidgetTester tester, String key) async {
  final finder = find.byKey(ValueKey(key));
  await tester.ensureVisible(finder);
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

void main() {
  test('draft and applied conditions are independent; defaults normalize away',
      () {
    final model = _Model();
    addTearDown(model.dispose);
    final original = ShopSearchProperty.empty()
      ..searchText = '  Aurora  '
      ..priceRange = ['0-100']
      ..itemFlags = ['warbond'];
    final draft = ShopSearchDraft(original);
    addTearDown(draft.dispose);
    draft.value.searchType.add('ship');
    draft.value.stockStatus.add('available');
    draft.value.priceRange[0] = '100-500';
    draft.value.itemFlags.clear();
    expect(original.searchType, ['all']);
    expect(original.stockStatus, ['all']);
    expect(original.priceRange, ['0-100']);
    expect(original.itemFlags, ['warbond']);
    model.updateShopSearchProperty(original);
    original.priceRange.clear();
    expect(model.shopSearchProperty!.priceRange, ['0-100']);
    expect(model.shopSearchProperty!.searchText, 'Aurora');
    expect(
        (ShopSearchProperty.empty()..priceRange = ['all', '0-100'])
            .normalized()
            .priceRange,
        ['all']);
    model.updateShopSearchProperty(
        ShopSearchProperty.empty()..searchText = '  ');
    expect(model.shopSearchProperty, isNull);
  });

  test('each token removes only its own condition', () {
    final original = ShopSearchProperty.empty()
      ..searchText = 'Aurora'
      ..priceRange = ['0-100']
      ..itemFlags = ['warbond']
      ..orderSelected = true
      ..priceOrder = true;
    var next = original;
    final tokens = shopFilterTokens(original);
    expect(tokens.length, 4);
    for (final token in tokens) {
      final count = shopFilterTokens(next).length;
      next = token.removedFrom(next);
      expect(shopFilterTokens(next).length, count - 1);
    }
    expect(next.hasConditions, isFalse);
    expect(original.hasConditions, isTrue);
  });

  test('ranges retain cent boundaries, discounted USD prices and Warbond flag',
      () {
    final items = [
      sample('sale',
          regular: 60000, discounted: 10000, warbond: true, title: 'Aurora'),
      sample('middle', regular: 10001, warbond: true, title: 'Aurora'),
      sample('boundary', regular: 50000),
      sample('high', regular: 50001),
      sample('title-only', regular: 5000, title: 'Warbond'),
    ];
    expect(items.where((i) => isShopPriceRange(i, ['0-100'])).map((i) => i.id),
        ['sale', 'title-only']);
    expect(
        items.where((i) => isShopPriceRange(i, ['100-500'])).map((i) => i.id),
        ['middle', 'boundary']);
    expect(items.where((i) => isShopPriceRange(i, ['500+'])).map((i) => i.id),
        ['high']);
    final filter = ShopSearchProperty.empty()
      ..itemFlags = ['warbond']
      ..searchText = ' AURORA '
      ..orderSelected = true
      ..priceOrder = false;
    expect(
        processShopSearch(items, filter).map((i) => i.id), ['middle', 'sale']);
    items.first.title = '极光';
    filter.searchText = '极光';
    expect(processShopSearch(items, filter).single.id, 'sale');
  });

  testWidgets(
      'reopen fills conditions; close and back discard edits; keyboard applies',
      (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    model.updateShopSearchProperty(ShopSearchProperty.empty()
      ..searchText = 'Aurora'
      ..priceRange = ['0-100']);
    await _launch(tester, model);
    await tester.tap(find.text('搜索入口'));
    await tester.pumpAndSettle();
    final text = find.byKey(const ValueKey('shop-search-text'));
    expect(tester.widget<TextField>(text).controller!.text, 'Aurora');
    expect(
        tester
            .widget<ChoiceChip>(find.byKey(const ValueKey('shop-price-0-100')))
            .selected,
        isTrue);
    await tester.enterText(text, 'Avenger');
    await tapKey(tester, 'shop-price-100-500');
    await tapKey(tester, 'shop-version-warbond');
    expect(
        tester
            .widget<ChoiceChip>(find.byKey(const ValueKey('shop-price-0-100')))
            .selected,
        isFalse);
    expect(model.shopSearchProperty!.searchText, 'Aurora');
    expect(model.shopSearchProperty!.priceRange, ['0-100']);
    await tester.tap(find.byTooltip('关闭并放弃修改'));
    await tester.pumpAndSettle();
    expect(model.shopSearchProperty!.searchText, 'Aurora');
    await tester.tap(find.text('搜索入口'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('重置'));
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(text).controller!.text, '');
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(model.shopSearchProperty!.searchText, 'Aurora');
    await tester.tap(find.text('搜索入口'));
    await tester.pumpAndSettle();
    await tapKey(tester, 'shop-price-100-500');
    await tapKey(tester, 'shop-version-warbond');
    await tester.enterText(text, '  Avenger  ');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();
    expect(find.byType(ShopSearchFields), findsNothing);
    expect(model.shopSearchProperty!.searchText, 'Avenger');
    expect(model.shopSearchProperty!.priceRange, ['100-500']);
    expect(model.shopSearchProperty!.itemFlags, ['warbond']);
    expect(tester.takeException(), isNull);
  });

  testWidgets('sort and reset are applied together, never live',
      (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    await _launch(tester, model);
    await tester.tap(find.text('搜索入口'));
    await tester.pumpAndSettle();
    await tapKey(tester, 'shop-sort-0');
    await tester.tap(find.text('价格从高到低').last);
    await tester.pumpAndSettle();
    expect(model.shopSearchProperty, isNull);
    await tapKey(tester, 'shop-search-apply');
    expect(model.shopSearchProperty!.orderSelected, isTrue);
    expect(model.shopSearchProperty!.priceOrder, isFalse);
    await tester.tap(find.text('搜索入口'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('shop-sort-2')), findsOneWidget);
    await tester.tap(find.text('重置'));
    await tester.pumpAndSettle();
    expect(model.shopSearchProperty!.orderSelected, isTrue);
    await tapKey(tester, 'shop-search-apply');
    expect(model.shopSearchProperty, isNull);
    expect(find.byType(ShopFilterBar), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('horizontal tokens edit, remove and clear across categories',
      (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    model.updateShopSearchProperty(ShopSearchProperty.empty()
      ..searchText = 'Aurora 极光超长商品名称'
      ..priceRange = ['100-500']
      ..itemFlags = ['warbond']
      ..orderSelected = true);
    await _launch(tester, model, size: const Size(320, 780));
    await tester.tap(find.text('涂装分类'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('shop-active-text')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('shop-active-text')));
    await tester.pumpAndSettle();
    expect(find.byType(ShopSearchFields), findsOneWidget);
    await tester.tap(find.byTooltip('关闭并放弃修改'));
    await tester.pumpAndSettle();
    await tester.drag(find.byKey(const ValueKey('shop-filter-scroll')),
        const Offset(-280, 0));
    await tester.pumpAndSettle();
    final chip = find.byKey(const ValueKey('shop-active-price'));
    await tester.ensureVisible(chip);
    await tester
        .tap(find.descendant(of: chip, matching: find.byIcon(Icons.close)));
    await tester.pumpAndSettle();
    expect(model.shopSearchProperty!.priceRange, ['all']);
    expect(model.shopSearchProperty!.itemFlags, ['warbond']);
    expect(find.text('修改筛选'), findsOneWidget);
    await tester.tap(find.text('修改筛选'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('关闭并放弃修改'));
    await tester.pumpAndSettle();
    await tester.drag(find.byKey(const ValueKey('shop-filter-scroll')),
        const Offset(-800, 0));
    await tester.pumpAndSettle();
    await tester.tap(find.text('清除全部').hitTestable());
    await tester.pumpAndSettle();
    expect(model.shopSearchProperty, isNull);
    expect(find.byType(ShopFilterBar), findsNothing);
    expect(find.text('清除筛选'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  for (final brightness in Brightness.values) {
    for (final size in [const Size(320, 780), const Size(840, 1000)]) {
      testWidgets(
          'search fits $brightness at $size with keyboard and large text',
          (tester) async {
        final model = _Model();
        addTearDown(model.dispose);
        await _launch(tester, model,
            size: size, brightness: brightness, scale: 1.4);
        await tester.tap(find.text('搜索入口'));
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byKey(const ValueKey('shop-search-text')), 'Aurora');
        tester.view.viewInsets = const FakeViewPadding(bottom: 300);
        await tester.pumpAndSettle();
        final button = find.byKey(const ValueKey('shop-search-apply'));
        expect(button.hitTestable(), findsOneWidget);
        expect(tester.getBottomRight(button).dy,
            lessThanOrEqualTo(size.height - 300));
        expect(tester.takeException(), isNull);
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(model.shopSearchProperty!.searchText, 'Aurora');
        expect(tester.takeException(), isNull);
      });
    }
  }
}
