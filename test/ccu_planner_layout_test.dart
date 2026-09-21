import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:refuge_next/src/datasource/models/ccu_plan.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/ccu_planner_components.dart';

const ship = CcuShipView(
    name: '赫拉克勒斯 星际运输舰 限定纪念版本',
    englishName: 'Hercules Starlifter Special Edition',
    price: 123456789);
const edge = CcuOffer(
    id: 'buyback:77',
    fromShipId: 1,
    toShipId: 2,
    source: 'buyback',
    cost: 123456789,
    itemId: 77);
const estimatedEdge = CcuOffer(
    id: 'estimate:1:2',
    fromShipId: 1,
    toShipId: 2,
    source: 'standard',
    cost: 3000);
const plan = CcuPlan(
    scenario: 'waiting',
    steps: [edge],
    ownedCost: 555,
    additionalCost: 123456789,
    totalCost: 123457344,
    regularCost: 123457444,
    savings: 100,
    pendingSteps: 1);

void main() {
  for (final width in [390.0, 768.0, 1280.0]) {
    for (final dark in [false, true]) {
      testWidgets(
          '$width ${dark ? 'dark' : 'light'} supports large text and lazy routes',
          (tester) async {
        tester.view.reset();
        tester.view.physicalSize = Size(width, 900);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final built = <int>{};
        await tester.pumpWidget(MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.blue,
                    brightness: dark ? Brightness.dark : Brightness.light)),
            home: MediaQuery(
                data: MediaQueryData(
                    size: Size(width, 900),
                    textScaler: const TextScaler.linear(1.8)),
                child: Scaffold(
                    body: CcuPlannerLayout(
                  headerBuilder: (context, openSettings) => Row(children: [
                    const Expanded(child: Text('升级规划')),
                    if (openSettings != null)
                      IconButton(
                          tooltip: '规划设置',
                          onPressed: openSettings,
                          icon: const Icon(Icons.tune)),
                  ]),
                  ships: CcuShipSelector(
                      label: '目标舰船',
                      ship: ship,
                      compact: width < 600,
                      onTap: () {}),
                  settings: Column(children: [
                    const Text('设置内容'),
                    for (final label in ['机库 CCU', '回购', '历史 WB'])
                      Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: CcuSourceOption(
                              label: label,
                              icon: Icons.inventory_2_outlined,
                              value: label != '历史 WB',
                              onChanged: (_) {})),
                  ]),
                  actions: const Text('计算方案'),
                  results: Column(children: [
                    CcuPlanChoice(
                        plan: plan,
                        number: 1,
                        selected: true,
                        onSelected: () {}),
                    const CcuCostSummary(plan: plan),
                    const CcuNotice(message: '以下为旧结果，请重新计算。'),
                  ]),
                  stepCount: 80,
                  stepBuilder: (context, index) {
                    built.add(index);
                    return CcuRouteStep(
                        edge: index.isEven ? estimatedEdge : edge,
                        index: index,
                        from: ship,
                        to: ship,
                        last: index == 79,
                        pinned: false,
                        onPin: () {},
                        onExclude: () {});
                  },
                )))));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(built.length, lessThan(80));
        expect(
            find.text('设置内容'), width >= 1000 ? findsOneWidget : findsNothing);
        expect(find.byTooltip('规划设置'),
            width < 1000 ? findsOneWidget : findsNothing);
        final scroll = find.byType(CustomScrollView);
        await tester.drag(scroll, const Offset(0, -1100));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(built, isNotEmpty);
        expect(built.length, lessThan(80));
      });
    }
  }

  for (final size in [const Size(390, 700), const Size(568, 320)]) {
    testWidgets('settings sheet at $size stays synced and scrollable',
        (tester) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      var selected = true;
      var loading = false;
      var changes = 0;
      late StateSetter updatePage;
      await tester.pumpWidget(MaterialApp(
          builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.8)),
              child: child!),
          home: Scaffold(body: StatefulBuilder(builder: (context, setState) {
            updatePage = setState;
            return CcuPlannerLayout(
                headerBuilder: (context, openSettings) => Row(children: [
                      const Expanded(child: Text('升级规划')),
                      IconButton(
                          tooltip: '规划设置',
                          onPressed: openSettings,
                          icon: const Icon(Icons.tune)),
                    ]),
                ships: const Text('舰船'),
                settings: Column(children: [
                  CcuSourceOption(
                      label: '回购',
                      icon: Icons.history,
                      value: selected,
                      onChanged: loading
                          ? null
                          : (value) => setState(() {
                                selected = value;
                                changes++;
                              })),
                  for (var i = 0; i < 12; i++)
                    ListTile(title: Text('固定升级条件 $i')),
                ]),
                actions: const Text('计算方案'),
                results: const Text('方案结果'),
                stepCount: 0,
                stepBuilder: (context, index) => const SizedBox.shrink());
          }))));
      expect(find.text('回购'), findsNothing);
      expect(find.text('计算方案'), findsOneWidget);
      await tester.tap(find.byTooltip('规划设置'));
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsOneWidget);
      await tester.tap(find.byType(CcuSourceOption));
      await tester.pumpAndSettle();
      expect(selected, isFalse);
      expect(tester.widget<CcuSourceOption>(find.byType(CcuSourceOption)).value,
          isFalse);
      expect(changes, 1);
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();
      expect(selected, isTrue);
      expect(changes, 2);
      updatePage(() => loading = true);
      await tester.pumpAndSettle();
      expect(
          tester
              .widget<CcuSourceOption>(find.byType(CcuSourceOption))
              .onChanged,
          isNull);
      await tester.tap(find.byType(CcuSourceOption));
      await tester.pumpAndSettle();
      expect(changes, 2);
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -1600));
      await tester.pumpAndSettle();
      expect(find.text('固定升级条件 11').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.tap(find.text('完成'));
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsNothing);
      await tester.tap(find.byTooltip('规划设置'));
      await tester.pumpAndSettle();
      expect(tester.widget<CcuSourceOption>(find.byType(CcuSourceOption)).value,
          isTrue);
      await tester.tap(find.byTooltip('关闭规划设置'));
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }

  for (final routeEdge in [
    edge,
    estimatedEdge,
    for (final source in ['hangar', 'store', 'store_wb', 'history_wb'])
      CcuOffer(
          id: source, fromShipId: 1, toShipId: 2, source: source, cost: 500),
  ]) {
    testWidgets(
        'route cards retain pin and exclude actions: ${routeEdge.source}',
        (tester) async {
      var pinned = false;
      var excluded = 0;
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: SingleChildScrollView(
                  child: CcuRouteStep(
                      edge: routeEdge,
                      index: 0,
                      from: ship,
                      to: ship,
                      last: true,
                      pinned: false,
                      onPin: () => pinned = true,
                      onExclude: () => excluded++)))));
      if (routeEdge.source == 'standard') {
        expect(find.text('未开放购买'), findsOneWidget);
        expect(find.text('普通升级估价'), findsNothing);
        expect(find.text('等待 / 待核实'), findsNothing);
      } else {
        expect(find.text(routeEdge.sourceLabel), findsOneWidget);
        expect(find.text('本地参考价'), findsNothing);
        expect(find.text('未开放购买'), findsNothing);
      }
      expect(find.text('物品 #77'), findsNothing);
      expect(find.text('步骤详情'), findsNothing);
      await tester.tap(find.byTooltip('固定该升级包或来源'));
      expect(pinned, isTrue);
      final excludeButton = find
          .byTooltip('排除［${routeEdge.tagLabel}］：${ship.name} → ${ship.name}');
      expect(tester.getCenter(excludeButton).dy,
          lessThan(tester.getCenter(find.byTooltip('固定该升级包或来源')).dy));
      await tester.tap(excludeButton);
      await tester.pumpAndSettle();
      expect(excluded, 1);
      expect(find.byType(PopupMenuItem<String>), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }

  for (final sample in [
    (
      from: 10000,
      to: 12525,
      cost: 500,
      source: 'store_wb',
      saved: '节约 \$20.25'
    ),
    (from: 10000, to: 12525, cost: 500, source: 'hangar', saved: '节约 \$20.25'),
    (from: 10000, to: 12525, cost: 2525, source: 'store', saved: null),
    (from: 10000, to: 12525, cost: 3000, source: 'buyback', saved: null),
    (from: null, to: 12525, cost: 500, source: 'store_wb', saved: null),
  ]) {
    testWidgets('step savings use reference difference and paid cost: $sample',
        (tester) async {
      tester.view.physicalSize = const Size(390, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(MaterialApp(
          home: MediaQuery(
              data: const MediaQueryData(textScaler: TextScaler.linear(1.8)),
              child: Scaffold(
                  body: CcuRouteStep(
                      edge: CcuOffer(
                          id: 'saving-test',
                          fromShipId: 1,
                          toShipId: 2,
                          source: sample.source,
                          cost: sample.cost),
                      index: 0,
                      from: CcuShipView(name: '起始舰船', price: sample.from),
                      to: CcuShipView(name: '目标舰船', price: sample.to),
                      last: true,
                      pinned: false,
                      onPin: null,
                      onExclude: null)))));
      expect(find.text(ccuMoney(sample.cost)), findsOneWidget);
      if (sample.saved != null) {
        expect(find.text(sample.saved!), findsOneWidget);
      } else {
        expect(find.textContaining('节约'), findsNothing);
      }
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('plan choice groups owned, buyback and store availability',
      (tester) async {
    final steps = [
      for (final (source, availability) in [
        ('hangar', 'owned'),
        ('buyback', 'unknown'),
        ('store', 'verified'),
        ('store_wb', 'verified'),
        ('store_wb', 'unknown'),
        ('history_wb', 'unknown'),
        ('standard', 'unknown'),
      ])
        CcuOffer(
            id: source,
            fromShipId: 1,
            toShipId: 2,
            source: source,
            availability: availability,
            cost: 100),
    ];
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CcuPlanChoice(
                plan: CcuPlan(
                    scenario: 'waiting',
                    steps: steps,
                    ownedCost: 100,
                    additionalCost: 600,
                    totalCost: 700,
                    regularCost: 1000,
                    savings: 300,
                    pendingSteps: 4),
                number: 1,
                selected: true,
                onSelected: () {}))));
    expect(find.text('机库中 1 · 回购中 1 · 可购买 2 · 不可购买 3'), findsOneWidget);
    expect(find.text('补入 \$6.00'), findsOneWidget);
    expect(find.textContaining('可用信用点'), findsNothing);
    expect(find.textContaining('仅现金'), findsNothing);
    expect(find.textContaining('商店 WB'), findsNothing);
    expect(find.textContaining('普通升级估价'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('missing images preserve geometry and cost summary stays compact',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      SizedBox(width: 120, height: 90, child: CcuShipImage(url: '')),
      CcuCostSummary(plan: plan, objective: 'total')
    ])))));
    expect(find.byIcon(Icons.rocket_launch_outlined), findsOneWidget);
    expect(find.text('CCU链可融价值'), findsOneWidget);
    expect(find.text('可用信用点'), findsOneWidget);
    expect(find.text('仅现金'), findsOneWidget);
    expect(find.textContaining('成本说明'), findsNothing);
    expect(find.textContaining('等待或核实'), findsNothing);
    expect(find.byType(ExpansionTile), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
