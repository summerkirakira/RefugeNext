import '../../api_service.dart' show RsiApiClient;


class SelectedCurrency {
  final String query = r"""query SelectedCurrencyQuery($storeFront: String) {
  store(name: $storeFront) {
    context {
      pricing {
        currencyCode
        __typename
      }
      __typename
    }
    __typename
  }
}""";

  Future<String?> execute() async {
    final data = {
      "query": query,
      "variables": {
        "storeFront": "pledge",
      }
    };

    final response = await RsiApiClient().graphql(data: data);
    return response.data!["data"]["store"]["context"]["pricing"]["currencyCode"];
  }
}