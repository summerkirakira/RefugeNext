import '../api_service.dart' show RsiApiClient;
import '../../datasource/models/shop/upgrade_ship_info.dart'
    show UpgradeShipInfo;

class InitShipUpgrade {
  Map<String, dynamic>? catalogData;
  // 舰船资料与可售 SKU 分开取；不重复请求 ships.skus，避免超过官网字段重复限制。
  final String query = r"""query initShipUpgrade {
  ships {
    id
    name
    medias {
      productThumbMediumAndSmall
      slideShow
    }
    manufacturer {
      id
      name
    }
    focus
    type
    flyableStatus
    owned
    msrp
    link
  }
  to(from: null) {
    ships {
      id
      skus {
        id
        price
        title
        available
        unlimitedStock
        availableStock
      }
    }
  }
  manufacturers {
    id
    name
  }
  app {
    version
    env
    cookieName
    sentryDSN
    pricing {
      currencyCode
      currencySymbol
      exchangeRate
      taxRate
      isTaxInclusive
    }
    mode
    isAnonymous
    buyback {
      credit
    }
  }
}
""";
  InitShipUpgrade();

  Future<List<UpgradeShipInfo>?> execute() async {
    final data = {
      "query": query,
      "variables": {},
    };

    final response = await RsiApiClient().upgradeGraphql(data: data);

    if (response.statusCode != 200) {
      return null;
    }

    final body = response.data;
    if (body is! Map ||
        body['errors'] != null ||
        body['data'] is! Map ||
        body['data']['ships'] is! List) {
      throw StateError('无法读取商店 CCU 目录');
    }
    catalogData = Map<String, dynamic>.from(body['data'] as Map);
    List<UpgradeShipInfo> upgradeShipInfoList = [];
    for (var item in response.data['data']['ships']) {
      upgradeShipInfoList.add(UpgradeShipInfo.fromJson(item));
    }

    return upgradeShipInfoList;
  }
}
