import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/graphql/shop/add_cart_item.dart';

void main() {
  test('Invalid cart reports failure without a clear-cart mutation', () async {
    SharedPreferences.setMockInitialValues({});
    final client = RsiApiClient();
    await client.session.reset();
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final original = client.baseUrl;
    client.baseUrl = 'http://127.0.0.1:${server.port}/';
    final queries = <String>[];
    server.listen((request) async {
      final data = jsonDecode(await utf8.decoder.bind(request).join()) as Map;
      queries.add(data['query'] as String);
      expect(data['variables']['qty'], 2);
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode({
        'errors': [
          {'message': 'Invalid cart'}
        ]
      }));
      await request.response.close();
    });
    try {
      await expectLater(
          AddCartItem(skuId: 'test-sku', qty: 2, identifier: null).execute(),
          throwsA(predicate((e) => e.toString().contains('购物车状态异常'))));
      expect(queries, hasLength(1));
      expect(queries.single, contains('AddCartItemMutation'));
    } finally {
      client.baseUrl = original;
      await server.close(force: true);
      await client.session.reset();
    }
  });
}
