import '../api_service.dart' show RsiApiClient;

class BasicGraphql<T> {
  String query = "";
  dynamic variables;

  BasicGraphql({
    required this.variables,
  });

  Future<dynamic> execute() async {}

}