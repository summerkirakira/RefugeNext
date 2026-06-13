import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';

/// Wiki API 分页行为测试。
///
/// 背景:生成代码的列表方法同时有 legacy `page` 参数(默认 1,
/// 不显式传 null 就总会发送)和 `page[number]`/`page[size]`;
/// 服务端优先 legacy 参数,导致翻页失效(永远第 1 页、30 条/页)。
/// 仓库层已通过显式 `page: null` 压掉 legacy 参数,此处回归验证。
void main() {
  group('请求参数(离线,捕获实际发出的 query)', () {
    test('fetchPage 不携带 legacy page 参数,且 page[number]/page[size] 正确',
        () async {
      final adapter = _CapturingAdapter();
      final dio = WikiApiClient().api.dio;
      final original = dio.httpClientAdapter;
      dio.httpClientAdapter = adapter;
      try {
        final items = await GameVehicleRepo().fetchPage(2);
        expect(items, isEmpty); // 假响应返回空列表

        final query = adapter.lastUri!.queryParameters;
        expect(query.containsKey('page'), isFalse,
            reason: 'legacy page 参数必须被压掉,否则服务端忽略 page[number]');
        expect(query['page[number]'], '2');
        expect(query['page[size]'], '200');
      } finally {
        dio.httpClientAdapter = original;
      }
    });

    test('对照:不显式传 page: null 时,生成代码默认发送 page=1(陷阱本身)',
        () async {
      final adapter = _CapturingAdapter();
      final api = StarcitizenWikiApi(
        basePathOverride: WikiApiClient.baseUrl,
      );
      api.dio.httpClientAdapter = adapter;

      await api.getVehiclesApi().listVehicles(
            pageLeftSquareBracketNumberRightSquareBracket: 2,
            pageLeftSquareBracketSizeRightSquareBracket: 200,
          );

      final query = adapter.lastUri!.queryParameters;
      expect(query['page'], '1',
          reason: '生成代码的 page 默认值 1 会被发送——这就是必须显式传 null 的原因');
    });
  });

  group('线上行为(网络冒烟,离线自动跳过)', () {
    test('翻页生效:第 1 页 200 条,第 2 页不重复且不足 200 条', () async {
      List<GameVehicle> page1, page2;
      try {
        page1 = await GameVehicleRepo().fetchPage(1);
        page2 = await GameVehicleRepo().fetchPage(2);
      } on DioException catch (e) {
        markTestSkipped('网络不可用,跳过线上冒烟: ${e.type}');
        return;
      }

      expect(page1.length, 200, reason: 'page[size]=200 应生效');
      expect(page2, isNotEmpty);
      expect(page2.length, lessThan(200), reason: '全集约 288 条,第 2 页应为余量');

      final uuids1 = page1.map((v) => v.uuid).toSet();
      final uuids2 = page2.map((v) => v.uuid).toSet();
      expect(uuids1.intersection(uuids2), isEmpty,
          reason: '两页内容不应重复(翻页生效)');
    }, timeout: const Timeout(Duration(minutes: 2)));
  });
}

/// 捕获请求并返回固定空数据的假 HTTP 适配器。
class _CapturingAdapter implements HttpClientAdapter {
  Uri? lastUri;

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    lastUri = options.uri;
    return ResponseBody.fromString(
      '{"data": []}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
