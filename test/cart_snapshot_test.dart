import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/graphql/shop/cart_snapshot_query.dart';
import 'package:refuge_next/src/datasource/models/shop/cart_snapshot.dart';
import 'helpers/cart_fixtures.dart';

void main() {
  test(
      'single response preserves server totals, currency, discounts and upgrade metadata',
      () async {
    SharedPreferences.setMockInitialValues({});
    final client = RsiApiClient();
    await client.session.reset();
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final original = client.baseUrl;
    client.baseUrl = 'http://127.0.0.1:${server.port}/';
    final line =
        jsonDecode(jsonEncode(cartItem(qty: 2, upgrade: true).toJson()))
            as Map<String, dynamic>;
    line['totalPriceWithTax'] = {'amount': 9000, 'discounted': null};
    final payload = {
      'data': {
        'store': {
          'context': {
            'pricing': {'currencyCode': 'EUR'}
          },
          'cart': {
            'hasRecurring': false,
            'hasDigital': true,
            'lineItems': [line],
            'totals': {
              'subTotal': 9000,
              'discount': 0,
              'coupon': {'amount': 500},
              'shipping': 0,
              'tax1': {'name': 'VAT', 'amount': 1000},
              'tax2': null,
              'total': 7500,
              'credits': {
                'amount': 2000,
                'maxApplicable': 9500,
                'applicable': true
              },
            },
            'flow': {
              'steps': [
                {'step': 'Addresses', 'active': true}
              ],
              'current': {'orderCreated': false}
            },
          }
        },
        'customer': {
          'ledger': {
            'amount': {
              'value': 8000,
              'currency': {'code': 'EUR'}
            }
          }
        },
      }
    };
    var calls = 0;
    server.listen((request) async {
      final body = jsonDecode(await utf8.decoder.bind(request).join());
      calls++;
      expect(body['query'], contains('totalPriceWithTax'));
      expect(body['query'], contains('ledger'));
      expect(body['query'], contains('subTotal total discount shipping'));
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(payload));
      await request.response.close();
    });
    try {
      final value = await CartSnapshotQuery().execute();
      expect(calls, 1);
      expect(value.count, 2);
      expect(value.total, 7500);
      expect(value.lineTotals['sale'], 9000);
      expect(value.items.single.upgrade!.fromShipId, 1);
      expect(value.items.single.unitPriceWithTax.discounted, 4500);
      expect(value.maxCredit, 8000);
      expect(value.step, 'Addresses');
      expect(cartMoney(value.total, value.currency), '€75.00');
      expect(cartMoney(-2000, value.currency), '-€20.00');
    } finally {
      client.baseUrl = original;
      await server.close(force: true);
      await client.session.reset();
    }
  });
}
