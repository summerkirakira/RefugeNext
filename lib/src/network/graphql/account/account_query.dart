import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/credit_query_property.dart';
import 'package:refuge_next/src/datasource/models/account/account_query_property.dart';


class AccountQuery {
  final String query = r"""query account {
  account {
    isAnonymous
    ... on RsiAuthenticatedAccount {
      avatar
      badges {
        id
        title
      }
      displayname
      id
      nickname
      profileUrl
      roles {
        name
      }
      updatedAt
      username
    }
  }
}""";


  Future<AccountQueryProperty> execute() async {
    final data = {
      "query": query,
      "variables": {},
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
    return AccountQueryProperty.fromJson(response.data!["data"]);
  }

}