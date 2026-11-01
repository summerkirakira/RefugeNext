class ShopSearchProperty {
  List<String> searchType;
  List<String> priceRange;
  List<String> stockStatus;
  List<String> itemFlags;
  String? searchText;
  bool orderSelected;
  bool priceOrder;

  ShopSearchProperty({
    required this.searchType,
    required this.priceRange,
    required this.stockStatus,
    required this.itemFlags,
    required this.searchText,
    required this.orderSelected,
    required this.priceOrder,
  });

  factory ShopSearchProperty.empty() => ShopSearchProperty(
      searchType: ['all'],
      priceRange: ['all'],
      stockStatus: ['all'],
      itemFlags: ['all'],
      searchText: null,
      orderSelected: false,
      priceOrder: false);

  ShopSearchProperty copy() => ShopSearchProperty(
      searchType: List.of(searchType),
      priceRange: List.of(priceRange),
      stockStatus: List.of(stockStatus),
      itemFlags: List.of(itemFlags),
      searchText: searchText,
      orderSelected: orderSelected,
      priceOrder: priceOrder);

  ShopSearchProperty normalized() {
    List<String> values(List<String> source) {
      final result = source.where((value) => value.isNotEmpty).toSet().toList();
      return result.isEmpty || result.contains('all') ? ['all'] : result;
    }

    final next = copy();
    next.searchType = values(searchType);
    next.stockStatus = values(stockStatus);
    next.itemFlags = values(itemFlags);
    final ranges = values(priceRange).where(
        (value) => const ['all', '0-100', '100-500', '500+'].contains(value));
    next.priceRange = [ranges.firstOrNull ?? 'all'];
    next.searchText = searchText?.trim();
    if (next.searchText?.isEmpty == true) next.searchText = null;
    if (!next.orderSelected) next.priceOrder = false;
    return next;
  }

  bool get hasConditions {
    final value = normalized();
    return value.searchText != null ||
        value.orderSelected ||
        [value.searchType, value.priceRange, value.stockStatus, value.itemFlags]
            .any((values) => !values.contains('all'));
  }
}
