import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/credit_query_property.dart';


class CreditQuery {
  final String query = r"""query Credit($storeFront: String) {
  customer {
    ledger(ledgerCode: "credit") {
      name
      amount {
        value
        currency {
          code
          symbol
          __typename
        }
        __typename
      }
      __typename
    }
    __typename
  }
  store(name: $storeFront) {
    cart {
      totals {
        credits {
          ...TyCreditsFragment
          __typename
        }
        __typename
      }
      __typename
    }
    __typename
  }
}

fragment TyCreditsFragment on TyCredits {
  applicable
  maxApplicable
  amount
  __typename
}
""";


  Future<CreditQueryProperty> execute() async {
    final data = {
      "query": query,
      "variables": {
        "storeFront": "pledge",
      },
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
    return CreditQueryProperty.fromJson(response.data!["data"]);
  }

}