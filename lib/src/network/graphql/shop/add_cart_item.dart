import '../../api_service.dart' show RsiApiClient;

class AddCartItem {
  final query = r"""mutation AddCartItemMutation($skuId: ID!, $qty: Int!, $identifier: String, $extra: TyAddToCartMetadataInput) {
  store(name: "pledge") {
    cart {
      mutations {
        add(skuId: $skuId, qty: $qty, identifier: $identifier, extra: $extra)
        __typename
      }
      __typename
    }
    __typename
  }
}""";

  final String skuId;
  final int qty;
  final String? identifier;

  AddCartItem({required this.skuId, required this.qty, required this.identifier});

  Future<void> execute() async {
    final data = {
      "query": query,
      "variables": {
        "skuId": skuId,
        "qty": qty,
        "identifier": identifier,
      },
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
  }

}