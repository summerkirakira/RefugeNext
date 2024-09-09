import '../../api_service.dart' show RsiApiClient;


class SetPaymentMethod {
  final String query = r"""mutation SetPaymentMethodMutation($orderSlug: String!, $method: String!) {
  tycoon_order_setPaymentMethod(orderSlug: $orderSlug, method: $method) {
    order {
      slug
      __typename
    }
    __typename
  }
}
""";
  final String paymentMethod;
  final String orderSlug;

  SetPaymentMethod({required this.paymentMethod, required this.orderSlug});

  Future<void> execute() async {
    final data = {
      "query": query,
      "variables": {
        "orderSlug": orderSlug,
        "method": paymentMethod,
      }
    };

    final response = await RsiApiClient().graphql(data: data);
  }
}