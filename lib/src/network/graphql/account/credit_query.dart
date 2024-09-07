import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/account/credit_query_property.dart';


class CreditQuery {
  final String query = r"""query credit {
  customer {
    ledgerCredit: ledger(ledgerCode: "credit") {
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
    ledgerUec: ledger(ledgerCode: "uec") {
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
    ledgerRec: ledger(ledgerCode: "rec") {
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
}""";


    Future<CreditQueryProperty> execute() async {
      final data = {
        "query": query,
        "variables": {},
      };

      final response = await RsiApiClient().graphql(data: data);
      if (response.data!["errors"] != null) {
        throw Exception(response.data!["errors"]);
      }
      return CreditQueryProperty.fromJson(response.data!["data"]["customer"]);
    }
}
