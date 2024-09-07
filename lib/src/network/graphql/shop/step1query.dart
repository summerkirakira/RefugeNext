import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/store_model.dart';


class Step1Query {
  final String query = r"""query Step1Query($storeFront: String) {
  store(name: $storeFront) {
    context {
      pricing {
        currencyCode
        __typename
      }
      __typename
    }
    cart {
      hasRecurring
      hasDigital
      lineItems {
        ...TyCartLineItemFragment
        __typename
      }
      __typename
    }
    __typename
  }
}

fragment TyCartLineItemFragment on TyCartLineItem {
  id
  skuId
  identifier
  taxDescription
  ...TySkuFragment
  unitPriceWithTax {
    amount
    discounted
    __typename
  }
  qty
  ... on ShipCustomizationLineItem {
    customizationId
    __typename
  }
  ... on ShipUpgradeLineItem {
    upgrade {
      name
      fromShipId
      toShipId
      toSkuId
      thumbnail
      __typename
    }
    __typename
  }
  ... on TicketLineItem {
    name
    __typename
  }
  discounts {
    ...TyCartLineItemDiscountFragment
    __typename
  }
  __typename
}

fragment TySkuFragment on TyCartLineItem {
  sku {
    id
    productId
    title
    label
    subtitle
    url
    type
    frequency
    isWarbond
    isPackage
    gameItems {
      ... on ShipGameItem {
        specs {
          productionStatus
          __typename
        }
        __typename
      }
      __typename
    }
    stock {
      ...TyStockFragment
      __typename
    }
    media {
      thumbnail {
        storeSmall
        __typename
      }
      __typename
    }
    maxQty
    minQty
    publicType {
      code
      label
      __typename
    }
    nativePrice {
      amount
      discounted
      __typename
    }
    price {
      amount
      discounted
      taxDescription
      __typename
    }
    __typename
  }
  __typename
}

fragment TyStockFragment on TyStock {
  unlimited
  show
  available
  backOrder
  qty
  backOrderQty
  level
  __typename
}

fragment TyCartLineItemDiscountFragment on TyCartLineItemDiscount {
  id
  title
  type
  reduction
  details
  bundle {
    id
    title
    __typename
  }
  __typename
}
""";

  Future<StoreData> execute() async {
    final data = {
      "query": query,
      "variables": {
        "storeFront": "pledge",
      },
    };

    final response = await RsiApiClient().graphql(data: data);
    return StoreData.fromJson(response.data['data']);
  }
}
