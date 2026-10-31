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

  factory SearchProperty.empty() => SearchProperty(
        searchType: ['all'],
        searchStatus: ['all'],
        searchInsurance: ['all'],
        priceRange: ['all'],
        reclaimStatus: ['all'],
        fromShip: ['all'],
        toShip: ['all'],
        searchText: null,
        selectedCCUSlots: [],
        orderSelected: false,
        priceOrder: false,
      );

  SearchProperty copy() => SearchProperty(
        searchType: List.of(searchType),
        searchStatus: List.of(searchStatus),
        searchInsurance: List.of(searchInsurance),
        priceRange: List.of(priceRange),
        reclaimStatus: List.of(reclaimStatus),
        fromShip: List.of(fromShip),
        toShip: List.of(toShip),
        searchText: searchText,
        selectedCCUSlots: List.of(selectedCCUSlots),
        orderSelected: orderSelected,
        priceOrder: priceOrder,
      );

  /// Legacy combinations containing `all` already mean unrestricted.
  SearchProperty normalized() {
    List<String> group(List<String> values) =>
        values.isEmpty || values.contains('all')
            ? ['all']
            : values.toSet().toList();
    final result = copy();
    result.searchType = group(searchType);
    result.searchStatus = group(searchStatus);
    result.searchInsurance = group(searchInsurance);
    result.priceRange = group(priceRange);
    result.reclaimStatus = group(reclaimStatus);
    result.fromShip = group(fromShip);
    result.toShip = group(toShip);
    result.searchText = searchText?.trim();
    if (result.searchText?.isEmpty ?? true) result.searchText = null;
    result.selectedCCUSlots = selectedCCUSlots.toSet().toList();
    if (!orderSelected) result.priceOrder = false;
    return result;
  }

  bool get hasConditions {
    final value = normalized();
    return value.searchText != null ||
        value.orderSelected ||
        value.selectedCCUSlots.isNotEmpty ||
        [
          value.searchType,
          value.searchStatus,
          value.searchInsurance,
          value.priceRange,
          value.reclaimStatus,
          value.fromShip,
          value.toShip
        ].any((group) => !group.contains('all'));
  }
}
