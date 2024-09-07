import '../../api_service.dart' show RsiApiClient;


class UpgradeAddToCart {
  final String query = r"""mutation addToCart($from: Int!, $to: Int!) {
  addToCart(from: $from, to: $to) {
    jwt
  }
}
""";
  final int skuId;
  final int fromShipId;

  UpgradeAddToCart({required this.skuId, required this.fromShipId});

  Future<String> execute() async {
    final data = {
      "query": query,
      "variables": {
        "from": fromShipId,
        "to": skuId,
      },
    };

    final response = await RsiApiClient().upgradeGraphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
    return response.data!["data"]["addToCart"]["jwt"];
  }
}