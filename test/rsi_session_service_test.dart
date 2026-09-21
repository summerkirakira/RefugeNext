import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/services/rsi_cookie_store.dart';
import 'package:refuge_next/src/services/rsi_session_service.dart';
import 'package:refuge_next/src/services/rsi_web_session.dart';

class MemoryCookies implements RsiCookieStore {
  final values = <String, String>{};
  final writes = <String>[];
  int clears = 0;
  bool failWrite = false;
  @override
  Future<void> clear() async {
    values.clear();
    clears++;
  }

  @override
  Future<String> read(Uri url) async =>
      values.entries.map((e) => '${e.key}=${e.value}').join('; ');
  @override
  Future<void> write(Uri url, List<String> cookies) async {
    if (failWrite) throw StateError('bridge failure');
    for (final raw in cookies) {
      writes.add(raw);
      final cookie = Cookie.fromSetCookieValue(raw);
      if (cookie.maxAge == 0) {
        values.remove(cookie.name);
      } else {
        values[cookie.name] = cookie.value;
      }
    }
  }
}

void main() {
  late MemoryCookies store;
  late RsiSessionService session;
  late List<List<String>> saved;
  setUp(() async {
    store = MemoryCookies();
    saved = [];
    session = RsiSessionService(
        store: store,
        persist: (handle, token, device) async =>
            saved.add([handle, token, device]));
    await session.reset(handle: 'Alice', token: 'initial', device: 'device-a');
  });

  Future<void> receive(List<String> cookies,
          {int? generation, int? revision}) =>
      session.acceptResponse(RsiSessionService.origin, cookies,
          requestGeneration: generation ?? session.generation,
          requestRevision: revision ?? session.revision);

  test('Cookie header keeps padding, percent escapes, plus and empty values',
      () {
    expect(parseRsiCookieHeader(' Rsi-Token=a%2B+b==; empty=; bad; a=x=y'),
        {'Rsi-Token': 'a%2B+b==', 'empty': '', 'a': 'x=y'});
    expect(() => parseRsiCookieHeader('Rsi-Token=a; Rsi-Token=b'),
        throwsFormatException);
  });

  test('Set-Cookie preserves raw value and attributes; matches exact names',
      () async {
    await session.prepareStore();
    const raw = 'Rsi-Token=a%2B+b==; Path=/; Secure; HttpOnly; SameSite=Lax';
    await receive([raw, 'Other-Rsi-Token=wrong; Path=/']);
    expect(session.value('Rsi-Token'), 'a%2B+b==');
    expect(store.writes.last, raw);
    expect(saved.last, ['Alice', 'a%2B+b==', 'device-a']);
  });

  test('Expired and explicitly empty cookies are removed', () async {
    await receive(['Rsi-Token=gone; Max-Age=0; Path=/']);
    expect(session.value('Rsi-Token'), '');
    await receive(['Rsi-Token=gone; Expires=Thu, 01 Jan 1970 00:00:00 GMT']);
    expect(session.value('Rsi-Token'), '');
    await receive(['Rsi-Token=restored']);
    await receive(['Rsi-Token=']);
    expect(session.header, isNot(contains('Rsi-Token=')));
  });

  test('Last Set-Cookie in one response wins', () async {
    await receive(['Rsi-Token=first', 'Rsi-Token=last']);
    expect(session.value('Rsi-Token'), 'last');
  });

  test('Wrong domain does not alter credentials', () async {
    await receive(['Rsi-Token=wrong; Domain=example.com']);
    expect(session.value('Rsi-Token'), 'initial');
  });

  test('Repeated preparation does not clear a live website session', () async {
    await session.prepareStore();
    store.values['Rsi-Token'] = 'web-rotated==';
    await session.synchronizeFromWeb((cookies) async {
      expect(cookies, contains('web-rotated=='));
      return 'Alice';
    });
    await session.prepareStore();
    expect(store.clears, 1);
    expect(session.value('Rsi-Token'), 'web-rotated==');
    expect(saved.last[1], 'web-rotated==');
  });

  test('Switch clears cookies and rejects late previous-account response',
      () async {
    await session.prepareStore();
    final generation = session.generation;
    await session.reset(handle: 'Bob', token: 'bob', device: 'device-b');
    await expectLater(receive(['Rsi-Token=alice-late'], generation: generation),
        throwsA(isA<RsiSessionChanged>()));
    await session.prepareStore();
    expect(store.values['Rsi-Token'], 'bob');
  });

  test('Older API response cannot overwrite a rotated website token', () async {
    await session.prepareStore();
    final revision = session.revision;
    store.values['Rsi-Token'] = 'web-new';
    await session.synchronizeFromWeb((_) async => 'Alice');
    await receive(['Rsi-Token=api-old', 'Rsi-Account-Auth=fresh-auth'],
        revision: revision);
    expect(session.value('Rsi-Token'), 'web-new');
    expect(session.value('Rsi-Account-Auth'), 'fresh-auth');
  });

  test('Wrong website identity is not persisted and triggers reset', () async {
    await session.prepareStore();
    store.values['Rsi-Token'] = 'bob';
    await expectLater(session.synchronizeFromWeb((_) async => 'Bob'),
        throwsA(isA<RsiSessionChanged>()));
    expect(saved, isEmpty);
    expect(session.account, 'Alice');
    expect(session.value('Rsi-Token'), 'initial');
    await session.prepareStore();
    expect(store.values['Rsi-Token'], 'initial');
  });

  test('Anonymous website does not replace saved credentials', () async {
    await session.prepareStore();
    store.values.remove('Rsi-Token');
    await expectLater(session.synchronizeFromWeb((_) async => null),
        throwsA(isA<RsiSessionExpired>()));
    expect(saved, isEmpty);
    expect(session.value('Rsi-Token'), 'initial');
  });

  test('API rotation during website identity probe is retained', () async {
    await session.prepareStore();
    store.values['Rsi-Token'] = 'web';
    final probe = Completer<String?>();
    final started = Completer<void>();
    final sync = session.synchronizeFromWeb((_) {
      started.complete();
      return probe.future;
    });
    await started.future;
    await receive(['Rsi-Token=api-new']);
    probe.complete('Alice');
    await sync;
    expect(session.value('Rsi-Token'), 'api-new');
  });

  test('Bridge write failure is surfaced and next preparation can recover',
      () async {
    await session.prepareStore();
    store.failWrite = true;
    await expectLater(
        receive(['Rsi-Token=new']), throwsA(isA<RsiSessionSyncFailed>()));
    store.failWrite = false;
    await session.prepareStore();
    expect(store.values['Rsi-Token'], 'new');
  });

  test('unchanged but server-expired cookies are checked before closing',
      () async {
    await session.prepareStore();
    await expectLater(
        session.synchronizeFromWeb((_) async => null, verifyIdentity: true),
        throwsA(isA<RsiSessionExpired>()));
  });

  test('an account switch during identity verification discards the result',
      () async {
    await session.prepareStore();
    store.values['Rsi-Token'] = 'alice-web';
    final started = Completer<void>();
    final probe = Completer<String?>();
    final sync = session.synchronizeFromWeb((_) {
      started.complete();
      return probe.future;
    });
    await started.future;
    await session.reset(handle: 'Bob', token: 'bob', device: 'bob-device');
    final rejected = expectLater(sync, throwsA(isA<RsiSessionChanged>()));
    probe.complete('Alice');
    await rejected;
    expect(session.value('Rsi-Token'), 'bob');
    expect(saved, isEmpty);
  });

  group('authentication', () {
    late int logins;
    late int authorizations;
    late String? identity;
    late RsiWebSessionCoordinator coordinator;
    setUp(() {
      logins = 0;
      authorizations = 0;
      identity = 'Alice';
      coordinator = RsiWebSessionCoordinator(
          session: session,
          synchronize: () async {},
          identify: () async => identity,
          refreshCsrf: () async {},
          authorize: () async {
            authorizations++;
          },
          relogin: () async {
            logins++;
            identity = 'Alice';
            return true;
          });
    });
    test('valid session does not sign in again', () async {
      await coordinator.ensure(RsiWebSessionAttempt());
      expect(logins, 0);
      expect(authorizations, 1);
    });
    test('expired session retries authentication once across an operation',
        () async {
      final attempt = RsiWebSessionAttempt();
      identity = null;
      await coordinator.ensure(attempt);
      expect(logins, 1);
      expect(authorizations, 1);
      identity = null;
      await expectLater(
          coordinator.ensure(attempt), throwsA(isA<RsiSessionExpired>()));
      expect(logins, 1);
      expect(authorizations, 1);
    });
    test('concurrent navigation shares one sign-in and authorization',
        () async {
      identity = null;
      final attempts = List.generate(5, (_) => RsiWebSessionAttempt());
      await Future.wait(attempts.map(coordinator.ensure));
      expect(logins, 1);
      expect(authorizations, 1);
      expect(attempts.every((attempt) => attempt.didRelogin), isTrue);
    });
    test('a continued buyback attempt cannot follow an account switch',
        () async {
      final attempt = RsiWebSessionAttempt();
      await coordinator.ensure(attempt);
      await session.reset(handle: 'Bob', token: 'bob');
      await expectLater(
          coordinator.ensure(attempt), throwsA(isA<RsiSessionChanged>()));
      expect(authorizations, 1);
      expect(logins, 0);
    });
    test('network failure does not attempt login or navigation', () async {
      coordinator = RsiWebSessionCoordinator(
          session: session,
          synchronize: () async {},
          identify: () async => throw const SocketException('offline'),
          refreshCsrf: () async {},
          authorize: () async {
            authorizations++;
          },
          relogin: () async {
            logins++;
            return false;
          });
      await expectLater(coordinator.ensure(RsiWebSessionAttempt()),
          throwsA(isA<SocketException>()));
      expect(logins, 0);
      expect(authorizations, 0);
    });
    test('captcha or failed login stops before authorization', () async {
      coordinator = RsiWebSessionCoordinator(
          session: session,
          synchronize: () async {},
          identify: () async => null,
          refreshCsrf: () async {},
          authorize: () async {
            authorizations++;
          },
          relogin: () async {
            logins++;
            return false;
          });
      await expectLater(coordinator.ensure(RsiWebSessionAttempt()),
          throwsA(isA<RsiSessionExpired>()));
      expect(logins, 1);
      expect(authorizations, 0);
    });
  });
}
