import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/cart_validation_property.dart';


class CartValidate {
  final String query = r"""mutation CartValidateCartMutation($storeFront: String, $token: String, $mark: String) {
  store(name: $storeFront) {
    cart {
      mutations {
        validate(mark: $mark, token: $token)
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
}""";
  final String token;
  final String mark;

  CartValidate({required this.token, required this.mark});

  Future<CartValidationProperty> execute() async {
    final data = {
      'query': query,
      'variables': {
        'token': token,
        'mark': mark,
        'storeFront': 'pledge'
      }
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!['errors'] != null) {
      throw Exception(response.data!['errors']);
    }
    return CartValidationProperty.fromJson(response.data!['data']['store']);
  }
}