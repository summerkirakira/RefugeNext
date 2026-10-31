import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/graphql/shop/add_cart_item.dart';
import 'package:refuge_next/src/network/graphql/shop/catalog_purchase_availability.dart';

void main() {
  test('live-shaped limits and cart quantities; mutation errors retain details',
      () async {
    SharedPreferences.setMockInitialValues({});
    final client = RsiApiClient();
    await client.session.reset();
    final original = client.baseUrl;
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    client.baseUrl = 'http://127.0.0.1:${server.port}/';
    final queries = <String>[];
    Object reply = {
      'data': {
        'store': {
          'search': {
            'resources': [
              {'id': '19607', 'minQty': 1, 'maxQty': 1}
            ]
          },
          'cart': {
            'lineItems': [
              {'skuId': 'other', 'qty': 4},
              {'skuId': '19607', 'qty': 1},
            ]
          },
        }
      }
    };
    server.listen((request) async {
      final body = jsonDecode(await utf8.decoder.bind(request).join());
      queries.add(body['query']);
      if (queries.length == 1) {
        expect(body['variables']['query']['skus']['ids'], ['19607']);
      }
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(reply));
      await request.response.close();
    });
    try {
      final availability =
          await CatalogPurchaseAvailabilityQuery().execute('19607');
      expect(availability.inCart, 1);
      expect(availability.cartOnly, isTrue);
      expect(availability.maxAddQuantity, 0);
      reply = {
        'errors': [
          {
            'message': 'Invalid cart',
            'extensions': {
              'details': {
                'skus':
                    'Cannot purchase more than 1 Star Citizen First Flight Pack per order'
              }
            }
          }
        ]
      };
      await expectLater(
          AddCartItem(skuId: '19607', qty: 1, identifier: null).execute(),
          throwsA(predicate((e) => e.toString().contains('每单最多可购买 1 件'))));
      reply = {
        'data': {
          'store': {
            'cart': {
              'mutations': {'add': true}
            }
          }
        }
      };
      await AddCartItem(skuId: '19607', qty: 1, identifier: null).execute();
      reply = {'data': null};
      await expectLater(
          AddCartItem(skuId: '19607', qty: 1, identifier: null).execute(),
          throwsA(predicate((e) => e.toString().contains('成功确认'))));
      // No clear-cart or retry mutation is ever sent.
      expect(queries, hasLength(4));
      expect(queries.where((q) => q.contains('clear')), isEmpty);
    } finally {
      client.baseUrl = original;
      await server.close(force: true);
      await client.session.reset();
    }
  });
}
