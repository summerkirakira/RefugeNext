import 'dart:async';
import 'package:refuge_next/src/datasource/models/shop/cart_snapshot.dart';
import 'package:refuge_next/src/datasource/models/shop/store_model.dart';
import 'package:refuge_next/src/widgets/shop/cart/cart_controller.dart';

LineItem cartItem(
        {String id = 'sale',
        String title = '星际公民首航礼包',
        int qty = 1,
        int maximum = 5,
        int amount = 6000,
        int? discounted = 4500,
        bool warbond = false,
        bool upgrade = false}) =>
    LineItem(
      id: id,
      skuId: id,
      identifier: null,
      taxDescription: [],
      discounts: [],
      qty: qty,
      unitPriceWithTax: UnitPrice(amount: amount, discounted: discounted),
      upgrade: upgrade
          ? Upgrade(
              name: 'Aurora MR to Constellation Andromeda',
              fromShipId: 1,
              toShipId: 2,
              toSkuId: 3,
              thumbnail: '')
          : null,
      sku: Sku(
          id: id,
          productId: id,
          title: title,
          label: title,
          subtitle: '游戏包',
          url: '',
          type: 'digital',
          frequency: '',
          isWarbond: warbond,
          isPackage: true,
          stock: Stock(
              unlimited: true,
              show: true,
              available: true,
              backOrder: false,
              qty: null,
              level: ''),
          media: Media(thumbnail: null),
          maxQty: maximum,
          minQty: 1,
          publicType: PublicType(code: 'package', label: 'Package'),
          nativePrice: Price(amount: amount, discounted: discounted),
          price: Price(amount: amount, discounted: discounted)),
    );

CartSnapshot cartSnapshot(
    {List<LineItem>? items,
    int total = 4500,
    int applied = 0,
    int maximumCredit = 4500,
    int balance = 10000,
    bool applicable = true,
    String step = 'CartLines'}) {
  final lines = items ?? [cartItem()];
  return CartSnapshot(
      items: lines,
      currency: 'USD',
      subtotal: 4500,
      total: total,
      discount: 0,
      coupon: 0,
      shipping: 0,
      taxes: [],
      creditApplied: applied,
      creditAvailable: maximumCredit,
      creditApplicable: applicable,
      balance: balance,
      balanceCurrency: 'USD',
      step: step,
      orderCreated: false,
      lineTotals: {
        for (final i in lines)
          i.id: (i.unitPriceWithTax.discounted ?? i.unitPriceWithTax.amount) *
              i.qty
      });
}

class FakeCartGateway implements CartGateway {
  FakeCartGateway(this.value);
  CartSnapshot value;
  int loads = 0,
      edits = 0,
      changes = 0,
      removals = 0,
      clears = 0,
      checkouts = 0;
  List<int> credits = [];
  bool failLoad = false,
      failMutation = false,
      failCheckout = false,
      completeCheckout = true;
  Completer<void>? pendingMutation, pendingCheckout;
  @override
  Future<CartSnapshot> load() async {
    loads++;
    if (failLoad) throw Exception('offline');
    return value;
  }

  @override
  Future<void> edit() async {
    edits++;
  }

  Future<void> mutation() async {
    if (pendingMutation != null) await pendingMutation!.future;
    if (failMutation) throw Exception('network interrupted');
  }

  @override
  Future<void> quantity(LineItem item, int quantity) async {
    changes++;
    await mutation();
    value = cartSnapshot(
        items: [item.copyWith(qty: quantity)],
        total: 4500 * quantity,
        applied: value.creditApplied);
  }

  @override
  Future<void> remove(LineItem item) async {
    removals++;
    await mutation();
    value = cartSnapshot(items: [], total: 0);
  }

  @override
  Future<void> clear() async {
    clears++;
    await mutation();
    value = cartSnapshot(items: [], total: 0);
  }

  @override
  Future<void> credit(int cents) async {
    credits.add(cents);
    await mutation();
    value =
        cartSnapshot(items: value.items, applied: cents, total: 4500 - cents);
  }

  @override
  Future<bool> checkout() async {
    checkouts++;
    if (pendingCheckout != null) await pendingCheckout!.future;
    if (failCheckout) throw Exception('response lost');
    return completeCheckout;
  }
}
