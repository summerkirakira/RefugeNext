/// Preserve the server's validation details instead of hiding them behind
/// the generic "Invalid cart" message.
class CartOperationException implements Exception {
  CartOperationException(this.message);
  final String message;

  factory CartOperationException.fromErrors(List errors) {
    final messages = <String>[];
    void collect(dynamic value) {
      if (value is String && value.trim().isNotEmpty) {
        final limit = RegExp(r'Cannot purchase more than (\d+) .+ per order')
            .firstMatch(value);
        messages.add(limit == null
            ? value
            : '该商品每单最多可购买 ${limit.group(1)} 件，请检查购物车内已有数量');
      } else if (value is Map) {
        value.values.forEach(collect);
      } else if (value is List) {
        value.forEach(collect);
      }
    }

    for (final error in errors.whereType<Map>()) {
      final before = messages.length;
      final extensions = error['extensions'];
      if (extensions is Map) collect(extensions['details']);
      if (messages.length == before) {
        collect(error['message'] == 'Invalid cart'
            ? '购物车状态异常，请检查购物车后重试'
            : error['message']);
      }
    }
    return CartOperationException(
        messages.isEmpty ? '购物车请求失败，请重试' : messages.toSet().join('；'));
  }

  @override
  String toString() => message;
}
