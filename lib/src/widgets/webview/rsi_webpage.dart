import 'package:flutter/cupertino.dart';

import '../../funcs/rsi_web_session.dart';
import '../../funcs/toast.dart';
import '../../services/rsi_cookie_store.dart';
import '../../services/rsi_session_service.dart';
import '../../services/rsi_web_session.dart';
import 'full_screen_webview.dart';

bool _openingRsiPage = false;

Future<bool> openRsiWebview({
  required BuildContext context,
  bool replace = false,
  required String url,
  RsiWebSessionAttempt? attempt,
}) async {
  if (!NativeRsiCookieStore.isSupported) {
    showAlert(message: '暂不支持此平台QAQ');
    return false;
  }
  if (_openingRsiPage) return false;
  _openingRsiPage = true;
  final operation = attempt ?? RsiWebSessionAttempt();
  final authenticated = Uri.parse(url).host == RsiSessionService.origin.host;
  try {
    if (authenticated) {
      await rsiWebSession.ensure(operation);
      await RsiSessionService.instance.prepareStore();
    }
    if (!context.mounted) return false;
    final navigator = Navigator.of(context);
    final route = CupertinoPageRoute<bool>(
      builder: (_) => FullScreenWebView(url: url, authenticated: authenticated),
    );
    final result = replace
        ? await navigator.pushReplacement<bool, void>(route)
        : await navigator.push<bool>(route);
    return result == true;
  } catch (error) {
    showAlert(
        message: error is RsiSessionExpired
            ? '自动登录未能恢复会话，请在 App 中手动登录后重试'
            : '无法打开网页，请检查网络或重新登录后重试');
    return false;
  } finally {
    _openingRsiPage = false;
  }
}

Future<bool> openRsiCartWebview(
        {required BuildContext context,
        bool replace = false,
        RsiWebSessionAttempt? attempt}) =>
    openRsiWebview(
      context: context,
      replace: replace,
      attempt: attempt,
      url: 'https://robertsspaceindustries.com/store/pledge/cart',
    );

void openRsiHangarWebview(
    {required BuildContext context, bool replace = false, int page = 1}) {
  openRsiWebview(
      context: context,
      replace: replace,
      url: 'https://robertsspaceindustries.com/account/pledges?page=$page');
}
