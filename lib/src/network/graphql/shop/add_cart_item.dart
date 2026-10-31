import '../../api_service.dart' show RsiApiClient;
import 'cart_operation_error.dart';

class AddCartItem {
  final query =
      r"""mutation AddCartItemMutation($skuId: ID!, $qty: Int!, $identifier: String, $extra: TyAddToCartMetadataInput) {
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

  AddCartItem(
      {required this.skuId, required this.qty, required this.identifier});

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
    final body = response.data;
    final errors = body is Map ? body['errors'] : null;
    if (errors is List && errors.isNotEmpty) {
      throw CartOperationException.fromErrors(errors);
    }
    if (body is! Map ||
        body['data']?['store']?['cart']?['mutations']?['add'] != true) {
      throw CartOperationException('未收到加入购物车的成功确认，请检查购物车后重试');
    }
  }
}
