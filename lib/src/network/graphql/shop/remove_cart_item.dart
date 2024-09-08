import '../../api_service.dart' show RsiApiClient;


class RemoveCartItem {
  final String query = r"""mutation RemoveCartItemAutomatedUpsellsMutation($skuId: ID!, $identifier: String, $storeFront: String) {
  store(name: $storeFront) {
    cart {
      mutations {
        remove(skuId: $skuId, identifier: $identifier)
        __typename
      }
      __typename
    }
    ...EntityAfterUpdateFragment
    ...TyAutomatedUpsellsSkuFragment
    __typename
  }
}

fragment EntityAfterUpdateFragment on TyStore {
  ...CartFlowFragment
  ...OrderSlugFragment
  cart {
    lineItemsQties
    billingRequired
    shippingRequired
    totals {
      ...TyCartTotalFragment
      __typename
    }
    lineItems {
      ...TySkuFragment
      id
      skuId
      identifier
      taxDescription
      discounts {
        ...TyCartLineItemDiscountFragment
        __typename
      }
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
      __typename
    }
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

fragment TyAutomatedUpsellsSkuFragment on TyStore {
  automatedUpsells {
    promotions {
      sku {
        id
        type
        title
        publicType {
          code
          __typename
        }
        price {
          amount
          discounted
          taxDescription
          __typename
        }
        stock {
          unlimited
          qty
          level
          __typename
        }
        __typename
      }
      title
      excerpt
      media {
        thumbnail {
          storeSmall
          __typename
        }
        __typename
      }
      __typename
    }
    bundles {
      id
      title
      media {
        thumbnail {
          storeSmall
          __typename
        }
        __typename
      }
      price {
        amount
        discounted
        taxDescription
        discountDescription
        __typename
      }
      stock {
        ...TyStockFragment
        __typename
      }
      discount {
        ...TyDiscountFragment
        __typename
      }
      __typename
    }
    skus {
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
  __typename
}

fragment TyDiscountFragment on TyDiscount {
  id
  title
  skus {
    ...TyBundleSkuFragment
    __typename
  }
  products {
    ...TyBundleProductFragment
    __typename
  }
  __typename
}

fragment TyBundleSkuFragment on TySku {
  id
  title
  label
  excerpt
  subtitle
  url
  type
  isWarbond
  isDirectCheckout
  media {
    thumbnail {
      storeSmall
      slideshow
      __typename
    }
    __typename
  }
  gameItems {
    __typename
  }
  stock {
    ...TyStockFragment
    __typename
  }
  price {
    amount
    taxDescription
    __typename
  }
  tags {
    ...TyHeapTagFragment
    __typename
  }
  __typename
}

fragment TyHeapTagFragment on HeapTag {
  name
  excerpt
  __typename
}

fragment TyBundleProductFragment on TyProduct {
  id
  name
  title
  subtitle
  url
  type
  excerpt
  stock {
    ...TyStockFragment
    __typename
  }
  media {
    thumbnail {
      storeSmall
      slideshow
      __typename
    }
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
  skus {
    ...TyBundleSkuFragment
    __typename
  }
  __typename
}
""";
  final String skuId;
  final String? identifier;

  RemoveCartItem({required this.skuId, required this.identifier});

  Future<void> execute() async {
    final data = {
      "query": query,
      "variables": {
        "skuId": skuId,
        "identifier": identifier,
        "storeFront": "pledge",
      },
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
  }

}