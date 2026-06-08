import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';

/// 联网冒烟测试:命中 Star Citizen Wiki 公开端点,验证生成的客户端能正常
/// 请求并反序列化成强类型对象。需要网络,默认随 `flutter test` 运行。
void main() {
  test('apiGameVersionsGet returns typed body', () async {
    final res = await WikiApiClient().api.apiGameVersionsGet();

    expect(res.isSuccessful, isTrue, reason: 'HTTP ${res.statusCode}');
    expect(res.body, isNotNull);
    // 打印一下,便于人工核对反序列化结果
    // ignore: avoid_print
    print('game versions body type: ${res.body.runtimeType}');
  }, timeout: const Timeout(Duration(seconds: 30)));
}
