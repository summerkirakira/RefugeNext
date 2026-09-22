import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as windows;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:window_manager/window_manager.dart';

import '../../funcs/rsi_web_session.dart';
import '../../services/rsi_session_service.dart';
import '../../services/windows_webview_environment.dart';
import 'browser_controller.dart';

class FullScreenWebView extends StatefulWidget {
  const FullScreenWebView(
      {super.key,
      required this.url,
      this.authenticated = true,
      this.synchronize,
      this.onClose,
      this.sessionValid});

  final String url;
  final bool authenticated;
  final Future<void> Function()? synchronize;
  final Future<void> Function(bool success)? onClose;
  final ValueListenable<bool>? sessionValid;

  @override
  State<FullScreenWebView> createState() => _FullScreenWebViewState();
}

class _FullScreenWebViewState extends State<FullScreenWebView>
    with WidgetsBindingObserver, WindowListener {
  final _session = RsiSessionService.instance;
  late final int _generation;
  BrowserController? _controller;
  windows.WebViewEnvironment? _windowsEnvironment;
  Future<bool>? _syncing;
  bool _isLoading = true;
  bool _closing = false;
  bool _canPop = false;
  bool _closeRequested = false;
  bool _navigating = false;
  bool _reloading = false;
  bool _canGoBack = false;
  bool _canGoForward = false;
  int _progress = 0;
  int _metadataRevision = 0;
  late String _currentUrl;
  String _title = '';
  String? _pageError;
  String? _sessionError;

  @override
  void initState() {
    super.initState();
    _generation = _session.generation;
    _currentUrl = widget.url;
    WidgetsBinding.instance.addObserver(this);
    if (widget.authenticated) _session.addListener(_accountChanged);
    widget.sessionValid?.addListener(_accountChanged);
    if (widget.onClose != null) windowManager.addListener(this);
    if (widget.sessionValid?.value == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _finish(false));
    } else {
      _initWebView();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _session.removeListener(_accountChanged);
    widget.sessionValid?.removeListener(_accountChanged);
    if (widget.onClose != null) windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) unawaited(_syncSession());
  }

  @override
  void onWindowClose() => unawaited(_close());

  void _accountChanged() {
    if (!mounted) return;
    if (widget.sessionValid != null
        ? widget.sessionValid!.value
        : _session.generation == _generation) {
      return;
    }
    // 停止旧账号页面继续产生请求，然后关闭它。
    unawaited(
        (_controller?.loadHtmlString('<html></html>') ?? Future<void>.value())
            .catchError((Object _) {}));
    _finish(false);
  }

  Future<void> _initWebView() async {
    try {
      if (Platform.isWindows) {
        final environment = await WindowsWebviewEnvironment.ensure();
        if (mounted && !_closing && widget.sessionValid?.value != false) {
          setState(() => _windowsEnvironment = environment);
        }
        return;
      }
      final controller = WebViewController();
      await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
      await controller.setNavigationDelegate(NavigationDelegate(
        onPageStarted: _pageStarted,
        onProgress: _progressChanged,
        onUrlChange: (change) => _urlChanged(change.url),
        onPageFinished: _pageFinished,
        onWebResourceError: (error) {
          // WebKit 的 -999 表示导航被后续导航取消，并非网页加载失败。
          if (error.isForMainFrame == true && error.errorCode != -999) {
            _showPageError('网页加载失败，请检查网络后重试');
          }
        },
        onHttpError: (error) {
          // 只处理当前页面自身的响应，图片等资源失败不覆盖网页。
          if (error.request?.uri.toString() == _currentUrl) {
            _showPageError('网页暂时无法访问，请稍后重试');
          }
        },
        onNavigationRequest: (request) => _navigationRequest(request.url),
      ));
      if (!mounted || _closing) return;
      if (widget.authenticated) _session.assertGeneration(_generation);
      setState(() => _controller = FlutterBrowserController(controller));
      // 认证统一由 Cookie 存储携带，不能附加过时的 Cookie 请求头。
      await controller.loadRequest(Uri.parse(widget.url));
    } catch (_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _pageError = '网页初始化失败，请重试';
        });
      }
    }
  }

  void _pageStarted(String url) {
    if (!mounted || _closing) return;
    setState(() {
      _currentUrl = url;
      _title = '';
      _pageError = null;
      _isLoading = true;
      _progress = 0;
    });
    unawaited(_updateBrowserState());
  }

  void _progressChanged(int progress) {
    if (mounted && !_closing) {
      setState(() => _progress = progress.clamp(0, 100));
    }
  }

  void _urlChanged(String? url) {
    if (!mounted || _closing) return;
    if (url != null) setState(() => _currentUrl = url);
    unawaited(_updateBrowserState());
  }

  Future<void> _pageFinished(String url) async {
    if (!mounted || _closing) return;
    setState(() {
      _isLoading = false;
      _progress = 100;
    });
    unawaited(_updateBrowserState());
    if (Uri.tryParse(url)?.host == RsiSessionService.origin.host) {
      await _syncSession();
    }
  }

  Future<NavigationDecision> _navigationRequest(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return NavigationDecision.prevent;
    if (!['http', 'https'].contains(uri.scheme)) {
      if (uri.scheme == 'about') return NavigationDecision.navigate;
      await _launch(uri, LaunchMode.externalApplication);
      return NavigationDecision.prevent;
    }
    if (url.startsWith('https://g.alipayplus.com/page/checkout')) {
      await _launch(uri, LaunchMode.externalApplication);
      return NavigationDecision.prevent;
    }
    if (url.startsWith('https://checkoutshopper-live.adyen')) {
      await _launch(uri, LaunchMode.inAppBrowserView);
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  Widget _webView() {
    if (!Platform.isWindows) {
      return WebViewWidget(
          controller: (_controller! as FlutterBrowserController).controller);
    }
    return windows.InAppWebView(
      webViewEnvironment: _windowsEnvironment,
      initialUrlRequest: windows.URLRequest(url: windows.WebUri(widget.url)),
      initialSettings: windows.InAppWebViewSettings(
        javaScriptEnabled: true,
        useShouldOverrideUrlLoading: true,
        supportMultipleWindows: true,
      ),
      onWebViewCreated: (controller) {
        if (widget.sessionValid?.value == false || _closing) {
          unawaited(controller.loadData(data: ''));
          return;
        }
        setState(() => _controller = WindowsBrowserController(controller));
      },
      onLoadStart: (_, url) => _pageStarted(url?.toString() ?? _currentUrl),
      onLoadStop: (_, url) => _pageFinished(url?.toString() ?? _currentUrl),
      onProgressChanged: (_, progress) => _progressChanged(progress),
      onUpdateVisitedHistory: (_, url, __) => _urlChanged(url?.toString()),
      onTitleChanged: (_, __) => _updateBrowserState(),
      onReceivedError: (_, request, error) {
        if (request.isForMainFrame == true &&
            error.type != windows.WebResourceErrorType.CANCELLED) {
          _showPageError('网页加载失败，请检查网络后重试');
        }
      },
      onReceivedHttpError: (_, request, response) {
        if (request.isForMainFrame == true) _showPageError('网页暂时无法访问，请稍后重试');
      },
      shouldOverrideUrlLoading: (_, action) async =>
          await _navigationRequest(action.request.url?.toString() ?? '') ==
                  NavigationDecision.navigate
              ? windows.NavigationActionPolicy.ALLOW
              : windows.NavigationActionPolicy.CANCEL,
      onCreateWindow: (controller, action) async {
        final url = action.request.url;
        if (url != null &&
            await _navigationRequest(url.toString()) ==
                NavigationDecision.navigate) {
          await controller.loadUrl(urlRequest: action.request);
        }
        return false;
      },
    );
  }

  Future<void> _launch(Uri uri, LaunchMode mode) async {
    try {
      if (!await _syncSession()) return;
      if (!await launchUrl(uri, mode: mode)) {
        throw StateError('launch failed');
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('无法打开外部页面，请重试')),
        );
      }
    }
  }

  Future<bool> _syncSession() async {
    if (widget.sessionValid?.value == false || _closing) return false;
    if (!widget.authenticated && widget.synchronize == null) return true;
    if (widget.authenticated && _session.generation != _generation) {
      return false;
    }
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
      if (widget.synchronize != null) {
        await widget.synchronize!();
        if (widget.sessionValid?.value == false) return false;
      } else {
        await synchronizeRsiWebSession(verifyIdentity: true);
        _session.assertGeneration(_generation);
      }
      if (mounted) setState(() => _sessionError = null);
      return true;
    } catch (error) {
      if (mounted) {
        setState(() => _sessionError = error is RsiSessionExpired
            ? '网页登录已失效，请关闭后重试；需要验证码时请在 App 中登录'
            : '登录状态同步失败，请关闭后重试');
      }
      return false;
    }
  }

  Future<void> _close() async {
    if (_closing || _closeRequested) return;
    setState(() => _closeRequested = true);
    final success = await _syncSession();
    _finish(success);
  }

  void _finish(bool success) {
    if (!mounted || _closing) return;
    _closing = true;
    if (widget.onClose != null) {
      unawaited(widget.onClose!(success));
      return;
    }
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

  Future<void> _updateBrowserState() async {
    final controller = _controller;
    if (controller == null) return;
    final revision = ++_metadataRevision;
    try {
      final values = await Future.wait<Object?>([
        controller.canGoBack(),
        controller.canGoForward(),
        controller.getTitle(),
      ]);
      if (!mounted || _closing || revision != _metadataRevision) return;
      setState(() {
        _canGoBack = values[0] as bool;
        _canGoForward = values[1] as bool;
        if (!_isLoading) _title = (values[2] as String?)?.trim() ?? '';
      });
    } catch (_) {
      // 页面切换期间元数据可能暂不可用，下一次导航事件会再次读取。
    }
  }

  void _showPageError(String message) {
    if (!mounted || _closing) return;
    setState(() {
      _isLoading = false;
      _pageError = message;
    });
    unawaited(_updateBrowserState());
  }

  Future<void> _navigate(
      {bool forward = false, bool closeAtStart = false}) async {
    if (_navigating || _closeRequested || _closing) return;
    setState(() => _navigating = true);
    try {
      final controller = _controller;
      final possible = controller != null &&
          (forward
              ? await controller.canGoForward()
              : await controller.canGoBack());
      if (!mounted || _closing) return;
      if (possible) {
        if (forward) {
          await controller.goForward();
        } else {
          await controller.goBack();
        }
        await _updateBrowserState();
      } else if (closeAtStart) {
        await _close();
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('暂时无法切换网页，请重试')),
        );
      }
    } finally {
      if (mounted) setState(() => _navigating = false);
    }
  }

  Future<void> _reload() async {
    if (_reloading || _closeRequested || _closing) return;
    final retryFailedPage = _pageError != null;
    setState(() => _reloading = true);
    try {
      if (!await _syncSession() || !mounted || _closing) return;
      setState(() {
        _pageError = null;
        _isLoading = true;
        _progress = 0;
      });
      if (_controller == null) {
        await _initWebView();
      } else if (retryFailedPage) {
        await _controller!.loadRequest(Uri.parse(_currentUrl));
      } else {
        await _controller!.reload();
      }
    } catch (_) {
      _showPageError('网页加载失败，请检查网络后重试');
    } finally {
      if (mounted) setState(() => _reloading = false);
    }
  }

  List<Widget> _navigationButtons() {
    final enabled = !_closeRequested && !_navigating;
    return [
      IconButton(
        tooltip: '后退',
        onPressed: enabled && _canGoBack ? () => _navigate() : null,
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      IconButton(
        tooltip: '前进',
        onPressed:
            enabled && _canGoForward ? () => _navigate(forward: true) : null,
        icon: const Icon(Icons.arrow_forward_rounded),
      ),
      IconButton(
        tooltip: '刷新网页',
        onPressed: _closeRequested || _reloading ? null : _reload,
        icon: const Icon(Icons.refresh_rounded),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final host = Uri.tryParse(_currentUrl)?.host ?? '';
    return PopScope<bool>(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) unawaited(_navigate(closeAtStart: true));
      },
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            final compact = constraints.maxWidth < 600;
            return Column(
              children: [
                Material(
                  color: colors.surfaceContainerLow,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Row(
                      children: [
                        IconButton(
                          tooltip: '关闭网页',
                          onPressed: _closeRequested ? null : _close,
                          icon: _closeRequested
                              ? const SizedBox.square(
                                  dimension: 18,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2))
                              : const Icon(Icons.close_rounded),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_title.isEmpty ? '浏览官网' : _title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              if (host.isNotEmpty)
                                Text(host,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: colors.onSurfaceVariant)),
                            ],
                          ),
                        ),
                        if (!compact) ..._navigationButtons(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                  child: _isLoading
                      ? LinearProgressIndicator(
                          value: _progress == 0 ? null : _progress / 100,
                          semanticsLabel: '网页加载进度',
                        )
                      : null,
                ),
                if (_sessionError != null)
                  Material(
                    color: colors.errorContainer,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(children: [
                        Expanded(
                            child: Text(_sessionError!,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: colors.onErrorContainer))),
                        TextButton(
                            onPressed: _closeRequested ? null : _syncSession,
                            child: const Text('重试')),
                      ]),
                    ),
                  ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (_controller != null || _windowsEnvironment != null)
                        _webView(),
                      if (_pageError != null)
                        ColoredBox(
                          color: colors.surface,
                          child: Center(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.cloud_off_rounded,
                                        size: 36,
                                        color: colors.onSurfaceVariant),
                                    const SizedBox(height: 16),
                                    Text(_pageError!,
                                        textAlign: TextAlign.center),
                                    const SizedBox(height: 16),
                                    FilledButton.icon(
                                      onPressed: _reloading || _closeRequested
                                          ? null
                                          : _reload,
                                      icon: const Icon(Icons.refresh_rounded),
                                      label: const Text('重新加载'),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (compact)
                  Material(
                    color: colors.surfaceContainerLow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _navigationButtons(),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
