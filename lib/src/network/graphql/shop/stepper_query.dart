import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/stepper_query_property.dart';


class StepperQuery {
  final String query = r"""query StepperQuery($storeFront: String) {
  store(name: $storeFront) {
    context {
      pricing {
        currencyCode
        
      }
      
    }
    cart {
      hasRecurring
      lineItemsQties
      lineItems {
        ...TyCartLineItemFragment
        
      }
      
    }
    ...CartFlowFragment
    ...OrderSlugFragment
    
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
    
  }
  qty
  ... on ShipCustomizationLineItem {
    customizationId
    
  }
  ... on ShipUpgradeLineItem {
    upgrade {
      name
      fromShipId
      toShipId
      toSkuId
      thumbnail
      
    }
    
  }
  ... on TicketLineItem {
    name
    
  }
  discounts {
    ...TyCartLineItemDiscountFragment
    
  }
  
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
          
        }
        
      }
      
    }
    stock {
      ...TyStockFragment
      
    }
    media {
      thumbnail {
        storeSmall
        
      }
      
    }
    maxQty
    minQty
    publicType {
      code
      label
      
    }
    nativePrice {
      amount
      discounted
      
    }
    price {
      amount
      discounted
      taxDescription
      
    }
    
  }
  
}

fragment TyStockFragment on TyStock {
  unlimited
  show
  available
  backOrder
  qty
  backOrderQty
  level
  
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
        
      }
      current {
        orderCreated
        
      }
      
    }
    
  }
  
}

fragment OrderSlugFragment on TyStore {
  order {
    slug
    
  }
  
}""";

  Future<StepperQueryProperty> execute() async {
    final data = {
      'query': query,
      'variables': {
        'storeFront': 'pledge'
      }
    };
    final response = await RsiApiClient().graphql(data: data);
    if (response.data!['errors'] != null) {
      throw Exception(response.data!['errors']);
    }
    return StepperQueryProperty.fromJson(response.data!['data']);
  }

}