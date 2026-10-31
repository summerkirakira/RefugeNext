import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
import 'package:refuge_next/src/datasource/models/searchProperty.dart';
import 'package:refuge_next/src/network/cirno/property/property.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_ship_picker.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_search_bottomsheet.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/utils.dart';

const choices = [
  HangarShipChoice('1', 'Railen', '锐伦', ['railen alias']),
  HangarShipChoice('2', 'Ironclad', '铁甲', ['iron']),
];

class _Model extends MainDataModel {
  @override
  Future<void> initUser() async {}
  @override
  Future<void> initialize() async {}
  @override
  Future<List<UpgradeStep>> loadHangarFilterSteps(int slot) async => [];
  @override
  List<HangarItem> get rawHangarItems => [_item()];
}

HangarItem _item() => HangarItem(
      id: 1,
      idList: [1],
      name: 'upgrade',
      image: '',
      number: 1,
      status: 'Attributed',
      tags: [],
      date: '',
      contains: '',
      price: 500,
      insurance: '',
      alsoContains: '',
      items: [],
      isUpgrade: true,
      rawData: [],
      ownedBy: '',
      currentPrice: 500,
      canGit: true,
      canReclaim: true,
      canUpgrade: true,
      page: 1,
      fromShip: ShipAlias(
          id: 1,
          name: 'Railen',
          chineseName: '锐伦',
          alias: ['railen alias'],
          skus: []),
      toShip: ShipAlias(
          id: 2, name: 'Ironclad', chineseName: '铁甲', alias: [], skus: []),
    );

void main() {
  test('ship choices search English, Chinese, aliases and IDs', () {
    expect(choices[0].matches(' RAILEN '), isTrue);
    expect(choices[0].matches('锐'), isTrue);
    expect(choices[0].matches('alias'), isTrue);
    expect(choices[0].matches('1'), isTrue);
    expect(choices[0].matches('Ironclad'), isFalse);
  });

  testWidgets(
      'picker sorts selected first, preserves hidden selections, and returns only on Done',
      (tester) async {
    List<String>? result;
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Builder(
                builder: (context) => TextButton(
                      onPressed: () async {
                        result = await showHangarShipPicker(context,
                            title: '目标舰船',
                            choices: choices,
                            selected: ['2', '999']);
                      },
                      child: const Text('open'),
                    )))));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    final tiles = tester
        .widgetList<CheckboxListTile>(find.byType(CheckboxListTile))
        .toList();
    expect(tiles.take(2).every((tile) => tile.value == true), isTrue);
    expect(find.text('ID 999'), findsOneWidget);
    await tester.enterText(
        find.byKey(const ValueKey('hangar-ship-query')), 'RAILEN');
    await tester.pump();
    expect(find.byType(CheckboxListTile), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('ship-choice-1')));
    await tester.pump();
    expect(result, isNull);
    await tester.enterText(
        find.byKey(const ValueKey('hangar-ship-query')), 'not-found');
    await tester.pump();
    expect(find.text('没有匹配的舰船'), findsOneWidget);
    await tester.tap(find.text('完成（3）'));
    await tester.pumpAndSettle();
    expect(result, unorderedEquals(['1', '2', '999']));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('清空选择'));
    await tester.pump();
    await tester.tap(find.byTooltip('取消舰船选择'));
    await tester.pumpAndSettle();
    expect(result, isNull);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
      'ship picker updates only editor draft; gift and reclaim remain independent',
      (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    await model.applyHangarSearch(SearchProperty.empty()
      ..reclaimStatus = ['giftable', 'non_giftable', 'reclaimable']);
    await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
      value: model,
      child: MaterialApp(
          theme: ThemeData(useMaterial3: false),
          home: Scaffold(
              body: Builder(
                  builder: (context) => TextButton(
                        onPressed: () => showHangarSearch(context),
                        child: const Text('open'),
                      )))),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<FilterChip>(find.byKey(const ValueKey('gift-all')))
            .selected,
        isTrue);
    expect(
        tester
            .widget<FilterChip>(find.byKey(const ValueKey('reclaim-true')))
            .selected,
        isTrue);
    await tester.tap(find.byKey(const ValueKey('gift-giftable')));
    await tester.pump();
    expect(
        tester
            .widget<FilterChip>(find.byKey(const ValueKey('gift-non_giftable')))
            .selected,
        isFalse);
    final shipField = find.byKey(const ValueKey('ship-field-from'));
    await tester.ensureVisible(shipField);
    await tester.pumpAndSettle();
    await tester.tap(shipField);
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('hangar-ship-query')), '锐伦');
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey('ship-choice-1')));
    await tester.pump();
    await tester.tap(find.text('完成（1）'));
    await tester.pumpAndSettle();
    expect(model.searchProperty!.fromShip, ['all']);
    await tester.tap(find.text('应用筛选'));
    await tester.pumpAndSettle();
    expect(model.searchProperty!.fromShip, ['1']);
    expect(model.searchProperty!.reclaimStatus, ['giftable', 'reclaimable']);
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('锐伦'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.tap(find.byTooltip('关闭并放弃修改'));
    await tester.pumpAndSettle();
  });
  testWidgets('advanced selections remain summarized when collapsed',
      (tester) async {
    final draft = HangarSearchDraft(SearchProperty.empty()
      ..searchStatus = ['attributed']
      ..selectedCCUSlots = [2]);
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
      child: HangarSearchFields(draft: draft, items: const []),
    ))));
    expect(find.byKey(const ValueKey('slot-2')), findsNothing);
    expect(find.text('状态：在库 · CCU：槽位3'), findsOneWidget);
    final more = find.byKey(const ValueKey('hangar-more-filters'));
    await tester.ensureVisible(more);
    await tester.tap(more);
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<FilterChip>(find.byKey(const ValueKey('slot-2')))
            .selected,
        isTrue);
    await tester.ensureVisible(more);
    await tester.tap(more);
    await tester.pumpAndSettle();
    expect(draft.value.selectedCCUSlots, [2]);
    expect(find.byKey(const ValueKey('slot-2')), findsNothing);
  });

  testWidgets(
      'ship picker fits a narrow dark screen with keyboard and large text',
      (tester) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    tester.view.viewInsets = const FakeViewPadding(bottom: 250);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(useMaterial3: false, brightness: Brightness.dark),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.4)),
          child: child!),
      home: Scaffold(
          body: Builder(
              builder: (context) => TextButton(
                    onPressed: () => showHangarShipPicker(context,
                        title: '起始舰船', choices: choices, selected: ['1']),
                    child: const Text('open'),
                  ))),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('hangar-ship-query')), findsOneWidget);
    expect(find.text('完成（1）').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
