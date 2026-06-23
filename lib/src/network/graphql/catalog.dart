import '../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart' show CatalogResponse, CatalogProperty;
import 'package:refuge_next/src/repo/shop_catalog_cache.dart';

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
    _cacheExtras(response.data);
    return catalogData.data.store.listing.resources;
  }

  /// 旁路:从原始 JSON 取各商品的 `nativePrice.discounted` 与 `tags[].name`,
  /// 写入缓存(freezed 模型未捕获这些字段)。空安全,失败不影响主流程。
  void _cacheExtras(dynamic data) {
    try {
      final resources =
          data?['data']?['store']?['listing']?['resources'] as List?;
      if (resources == null) return;
      final cache = ShopCatalogCache();
      for (final r in resources) {
        if (r is! Map) continue;
        final id = r['id']?.toString();
        if (id == null) continue;

        final discounted = (r['nativePrice'] as Map?)?['discounted'] as num?;
        cache.putDiscounted(id, discounted?.toInt());

        final tags = <String>[];
        for (final t in (r['tags'] as List?) ?? const []) {
          final name = (t is Map) ? t['name']?.toString() : null;
          if (name != null && name.isNotEmpty) tags.add(name);
        }
        cache.putTags(id, tags);
      }
    } catch (_) {
      // 附加信息,解析失败时忽略
    }
  }

}