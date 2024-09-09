import '../../api_service.dart' show RsiApiClient;

class NextStep {
  final query = r"""mutation NextStepMutation($storeFront: String) {
  store(name: $storeFront) {
    cart {
      hasDigital
      mutations {
        flow {
          moveNext
          __typename
        }
        __typename
      }
      totals {
        ...TyCartTotalFragment
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
}""";

  Future<void> execute() async {
    final data = {
      "query": query,
      "variables": {
        "storeFront": "pledge",
      }
    };

    final response = await RsiApiClient().graphql(data: data);
  }
}