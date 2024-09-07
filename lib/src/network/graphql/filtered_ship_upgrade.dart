import '../api_service.dart' show RsiApiClient;
import '../../datasource/models/shop/filtered_ship_upgrade.dart' show FilteredShipResponse;


class FilterUpgradeShip {
  final String query = r"""query filterShips($fromId: Int, $toId: Int, $fromFilters: [FilterConstraintValues], $toFilters: [FilterConstraintValues]) {
  from(to: $toId, filters: $fromFilters) {
    ships {
      id
    }
  }
  to(from: $fromId, filters: $toFilters) {
    featured {
      reason
      style
      tagLabel
      tagStyle
      footNotes
      shipId
    }
    ships {
      id
      skus {
        id
        price
        title
        upgradePrice
        unlimitedStock
        showStock
        available
        availableStock
      }
    }
  }
}
""";
  final int? fromId;
  final int? toId;

  FilterUpgradeShip({required this.fromId, required this.toId});

  Future<FilteredShipResponse> execute() async {
    final data = {
      "query": query,
      "variables": {
        "fromId": fromId,
        "toId": toId,
      }
    };

    final response = await RsiApiClient().upgradeGraphql(data: data);
    return FilteredShipResponse.fromJson(response.data);
  }


}