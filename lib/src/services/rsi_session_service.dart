import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart';

import '../repo/user.dart';
import 'rsi_cookie_store.dart';

class RsiSessionChanged implements Exception {
  @override
  String toString() => '账号已切换，请重新操作';
}

class RsiSessionExpired implements Exception {
  @override
  String toString() => '登录已失效，请重新登录';
}

class RsiSessionSyncFailed implements Exception {
  @override
  String toString() => '网页登录状态同步失败，请重试';
}

typedef PersistRsiCredentials = Future<void> Function(
    String handle, String token, String device);

class RsiSessionService extends ChangeNotifier {
  RsiSessionService(
      {required RsiCookieStore store, PersistRsiCredentials? persist})
      : _store = store,
        _persist = persist;

  static final instance = RsiSessionService(
    store: NativeRsiCookieStore(),
    persist: (handle, token, device) =>
        UserRepo().updateSession(handle: handle, token: token, device: device),
  );

  static final origin = Uri.parse('https://robertsspaceindustries.com/');
  static const cookieNames = {
    'Rsi-Token',
    '_rsi_device',
    'Rsi-Account-Auth',
    'Rsi-ShipUpgrades-Context',
  };
  final RsiCookieStore _store;
  final PersistRsiCredentials? _persist;
  final _lock = Lock();
  final _cookies = <String, Cookie>{};
  final _revisions = <String, int>{};
  String? account;
  int generation = 0;
  int revision = 0;
  bool _webReady = false;
  bool _needsReset = true;
  bool _syncFailed = false;

  String value(String name) => _cookies[name]?.value ?? '';
  String get header => _cookies.values
      .where((cookie) => cookie.value.isNotEmpty)
      .map((cookie) => '${cookie.name}=${cookie.value}')
      .join('; ');

  void assertGeneration(int expected) {
    if (generation != expected) throw RsiSessionChanged();
  }

  void setValue(String name, String value) {
    if (!cookieNames.contains(name)) return;
    _cookies[name] = Cookie(name, value)
      ..path = '/'
      ..secure = true
      ..httpOnly = true;
    _revisions[name] = ++revision;
  }

  /// 同步递增 generation，使已发出的旧请求立即失效。
  Future<void> reset({String? handle, String token = '', String device = ''}) {
    generation++;
    account = handle;
    _cookies.clear();
    _revisions.clear();
    setValue('Rsi-Token', token);
    setValue('_rsi_device', device);
    _needsReset = true;
    _syncFailed = false;
    notifyListeners();
    return _lock.synchronized(() async {
      if (_webReady) {
        await _store.clear();
        _webReady = false;
      }
    });
  }

  void bindAccount(String handle) {
    account = handle;
  }

  Future<void> _save() async {
    final handle = account;
    if (handle != null && _persist != null) {
      await _persist(handle, value('Rsi-Token'), value('_rsi_device'));
    }
  }

  Future<void> acceptResponse(Uri url, List<String> rawCookies,
      {required int requestGeneration, required int requestRevision}) {
    return _lock.synchronized(() async {
      assertGeneration(requestGeneration);
      if (url.scheme != 'https' || url.host != origin.host) return;
      final accepted = <String>[];
      final originalRevisions = Map<String, int>.of(_revisions);
      for (final raw in rawCookies) {
        Cookie cookie;
        try {
          cookie = Cookie.fromSetCookieValue('$raw;');
        } on FormatException {
          continue;
        } on HttpException {
          continue;
        }
        if (!cookieNames.contains(cookie.name)) continue;
        if (cookie.path == null || !cookie.path!.startsWith('/')) {
          final slash = url.path.lastIndexOf('/');
          cookie.path = slash <= 0 ? '/' : url.path.substring(0, slash);
        }
        final domain = cookie.domain?.replaceFirst(RegExp(r'^\.'), '');
        if (domain != null && domain != origin.host) continue;
        if ((originalRevisions[cookie.name] ?? 0) > requestRevision) continue;
        final expired = cookie.maxAge != null
            ? cookie.maxAge! <= 0
            : cookie.expires != null &&
                !cookie.expires!.isAfter(DateTime.now());
        if (expired || cookie.value.isEmpty) {
          _cookies.remove(cookie.name);
        } else {
          _cookies[cookie.name] = cookie;
        }
        _revisions[cookie.name] = ++revision;
        accepted.add(raw);
      }
      if (accepted.isEmpty) return;
      await _save();
      if (_webReady && !_needsReset) {
        try {
          await _store.write(url, accepted);
        } catch (_) {
          _syncFailed = true;
          throw RsiSessionSyncFailed();
        }
      }
    });
  }

  Future<void> prepareStore() => _lock.synchronized(() async {
        final expected = generation;
        if (_syncFailed) {
          _needsReset = true;
          _syncFailed = false;
        }
        if (_needsReset) {
          await _store.clear();
          assertGeneration(expected);
          final seeds = _cookies.values
              .where((c) => c.value.isNotEmpty)
              .map((c) => c.toString())
              .toList();
          await _store.write(origin, seeds);
          assertGeneration(expected);
          _needsReset = false;
        }
        _webReady = true;
      });

  /// 先验证候选网页身份，验证请求不得写回会话，防止串号后污染 App。
  Future<void> synchronizeFromWeb(
      Future<String?> Function(String cookieHeader) identify,
      {bool verifyIdentity = false}) async {
    if (_syncFailed) await prepareStore();
    if (!_webReady || _needsReset) return;
    // 网络验证不能持有 Cookie 锁，否则会阻塞 API 响应拦截器。
    final expected = generation;
    final snapshotRevision = revision;
    final candidates = await _lock.synchronized(() async {
      if (_syncFailed) throw RsiSessionSyncFailed();
      return parseRsiCookieHeader(await _store.read(origin));
    });
    assertGeneration(expected);
    final filtered = Map<String, String>.fromEntries(
        candidates.entries.where((e) => cookieNames.contains(e.key)));
    if (!verifyIdentity &&
        cookieNames.every((name) => ((!filtered.containsKey(name) &&
                (_cookies[name]?.path ?? '/') != '/') ||
            (filtered[name] ?? '') == value(name)))) {
      return;
    }
    final candidateHeader = filtered.entries
        .map((entry) => '${entry.key}=${entry.value}')
        .join('; ');
    final handle = await identify(candidateHeader);
    assertGeneration(expected);
    if (handle == null) throw RsiSessionExpired();
    if (handle != account) {
      await reset(
          handle: account,
          token: value('Rsi-Token'),
          device: value('_rsi_device'));
      throw RsiSessionChanged();
    }
    await _lock.synchronized(() async {
      assertGeneration(expected);
      // 验证期间 API 已更新凭证时保留较新的值。
      for (final name in cookieNames) {
        if ((_revisions[name] ?? 0) > snapshotRevision) continue;
        // 不丢弃仅在升级接口路径下可见的 Cookie。
        if (!filtered.containsKey(name) &&
            (_cookies[name]?.path ?? '/') != '/') {
          continue;
        }
        final next = filtered[name] ?? '';
        if (next == value(name)) continue;
        final existing = _cookies[name];
        if (existing != null) {
          existing.value = next;
          _revisions[name] = ++revision;
        } else {
          setValue(name, next);
        }
      }
      await _save();
    });
  }
}
