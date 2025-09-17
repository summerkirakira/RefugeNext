import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/shop/credit_query_property.dart';
import 'package:refuge_next/src/datasource/models/referral/referral_query_property.dart';


class ReferralCountQuery {
  final String query = r"""query ReferralCountByCampaign($campaignId: ID!) {
  referralCountByCampaign(campaignId: $campaignId)
}""";

  final String campaignId;

  ReferralCountQuery({required this.campaignId});


  Future<ReferralData> execute() async {
    final data = {
      "query": query,
      "variables": {
        "campaignId": campaignId,
      },
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
    return ReferralData.fromJson(response.data!["data"]);
  }

}