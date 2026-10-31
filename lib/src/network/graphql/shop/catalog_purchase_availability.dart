import '../../api_service.dart';
import 'cart_operation_error.dart';

class CatalogPurchaseAvailability {
  const CatalogPurchaseAvailability(
      {required this.minimum, required this.maximum, required this.inCart});
  final int minimum;
  final int maximum;
  final int inCart;

  int get remaining => (maximum - inCart).clamp(0, maximum);
  int get maxAddQuantity => remaining.clamp(0, minimum > 5 ? minimum : 5);
  bool get cartOnly => inCart > 0 && remaining < minimum;
}

class CatalogPurchaseAvailabilityQuery {
  static const query =
      r'''query CatalogPurchaseAvailability($query: SearchQuery!) {
  store(name: "pledge") {
    search(query: $query) {
      resources {
        id
        ... on TySku { minQty maxQty }
      }
    }
    cart { lineItems { skuId qty } }
  }
}''';

  Future<CatalogPurchaseAvailability> execute(String skuId) async {
    final response = await RsiApiClient().graphql(data: {
      'query': query,
      'variables': {
        'query': {
          'skus': {
            'ids': [skuId]
          }
        }
      }
    });
    final body = response.data;
    if (body is! Map) throw CartOperationException('无法读取商品可购数量，请重试');
    final errors = body['errors'];
    if (errors is List && errors.isNotEmpty) {
      throw CartOperationException.fromErrors(errors);
    }
    final store = body['data']?['store'];
    final resources = store?['search']?['resources'];
    final lines = store?['cart']?['lineItems'];
    if (resources is! List || lines is! List) {
      throw CartOperationException('无法读取商品可购数量，请重试');
    }
    final sku = resources
        .whereType<Map>()
        .where((item) => item['id']?.toString() == skuId)
        .firstOrNull;
    if (sku == null) throw CartOperationException('该商品暂不可购买，请刷新商店');
    final minimum = (sku['minQty'] as num?)?.toInt() ?? 1;
    final maximum = (sku['maxQty'] as num?)?.toInt() ?? 5;
    if (minimum < 1 || maximum < minimum) {
      throw CartOperationException('该商品暂不可购买，请刷新商店');
    }
    final inCart = lines
        .whereType<Map>()
        .where((line) => line['skuId']?.toString() == skuId)
        .fold<int>(0, (sum, line) => sum + (line['qty'] as num).toInt());
    return CatalogPurchaseAvailability(
        minimum: minimum, maximum: maximum, inCart: inCart);
  }
}
