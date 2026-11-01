import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/network/cirno/property/property.dart'
    show ShipAlias;
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/game_version_manager.dart';
import 'package:refuge_next/src/repo/game_item_translation.dart';
import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/repo/translation.dart';
import 'package:refuge_next/src/repo/wiki_data_sync.dart';
import 'package:refuge_next/src/widgets/database/database_page.dart';
import 'package:refuge_next/src/widgets/database/database_search_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_detail_page.dart';

class _Paths extends PathProviderPlatform {
  _Paths(this.path);
  final String path;
  @override
  Future<String> getApplicationDocumentsPath() async => path;
}

class _Model extends MainDataModel {
  Future<void>? readiness;
  @override
  Future<void> get localizationReady => readiness ?? super.localizationReady;
  @override
  Future<void> initUser() async {}
  @override
  Future<void> initialize() async {}
}

class _Network implements HttpClientAdapter {
  int requests = 0;
  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? stream,
      Future<void>? cancel) async {
    requests++;
    return ResponseBody.fromString('{"data":[]}', 200, headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType]
    });
  }

  @override
  void close({bool force = false}) {}
}

Future<void> _mount(WidgetTester tester, _Model model, Widget page) async {
  await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
    value: model,
    child: MaterialApp(home: Scaffold(body: page)),
  ));
  await tester.pump();
}

