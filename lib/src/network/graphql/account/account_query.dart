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
        __typename
      }
      badgeIcons {
        favorite {
          icon
          name
          __typename
        }
        organization {
          icon
          name
          url
          __typename
        }
        __typename
      }
      canBeReferred
      createdAt
      displayname
      email
      hasBeenReferred
      hasGamePackage
      id
      nickname
      profileUrl
      referral_code
      referral_count
      referrerReferralCode
      roles {
        name
        __typename
      }
      status
      tmid
      updatedAt
      username
      __typename
    }
    __typename
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