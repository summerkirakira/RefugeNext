import '../../api_service.dart' show RsiApiClient;


class AssignCartAddress {
  final String query = r"""mutation CartAddressAssignMutation($billing: ID, $shipping: ID, $storeFront: String) {
  store(name: $storeFront) {
    cart {
      mutations {
        assignAddresses(assign: {billing: $billing, shipping: $shipping})
        __typename
      }
      shippingAddress {
        ...PostalAddressFragment
        __typename
      }
      billingAddress {
        ...PostalAddressFragment
        __typename
      }
      totals {
        ...TyCartTotalFragment
        __typename
      }
      __typename
    }
    context {
      currencies {
        code
        symbol
        __typename
      }
      pricing {
        ...PricingContextFragment
        __typename
      }
      __typename
    }
    ...CartFlowFragment
    __typename
  }
}

fragment PricingContextFragment on PricingContext {
  currencyCode
  currencySymbol
  exchangeRate
  taxInclusive
  __typename
}

fragment PostalAddressFragment on PostalAddress {
  id
  firstname
  lastname
  addressLine
  city
  company
  phone
  postalCode
  regionName
  countryName
  countryCode
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
}""";

  final String billing;

  AssignCartAddress({required this.billing});

  Future<void> execute() async {
    final data = {
      'query': query,
      'variables': {
        'billing': billing,
        'storeFront': 'pledge'
      }
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!['errors'] != null) {
      throw Exception(response.data!['errors']);
    }
  }
}