import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/funcs/login.dart';
import 'package:refuge_next/src/widgets/user_info/user_login_page.dart';

LoginStatus status(
        {bool success = false,
        bool captcha = false,
        bool code = false,
        String message = ''}) =>
    LoginStatus(
        success: success, msg: message, needCode: code, needCaptcha: captcha);

void main() {
  Future<void> open(
    WidgetTester tester, {
    required LoginFirstStep first,
    Future<LoginStatus> Function(String, String, String)? second,
    Future<Uint8List?> Function()? captcha,
    Future<void> Function()? onSignedIn,
    double width = 390,
    double keyboard = 0,
  }) async {
    tester.view.physicalSize = Size(width, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          viewInsets: EdgeInsets.only(bottom: keyboard),
          textScaler: const TextScaler.linear(1.3),
        ),
        child: child!,
      ),
      home: Builder(
          builder: (context) => Scaffold(
                body: TextButton(
                    onPressed: () => Navigator.of(context).push<bool>(
                          MaterialPageRoute(
                              builder: (_) => UserLoginPage(
                                    firstStep: first,
                                    secondStep: second ??
                                        (_, __, ___) async => status(),
                                    loadCaptcha: captcha ?? () async => null,
                                    onSignedIn: onSignedIn ?? () async {},
                                  )),
                        ),
                    child: const Text('打开登录')),
              )),
    ));
    await tester.tap(find.text('打开登录'));
    await tester.pumpAndSettle();
  }

  Future<void> credentials(WidgetTester tester) async {
    await tester.enterText(
        find.byKey(const ValueKey('login-email')), ' test@example.com ');
    await tester.enterText(
        find.byKey(const ValueKey('login-password')), ' password ');
  }

  Future<void> submit(WidgetTester tester) async {
    await tester.ensureVisible(find.byType(FilledButton));
    await tester.tap(find.byType(FilledButton));
    await tester.pump();
  }

  testWidgets('独立页面校验输入并可返回，密码支持显隐', (tester) async {
    var calls = 0;
    await open(tester,
        first: ({required email, required password, captcha}) async {
      calls++;
      return status();
    });
    await submit(tester);
    expect(find.text('请输入邮箱'), findsOneWidget);
    expect(find.text('请输入密码'), findsOneWidget);
    expect(calls, 0);
    await tester.tap(find.byTooltip('显示密码'));
    await tester.pump();
    expect(
        tester
            .widget<TextFormField>(find.byKey(const ValueKey('login-password')))
            .controller!
            .text,
        '');
    expect(find.byTooltip('隐藏密码'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('打开登录'), findsOneWidget);
    expect(find.byType(UserLoginPage), findsNothing);
  });

  testWidgets('登录等待期间禁止重复提交，成功后更新账号并返回', (tester) async {
    final pending = Completer<LoginStatus>();
    var calls = 0;
    var signedIn = false;
    await open(tester,
        first: ({required email, required password, captcha}) {
          expect(email, 'test@example.com');
          expect(password, ' password ');
          calls++;
          return pending.future;
        },
        onSignedIn: () async => signedIn = true);
    await credentials(tester);
    await submit(tester);
    expect(tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNull);
    await tester.binding.handlePopRoute();
    await tester.pump();
    expect(find.byType(UserLoginPage), findsOneWidget);
    expect(calls, 1);
    pending.complete(status(success: true));
    await tester.pumpAndSettle();
    expect(signedIn, true);
    expect(find.byType(UserLoginPage), findsNothing);
  });

  testWidgets('图片验证码加载失败可刷新，继续进入邮箱验证码', (tester) async {
    var attempts = 0;
    var images = 0;
    await open(tester,
        first: ({required email, required password, captcha}) async {
      attempts++;
      if (attempts == 1) return status(captcha: true);
      expect(captcha, 'abcd');
      return status(code: true);
    }, captcha: () async {
      images++;
      return null;
    }, second: (email, password, code) async {
      expect(email, 'test@example.com');
      expect(password, ' password ');
      expect(code, '123456');
      return status(success: true);
    });
    await credentials(tester);
    await submit(tester);
    await tester.pumpAndSettle();
    expect(find.text('图片验证'), findsOneWidget);
    expect(find.text('验证码加载失败，请点击刷新'), findsOneWidget);
    await tester.ensureVisible(find.text('刷新验证码'));
    await tester.tap(find.text('刷新验证码'));
    await tester.pumpAndSettle();
    expect(images, 2);
    await tester.enterText(find.byType(TextFormField), 'abcd');
    await submit(tester);
    await tester.pumpAndSettle();
    expect(find.text('邮箱验证'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), '123456');
    await submit(tester);
    await tester.pumpAndSettle();
    expect(find.byType(UserLoginPage), findsNothing);
  });

  testWidgets('网络失败恢复提交状态，返回修改账号保留表单', (tester) async {
    var attempts = 0;
    await open(tester,
        first: ({required email, required password, captcha}) async {
      if (++attempts == 1) throw StateError('offline');
      return status(code: true);
    });
    await credentials(tester);
    await submit(tester);
    await tester.pumpAndSettle();
    expect(find.text('登录暂未完成，请检查网络后重试'), findsOneWidget);
    expect(tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNotNull);
    await submit(tester);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('返回修改账号'));
    await tester.tap(find.text('返回修改账号'));
    await tester.pumpAndSettle();
    expect(find.text('登录 RSI 账号'), findsOneWidget);
    expect(find.text(' test@example.com '), findsOneWidget);
  });

  for (final width in [320.0, 1100.0]) {
    testWidgets('键盘显示时可滚动提交，适配宽度 $width', (tester) async {
      await open(tester,
          first: ({required email, required password, captcha}) async =>
              status(message: '测试错误'),
          width: width,
          keyboard: 300);
      await credentials(tester);
      await submit(tester);
      await tester.pumpAndSettle();
      expect(find.text('测试错误'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
