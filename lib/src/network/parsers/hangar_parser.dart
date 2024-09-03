import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
import 'package:intl/intl.dart';
import '../../datasource/models/hangar.dart';
import '../../datasource/models/upgradeInfo.dart';
import 'dart:convert';

class ParserError implements Exception {
  final String message;
  ParserError(this.message);
}

int priceStringToInt(String priceString) {
  int price = 0;
  if (!priceString.contains("UEC")) {
    String cleanedString = priceString
        .replaceAll("\$", "")
        .replaceAll(" USD", "")
        .replaceAll(",", "");
    price = (double.parse(cleanedString) * 100).toInt();
  }
  return price;
}

String imageStringToUrl(String imageString) {
  String imageUrl = imageString
      .replaceAll("background-image:url('", "")
      .replaceAll("');", "");
  if (imageUrl.startsWith("/")) {
    imageUrl = "https://robertsspaceindustries.com" + imageUrl;
  }
  return imageUrl;
}

String convertDate(String date) {
  DateFormat originalFormat = DateFormat("MMMM dd, yyyy", "en_US");
  DateFormat newFormat = DateFormat("yyyy年MM月dd日", "zh_CN");
  DateTime dateObj = originalFormat.parse(date);
  return newFormat.format(dateObj);
}

Future<List<HangarItem>> getHangarItems({required String content, required int page}) async {
  List<HangarItem> hangarItems = [];
  dom.Document? doc = html_parser.parse(content);

  dom.Element? pledgeListContainer = doc.querySelector(".list-items");
  List<dom.Element>? pledgeList = pledgeListContainer?.querySelectorAll(".row");

  if (pledgeList == null) {
    throw ParserError("未找到机库内容");
  }

  try {
    for (var pledge in pledgeList) {
      int pledgeId = int.parse(pledge.querySelector(".js-pledge-id")!.attributes['value']!);
      String pledgeValueString = pledge.querySelector(".js-pledge-value")!.attributes['value']!;
      int pledgeValue = priceStringToInt(pledgeValueString);
      String pledgeImage = imageStringToUrl(pledge.querySelector("div.image")!.attributes['style']!);
      String pledgeTitle = pledge.querySelector(".js-pledge-name")!.attributes['value']!;

      if (pledgeTitle.contains("nameable ship") && pledgeTitle.contains(" Contains ")) {
        pledgeTitle = pledgeTitle.split(" Contains ")[0];
      }

      String pledgeStatus = pledge.querySelector(".availability")!.text;
      String dateCol = pledge.querySelector(".date-col")!.text;
      String timeString = dateCol.split("Created:\n")[1].replaceAll("\n", "").trim();
      String pledgeDate = convertDate(timeString);
      // String pledgeContains = pledge.querySelector(".items-col")!.text.replaceAll("Contains:", "");
      bool canGift = pledge.querySelector(".shadow-button.js-gift") != null;
      bool canExchange = pledge.querySelector(".shadow-button.js-reclaim") != null;
      bool canUpgrade = pledge.querySelector(".shadow-button.js-apply-upgrade") != null;

      final upgradeInfo = pledge.querySelector(".js-upgrade-data");

      String? upgradeInfoString = upgradeInfo?.attributes['value'];

      bool isUpgrade = upgradeInfo != null;


      String alsoContainsItemString = pledge.querySelectorAll(".title").map((element) {
        return element.text;
      }).join("#");

      dom.Element? itemsArea = pledge.querySelector(".with-images");
      List<HangarSubItem> items = [];

      if (itemsArea != null) {
        items = itemsArea.querySelectorAll(".item").where((item) {
          return item.querySelector(".image") != null;
        }).map((item) {
          String id = pledgeId.toString();
          String title = item.querySelector(".title")!.text;
          String image = imageStringToUrl(item.querySelector(".image")!.attributes['style']!);
          String kind = item.querySelector(".kind")?.text ?? "";
          String subtitle = item.querySelector(".liner")?.text ?? "";

          return HangarSubItem(
            id: id,
            image: image,
            packageId: pledgeId,
            title: title,
            kind: kind,
            subtitle: subtitle,
            insertTime: 777,
            chineseSubtitle: subtitle,
            chineseTitle: title,
            price: 0,
            fromShipPrice: 0,
            toShipPrice: 0,
          );
        }).toList();
      }

      String insuranceString = "";

      int insuranceTime = 0;


      for (var alsoContainsItem in alsoContainsItemString.split("#")) {
        try {
          int eachInsuranceTime = 0;
          if (alsoContainsItem.contains("Insurance")) {
            // print("HangerItemProperty: $it");
            String formattedInsurance = alsoContainsItem.replaceAll("-", " ").trim();
            if (formattedInsurance.contains("Lifetime")) {
              insuranceString = "LTI";
              break;
            } else {
              eachInsuranceTime = int.parse(formattedInsurance.split(" ")[0]);
            }
            if (formattedInsurance.split(" ")[1] == "Year") {
              eachInsuranceTime *= 12;
            }
          }
          if (eachInsuranceTime > insuranceTime) {
            insuranceTime = eachInsuranceTime;
          }
        } catch (e) {
          print("Error parsing alsoContainsItem: $e");
        }
      }
      if (insuranceTime > 0 && insuranceString.isEmpty) {
        if (insuranceTime % 12 == 0)
          insuranceString = "${insuranceTime ~/ 12}Y";
        insuranceString = "${insuranceTime}M";
      }





      HangarItem hangarItem = HangarItem(
        id: pledgeId,
        name: pledgeTitle,
        chineseName: pledgeTitle,
        image: pledgeImage,
        number: 1,
        status: pledgeStatus,
        tags: [],
        date: pledgeDate,
        contains: alsoContainsItemString,
        price: pledgeValue,
        insurance: insuranceString,
        alsoContains: alsoContainsItemString,
        items: items,
        isUpgrade: isUpgrade,
        chineseAlsoContains: alsoContainsItemString,
        canGit: canGift,
        canReclaim: canExchange,
        canUpgrade: canUpgrade,
        page: page,
        ownedBy: "Default",
        currentPrice: pledgeValue,
        rawData: [],
        idList: [],
        upgradeInfo: upgradeInfoString != null ? UpgradeInfo.fromJson(jsonDecode(upgradeInfoString)) : null,
      );

      hangarItem.idList.add(pledgeId);
      hangarItems.add(hangarItem);
    }
  } catch (e) {
    throw ParserError("机库解析错误");
  }

  return hangarItems;
}
