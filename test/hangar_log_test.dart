import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/datasource/models/hangar/hangar_log.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
import 'package:refuge_next/src/repo/hangar_log.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_log/hangar_log_bottomsheet.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_log/hangar_log_entry.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_log/hangar_log_page.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

HangarLog log(String id,
        {String type = 'CREATED',
        String? target = '1',
        int? time,
        int? price,
        String? source,
        String? reason,
        String name = 'Test ship',
        String? order}) =>
    HangarLog(
      id: id,
      time: time ?? DateTime(2026, 9, 22, 18, 5).millisecondsSinceEpoch,
      type: type,
      name: name,
      target: target,
      source: source,
      reason: reason,
      price: price,
      order: order,
      insertTime: 0,
    );

class _Repo extends Fake implements HangarLogRepo {
  List<HangarLog> cached = [];
  Completer<List<HangarLog>>? pending;
  int requests = 0;

  @override
  Future<List<HangarLog>> readHangarLogs() async => cached;

  @override
  Future<List<HangarLog>> refreshHangarLogs() {
    requests++;
    return pending?.future ?? Future.value(cached);
  }
}

class _Model extends MainDataModel {
  final repo = _Repo();
  @override
  HangarLogRepo get hangarLogRepo => repo;
  @override
  Future<void> initUser() async {}
  @override
  Future<void> initialize() async {}
  @override
  bool get enableHangarTranslation => false;
}

class _Item extends Fake implements HangarItem {
  @override
  int get id => 1;
  @override
  List<int> get idList => [1, 2, 2];
  @override
  String get name => 'Stacked ship';
  @override
  String? get chineseName => null;
}

HangarLogEntry entry(HangarLog value) =>
    HangarLogEntry(value, translate: (value) => value);

