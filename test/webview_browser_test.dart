import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

import 'package:refuge_next/src/widgets/webview/full_screen_webview.dart';

const _url = 'https://robertsspaceindustries.com/account/pledges';

class _Platform extends WebViewPlatform {
  late _Controller controller;
  late _Delegate delegate;
  bool failInitialization = false;
  @override
  PlatformWebViewController createPlatformWebViewController(
      PlatformWebViewControllerCreationParams params) {
    if (failInitialization) throw StateError('init failed');
    return controller = _Controller(params);
  }

  @override
  PlatformNavigationDelegate createPlatformNavigationDelegate(
          PlatformNavigationDelegateCreationParams params) =>
      delegate = _Delegate(params);
  @override
  PlatformWebViewWidget createPlatformWebViewWidget(
          PlatformWebViewWidgetCreationParams params) =>
      _WebWidget(params);
}

class _Controller extends PlatformWebViewController {
  _Controller(super.params) : super.implementation();
  bool back = false;
  bool forward = false;
  int backCalls = 0;
  int forwardCalls = 0;
  int reloads = 0;
  String title = 'RSI title';
  final requests = <Uri>[];
  final html = <String>[];
  @override
  Future<void> loadHtmlString(String content, {String? baseUrl}) async {
    html.add(content);
  }

  @override
  Future<void> setJavaScriptMode(JavaScriptMode mode) async {}
  @override
  Future<void> setPlatformNavigationDelegate(
      PlatformNavigationDelegate handler) async {}
  @override
  Future<void> loadRequest(LoadRequestParams params) async {
    requests.add(params.uri);
  }

  @override
  Future<bool> canGoBack() async => back;
  @override
  Future<bool> canGoForward() async => forward;
  @override
  Future<String?> getTitle() async => title;
  @override
  Future<void> goBack() async {
    backCalls++;
    back = false;
    forward = true;
  }

  @override
  Future<void> goForward() async {
    forwardCalls++;
    back = true;
    forward = false;
  }

  @override
  Future<void> reload() async {
    reloads++;
  }
}

class _Delegate extends PlatformNavigationDelegate {
  _Delegate(super.params) : super.implementation();
  late PageEventCallback started;
  late PageEventCallback finished;
  late ProgressCallback progress;
  late WebResourceErrorCallback error;
  late UrlChangeCallback urlChanged;
  late HttpResponseErrorCallback httpError;
  @override
  Future<void> setOnNavigationRequest(
      NavigationRequestCallback callback) async {}
  @override
  Future<void> setOnPageStarted(PageEventCallback callback) async {
    started = callback;
  }

  @override
  Future<void> setOnPageFinished(PageEventCallback callback) async {
    finished = callback;
  }

  @override
  Future<void> setOnProgress(ProgressCallback callback) async {
    progress = callback;
  }

  @override
  Future<void> setOnWebResourceError(WebResourceErrorCallback callback) async {
    error = callback;
  }

  @override
  Future<void> setOnUrlChange(UrlChangeCallback callback) async {
    urlChanged = callback;
  }

  @override
  Future<void> setOnHttpError(HttpResponseErrorCallback callback) async {
    httpError = callback;
  }
}

class _WebWidget extends PlatformWebViewWidget {
  _WebWidget(super.params) : super.implementation();
  @override
  Widget build(BuildContext context) =>
      const ColoredBox(key: ValueKey('web-content'), color: Colors.white);
}

