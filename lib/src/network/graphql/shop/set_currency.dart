import '../../api_service.dart' show RsiApiClient;


class SetCurrency {
  final String query = r"""mutation SetCurrency($currencyCode: String!) {
  store(name: "pledge") {
    context {
      currencies {
        code
        symbol
        __typename
      }
      __typename
    }
    __typename
  }
  tycoon_context_setCurrency(currencyCode: $currencyCode) {
    context {
      pricing {
        currencyCode
        __typename
      }
      __typename
    }
    __typename
  }
}
""";
  final String currency;

  SetCurrency({this.currency = "USD"});

  Future<void> execute() async {
    final data = {
      "query": query,
      "variables": {
        "currencyCode": currency,
      }
    };

    await RsiApiClient().graphql(data: data);
  }
}