import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/armor.dart';
import 'package:refuge_next/src/repo/base/wiki_pagination.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/game_version_manager.dart';
import 'package:refuge_next/src/repo/ship_matrix.dart';
import 'package:refuge_next/src/repo/wiki_data_registry.dart';
import 'package:refuge_next/src/repo/wiki_data_sync.dart';

class _RepoTestBinding extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

class _Paths extends PathProviderPlatform {
  _Paths(this.path);
  final String path;
  @override
  Future<String> getApplicationDocumentsPath() async => path;
}

class _Pages implements HttpClientAdapter {
  _Pages(this.version, {this.failPage, this.lastPage = 2});
  final String version;
  final int? failPage;
  final int lastPage;
  final pages = <int>[];

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    if (options.path.contains('game-versions')) {
      return _response({
        'data': {'code': version}
      });
    }
    final query = options.uri.queryParameters;
    expect(query.containsKey('page'), isFalse);
    expect(query['page[size]'], '200');
    final page = int.parse(query['page[number]']!);
    pages.add(page);
    if (page == failPage) {
      return ResponseBody.fromString('unavailable', 503);
    }
    return _response({
      'data': [
        {'uuid': 'vehicle-$page', 'name': 'Vehicle $page'},
      ],
      'meta': {'current_page': page, 'last_page': lastPage, 'per_page': 1},
    });
  }

  ResponseBody _response(Object body) => ResponseBody.fromString(
        jsonEncode(body),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType]
        },
      );
  @override
  void close({bool force = false}) {}
}

void main() {
  _RepoTestBinding();
  late Directory temp;
  late PathProviderPlatform oldPaths;
  late HttpClientAdapter oldAdapter;
  var caseNumber = 0;
  late String version;

  setUpAll(() async {
    temp = await Directory.systemTemp.createTemp('wiki-pagination-');
    oldPaths = PathProviderPlatform.instance;
    PathProviderPlatform.instance = _Paths(temp.path);
    oldAdapter = WikiApiClient().api.dio.httpClientAdapter;
    SharedPreferences.setMockInitialValues({});
  });
  setUp(() async {
    version = 'pagination-${caseNumber++}';
    await GameVersionManager().setVersion(version);
  });
  tearDown(() {
    WikiApiClient().api.dio.httpClientAdapter = oldAdapter;
    WikiDataSync().resetForTest();
  });
  tearDownAll(() async {
    await GameVersionManager().setVersion(null);
    PathProviderPlatform.instance = oldPaths;
    await temp.delete(recursive: true);
  });

  final datasets = [
    ...kWikiDatasets,
    WikiDataset(name: '护甲', repo: ArmorRepo(), refresh: ArmorRepo().refresh),
    WikiDataset(
        name: '舰船矩阵',
        repo: ShipMatrixRepo(),
        refresh: ({String? version}) => ShipMatrixRepo().refresh()),
  ];
  for (final dataset in datasets) {
    test('${dataset.name}: 服务端缩小每页条数仍下载至末页并保存', () async {
      final adapter = _Pages(version);
      WikiApiClient().api.dio.httpClientAdapter = adapter;
      await dataset.refresh(version: version);
      expect(adapter.pages, [1, 2]);
      expect(await dataset.repo.getItems(), hasLength(2));
      expect(await dataset.repo.listLocalVersions(), contains(version));
    });
  }

  test('第二页失败保留已有缓存，重试后恢复完整列表', () async {
    final repo = GameVehicleRepo();
    await repo.saveAll([GameVehicle(uuid: 'old')], version: version);
    WikiApiClient().api.dio.httpClientAdapter = _Pages(version, failPage: 2);
    await expectLater(
        repo.refresh(version: version), throwsA(isA<DioException>()));
    expect((await repo.getVehicles()).single.uuid, 'old');
    WikiApiClient().api.dio.httpClientAdapter = _Pages(version);
    await repo.refresh(version: version);
    expect((await repo.getVehicles()).map((v) => v.uuid),
        ['vehicle-1', 'vehicle-2']);
  });

  test('达到页数上限未完成时不覆盖缓存', () async {
    final repo = GameVehicleRepo();
    await repo.saveAll([GameVehicle(uuid: 'old')], version: version);
    WikiApiClient().api.dio.httpClientAdapter = _Pages(version, lastPage: 21);
    await expectLater(repo.refresh(version: version), throwsStateError);
    expect((await repo.getVehicles()).single.uuid, 'old');
  });

  test('旧缓存触发同步，下载完成后不再重复下载', () async {
    final root = Platform.isMacOS || Platform.isWindows || Platform.isLinux
        ? '${temp.path}/refuge_next'
        : temp.path;
    final file = File('$root/wiki/game_vehicles/$version.json');
    await file.parent.create(recursive: true);
    await file.writeAsString(jsonEncode({
      'schemaVersion': 1,
      'data': [
        {'uuid': 'partial'}
      ],
    }));
    final dataset = kWikiDatasets.first;
    WikiDataSync().datasets = [dataset];
    expect(
        (await WikiDataSync().inspect(version: version)).single.needsDownload,
        isTrue);
    expect(await GameVehicleRepo().getVehicles(), isEmpty);
    final adapter = _Pages(version);
    WikiApiClient().api.dio.httpClientAdapter = adapter;
    expect(
        (await WikiDataSync().syncMissing(version: version)).succeeded, ['载具']);
    expect(
        (await WikiDataSync().inspect(version: version)).single.needsDownload,
        isFalse);
    expect(
        (await WikiDataSync().syncMissing(version: version)).skipped, ['载具']);
    expect(adapter.pages, [1, 2]);
  });

  test('缺少分页元数据时继续至空页，提前空页视为失败', () {
    expect(
        () =>
            hasMoreWikiPages(page: 6, itemCount: 0, lastPage: 6, maxPages: 20),
        throwsStateError);
    expect(hasMoreWikiPages(page: 1, itemCount: 0, lastPage: 1, maxPages: 20),
        isFalse);
    expect(hasMoreWikiPages(page: 1, itemCount: 50, maxPages: 20), isTrue);
    expect(hasMoreWikiPages(page: 2, itemCount: 0, maxPages: 20), isFalse);
    expect(
        () =>
            hasMoreWikiPages(page: 2, itemCount: 0, lastPage: 6, maxPages: 20),
        throwsStateError);
  });

  test('线上全量载具数量与接口总数一致', () async {
    final client = WikiApiClient();
    final liveVersion = await client.getDefaultGameVersionCode();
    expect(liveVersion, isNotNull);
    await GameVersionManager().setVersion(liveVersion);
    final first = await client.api.getVehiclesApi().listVehicles(
          page: null,
          pageLeftSquareBracketNumberRightSquareBracket: 1,
          pageLeftSquareBracketSizeRightSquareBracket: 200,
          version: liveVersion,
        );
    final total = first.data?.meta?.total;
    expect(total, isNotNull);
    await GameVehicleRepo().refresh(version: liveVersion);
    final vehicles = await GameVehicleRepo().getVehicles();
    expect(vehicles, hasLength(total!));
    expect(vehicles.map((v) => v.uuid).toSet(), hasLength(total));
    final manufacturers = vehicles.map((v) => v.manufacturer?.name).toSet();
    expect(manufacturers.length, greaterThan(2));
    // ignore: avoid_print
    print('完整下载 ${vehicles.length} 条载具，${manufacturers.length} 个制造商');
  },
      skip: !const bool.fromEnvironment('RUN_WIKI_LIVE'),
      timeout: const Timeout(Duration(minutes: 4)));
}
