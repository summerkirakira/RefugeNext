import '../../api_service.dart' show RsiApiClient;


class ApplyUpgradeToken {

  final String upgradeToken;

  ApplyUpgradeToken({required this.upgradeToken});

  Future<void> execute() async {
    final data = {
      "jwt": upgradeToken,
    };

    final response = await RsiApiClient().basicPost(endpoint: "api/store/v2/cart/token", data: data);
    if (response.data!["success"] == 0) {
      throw Exception(response.data!["code"]);
    }
  }
}