void main() {
  late _Platform platform;
  setUp(() {
    WebViewPlatform.instance = platform = _Platform();
  });

  Future<void> open(WidgetTester tester,
      {double width = 390, bool dark = false}) async {
    tester.view.physicalSize = Size(width, 780);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: dark ? Brightness.dark : Brightness.light),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.4)),
          child: child!),
      home: Builder(
          builder: (context) => Scaffold(
                  body: TextButton(
                child: const Text('打开官网'),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<bool>(
                        builder: (_) => const FullScreenWebView(
                            url: _url, authenticated: false))),
              ))),
    ));
    await tester.tap(find.text('打开官网'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
  }

  for (final width in [320.0, 1280.0]) {
    testWidgets('工具栏不遮挡网页，进度及标题更新 width=$width', (tester) async {
      await open(tester, width: width, dark: width == 320);
      platform.delegate.started(_url);
      platform.delegate.progress(42);
      await tester.pump();
      expect(
          tester
              .widget<LinearProgressIndicator>(
                  find.byType(LinearProgressIndicator))
              .value,
          .42);
      final web = tester.getRect(find.byKey(const ValueKey('web-content')));
      for (final label in ['关闭网页', '后退', '前进', '刷新网页']) {
        expect(web.overlaps(tester.getRect(find.byTooltip(label))), isFalse);
      }
      platform.controller.title = 'A long webpage title ' * 10;
      platform.delegate.finished(_url);
      await tester.pumpAndSettle();
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.text(platform.controller.title.trim()), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('前进后退按钮跟随历史，系统返回优先后退，起点退出', (tester) async {
    await open(tester);
    platform.delegate.finished(_url);
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<IconButton>(
                find.widgetWithIcon(IconButton, Icons.arrow_back_rounded))
            .onPressed,
        isNull);
    platform.controller.back = true;
    platform.delegate.urlChanged(
        const UrlChange(url: 'https://robertsspaceindustries.com/store'));
    await tester.pump();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(platform.controller.backCalls, 1);
    expect(find.byType(FullScreenWebView), findsOneWidget);
    await tester.tap(find.byTooltip('前进'));
    await tester.pumpAndSettle();
    expect(platform.controller.forwardCalls, 1);
    await tester.tap(find.byTooltip('后退'));
    await tester.pumpAndSettle();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(FullScreenWebView), findsNothing);
  });

  testWidgets('关闭按钮即使有网页历史也直接退出', (tester) async {
    await open(tester);
    platform.controller.back = true;
    platform.delegate.finished(_url);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('关闭网页'));
    await tester.pumpAndSettle();
    expect(platform.controller.backCalls, 0);
    expect(find.byType(FullScreenWebView), findsNothing);
  });

  testWidgets('忽略资源错误和取消事件，主页面失败可重试且完成事件不抹除错误', (tester) async {
    await open(tester);
    platform.delegate.started(_url);
    for (final error in [
      const WebResourceError(
          errorCode: 1, description: '', isForMainFrame: false),
      const WebResourceError(
          errorCode: -999, description: '', isForMainFrame: true),
    ]) {
      platform.delegate.error(error);
    }
    await tester.pump();
    expect(find.text('重新加载'), findsNothing);
    platform.delegate.error(const WebResourceError(
        errorCode: -1009, description: '', isForMainFrame: true));
    platform.delegate.finished(_url);
    await tester.pumpAndSettle();
    expect(find.text('重新加载'), findsOneWidget);
    await tester.tap(find.text('重新加载'));
    await tester.pump();
    expect(platform.controller.requests, [Uri.parse(_url), Uri.parse(_url)]);
    platform.delegate.started(_url);
    platform.delegate.finished(_url);
    await tester.pumpAndSettle();
    expect(find.text('重新加载'), findsNothing);
    await tester.tap(find.byTooltip('刷新网页'));
    await tester.pump();
    expect(platform.controller.reloads, 1);
  });

  testWidgets('初始化失败可以重新创建 WebView', (tester) async {
    platform.failInitialization = true;
    await open(tester);
    expect(find.text('网页初始化失败，请重试'), findsOneWidget);
    platform.failInitialization = false;
    await tester.tap(find.text('重新加载'));
    await tester.pump();
    expect(platform.controller.requests, [Uri.parse(_url)]);
    platform.delegate.finished(_url);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('web-content')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('HTTP 资源错误不覆盖网页，当前页面错误可重试失败地址', (tester) async {
    await open(tester);
    platform.delegate.started(_url);
    platform.delegate.httpError(HttpResponseError(
      request:
          WebResourceRequest(uri: Uri.parse('https://example.com/image.png')),
    ));
    await tester.pump();
    expect(find.text('重新加载'), findsNothing);
    const nextUrl = 'https://robertsspaceindustries.com/store';
    platform.delegate.started(nextUrl);
    platform.delegate.httpError(HttpResponseError(
      request: WebResourceRequest(uri: Uri.parse(nextUrl)),
    ));
    await tester.pumpAndSettle();
    expect(find.text('网页暂时无法访问，请稍后重试'), findsOneWidget);
    await tester.tap(find.text('重新加载'));
    await tester.pump();
    expect(platform.controller.requests.last, Uri.parse(nextUrl));
    platform.delegate.finished(nextUrl);
    await tester.pumpAndSettle();
  });

  testWidgets('独立窗口关闭等待同步且只回调一次，不退出主路由', (tester) async {
    final syncing = Completer<void>();
    final results = <bool>[];
    await tester.pumpWidget(MaterialApp(
      home: FullScreenWebView(
        url: _url,
        authenticated: false,
        synchronize: () => syncing.future,
        onClose: (success) async => results.add(success),
      ),
    ));
    await tester.pump();
    await tester.tap(find.byTooltip('关闭网页'));
    await tester.pump();
    expect(results, isEmpty);
    syncing.complete();
    await tester.pump();
    expect(results, [true]);
    expect(find.byType(FullScreenWebView), findsOneWidget);
    await tester.tap(find.byTooltip('关闭网页'));
    await tester.pump();
    expect(results, [true]);
  });

  testWidgets('切换账号清空旧窗口，迟到的同步不能返回成功', (tester) async {
    final valid = ValueNotifier(true);
    final syncing = Completer<void>();
    final results = <bool>[];
    await tester.pumpWidget(MaterialApp(
      home: FullScreenWebView(
        url: _url,
        authenticated: false,
        sessionValid: valid,
        synchronize: () => syncing.future,
        onClose: (success) async => results.add(success),
      ),
    ));
    await tester.pump();
    await tester.tap(find.byTooltip('关闭网页'));
    valid.value = false;
    await tester.pump();
    expect(platform.controller.html, ['<html></html>']);
    expect(results, [false]);
    syncing.complete();
    await tester.pump();
    expect(results, [false]);
    await tester.pumpWidget(const SizedBox());
    valid.dispose();
  });

  testWidgets('独立窗口同步失败仍可关闭并返回失败', (tester) async {
    final results = <bool>[];
    await tester.pumpWidget(MaterialApp(
      home: FullScreenWebView(
        url: _url,
        authenticated: false,
        synchronize: () async => throw StateError('offline'),
        onClose: (success) async => results.add(success),
      ),
    ));
    await tester.pump();
    await tester.tap(find.byTooltip('关闭网页'));
    await tester.pump();
    expect(results, [false]);
    expect(tester.takeException(), isNull);
  });
}
