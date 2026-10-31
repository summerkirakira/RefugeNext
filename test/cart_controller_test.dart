import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/shop/cart_snapshot.dart';
import 'package:refuge_next/src/widgets/shop/cart/cart_controller.dart';
import 'helpers/cart_fixtures.dart';

void main() {
  test(
      'credit parses exact cents and rejects negative, excessive precision and non-finite inputs',
      () {
    expect(parseCreditCents('12.34'), 1234);
    expect(parseCreditCents('0.1'), 10);
    expect(parseCreditCents('0'), 0);
    for (final v in [
      '-1',
      '1.001',
      'NaN',
      'Infinity',
      '',
      '1e3',
      '9999999999999999999'
    ]) {
      expect(parseCreditCents(v), isNull, reason: v);
    }
  });

  test(
      'quantity operation locks mutations and checkout; refresh never repeats a completed write',
      () async {
    final gateway = FakeCartGateway(cartSnapshot())
      ..pendingMutation = Completer<void>();
    final c = CartController(
        gateway: gateway, initial: gateway.value, isBuyback: true);
    addTearDown(c.dispose);
    final item = c.snapshot.items.single;
    final update = c.changeQuantity(item, 2);
    await c.changeQuantity(item, 3);
    await c.remove(item);
    expect(gateway.changes, 1);
    expect(gateway.removals, 0);
    expect(c.canCheckout, isFalse);
    gateway.failLoad = true;
    gateway.pendingMutation!.complete();
    await update;
    expect(c.error, contains('操作已完成'));
    expect(c.needsRefresh, isTrue);
    await c.changeQuantity(item, 4);
    expect(gateway.changes, 1);
    gateway.failLoad = false;
    await c.refresh();
    expect(c.snapshot.items.single.qty, 2);
    expect(c.isBuyback, isTrue);
    expect(c.canCheckout, isTrue);
    expect(gateway.changes, 1);
  });

  test('failed mutation retains snapshot and requires read before retry',
      () async {
    final gateway = FakeCartGateway(cartSnapshot())..failMutation = true;
    final c = CartController(gateway: gateway, initial: gateway.value);
    addTearDown(c.dispose);
    await c.remove(c.snapshot.items.single);
    expect(c.snapshot.count, 1);
    expect(c.needsRefresh, isTrue);
    await c.clear();
    expect(gateway.clears, 0);
    await c.refresh();
    expect(c.canEdit, isTrue);
    expect(gateway.removals, 1);
  });

  test(
      'credit limits, applying, cancellation and server totals remain distinct from drafts',
      () async {
    final gateway = FakeCartGateway(cartSnapshot(balance: 2000));
    final c = CartController(gateway: gateway, initial: gateway.value);
    addTearDown(c.dispose);
    expect(c.snapshot.maxCredit, 2000);
    c.creditInput.text = '20.01';
    await c.applyCredit();
    expect(gateway.credits, isEmpty);
    expect(c.canCheckout, isFalse);
    expect(c.creditError, isNotNull);
    await c.applyCredit(c.snapshot.maxCredit);
    expect(gateway.credits, [2000]);
    expect(c.snapshot.total, 2500);
    expect(c.creditDirty, isFalse);
    c.creditInput.text = '-1';
    c.cancelCreditDraft();
    expect(c.creditInput.text, '20.00');
    await c.applyCredit(0);
    expect(gateway.credits, [2000, 0]);
    expect(c.snapshot.total, 4500);
  });

  test('failed credit application preserves draft and blocks purchase',
      () async {
    final gateway = FakeCartGateway(cartSnapshot())..failMutation = true;
    final c = CartController(gateway: gateway, initial: gateway.value);
    addTearDown(c.dispose);
    c.creditInput.text = '12.34';
    await c.applyCredit();
    expect(c.creditInput.text, '12.34');
    expect(c.snapshot.creditApplied, 0);
    var auth = 0;
    await c.checkout(
        authenticate: () async {
          auth++;
          return true;
        },
        openWeb: () async {},
        completed: () {});
    expect(auth, 0);
    expect(gateway.checkouts, 0);
    await c.refresh();
    expect(c.creditDirty, isTrue);
  });

  test('checkout refresh detects external changes before authentication',
      () async {
    final gateway = FakeCartGateway(cartSnapshot());
    final c = CartController(gateway: gateway, initial: gateway.value);
    addTearDown(c.dispose);
    gateway.value = cartSnapshot(total: 4600);
    var auth = 0;
    await c.checkout(
        authenticate: () async {
          auth++;
          return true;
        },
        openWeb: () async {},
        completed: () {});
    expect(auth, 0);
    expect(gateway.checkouts, 0);
    expect(c.snapshot.total, 4600);
    expect(c.error, contains('购物车已更新'));
  });

  test('native checkout cannot duplicate while pending or after completion',
      () async {
    final gateway = FakeCartGateway(cartSnapshot())
      ..pendingCheckout = Completer<void>();
    final c = CartController(gateway: gateway, initial: gateway.value);
    addTearDown(c.dispose);
    var completed = 0;
    Future<void> checkout() => c.checkout(
        authenticate: () async => true,
        openWeb: () async {},
        completed: () {
          completed++;
        });
    final pending = checkout();
    await Future<void>.delayed(Duration.zero);
    await checkout();
    expect(gateway.checkouts, 1);
    gateway.pendingCheckout!.complete();
    await pending;
    await checkout();
    expect(gateway.checkouts, 1);
    expect(completed, 1);
  });

  test('buyback and uncertain native checkout hand off without re-submitting',
      () async {
    final gateway = FakeCartGateway(cartSnapshot());
    final c = CartController(
        gateway: gateway, initial: gateway.value, isBuyback: true);
    addTearDown(c.dispose);
    var web = 0;
    await c.refresh();
    await c.checkout(
        authenticate: () async => true,
        openWeb: () async {
          web++;
        },
        completed: () {});
    expect(web, 1);
    expect(gateway.checkouts, 0);
    final native = CartController(gateway: gateway, initial: gateway.value);
    addTearDown(native.dispose);
    gateway.failCheckout = true;
    await native.checkout(
        authenticate: () async => true,
        openWeb: () async {
          web++;
        },
        completed: () {});
    expect(native.webReviewRequired, isTrue);
    await native.refresh();
    await native.checkout(
        authenticate: () async => true,
        openWeb: () async {
          web++;
        },
        completed: () {});
    expect(gateway.checkouts, 1);
    expect(web, 2);
  });

  test('quantity limits and late disposal do not submit invalid writes',
      () async {
    final gateway =
        FakeCartGateway(cartSnapshot(items: [cartItem(maximum: 1)]));
    final c = CartController(gateway: gateway, initial: gateway.value);
    await c.changeQuantity(c.snapshot.items.single, 2);
    expect(gateway.changes, 0);
    gateway.pendingMutation = Completer<void>();
    final removal = c.remove(c.snapshot.items.single);
    c.dispose();
    gateway.pendingMutation!.complete();
    await removal;
    expect(gateway.loads, 0);
  });
}
