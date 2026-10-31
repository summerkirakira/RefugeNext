import 'rsi_session_service.dart';

class RsiWebSessionAttempt {
  bool didRelogin = false;
  bool recovering = false;
  String? account;
}

/// 一次用户操作只恢复登录一次，并发入口共享正在进行的认证。
class RsiWebSessionCoordinator {
  RsiWebSessionCoordinator({
    required this.session,
    required this.synchronize,
    required this.identify,
    required this.refreshCsrf,
    required this.authorize,
    required this.relogin,
  });

  final RsiSessionService session;
  final Future<void> Function() synchronize;
  final Future<String?> Function() identify;
  final Future<void> Function() refreshCsrf;
  final Future<void> Function() authorize;
  final Future<bool> Function() relogin;
  Future<void>? _pending;
  RsiWebSessionAttempt? _pendingAttempt;

  /// Only a confirmed expired/anonymous session starts automatic login.
  /// Returns true when the browser must load its page with restored cookies.
  Future<bool> synchronizeWeb(RsiWebSessionAttempt attempt,
      {required Future<void> Function() verify}) async {
    attempt.account ??= session.account;
    if (attempt.account != session.account) throw RsiSessionChanged();
    try {
      await verify();
      return false;
    } on RsiSessionExpired {
      attempt.recovering = true;
      try {
        await ensure(attempt);
        await session.prepareStore();
        return true;
      } finally {
        attempt.recovering = false;
      }
    }
  }

  Future<void> ensure(RsiWebSessionAttempt attempt) async {
    attempt.account ??= session.account ?? _pendingAttempt?.account;
    final pending = _pending;
    if (pending != null) {
      final activeAttempt = _pendingAttempt!;
      if (attempt.account != activeAttempt.account ||
          (session.account != null && session.account != attempt.account)) {
        throw RsiSessionChanged();
      }
      try {
        await pending;
        if (session.account != attempt.account) throw RsiSessionChanged();
      } finally {
        attempt.didRelogin |= activeAttempt.didRelogin;
      }
      return;
    }
    if (attempt.account != session.account) throw RsiSessionChanged();
    _pendingAttempt = attempt;
    final operation = _ensure(attempt);
    _pending = operation;
    try {
      await operation;
    } finally {
      _pending = null;
      _pendingAttempt = null;
    }
  }

  Future<void> _ensure(RsiWebSessionAttempt attempt) async {
    final account = session.account;
    if (account == null) throw RsiSessionExpired();
    var expected = session.generation;
    var expired = false;
    try {
      await synchronize();
      session.assertGeneration(expected);
      await refreshCsrf();
      session.assertGeneration(expected);
      final identity = await identify();
      session.assertGeneration(expected);
      expired = identity == null;
      if (identity != null && identity != account) throw RsiSessionChanged();
    } on RsiSessionExpired {
      expired = true;
    }
    if (expired) {
      session.assertGeneration(expected);
      if (attempt.didRelogin) throw RsiSessionExpired();
      attempt.didRelogin = true;
      if (!await relogin()) throw RsiSessionExpired();
      if (session.account != account) throw RsiSessionChanged();
      expected = session.generation;
      await refreshCsrf();
      session.assertGeneration(expected);
      final identity = await identify();
      session.assertGeneration(expected);
      if (identity == null) throw RsiSessionExpired();
      if (identity != account) throw RsiSessionChanged();
    }
    await authorize();
    session.assertGeneration(expected);
  }
}
