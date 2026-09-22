import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/funcs/login.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/parsers/launcher_login_parser.dart';

class _LoginTestBinding extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

Map<String, Object?> response(String code,
        {Object? data = const [], int success = 0}) =>
    {
      'success': success,
      'code': code,
      'msg': 'test message',
      'data': data,
    };

void main() {
  _LoginTestBinding();
  group('登录响应解析', () {
    for (final code in [
      'ErrCaptchaRequiredLauncher',
      'ErrMultiStepRequired',
      'ErrWrongPassword_email'
    ]) {
      test('$code 的空数组 data 保留错误码，不再抛 TypeError', () {
        final result = parseLauncherLoginResponse(response(code));
        expect(result.data, isNull);
        expect(result.code, code);
        expect(result.msg, 'test message');
        expect(result.success, 0);
      });
    }
    test('成功响应保留原始会话值，不二次编码', () {
      final result = parseLauncherLoginResponse(response('OK',
          success: 1,
          data: {'session_id': 'test+token==', 'device_id': 'test-device'}));
      expect(result.success, 1);
      expect(result.data!.session_id, 'test+token==');
      expect(result.data!.device_id, 'test-device');
    });
    test('挑战响应允许只返回 device_id 或空对象', () {
      for (final data in <Map<String, dynamic>>[
        {},
        {'device_id': 'test-device'}
      ]) {
        final result = parseLauncherLoginResponse(
            response('ErrMultiStepRequired', data: data));
        expect(result.data!.session_id, '');
      }
    });
    test('null data 保留，异常非空数组和标量仍拒绝', () {
      expect(parseLauncherLoginResponse(response('Error', data: null)).data,
          isNull);
      for (final data in [
        [1],
        'unexpected',
        1
      ]) {
        expect(() => parseLauncherLoginResponse(response('Error', data: data)),
            throwsFormatException);
      }
    });
  });

  group('真实请求链路（本地假官网）', () {
    late HttpServer server;
    late String originalUrl;
    late Future<void> Function(HttpRequest) handler;
    final client = RsiApiClient();

    Future<void> reply(HttpRequest request, Map<String, Object?> body) async {
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(body));
      await request.response.close();
    }

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await client.session.reset();
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      originalUrl = client.baseUrl;
      client.baseUrl = 'http://127.0.0.1:${server.port}/';
      server.listen((request) async => handler(request));
    });
    tearDown(() async {
      client.baseUrl = originalUrl;
      await server.close(force: true);
      await client.session.reset();
    });

    test('首次登录 data=[] 仍进入图片验证码', () async {
      handler =
          (request) => reply(request, response('ErrCaptchaRequiredLauncher'));
      final status =
          await loginFirstStep(email: 'test@example.invalid', password: 'test');
      expect(status.needCaptcha, isTrue);
      expect(status.success, isFalse);
    });

    test('图片验证码保留会话，data=[] 的下一步进入邮箱验证', () async {
      var calls = 0;
      handler = (request) async {
        calls++;
        final body = jsonDecode(await utf8.decoder.bind(request).join()) as Map;
        if (calls == 1) {
          expect(body['captcha'], isNull);
          await reply(
              request,
              response('ErrCaptchaRequiredLauncher', data: {
                'session_id': 'captcha-session',
                'device_id': 'captcha-device',
              }));
        } else if (calls == 2) {
          expect(body['captcha'], 'correct-captcha');
          expect(request.headers.value('x-rsi-token'), 'captcha-session');
          expect(request.headers.value('x-rsi-device'), 'captcha-device');
          await reply(request, response('ErrMultiStepRequired'));
        } else {
          // 返回修改账号后重新登录时应开始新会话。
          expect(request.headers.value('x-rsi-token'), isNull);
          await reply(request, response('ErrCaptchaRequiredLauncher'));
        }
      };
      expect(
          (await loginFirstStep(
                  email: 'test@example.invalid', password: 'test'))
              .needCaptcha,
          isTrue);
      final generation = client.session.generation;
      final status = await loginFirstStep(
          email: 'test@example.invalid',
          password: 'test',
          captcha: 'correct-captcha');
      expect(status.needCode, isTrue);
      expect(client.session.generation, generation);
      expect(client.rsiToken, 'captcha-session');
      await loginFirstStep(email: 'other@example.invalid', password: 'test');
      expect(client.session.generation, greaterThan(generation));
    });

    test('邮箱验证码错误且 data=[] 时正常返回错误，允许重试', () async {
      handler = (request) => reply(request, response('ErrInvalidCode'));
      final status =
          await loginSecondStep('test@example.invalid', 'test', '123456');
      expect(status.success, isFalse);
      expect(status.msg, 'test message');
    });
  });
}
