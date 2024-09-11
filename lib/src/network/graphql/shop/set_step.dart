import '../../api_service.dart' show RsiApiClient;


class SetStep {
  final query = r"""mutation SetStepMutation($step: TyCartStepType, $storeFront: String) {
  store(name: $storeFront) {
    cart {
      mutations {
        flow {
          moveTo(step: $step)
          __typename
        }
        __typename
      }
      totals {
        ...TyCartTotalFragment
        __typename
      }
      lineItems {
        ...TyCartLineItemFragment
        __typename
      }
      __typename
    }
    ...CartFlowFragment
    ...OrderSlugFragment
    __typename
  }
}

fragment CartFlowFragment on TyStore {
  cart {
    flow {
      steps {
        step
        action
        finalStep
        active
        __typename
      }
      current {
        orderCreated
        __typename
      }
      __typename
    }
    __typename
  }
  __typename
}

fragment OrderSlugFragment on TyStore {
  order {
    slug
    __typename
  }
  __typename
}

fragment TyCartTotalFragment on TyCartTotal {
  discount
  shipping
  total
  subTotal
  tax1 {
    name
    amount
    __typename
  }
  tax2 {
    name
    amount
    __typename
  }
  coupon {
    amount
    allowed
    code
    __typename
  }
  credits {
    amount
    nativeAmount {
      value
      __typename
    }
    applicable
    maxApplicable
    __typename
  }
  __typename
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

  final String step;

  SetStep({required this.step});

  Future<void> execute() async {
    final data = {
      "query": query,
      "variables": {
        "step": step,
        "storeFront": "pledge",
      },
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
  }

}