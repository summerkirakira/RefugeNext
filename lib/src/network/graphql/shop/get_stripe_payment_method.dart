import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/get_stripe_payment_method_property.dart';


class GetStripePaymentMethod {
  final String query = r"""query GetStripePaymentMethodQuery($orderSlug: String!) {
  order(slug: $orderSlug) {
    payment {
      apiKey(name: "STRIPE") {
        value
        __typename
      }
      __typename
    }
    order {
      id
      recurring
      slug
      paymentMethod {
        ... on StripeIntentMethod {
          clientSecret
          __typename
        }
        __typename
      }
      __typename
    }
    billingAddress {
      ...PostalAddressFragment
      __typename
    }
    shippingAddress {
      ...PostalAddressFragment
      __typename
    }
    context {
      pricing {
        currencyCode
        __typename
      }
      __typename
    }
    totals {
      total
      __typename
    }
    savedCards {
      id
      brand
      last4
      expMonth
      expYear
      __typename
    }
    __typename
  }
  customer {
    id
    email
    __typename
  }
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
""";

  final String orderSlug;

  GetStripePaymentMethod({required this.orderSlug});

  Future<GetStripePaymentMethodProperty> execute() async {
    final data = {
      'query': query,
      'variables': {
        'orderSlug': orderSlug,
      }
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!['errors'] != null) {
      throw Exception(response.data!['errors']);
    }

    return GetStripePaymentMethodProperty.fromJson(response.data!['data']);
  }
}