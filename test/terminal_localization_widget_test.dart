import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
import 'package:refuge_next/src/widgets/common/wiki_image_fallback.dart';
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
  bool loaded = false;
  @override
  bool get localizationLoaded => loaded;
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

const _thumbUrl = 'https://example.test/thumb.jpg';
const _originalUrl = 'https://example.test/original.jpg';

GameVehicle _vehicleWithImage() => GameVehicle(
      uuid: 'eclipse',
      name: 'Eclipse',
      images: [
        GameVehicleImagesInner(
          thumbnailUrl: _thumbUrl,
          originalUrl: _originalUrl,
        ),
      ],
    );

/// 图片缓存替身:[failing] 中的地址立即失败,其余地址一直处于加载中。
class _ImageCache implements BaseCacheManager {
  _ImageCache([this.failing = const {}]);
  final Set<String> failing;

  @override
  Stream<FileResponse> getFileStream(String url,
      {String? key, Map<String, String>? headers, bool withProgress = false}) {
    if (failing.contains(url)) return Stream.error(Exception('failed: $url'));
    return StreamController<FileResponse>().stream;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
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
    CachedNetworkImageProvider.defaultCacheManager = _ImageCache();
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

  testWidgets('vehicle details from a loaded list skip the loading frame',
      (tester) async {
    final model = _Model()
      ..readiness = Future.value()
      ..loaded = true;
    addTearDown(model.dispose);
    await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
      value: model,
      child: MaterialApp(
        home: VehicleDetailPage(
            initialVehicle: _vehicleWithImage(), allowSwitch: false),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('Eclipse'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1));
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('vehicle details wait when no thumbnail can be resolved yet',
      (tester) async {
    final model = _Model()
      ..readiness = Completer<void>().future
      ..loaded = true;
    addTearDown(model.dispose);
    await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
      value: model,
      child: MaterialApp(
        home: VehicleDetailPage(
            initialVehicle: vehicles.first, allowSwitch: false),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  group('vehicle header image', () {
    Future<Iterable<String>> pumpHeader(
        WidgetTester tester, Set<String> failing) async {
      CachedNetworkImageProvider.defaultCacheManager = _ImageCache(failing);
      // 图片缓存按地址复用请求,不清空会沿用上个测试中未完成的请求。
      imageCache
        ..clear()
        ..clearLiveImages();
      final model = _Model()
        ..readiness = Future.value()
        ..loaded = true;
      addTearDown(model.dispose);
      await tester.pumpWidget(ChangeNotifierProvider<MainDataModel>.value(
        value: model,
        child: MaterialApp(
          home: VehicleDetailPage(
              initialVehicle: _vehicleWithImage(), allowSwitch: false),
        ),
      ));
      // 图片错误经真实事件循环传递,需要交替等待才能走完回退链。
      for (var i = 0; i < 8; i++) {
        await tester.runAsync(
            () => Future<void>.delayed(const Duration(milliseconds: 10)));
        await tester.pump(const Duration(milliseconds: 100));
      }
      return tester
          .widgetList<CachedNetworkImage>(find.byType(CachedNetworkImage))
          .map((image) => image.imageUrl);
    }

    testWidgets('previews the thumbnail while the original loads',
        (tester) async {
      final urls = await pumpHeader(tester, {});
      expect(urls, containsAll([_originalUrl, _thumbUrl]));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('swaps the thumbnail for the original without fading',
        (tester) async {
      await pumpHeader(tester, {});
      final images = tester
          .widgetList<CachedNetworkImage>(find.byType(CachedNetworkImage));
      expect(images, hasLength(2));
      for (final image in images) {
        expect(image.fadeInDuration, Duration.zero);
        expect(image.fadeOutDuration, Duration.zero);
      }
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('falls back to the thumbnail mirror', (tester) async {
      final urls = await pumpHeader(tester, {_thumbUrl});
      expect(urls, contains(wikiImageFallbackUrls(_thumbUrl).first));
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('keeps the thumbnail after the original fails', (tester) async {
      final urls = await pumpHeader(tester, {
        _originalUrl,
        ...wikiImageFallbackUrls(_originalUrl),
      });
      // 回退链逐层嵌套:能找到原图镜像说明走完了回退,缩略图仍在其中显示。
      expect(urls, contains(wikiImageFallbackUrls(_originalUrl).first));
      expect(urls, contains(_thumbUrl));
      await tester.pumpWidget(const SizedBox());
    });
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
