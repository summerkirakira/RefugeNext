import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/graphql/shop/update_cart_number.dart';
import 'package:refuge_next/src/network/graphql/shop/remove_cart_item.dart';
import 'package:refuge_next/src/network/graphql/shop/clear_cart.dart';
import 'package:refuge_next/src/network/graphql/shop/add_credit.dart';

void main() {
  final operations = <String, Future<void> Function()>{
    'update': () =>
        UpdateCartNumber(skuId: 'sku', qty: 2, identifier: null).execute(),
    'remove': () => RemoveCartItem(skuId: 'sku', identifier: null).execute(),
    'clear': () => ClearCart().execute(),
    'credit_update': () => AddCredit(12.34).execute(),
  };
  for (final operation in operations.entries) {
    test(
        '${operation.key} checks acknowledgement and preserves server validation details',
        () async {
      SharedPreferences.setMockInitialValues({});
      final client = RsiApiClient();
      await client.session.reset();
      final original = client.baseUrl;
      final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      client.baseUrl = 'http://127.0.0.1:${server.port}/';
      Object response = {
        'data': {
          'store': {
            'cart': {
              'mutations': {operation.key: true}
            }
          }
        }
      };
      var calls = 0;
      server.listen((request) async {
        calls++;
        final body = jsonDecode(await utf8.decoder.bind(request).join());
        expect(body['variables']['storeFront'], 'pledge');
        if (operation.key == 'credit_update') {
          expect(body['variables']['amount'], 12.34);
        }
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode(response));
        await request.response.close();
      });
      try {
        await operation.value();
        response = {'data': null};
        await expectLater(operation.value(),
            throwsA(predicate((e) => e.toString().contains('未确认'))));
        response = {
          'errors': [
            {
              'message': 'Invalid cart',
              'extensions': {
                'details': {'amount': 'Credit limit exceeded'}
              }
            }
          ]
        };
        await expectLater(
            operation.value(),
            throwsA(predicate(
                (e) => e.toString().contains('Credit limit exceeded'))));
        expect(calls, 3);
      } finally {
        client.baseUrl = original;
        await server.close(force: true);
        await client.session.reset();
      }
    });
  }
}
