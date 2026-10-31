import '../api_service.dart' show RsiApiClient;
import '../../datasource/models/shop/filtered_ship_upgrade.dart'
    show FilteredShipResponse;

class FilterUpgradeShip {
  final String query =
      r"""query filterShips($fromId: Int, $toId: Int, $fromFilters: [FilterConstraintValues], $toFilters: [FilterConstraintValues]) {
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
    final body = response.data;
    if (body is! Map<String, dynamic> ||
        body['errors'] != null ||
        body['data'] is! Map ||
        body['data']['from'] is! Map ||
        body['data']['to'] is! Map ||
        body['data']['from']['ships'] is! List ||
        body['data']['to']['ships'] is! List) {
      throw StateError('无法读取可升级舰船，请重试');
    }
    return FilteredShipResponse.fromJson(body);
  }
}
