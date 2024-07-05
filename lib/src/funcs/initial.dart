import '../network/api_service.dart';


Future<void> startup() async {
  final rsiApiClient = RsiApiClient();
  await rsiApiClient.refreshCsrfToken();

}