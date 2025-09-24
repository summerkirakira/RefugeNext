import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/referral/referral_list_property.dart';


class ReferralListQuery {
  final String query = r"""query GetReferralRecruitsList($converted: Boolean!, $limit: Int!, $page: Int!, $campaignId: ID!) {
  referralRecruitsList(
    query: {converted: $converted, limit: $limit, page: $page, campaignId: $campaignId}
  ) {
    recruitsCount
    prospectsCount
    data {
      id
      displayName
      nickname
      avatar
      enlistedOn
      convertedOn
      __typename
    }
    __typename
  }
}""";

  final bool converted;
  final int limit;
  final int page;
  final String campaignId;

  ReferralListQuery({this.converted = false, this.limit = 5, this.page = 1, this.campaignId = "1"});


  Future<ReferralRecruitsList> execute() async {
    final data = {
      "query": query,
      "variables": {
        "converted": converted,
        "limit": limit,
        "page": page,
        "campaignId": campaignId,
      },
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
    return ReferralRecruitsList.fromJson(response.data!["data"]["referralRecruitsList"]);
  }
}
