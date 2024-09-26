import 'package:refuge_next/src/network/graphql/shop/clear_cart.dart';

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
      if (response.data!['msg'] == 'Invalid cart') {
        await ClearCart().execute();
        throw Exception("库存错误，已清空购物车，请重试");
      }
      throw Exception(response.data!["code"]);
    }
  }
}