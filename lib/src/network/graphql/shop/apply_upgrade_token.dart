import '../../api_service.dart' show RsiApiClient;

class ApplyUpgradeToken {
  final String upgradeToken;
  ApplyUpgradeToken({required this.upgradeToken});

  Future<void> execute() async {
    final response = await RsiApiClient().basicPost(
        endpoint: 'api/store/v2/cart/token', data: {'jwt': upgradeToken});
    final body = response.data;
    if (body is Map && body['success'] == 1) return;
    if (body is Map && body['msg'] == 'Invalid cart') {
      throw StateError('购物车状态不兼容，请检查现有商品后再添加升级包');
    }
    throw StateError('未能确认升级包已加入购物车，请检查购物车');
  }
}