Widget _page(_Model model, {Set<int>? ids, bool dark = false}) =>
    ChangeNotifierProvider<MainDataModel>.value(
      value: model,
      child: MaterialApp(
        theme: ThemeData(
            colorSchemeSeed: Colors.blue,
            brightness: dark ? Brightness.dark : Brightness.light),
        home: Scaffold(
          body: CustomScrollView(slivers: [HangarLogPage(targetItemIds: ids)]),
        ),
      ),
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('汇总多个物品，按 ID 去重，时间倒序且相同时间保持顺序', () async {
    final model = _Model();
    addTearDown(model.dispose);
    final a = log('a', time: 100);
    model.repo.cached = [
      a,
      log('b', target: '2', time: 300),
      a,
      log('c', target: '2', time: 300),
      log('other', target: '9', time: 500),
      log('unknown', target: 'not-a-number', time: 400),
    ];
    await model.readHangarLogs();
    expect(model.getHangarLogsByTargetIds([1, 2, 2]).map((v) => v.id),
        ['b', 'c', 'a']);
    expect(model.getHangarLogByTargetId(1).map((v) => v.id), ['a']);
    expect(model.getHangarLogsByTargetIds([]), isEmpty);
    expect(model.getHangarLogsByTargetIds(null).length, 5);
    expect(model.hangarLogs.length, 6);
  });

  test('金额保持分单位，区分零值与缺失及不同操作语义', () {
    expect(entry(log('a')).amount, isNull);
    expect(entry(log('a', price: 0)).amount, '\$0');
    expect(entry(log('a', price: 21500)).amount, '\$215');
    expect(entry(log('a', price: 1234)).amount, '\$12.34');
    expect(entry(log('a')).amountLabel, '购买价值');
    expect(entry(log('a', type: 'RECLAIMED')).amountLabel, '回收金额');
    expect(entry(log('a', type: 'APPLIED_UPGRADE')).amountLabel, '升级后价值');
  });

  test('升级、消耗、命名字段与缺失信息显示正确', () {
    final upgrade = entry(log('a',
        type: 'APPLIED_UPGRADE',
        source: '123',
        reason: 'Upgrade - Carrack to Perseus'));
    expect(upgrade.summary, '使用 Upgrade - Carrack to Perseus');
    expect(upgrade.details, contains(('CCU 编号', '123')));
    expect(
        entry(log('a', type: 'CONSUMED', source: '321')).summary, '用于物品 #321');
    for (final type in ['NAME_CHANGE', 'NAME_CHANGE_RECLAIMED']) {
      final named = entry(
          log('a', type: type, source: 'Actual name', reason: 'S-CRSD-SHIP'));
      expect(named.summary, contains('Actual name'));
      expect(named.summary, isNot(contains('S-CRSD-SHIP')));
    }
    final unknown = entry(log('a', type: 'FUTURE_EVENT', target: null));
    expect(unknown.title, '物品记录');
    expect(unknown.details, contains(('记录类型', 'FUTURE_EVENT')));
    expect(unknown.details.any((v) => v.$2.contains('null')), isFalse);
    expect(entry(log('a', type: 'APPLIED_UPGRADE')).summary, isNull);
  });

  test('并发刷新合并，失败保留已有记录，重试成功清除错误', () async {
    final model = _Model();
    addTearDown(model.dispose);
    model.repo.cached = [log('old')];
    await model.readHangarLogs();
    model.repo.pending = Completer();
    var notifications = 0;
    model.addListener(() => notifications++);
    final first = model.refreshHangarLogs();
    final second = model.refreshHangarLogs();
    expect(identical(first, second), isTrue);
    expect(model.repo.requests, 1);
    expect(model.isRefreshingHangarLogs, isTrue);
    model.repo.pending!.completeError(StateError('offline'));
    await first;
    expect(model.hangarLogs.single.id, 'old');
    expect(model.hangarLogError, isNotNull);
    expect(model.isRefreshingHangarLogs, isFalse);
    model.repo.pending = Completer();
    final retry = model.refreshHangarLogs();
    model.repo.pending!.complete([log('new')]);
    await retry;
    expect(model.hangarLogs.single.id, 'new');
    expect(model.hangarLogError, isNull);
    expect(notifications, 4);
  });

  testWidgets('刷新后自动更新，展开状态保留且显示 24 小时制', (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    model.repo.cached = [log('a', price: 0, order: 'ORDER123')];
    await model.readHangarLogs();
    model.repo.pending = Completer();
    await tester.pumpWidget(_page(model, ids: {1, 2}));
    await tester.pump();
    expect(find.text('18:05'), findsOneWidget);
    expect(find.text('购买价值 \$0'), findsOneWidget);
    expect(find.text('#1'), findsOneWidget);
    await tester.tap(find.text('购买物品'));
    await tester.pump();
    expect(find.text('ORDER123'), findsOneWidget);
    model.repo.pending!.complete([
      ...model.repo.cached,
      log('b', target: '2', type: 'GIFT', time: 0),
    ]);
    await tester.pumpAndSettle();
    expect(find.text('2 件物品 · 共 2 条记录'), findsOneWidget);
    expect(find.text('ORDER123'), findsOneWidget);
    expect(model.repo.requests, 1);
    expect(tester.takeException(), isNull);
  });

  for (final dark in [false, true]) {
    testWidgets('窄屏长名称与展开详情无溢出 dark=$dark', (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final model = _Model();
      addTearDown(model.dispose);
      model.repo.cached = [
        log('a',
            type: 'APPLIED_UPGRADE',
            name: 'Standalone Ship - A very long ship package name ' * 3,
            reason: 'Upgrade - Carrack to Perseus Warbond Edition ' * 3,
            order: 'ABCDEFGHIJKLMN0123456789' * 4,
            price: 1234567),
      ];
      await model.readHangarLogs();
      await tester.pumpWidget(_page(model, dark: dark));
      await tester.pumpAndSettle();
      await tester.tap(find.text('应用升级'));
      await tester.pumpAndSettle();
      expect(find.text('订单号'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('只有真实剩余记录才显示加载更多，每次增加 50 条', (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    model.repo.cached = List.generate(51, (i) => log('$i', name: 'Item $i'));
    await model.readHangarLogs();
    await tester.pumpWidget(_page(model));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('加载更多（剩余 1 条）'), 600);
    await tester.tap(find.text('加载更多（剩余 1 条）'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Item 50'), 200);
    expect(find.text('加载更多（剩余 1 条）'), findsNothing);
    expect(find.text('Item 50'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('无缓存时显示加载，失败重试后进入空状态', (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    model.repo.pending = Completer();
    await tester.pumpWidget(_page(model));
    await tester.pump();
    expect(find.text('正在加载日志…'), findsOneWidget);
    model.repo.pending!.completeError(StateError('offline'));
    await tester.pumpAndSettle();
    expect(find.text('日志刷新失败，请重试'), findsOneWidget);
    model.repo.pending = null;
    await tester.tap(find.text('重试'));
    await tester.pumpAndSettle();
    expect(find.text('暂无日志记录'), findsOneWidget);
  });

  testWidgets('总日志弹窗刷新与关闭使用正确导航上下文', (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
      value: model,
      child: MaterialApp(
        home: Builder(builder: (context) {
          return Scaffold(
            body: TextButton(
              child: const Text('打开'),
              onPressed: () => WoltModalSheet.show<void>(
                context: context,
                pageListBuilder: (modalContext) =>
                    [getHangarLogBottomSheet(modalContext)],
              ),
            ),
          );
        }),
      ),
    ));
    await tester.tap(find.text('打开'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('返回物品详情'), findsNothing);
    await tester.tap(find.byTooltip('刷新日志'));
    await tester.pumpAndSettle();
    expect(model.repo.requests, 2);
    await tester.tap(find.byTooltip('关闭日志'));
    await tester.pumpAndSettle();
    expect(find.text('打开'), findsOneWidget);
    expect(find.text('机库日志'), findsNothing);
    expect(tester.takeException(), isNull);
  });
  testWidgets('物品日志往返详情无标题栏溢出，使用全部堆叠编号', (tester) async {
    final model = _Model();
    addTearDown(model.dispose);
    model.repo.cached = [
      log('a'),
      log('b', target: '2'),
      log('c', target: '3')
    ];
    await model.readHangarLogs();
    await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
      value: model,
      child: MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                  body: TextButton(
                    child: const Text('打开详情'),
                    onPressed: () => WoltModalSheet.show<void>(
                      context: context,
                      pageListBuilder: (modalContext) => [
                        WoltModalSheetPage(
                          navBarHeight: 1,
                          child: TextButton(
                            child: const Text('查看日志'),
                            onPressed: () {
                              final modal = WoltModalSheet.of(modalContext);
                              modal.addPage(getHangarLogBottomSheet(
                                  modalContext,
                                  item: _Item()));
                              modal.showAtIndex(1);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    ));
    await tester.tap(find.text('打开详情'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('查看日志'));
    await tester.pumpAndSettle();
    expect(find.text('2 件物品 · 共 2 条记录'), findsOneWidget);
    expect(find.text('Test ship'), findsNothing);
    await tester.tap(find.byTooltip('返回物品详情'));
    await tester.pumpAndSettle();
    expect(find.text('查看日志'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
