import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for AuthApi
void main() {
  final instance = StarcitizenWikiApi().getAuthApi();

  group(AuthApi, () {
    // Get Authenticated User
    //
    // Returns the currently authenticated user. Requires a valid Sanctum bearer token.
    //
    //Future<GetAuthenticatedUser200Response> getAuthenticatedUser() async
    test('test getAuthenticatedUser', () async {
      // TODO
    });

  });
}
