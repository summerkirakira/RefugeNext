import 'dart:math' as math;
import 'store_model.dart';

/// One server response for the cart, totals and credit balance. Amounts are cents.
class CartSnapshot {
  CartSnapshot({
    required this.items,
    required this.currency,
    required this.subtotal,
    required this.total,
    required this.discount,
    required this.coupon,
    required this.shipping,
    required this.taxes,
    required this.creditApplied,
    required this.creditAvailable,
    required this.creditApplicable,
    required this.balance,
    required this.balanceCurrency,
    required this.step,
    required this.orderCreated,
    required this.lineTotals,
  });

  final List<LineItem> items;
  final String currency, balanceCurrency, step;
  final int subtotal, total, discount, coupon, shipping;
  final List<CartTax> taxes;
  final int creditApplied, creditAvailable, balance;
  final bool creditApplicable, orderCreated;
  final Map<String, int> lineTotals;

  int get count => items.fold(0, (sum, item) => sum + item.qty);
  int get maxCredit =>
      creditApplicable ? math.max(0, math.min(balance, creditAvailable)) : 0;

  /// Used before checkout to require confirmation of externally changed totals.
  String get checkoutFingerprint => [
        currency,
        total,
        creditApplied,
        ...items.map((i) => '${i.id}:${i.qty}:${lineTotals[i.id]}'),
      ].join('|');

  factory CartSnapshot.fromJson(Map<String, dynamic> data) {
    final storeData = StoreData.fromJson(data);
    final cart = data['store']['cart'] as Map;
    final totals = cart['totals'] as Map;
    final credits = totals['credits'] as Map;
    final ledger = data['customer']['ledger']['amount'] as Map;
    final flow = cart['flow'] as Map;
    final steps = flow['steps'] as List;
    return CartSnapshot(
      items: storeData.store.cart.lineItems,
      currency: storeData.store.context.pricing.currencyCode,
      subtotal: (totals['subTotal'] as num).toInt(),
      total: (totals['total'] as num).toInt(),
      discount: (totals['discount'] as num).toInt(),
      coupon: (totals['coupon']?['amount'] as num?)?.toInt() ?? 0,
      shipping: (totals['shipping'] as num).toInt(),
      taxes: [
        for (final key in ['tax1', 'tax2'])
          if (totals[key] is Map)
            CartTax(totals[key]['name'] as String? ?? '税费',
                (totals[key]['amount'] as num).toInt()),
      ],
      creditApplied: (credits['amount'] as num).toInt(),
      creditAvailable: (credits['maxApplicable'] as num).toInt(),
      creditApplicable: credits['applicable'] == true,
      balance: (ledger['value'] as num).toInt(),
      balanceCurrency: ledger['currency']['code'] as String,
      step: steps
              .whereType<Map>()
              .where((s) => s['active'] == true)
              .map((s) => s['step'] as String)
              .firstOrNull ??
          '',
      orderCreated: flow['current']['orderCreated'] == true,
      lineTotals: {
        for (final line in cart['lineItems'] as List)
          line['id'] as String:
              effectiveCartAmount(line['totalPriceWithTax'] as Map),
      },
    );
  }
}

int effectiveCartAmount(Map price) {
  final original = (price['amount'] as num).toInt();
  final discounted = (price['discounted'] as num?)?.toInt();
  return discounted != null && discounted >= 0 && discounted < original
      ? discounted
      : original;
}

class CartTax {
  const CartTax(this.name, this.amount);
  final String name;
  final int amount;
}

String cartMoney(int cents, String currency) {
  final value = (cents.abs() / 100).toStringAsFixed(2);
  final sign = cents < 0 ? '-' : '';
  return switch (currency) {
    'USD' => '$sign\$$value',
    'EUR' => '$sign€$value',
    'GBP' => '$sign£$value',
    _ => '$sign$currency $value',
  };
}

int? parseCreditCents(String text) {
  final normalized = text.trim();
  if (!RegExp(r'^\d+(?:\.\d{1,2})?$').hasMatch(normalized)) return null;
  final parts = normalized.split('.');
  final whole = int.tryParse(parts.first);
  if (whole == null || whole > 90071992547409) return null;
  return whole * 100 +
      (parts.length == 1 ? 0 : int.parse(parts[1].padRight(2, '0')));
}
