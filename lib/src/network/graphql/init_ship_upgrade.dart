import '../api_service.dart' show RsiApiClient;
import '../../datasource/models/shop/upgrade_ship_info.dart' show UpgradeShipInfo;
import 'dart:convert';


class InitShipUpgrade {
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
    skus {
      id
      title
      available
      price
      body
      unlimitedStock
      availableStock
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

    List<UpgradeShipInfo> upgradeShipInfoList = [];
    for (var item in response.data['data']['ships']) {
      upgradeShipInfoList.add(UpgradeShipInfo.fromJson(item));
    }

    return upgradeShipInfoList;
  }
}