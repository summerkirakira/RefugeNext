import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/billing_address_model.dart';


class AddressBookQuery {
  final String query = r"""query AddressBookQuery($storeFront: String) {
  store(name: $storeFront) {
    addressBook {
      ...TyAddressFragment
      __typename
    }
    cart {
      totals {
        ...TyCartTotalFragment
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
      shippingRequired
      billingRequired
      __typename
    }
    __typename
  }
}

fragment TyAddressFragment on TyAddress {
  id
  defaultBilling
  defaultShipping
  company
  firstname
  lastname
  addressLine
  postalCode
  phone
  city
  country {
    id
    name
    requireRegion
    hasRegion
    code
    __typename
  }
  region {
    id
    code
    name
    __typename
  }
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
""";

    Future<BillingAddress> execute() async {
      final data = {
        "query": query,
        "variables": {
          "storeFront": "pledge",
        },
      };

      final response = await RsiApiClient().graphql(data: data);
      if (response.data!["errors"] != null) {
        throw Exception(response.data!["errors"]);
      }
      return BillingAddress.fromJson(response.data!["data"]);
    }

}