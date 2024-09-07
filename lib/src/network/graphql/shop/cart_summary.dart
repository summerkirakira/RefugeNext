import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/cart_summary_property.dart';


class CartSummary {
  final String query = r"""query CartSummaryViewQuery($storeFront: String) {
  account {
    isAnonymous
    __typename
  }
  store(name: $storeFront) {
    cart {
      totals {
        ...TyCartTotalFragment
        __typename
      }
      __typename
    }
    ...CartFlowFragment
    __typename
  }
}

fragment TyCartTotalFragment on TyCartTotal {
  discount
  shipping
  total
  subTotal
  tax1 {
    name
    amount
    __typename
  }
  tax2 {
    name
    amount
    __typename
  }
  coupon {
    amount
    allowed
    code
    __typename
  }
  credits {
    amount
    nativeAmount {
      value
      __typename
    }
    applicable
    maxApplicable
    __typename
  }
  __typename
}

fragment CartFlowFragment on TyStore {
  cart {
    flow {
      steps {
        step
        action
        finalStep
        active
        __typename
      }
      current {
        orderCreated
        __typename
      }
      __typename
    }
    __typename
  }
  __typename
}
""";

  Future<CartSummaryProperty> execute() async {
    final data = {
      "query": query,
      "variables": {
        "storeFront": "pledge",
      }
    };

    final response = await RsiApiClient().graphql(data: data);
    return CartSummaryProperty.fromJson(response.data!['data']);
  }
}