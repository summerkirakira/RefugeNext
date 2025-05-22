class SearchProperty {
  List<String> searchType;
  List<String> searchStatus;
  List<String> searchInsurance;
  List<String> priceRange;
  List<String> reclaimStatus;
  List<String> fromShip;
  List<String> toShip;
  String? searchText;
  List<int> selectedCCUSlots;
  bool orderSelected;
  bool priceOrder;

  SearchProperty({
    required this.searchType,
    required this.searchStatus,
    required this.searchInsurance,
    required this.priceRange,
    required this.reclaimStatus,
    required this.fromShip,
    required this.toShip,
    required this.searchText,
    required this.selectedCCUSlots,
    required this.orderSelected,
    required this.priceOrder,
  });
}