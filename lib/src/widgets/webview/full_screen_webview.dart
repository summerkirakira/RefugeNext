import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../funcs/rsi_web_session.dart';
import '../../services/rsi_session_service.dart';

class FullScreenWebView extends StatefulWidget {
  const FullScreenWebView(
      {super.key, required this.url, this.authenticated = true});

  final String url;
  final bool authenticated;

  @override
  State<FullScreenWebView> createState() => _FullScreenWebViewState();
}

class _FullScreenWebViewState extends State<FullScreenWebView>
    with WidgetsBindingObserver {
  final _session = RsiSessionService.instance;
  late final int _generation;
  WebViewController? _controller;
  Future<bool>? _syncing;
  bool _isLoading = true;
  bool _closing = false;
  bool _canPop = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _generation = _session.generation;
    WidgetsBinding.instance.addObserver(this);
    if (widget.authenticated) _session.addListener(_accountChanged);
    _initWebView();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _session.removeListener(_accountChanged);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) unawaited(_syncSession());
  }

  void _accountChanged() {
    if (_session.generation == _generation || !mounted) return;
    // 停止旧账号页面继续产生请求，然后关闭它。
    unawaited((_controller?.loadHtmlString('') ?? Future<void>.value())
        .catchError((Object _) {}));
    _finish(false);
  }

  Future<void> _initWebView() async {
    try {
      final controller = WebViewController();
      await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
      await controller.setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) {
          if (mounted) setState(() => _isLoading = true);
        },
        onPageFinished: (url) async {
          if (!mounted) return;
          setState(() => _isLoading = false);
          if (Uri.tryParse(url)?.host == RsiSessionService.origin.host) {
            await _syncSession();
          }
        },
        onWebResourceError: (error) {
          if (mounted && error.isForMainFrame == true) {
            setState(() {
              _isLoading = false;
              _error = '网页加载失败，请重试';
            });
          }
        },
        onNavigationRequest: (request) async {
          final uri = Uri.tryParse(request.url);
          if (uri == null) return NavigationDecision.prevent;
          if (!['http', 'https'].contains(uri.scheme)) {
            if (uri.scheme == 'about') return NavigationDecision.navigate;
            await _launch(uri, LaunchMode.externalApplication);
            return NavigationDecision.prevent;
          }
          if (request.url
              .startsWith('https://g.alipayplus.com/page/checkout')) {
            await _launch(uri, LaunchMode.externalApplication);
            return NavigationDecision.prevent;
          }
          if (request.url.startsWith('https://checkoutshopper-live.adyen')) {
            await _launch(uri, LaunchMode.inAppBrowserView);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ));
      if (!mounted || _closing) return;
      if (widget.authenticated) _session.assertGeneration(_generation);
      setState(() => _controller = controller);
      // 认证统一由 Cookie 存储携带，不能附加过时的 Cookie 请求头。
      await controller.loadRequest(Uri.parse(widget.url));
    } catch (_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = '网页初始化失败，请关闭后重试';
        });
      }
    }
  }

  Future<void> _launch(Uri uri, LaunchMode mode) async {
    try {
      if (!await _syncSession()) return;
      if (!await launchUrl(uri, mode: mode)) {
        throw StateError('launch failed');
      }
    } catch (_) {
      if (mounted) setState(() => _error = '无法打开支付页面，请重试');
    }
  }

  Future<bool> _syncSession() async {
    if (!widget.authenticated) return true;
    if (_closing || _session.generation != _generation) return false;
    final pending = _syncing;
    if (pending != null) return pending;
    final future = _synchronize();
    _syncing = future;
    try {
      return await future;
    } finally {
      _syncing = null;
    }
  }

  Future<bool> _synchronize() async {
    try {
      await synchronizeRsiWebSession(verifyIdentity: true);
      _session.assertGeneration(_generation);
      if (mounted) setState(() => _error = null);
      return true;
    } catch (error) {
      if (mounted) {
        setState(() => _error = error is RsiSessionExpired
            ? '网页登录已失效，请关闭后重试；需要验证码时请在 App 中登录'
            : '登录状态同步失败，请关闭后重试');
      }
      return false;
    }
  }

  Future<void> _close() async {
    if (_closing) return;
    final success = await _syncSession();
    _finish(success);
  }

  void _finish(bool success) {
    if (!mounted || _closing) return;
    _closing = true;
    final route = ModalRoute.of(context);
    final navigator = Navigator.of(context);
    setState(() => _canPop = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (route?.isCurrent == true) {
        navigator.pop(success);
      } else if (route != null && route.isActive) {
        navigator.removeRoute(route, false);
      }
    });
  }

  @override
  Widget build(BuildContext context) => PopScope<bool>(
        canPop: _canPop,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) unawaited(_close());
        },
        child: Scaffold(
          body: SafeArea(
              child: Stack(children: [
            if (_controller != null) WebViewWidget(controller: _controller!),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
            if (_error != null)
              Positioned(
                  left: 8,
                  right: 70,
                  top: 8,
                  child: Material(
                      color: Theme.of(context).colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(_error!)))),
            Positioned(
                top: Platform.isWindows || Platform.isMacOS ? 40 : 100,
                right: 10,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: _close),
                      IconButton(
                          icon: const Icon(Icons.refresh_outlined),
                          onPressed: _controller == null
                              ? null
                              : () async {
                                  if (await _syncSession()) {
                                    await _controller?.reload();
                                  }
                                }),
                    ]))),
          ])),
        ),
      );
}