Future<void> _settleIO(WidgetTester tester) async {
  // File reads run outside the fake frame clock; keep the wait bounded.
  for (var i = 0; i < 100; i++) {
    await tester
        .runAsync(() => Future<void>.delayed(const Duration(milliseconds: 5)));
    await tester.pump();
    if (find.byType(CircularProgressIndicator).evaluate().isEmpty) break;
  }
  await tester.pumpAndSettle();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory directory;
  late PathProviderPlatform previousPaths;
  late HttpClientAdapter previousAdapter;
  late _Network network;
  late List<GameVehicle> vehicles;
  var version = 0;

  setUpAll(() async {
    directory = await Directory.systemTemp.createTemp('terminal-widgets-');
    previousPaths = PathProviderPlatform.instance;
    PathProviderPlatform.instance = _Paths(directory.path);
    previousAdapter = WikiApiClient().api.dio.httpClientAdapter;
    SharedPreferences.setMockInitialValues({});
    await GameItemTranslationRepo().load();
  });
  setUp(() async {
    network = _Network();
    WikiApiClient().api.dio.httpClientAdapter = network;
    WikiDataSync().datasets = [];
    final selected = 'localization-${version++}';
    await GameVersionManager().setVersion(selected);
    await TranslationRepo().writeTranslation({}, 1);
    TranslationRepo().setTranslationEnabled(true);
    await ShipAliasRepo().writeShipAliases([], 1);
    vehicles = [
      GameVehicle(uuid: 'eclipse', name: 'Eclipse', ports: [
        GameVehiclePort(ports: [GameVehiclePort()]),
      ]),
      for (var i = 1; i <= 20; i++)
        GameVehicle(uuid: 'ship-$i', name: 'Ship $i'),
    ];
    await GameVehicleRepo().saveAll(vehicles, version: selected);
  });
  tearDown(() {
    WikiDataSync().resetForTest();
    WikiApiClient().api.dio.httpClientAdapter = previousAdapter;
  });
  tearDownAll(() async {
    await GameVersionManager().setVersion(null);
    PathProviderPlatform.instance = previousPaths;
    await directory.delete(recursive: true);
  });

  testWidgets('first terminal frame waits for shared local readiness',
      (tester) async {
    final ready = Completer<void>();
    final model = _Model()..readiness = ready.future;
    addTearDown(model.dispose);
    await _mount(tester, model, const DatabasePage());
    expect(find.text('Eclipse'), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsWidgets);
    await tester.runAsync(
        () => TranslationRepo().writeTranslation({'Eclipse': '日蚀'}, 2));
    ready.complete();
    await _settleIO(tester);
    expect(find.text('日蚀'), findsOneWidget);
    expect(find.text('Eclipse'), findsNothing);
    expect(network.requests, 0);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
      'late dictionary refreshes visible names without resetting scroll; late aliases refilter',
      (tester) async {
    final model = _Model()..readiness = Future.value();
    addTearDown(model.dispose);
    await _mount(tester, model, const DatabasePage());
    await _settleIO(tester);
    expect(find.text('Eclipse'), findsOneWidget);
    await tester.runAsync(
        () => TranslationRepo().writeTranslation({'Eclipse': '日蚀'}, 2));
    await tester.pumpAndSettle();
    expect(find.text('日蚀'), findsOneWidget);
    final list = find.byType(ListView).first;
    await tester.drag(list, const Offset(0, -650));
    await tester.pumpAndSettle();
    final scroll = tester.state<ScrollableState>(
        find.descendant(of: list, matching: find.byType(Scrollable)).first);
    final offset = scroll.position.pixels;
    expect(offset, greaterThan(0));
    await tester.runAsync(() => TranslationRepo().writeTranslation({
          'Eclipse': '日蚀',
          for (var i = 1; i <= 20; i++) 'Ship $i': '舰船$i',
        }, 3));
    await tester.pumpAndSettle();
    expect(scroll.position.pixels, offset);
    expect(find.textContaining('舰船'), findsWidgets);
    await tester.runAsync(() => ShipAliasRepo().writeShipAliases([
          ShipAlias(
              id: 1, name: 'Eclipse', alias: [], skus: [], uuid: 'eclipse'),
        ], 2));
    await tester.pumpAndSettle();
    expect(find.text('日蚀'), findsOneWidget);
    expect(find.textContaining('舰船'), findsNothing);
    expect(network.requests, 0);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
      'search reindexes dictionary, aliases and switch without replacing query',
      (tester) async {
    final model = _Model()..readiness = Future.value();
    addTearDown(model.dispose);
    await _mount(tester, model, const DatabaseSearchPage());
    await _settleIO(tester);
    await tester.enterText(find.byType(TextField), '日蚀');
    await tester.pumpAndSettle();
    expect(find.text('无匹配结果'), findsOneWidget);
    await tester.runAsync(() => TranslationRepo()
        .writeTranslation({'Eclipse': '日蚀', 'Stealth': '隐形舰'}, 2));
    await tester.pumpAndSettle();
    expect(find.text('无匹配结果'), findsNothing);
    expect(find.text('日蚀'), findsNWidgets(2));
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        '日蚀');
    TranslationRepo().setTranslationEnabled(false);
    await tester.pumpAndSettle();
    expect(find.text('无匹配结果'), findsOneWidget);
    TranslationRepo().setTranslationEnabled(true);
    await tester.pumpAndSettle();
    expect(find.text('无匹配结果'), findsNothing);
    await tester.runAsync(() => ShipAliasRepo().writeShipAliases([
          ShipAlias(
              id: 1, name: 'Stealth', alias: [], skus: [], uuid: 'eclipse'),
        ], 2));
    await tester.pumpAndSettle();
    expect(find.text('无匹配结果'), findsOneWidget);
    await tester.enterText(find.byType(TextField), '隐形舰');
    await tester.pumpAndSettle();
    expect(find.text('隐形舰'), findsNWidgets(2));
    expect(network.requests, 0);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
      'direct vehicle details wait then refresh text without changing active tab',
      (tester) async {
    final ready = Completer<void>();
    final model = _Model()..readiness = ready.future;
    addTearDown(model.dispose);
    await _mount(tester, model,
        VehicleDetailPage(initialVehicle: vehicles.first, allowSwitch: false));
    expect(find.text('Eclipse'), findsNothing);
    await tester.runAsync(
        () => TranslationRepo().writeTranslation({'Eclipse': '日蚀'}, 2));
    ready.complete();
    await _settleIO(tester);
    expect(find.text('日蚀'), findsOneWidget);
    final pages = tester.widget<PageView>(find.byType(PageView));
    pages.controller!.jumpToPage(1);
    await tester.pumpAndSettle();
    await tester.runAsync(
        () => TranslationRepo().writeTranslation({'Eclipse': '日蚀更新'}, 3));
    await tester.pumpAndSettle();
    expect(find.text('日蚀更新'), findsOneWidget);
    expect(tester.widget<PageView>(find.byType(PageView)).controller,
        same(pages.controller));
    expect(pages.controller!.page, 1);
    TranslationRepo().setTranslationEnabled(false);
    await tester.pumpAndSettle();
    expect(find.text('Eclipse'), findsOneWidget);
    expect(network.requests, 0);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('closing during local loading detaches all listeners',
      (tester) async {
    final ready = Completer<void>();
    final model = _Model()..readiness = ready.future;
    addTearDown(model.dispose);
    await _mount(tester, model, const DatabaseSearchPage());
    await tester.pumpWidget(const SizedBox());
    ready.complete();
    await tester.runAsync(
        () => TranslationRepo().writeTranslation({'Eclipse': '日蚀'}, 2));
    await tester.pumpAndSettle();
    expect(network.requests, 0);
    expect(tester.takeException(), isNull);
  });

  test(
      'MainDataModel shares local readiness and mirrors saved translation setting',
      () async {
    final model = _Model();
    addTearDown(model.dispose);
    final first = model.localizationReady;
    expect(identical(first, model.localizationReady), isTrue);
    await first;
    expect(model.enableHangarTranslation, TranslationRepo().translationEnabled);
    expect(network.requests, 0);
  });
}
