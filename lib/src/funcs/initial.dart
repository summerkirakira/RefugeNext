import '../network/api_service.dart';
import '../repo/hangar.dart';
import 'package:intl/date_symbol_data_local.dart';


Future<void> startup() async {

  await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('zh_CN', null);

  final rsiApiClient = RsiApiClient();
  await rsiApiClient.refreshCsrfToken();
  final hangarRepo = HangarRepo();
  // final items = await hangarRepo.refreshHangarItems();
}