import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/cirno/property.dart';
import 'package:refuge_next/src/funcs/cirno_auth.dart';

RefugeVersionProperty property() => RefugeVersionProperty(
    versionCode: 443,
    versionName: '4.6.3',
    shipAliasVersionCode: 1,
    shipAliasUrl: '',
    translationVersionCode: 1,
    translationUrl: '',
    isVip: false,
    vipExpire: 0,
    credit: 0,
    appUrl: 'https://example.test/app.apk',
    updateContent: '修复',
    shipInfoVersionCode: 1,
    shipInfoUrl: '');

void main() {
  test('startup and update check share configuration without RSI login',
      () async {
    final gate = Completer<RefugeVersionProperty>();
    var requests = 0, callbacks = 0;
    final auth = CirnoAuth.forTesting(() {
      requests++;
      return gate.future;
    });
    auth.addAfterInit(() => callbacks++);
    final first = auth.initialize();
    final second = auth.refreshProperty();
    gate.complete(property());
    await Future.wait([first, second]);
    expect(requests, 1);
    expect(callbacks, 1);
    expect(auth.isInitialized, true);
    await auth.initialize();
    expect(requests, 1);
    await auth.refreshProperty();
    expect(requests, 2);
    expect(callbacks, 1);
  });
  test(
      'failed startup request remains retryable and callbacks only fire on success',
      () async {
    var fail = true, callbacks = 0;
    final auth = CirnoAuth.forTesting(() async {
      if (fail) throw StateError('network unavailable');
      return property();
    });
    auth.addAfterInit(() => callbacks++);
    await expectLater(auth.initialize(), throwsStateError);
    expect(auth.isInitialized, false);
    expect(callbacks, 0);
    fail = false;
    await auth.initialize();
    expect(callbacks, 1);
    auth.addAfterInit(() => callbacks++);
    expect(callbacks, 2);
  });
}
