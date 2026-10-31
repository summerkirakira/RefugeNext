import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/graphql/shop/apply_upgrade_token.dart';

void main() {
  test('invalid cart and unacknowledged response never clear existing cart',
      () async {
    SharedPreferences.setMockInitialValues({});
    final client = RsiApiClient();
    await client.session.reset();
    final original = client.baseUrl;
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    client.baseUrl = 'http://127.0.0.1:${server.port}/';
    final paths = <String>[];
    Object response = {'success': 0, 'msg': 'Invalid cart'};
    server.listen((request) async {
      paths.add(request.uri.path);
      await request.drain<void>();
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(response));
      await request.response.close();
    });
    try {
      await expectLater(ApplyUpgradeToken(upgradeToken: 'fake').execute(),
          throwsA(predicate((e) => e.toString().contains('购物车状态不兼容'))));
      response = {'data': null};
      await expectLater(
          ApplyUpgradeToken(upgradeToken: 'fake').execute(), throwsStateError);
      response = {'success': 1};
      await ApplyUpgradeToken(upgradeToken: 'fake').execute();
      expect(paths, List.filled(3, '/api/store/v2/cart/token'));
    } finally {
      client.baseUrl = original;
      await server.close(force: true);
      await client.session.reset();
    }
  });
}
