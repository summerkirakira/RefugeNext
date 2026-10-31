import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
import 'package:refuge_next/src/datasource/models/searchProperty.dart';
import 'package:refuge_next/src/funcs/search.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/utils.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_filter_bar.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_filter_options.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_search_bottomsheet.dart';

class _Model extends MainDataModel {
  Future<List<UpgradeStep>> Function(int)? loader;
  @override
  Future<void> initUser() async {}
  @override
  Future<void> initialize() async {}
  @override
  Future<List<UpgradeStep>> loadHangarFilterSteps(int slot) =>
      loader?.call(slot) ?? Future.value([]);
}

HangarItem item(int id,
        {int count = 1, bool giftable = true, bool reclaimable = true}) =>
    HangarItem(
      id: id,
      idList: [id],
      name: 'Test $id',
      chineseName: '测试 $id',
      image: '',
      number: count,
      status: 'Attributed',
      tags: [],
      date: '',
      contains: '',
      price: 500,
      insurance: '',
      alsoContains: '',
      chineseAlsoContains: '',
      items: [],
      isUpgrade: true,
      rawData: [],
      ownedBy: '',
      currentPrice: 500,
      canGit: giftable,
      canReclaim: reclaimable,
      canUpgrade: true,
      page: 1,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
      'draft copies all lists; default and legacy all normalize without activating filters',
      () {
    final initial = SearchProperty.empty()..searchType = ['upgrade'];
    final draft = initial.copy();
    draft.searchType.add('ship');
    draft.selectedCCUSlots.add(0);
    expect(initial.searchType, ['upgrade']);
    expect(initial.selectedCCUSlots, isEmpty);
    expect(SearchProperty.empty().hasConditions, isFalse);
    expect(
        (SearchProperty.empty()..searchType = ['all', 'ship'])
            .normalized()
            .searchType,
        ['all']);
    expect((SearchProperty.empty()..searchText = '  ').hasConditions, isFalse);
    toggleFilterValue(draft, HangarFilterField.type, 'all');
    expect(draft.searchType, ['all']);
    toggleFilterValue(draft, HangarFilterField.type, 'paint');
    expect(draft.searchType, ['paint']);
    toggleFilterValue(draft, HangarFilterField.type, 'paint');
    expect(draft.searchType, ['all']);
  });

  test(
      'tokens identify field and value; removing one preserves others and defaults the last',
      () {
    final value = SearchProperty.empty()
      ..searchText = ' Railen '
      ..searchType = ['upgrade']
      ..fromShip = ['123']
      ..selectedCCUSlots = [0]
      ..orderSelected = true;
    final tokens = hangarFilterTokens(value, []);
    expect(tokens.map((t) => t.label),
        containsAll(['名称：Railen', '类型：升级', '起点：ID 123', 'CCU：槽位1', '价格：高到低']));
    var next = value;
    for (final token in tokens) {
      next = token.removedFrom(next);
    }
    expect(next.hasConditions, isFalse);
    expect(value.searchText, ' Railen ');
  });

  test('gift options remain OR, combined with reclaimable by AND', () {
    final items = [
      item(1),
      item(2, giftable: false),
      item(3, reclaimable: false)
    ];
    final filter = SearchProperty.empty()
      ..reclaimStatus = ['giftable', 'reclaimable'];
    expect(processSearch(items, filter, []).map((i) => i.id), [1]);
    filter.reclaimStatus.add('non_giftable');
    expect(processSearch(items, filter, []).map((i) => i.id), [1, 2]);
  });

  test('zero and nonzero filters use melt price, independent of current value',
      () {
    final items = [item(1)..price = 0, item(2), item(3)..price = -1];
    final filter = SearchProperty.empty()..priceRange = ['zero'];
    expect(processSearch(items, filter, []).map((i) => i.id), [1]);
    filter.priceRange = ['non_zero'];
    expect(processSearch(items, filter, []).map((i) => i.id), [2, 3]);
    filter.priceRange = ['all'];
    expect(processSearch(items, filter, []).length, 3);
  });

  test(
      'CCU apply is atomic, failure preserves conditions, clear invalidates pending result',
      () async {
    final model = _Model();
    addTearDown(model.dispose);
    await model.applyHangarSearch(
        SearchProperty.empty()..reclaimStatus = ['giftable']);
    final pending = Completer<List<UpgradeStep>>();
    model.loader = (_) => pending.future;
    final applying =
        model.applyHangarSearch(SearchProperty.empty()..selectedCCUSlots = [0]);
    expect(model.searchProperty!.reclaimStatus, ['giftable']);
    pending.completeError(StateError('Cannot read saved chain'));
    await expectLater(applying, throwsStateError);
    expect(model.searchProperty!.reclaimStatus, ['giftable']);
    final next = Completer<List<UpgradeStep>>();
    model.loader = (_) => next.future;
    final stale =
        model.applyHangarSearch(SearchProperty.empty()..selectedCCUSlots = [1]);
    model.clearSearch();
    next.complete([]);
    expect(await stale, isFalse);
    expect(model.searchProperty, isNull);
  });

  test('new request and dismissed editor prevent stale application', () async {
    final model = _Model();
    addTearDown(model.dispose);
    final pending = Completer<List<UpgradeStep>>();
    model.loader = (_) => pending.future;
    final old =
        model.applyHangarSearch(SearchProperty.empty()..selectedCCUSlots = [0]);
    await model
        .applyHangarSearch(SearchProperty.empty()..searchText = 'latest');
    pending.complete([]);
    expect(await old, isFalse);
    expect(model.searchProperty!.searchText, 'latest');
    expect(
        await model.applyHangarSearch(
            SearchProperty.empty()..searchText = 'closed',
            isCurrent: () => false),
        isFalse);
    expect(model.searchProperty!.searchText, 'latest');
    await model.applyHangarSearch(SearchProperty.empty());
    expect(model.isSearched, isFalse);
  });

  testWidgets(
      'editor refills values, cancels drafts, resets locally and confirms once',
      (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    await model.applyHangarSearch(SearchProperty.empty()
      ..searchText = 'Railen'
      ..searchType = ['upgrade']);
    await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
      value: model,
      child: MaterialApp(
          home: Scaffold(
              body: Builder(
                  builder: (context) => TextButton(
                        onPressed: () => showHangarSearch(context),
                        child: const Text('open'),
                      )))),
    ));
    Future<void> open() async {
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    await open();
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        'Railen');
    final upgrade = find.byKey(const ValueKey('filter-type-upgrade'));
    expect(tester.widget<FilterChip>(upgrade).selected, isTrue);
    await tester.enterText(find.byType(TextField), 'cancelled');
    await tester.tap(find.byTooltip('关闭并放弃修改'));
    await tester.pumpAndSettle();
    expect(model.searchProperty!.searchText, 'Railen');
    await open();
    await tester.tap(find.text('重置'));
    await tester.pumpAndSettle();
    expect(model.searchProperty!.searchType, ['upgrade']);
    expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text, '');
    final zero = find.byKey(const ValueKey('filter-price-zero'));
    final nonzero = find.byKey(const ValueKey('filter-price-non_zero'));
    expect(zero, findsOneWidget);
    expect(find.text('0–100'), findsNothing);
    await Scrollable.ensureVisible(tester.element(zero), alignment: .5);
    await tester.pumpAndSettle();
    await tester.tap(zero);
    await tester.pumpAndSettle();
    expect(tester.widget<FilterChip>(zero).selected, isTrue);
    await tester.tap(nonzero);
    await tester.pumpAndSettle();
    expect(tester.widget<FilterChip>(zero).selected, isFalse);
    expect(tester.widget<FilterChip>(nonzero).selected, isTrue);
    await tester.tap(nonzero);
    await tester.pumpAndSettle();
    expect(tester.widget<FilterChip>(nonzero).selected, isFalse);
    Future<void> selectSort(String label) async {
      final sort = find.byType(DropdownButtonFormField<int>);
      await tester.ensureVisible(sort);
      await tester.pumpAndSettle();
      await tester.tap(sort);
      await tester.pumpAndSettle();
      await tester.tap(find.text(label).last);
      await tester.pumpAndSettle();
    }

    await selectSort('可融价从低到高');
    await selectSort('可融价从高到低');
    await selectSort('默认顺序');
    await tester.tap(find.text('应用筛选'));
    await tester.pumpAndSettle();
    expect(model.searchProperty, isNull);
    expect(tester.takeException(), isNull);
  });

  for (final brightness in Brightness.values) {
    testWidgets(
        'single-row conditions scroll without overflow at large text ($brightness)',
        (tester) async {
      tester.view.physicalSize = const Size(320, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final property = SearchProperty.empty()
        ..searchType = ['ship', 'upgrade', 'paint']
        ..reclaimStatus = ['giftable', 'reclaimable']
        ..searchText = '很长的舰船名称 ' * 6
        ..fromShip = ['123']
        ..selectedCCUSlots = [0, 1, 2, 3]
        ..orderSelected = true;
      final tokens = hangarFilterTokens(property, []);
      SearchProperty? applied;
      final semantics = tester.ensureSemantics();

      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(brightness: brightness),
        home: MediaQuery(
          data: const MediaQueryData(
              size: Size(320, 900), textScaler: TextScaler.linear(1.8)),
          child: Scaffold(
              body: Column(children: [
            HangarFilterBar(
              property: property,
              items: [],
              onApply: (value) async {
                applied = value;
                return true;
              },
              onClear: () {},
              onEdit: () {},
            )
          ])),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.textContaining('匹配'), findsNothing);
      expect(find.textContaining('展开'), findsNothing);
      expect(find.text('修改筛选'), findsNothing);
      expect(find.byType(InputChip), findsNWidgets(tokens.length));
      final rows = find
          .byType(InputChip)
          .evaluate()
          .map((e) => tester.getTopLeft(find.byWidget(e.widget)).dy)
          .toSet();
      expect(rows.length, 1);
      expect(tester.getSize(find.byType(HangarFilterBar)).width, 320);
      expect(tester.takeException(), isNull);
      final scrollable = tester.state<ScrollableState>(find.descendant(
          of: find.byType(HangarFilterBar), matching: find.byType(Scrollable)));
      expect(scrollable.position.maxScrollExtent, greaterThan(0));
      await tester.drag(find.byKey(const ValueKey('hangar-filter-scroll')),
          const Offset(-200, 0));
      await tester.pumpAndSettle();
      expect(scrollable.position.pixels, greaterThan(0));
      scrollable.position.jumpTo(scrollable.position.maxScrollExtent);
      await tester.pumpAndSettle();
      expect(find.text('清除全部').hitTestable(), findsOneWidget);
      final delete = find.byTooltip('移除${tokens.first.label}');
      await tester.ensureVisible(delete);
      await tester.pumpAndSettle();
      await tester.tap(delete);
      await tester.pumpAndSettle();
      expect(applied!.searchText, isNull);
      expect(applied!.reclaimStatus, ['giftable', 'reclaimable']);
      semantics.dispose();
    });
  }
}
