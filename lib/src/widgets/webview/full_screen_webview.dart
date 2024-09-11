import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../datasource/data_model.dart';

class FullScreenWebView extends StatefulWidget {
  final String url;
  final Map<String, String> headers;

  FullScreenWebView({
    required this.url,
    this.headers = const {},
  });

  @override
  _FullScreenWebViewState createState() => _FullScreenWebViewState();
}

class _FullScreenWebViewState extends State<FullScreenWebView> {
  WebViewController? _controller;
  bool _isLoading = true;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    _initWebView();
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    super.dispose();
  }

  Future<void> _initWebView() async {
    final cookieManager = WebViewCookieManager();

    // 从 headers 中解析并设置 Cookies
    List<WebViewCookie> cookies = _parseCookiesFromHeaders(widget.headers);
    for (var cookie in cookies) {
      await cookieManager.setCookie(cookie);
    }

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            _loadUrlWithHeaders(request.url);
            return NavigationDecision.prevent;
          },
        ),
      );

    _loadUrlWithHeaders(widget.url);
  }

  void _loadUrlWithHeaders(String url) {
    _controller!.loadRequest(
      Uri.parse(url),
      headers: widget.headers,
    );
  }

  List<WebViewCookie> _parseCookiesFromHeaders(Map<String, String> headers) {
    List<WebViewCookie> cookies = [];
    String? cookieHeader = headers['cookie'] ?? headers['Cookie'];

    if (cookieHeader != null) {
      List<String> rawCookies = cookieHeader.split(';');
      for (var rawCookie in rawCookies) {
        List<String> parts = rawCookie.trim().split('=');
        if (parts.length == 2) {
          cookies.add(WebViewCookie(
            name: parts[0].trim(),
            value: parts[1].trim(),
            domain: Uri.parse(widget.url).host,
            path: '/',
          ));
        }
      }
    }
    return cookies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Roberts Space Industries'),
      //   systemOverlayStyle: SystemUiOverlayStyle.light,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.refresh),
      //       onPressed: () {
      //         _controller!.reload();
      //       },
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            if (_controller != null)
              WebViewWidget(controller: _controller!),
            // WebViewWidget(controller: _controller),
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
            Positioned(
              top: 100,
              right: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: Icon(Icons.close_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Positioned(
              top: 160,
              right: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: Icon(Icons.refresh_outlined),
                  onPressed: () {
                    _controller!.reload();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
