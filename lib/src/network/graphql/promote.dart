

import 'package:refuge_next/src/datasource/models/shop/promote_property.dart';

import '../api_service.dart';

class PromoteReq {
  final String code;
  final String id;

  final String query = r"""query PromotionCodeQuery($code: String!, $id: ID!) {
  promotionalCode {
    validate(query: {code: $code, id: $id}) {
      isValid
      error
      __typename
    }
    __typename
  }
  heap {
    launcherDownloadLink: variables(key: "rsi.game.download_url") {
      value
      __typename
    }
    __typename
  }
}
""";

  PromoteReq({
    required this.code,
    required this.id,
});

  Map<String, dynamic> get variables => {
    "code": code,
    "id": id,
  };


  Future<PromoteProperty?> execute() async {
    final data = {
      "query": query,
      "variables": variables,
    };
    final response = await RsiApiClient().graphql(data: data);
    if (response.statusCode != 200) {
      return null;
    }
    final promoteResponse = PromoteProperty.fromJson(response.data);
    return promoteResponse;
  }


}