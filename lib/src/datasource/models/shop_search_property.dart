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
}