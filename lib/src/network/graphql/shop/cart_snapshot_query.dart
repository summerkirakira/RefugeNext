import '../../../datasource/models/shop/cart_snapshot.dart';
import '../../api_service.dart';
import 'cart_operation_error.dart';
import 'step1query.dart';

class CartSnapshotQuery {
  static const query = r'''query CartSnapshotQuery($storeFront: String) {
    customer {
      ledger(ledgerCode: "credit") {
        amount { value currency { code } }
      }
    }
    store(name: $storeFront) {
      context { pricing { currencyCode } }
      cart {
        hasRecurring
        hasDigital
        lineItems {
          ...TyCartLineItemFragment
          totalPriceWithTax { amount discounted }
        }
        totals {
          subTotal total discount shipping
          tax1 { name amount }
          tax2 { name amount }
          coupon { amount }
          credits { amount applicable maxApplicable }
        }
        flow {
          steps { step active }
          current { orderCreated }
        }
      }
    }
  }
  ''' +
      Step1Query.lineItemFragments;

  Future<CartSnapshot> execute() async {
    final response = await RsiApiClient().graphql(data: {
      'query': query,
      'variables': {'storeFront': 'pledge'},
    });
    final body = response.data;
    if (body is! Map) throw CartOperationException('无法读取购物车，请重试');
    final errors = body['errors'];
    if (errors is List && errors.isNotEmpty) {
      throw CartOperationException.fromErrors(errors);
    }
    if (body['data'] is! Map<String, dynamic>) {
      throw CartOperationException('无法读取购物车，请重试');
    }
    return CartSnapshot.fromJson(body['data']);
  }
}
