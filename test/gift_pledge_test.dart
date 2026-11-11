import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/hangar/property.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late RsiApiClient client;
  late HttpServer server;
  late String originalBaseUrl;
  late List<
      ({
        String method,
        String path,
        Map body,
        String? token,
        String? cookie
      })> requests;
  late Map<String, dynamic> response;
  late int status;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    client = RsiApiClient();
    await client.session
        .reset(token: 'test-session-token', device: 'test-device');
    originalBaseUrl = client.baseUrl;
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    client.baseUrl = 'http://127.0.0.1:${server.port}/';
    requests = [];
    response = {'success': 1, 'code': 'OK', 'msg': 'OK', 'data': null};
    status = HttpStatus.ok;
    server.listen((request) async {
      requests.add((
        method: request.method,
        path: request.uri.path,
        body: jsonDecode(await utf8.decoder.bind(request).join()) as Map,
        token: request.headers.value('x-rsi-token'),
        cookie: request.headers.value(HttpHeaders.cookieHeader),
      ));
      request.response.statusCode = status;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(response));
      await request.response.close();
    });
  });

  tearDown(() async {
    client.baseUrl = originalBaseUrl;
    await server.close(force: true);
    await client.session.reset();
  });

  Future<BasicResponseBody> gift() => client.giftItem(
        pledge: '123456',
        password: 'test-password',
        name: 'Test recipient',
        email: 'recipient@example.test',
      );

  test('gift uses V2 once with the existing payload and current session',
      () async {
    // Credentials must be read at request time rather than captured earlier.
    client.session.setValue('Rsi-Token', 'rotated-test-token');
    final result = await gift();

    expect(result.success, 1);
    expect(result.code, 'OK');
    expect(result.msg, 'OK');
    expect(requests, hasLength(1));
    final request = requests.single;
    expect(request.method, 'POST');
    expect(request.path, '/api/account/giftPledgeV2');
    expect(request.body, {
      'pledge_id': '123456',
      'current_password': 'test-password',
      'name': 'Test recipient',
      'email': 'recipient@example.test',
    });
    expect(request.token, 'rotated-test-token');
    expect(request.cookie, contains('Rsi-Token=rotated-test-token'));
    expect(request.cookie, contains('_rsi_device=test-device'));
    expect(request.cookie, isNot(contains('Rsi-Token=test-session-token')));
  });

  test('V2 password failure preserves the error without retry or fallback',
      () async {
    response = {
      'success': 0,
      'code': 'ErrInvalidPassword',
      'msg': '<strong>Error</strong> Invalid password',
      'data': {'password': 'Invalid password.'},
    };

    final result = await gift();

    expect(result.success, 0);
    expect(result.code, 'ErrInvalidPassword');
    expect(result.msg, '<strong>Error</strong> Invalid password');
    expect(requests, hasLength(1));
    expect(requests.single.path, '/api/account/giftPledgeV2');
  });

  for (final failureStatus in [
    HttpStatus.notFound,
    HttpStatus.serviceUnavailable
  ]) {
    test('HTTP $failureStatus does not retry or fall back to the old gift API',
        () async {
      status = failureStatus;
      response = {'error': 'Test HTTP failure'};

      await expectLater(
        gift(),
        throwsA(isA<DioException>().having(
          (error) => error.response?.statusCode,
          'HTTP status',
          failureStatus,
        )),
      );
      expect(requests, hasLength(1));
      expect(requests.single.path, '/api/account/giftPledgeV2');
    });
  }
}
