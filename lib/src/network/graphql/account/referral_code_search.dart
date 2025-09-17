import '../../api_service.dart' show RsiApiClient;
import 'package:refuge_next/src/datasource/models/referral/referral_code_search_property.dart';


class ReferralCodeSearchQuery {
  final String query = r"""query referralCode($query: ValidateReferralCodeInput!) {
  referralCode {
    validate(query: $query) {
      isValid
      displayname
      handle
      avatar
      nextReward {
        title
        image
        __typename
      }
      cantValidateCaptcha
      __typename
    }
    __typename
  }
}""";

  final String captcha_token;
  final String code;

  ReferralCodeSearchQuery({required this.captcha_token, required this.code});


  Future<ReferralCodeSearchResponse> execute() async {
    final data = {
      "query": query,
      "variables": {
        "query": {
          "captcha_token": captcha_token,
          "code": code,
        },
      },
    };

    final response = await RsiApiClient().graphql(data: data);
    if (response.data!["errors"] != null) {
      throw Exception(response.data!["errors"]);
    }
    return ReferralCodeSearchResponse.fromJson(response.data!["data"]);
  }
}
