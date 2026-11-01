import '../../datasource/models/shop_search_property.dart';

const shopPriceLabels = {
  'all': '不限',
  '0-100': r'$0–100',
  '100-500': r'$100–500',
  '500+': r'$500 以上',
};

enum ShopFilterField { text, price, warbond, sort }

class ShopFilterToken {
  const ShopFilterToken(this.field, this.label);
  final ShopFilterField field;
  final String label;

  ShopSearchProperty removedFrom(ShopSearchProperty source) {
    final next = source.copy();
    switch (field) {
      case ShopFilterField.text:
        next.searchText = null;
      case ShopFilterField.price:
        next.priceRange = ['all'];
      case ShopFilterField.warbond:
        next.itemFlags = ['all'];
      case ShopFilterField.sort:
        next.orderSelected = false;
        next.priceOrder = false;
    }
    return next.normalized();
  }
}

List<ShopFilterToken> shopFilterTokens(ShopSearchProperty source) {
  final value = source.normalized();
  return [
    if (value.searchText case final text?)
      ShopFilterToken(ShopFilterField.text, '名称：$text'),
    if (value.priceRange.single != 'all')
      ShopFilterToken(ShopFilterField.price,
          '价格：${shopPriceLabels[value.priceRange.single]}'),
    if (value.itemFlags.contains('warbond'))
      const ShopFilterToken(ShopFilterField.warbond, '战争债券'),
    if (value.orderSelected)
      ShopFilterToken(
          ShopFilterField.sort, value.priceOrder ? '价格：低到高' : '价格：高到低'),
  ];
}
