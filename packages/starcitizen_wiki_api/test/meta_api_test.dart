import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';


/// tests for MetaApi
void main() {
  final instance = StarcitizenWikiApi().getMetaApi();

  group(MetaApi, () {
    // OpenAPI Specification
    //
    // Returns the OpenAPI 3.0 specification as YAML. This spec describes all documented API endpoints, parameters, request bodies, and response schemas.
    //
    //Future<Uint8List> getOpenApiSpec() async
    test('test getOpenApiSpec', () async {
      // TODO
    });

  });
}
