import '../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart' show CatalogResponse, CatalogProperty;

class CatalogReq {
  final int page;
  final List<String> products;
  final String direction;
  final String query = r"""mutation UpdateCatalogQueryMutation($storeFront: String, $query: SearchQuery!) {
  store(name: $storeFront, browse: true) {
    listing: search(query: $query) {
      resources {
        ...TyItemFragment
        __typename
      }
      __typename
    }
    __typename
  }
}

fragment TyItemFragment on TyItem {
  id
  name
  title
  subtitle
  url
  body
  excerpt
  type
  media {
    thumbnail {
      slideshow
      storeSmall
      __typename
    }
    list {
      slideshow
      __typename
    }
    __typename
  }
  nativePrice {
    amount
    discounted
    discountDescription
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
  tags {
    name
    __typename
  }
  ... on TySku {
    label
    customizable
    isWarbond
    isPackage
    isVip
    isDirectCheckout
    __typename
  }
  ... on TyProduct {
    skus {
      id
      title
      isDirectCheckout
      __typename
    }
    isVip
    __typename
  }
  ... on TyBundle {
    isVip
    media {
      thumbnail {
        slideshow
        __typename
      }
      __typename
    }
    discount {
      ...TyDiscountFragment
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
}""";

  CatalogReq({
    required this.page,
    required this.products,
    this.direction = "desc",
  });


  Map<String, dynamic> get variables => {
    'query': {
      "page": page,
      "sort": {
        "field": "weight",
        "direction": direction,
      },
      "skus": {
        "products": products,
      }
    }
  };


  Future<List<CatalogProperty>?> execute() async {
    final data = {
      "query": query,
      "variables": variables,
    };
    final response = await RsiApiClient().graphql(data: data);
    if (response.statusCode != 200) {
      return null;
    }
    final catalogData = CatalogResponse.fromJson(response.data);
    return catalogData.data.store.listing.resources;
  }

}