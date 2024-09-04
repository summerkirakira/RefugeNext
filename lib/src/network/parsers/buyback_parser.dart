import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';
import '../../datasource/models/buyback.dart';
import 'package:intl/intl.dart';

int convertDateToLong(String date) {
  final DateFormat formatter = DateFormat('MMMM dd, yyyy', 'en_US');
  try {
    final DateTime parsedDate = formatter.parse(date);
    return parsedDate.millisecondsSinceEpoch;
  } catch (e) {
    print('Error parsing date: $e');
    return 0;
  }
}


List<BuybackItem> parseBuybackItem(String page) {
  final doc = parser.parse(page);
  final buybackItems = <BuybackItem>[];

  for (var pledge in doc.querySelectorAll('article.pledge')) {
    String image = pledge.querySelector('img')?.attributes['src'] ?? '';
    if (image.startsWith('/')) {
      image = 'https://robertsspaceindustries.com$image';
    }
    final title = pledge.querySelector('.information h1')?.text ?? '';
    final timeString = pledge.querySelectorAll('dl dd')[0].text;
    final time = convertDateToLong(timeString);
    final contains = pledge.querySelectorAll('dl dd')[2].text;
    String? url = null;

    int pledgeId = 0;
    bool isUpgrade = false;
    int fromShipId = 0;
    int toShipId = 0;
    int toSkuId = 0;

    try {
      url = pledge.querySelector('.holosmallbtn')!.attributes['href']!;
      url = "https://robertsspaceindustries.com$url";
      pledgeId = int.parse(url.split('/').last);
    } catch (e) {
      pledgeId = int.parse(pledge.querySelector('.holosmallbtn')!.attributes['data-pledgeid'] ?? '0');
      isUpgrade = true;
      fromShipId = int.parse(pledge.querySelector('.holosmallbtn')!.attributes['data-fromshipid'] ?? '0');
      toShipId = int.parse(pledge.querySelector('.holosmallbtn')!.attributes['data-toshipid'] ?? '0');
      toSkuId = int.parse(pledge.querySelector('.holosmallbtn')!.attributes['data-toskuid'] ?? '0');
    }

    buybackItems.add(BuybackItem(
      id: pledgeId,
      title: title,
      image: image,
      date: time,
      contains: contains,
      alsoContains: "回购此物品将会消耗一次回购机会",
      insertTime: DateTime.now().millisecondsSinceEpoch,
      isUpgrade: isUpgrade,
      formShipId: fromShipId,
      toShipId: toShipId,
      toSkuId: toSkuId,
      url: url,
      number: 1,
      idList: [pledgeId],
    ));
  }

  return buybackItems;
}
