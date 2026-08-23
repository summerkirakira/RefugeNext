import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart';

import '../../datasource/models/buyback.dart';

const _rsiBaseUrl = 'https://robertsspaceindustries.com/';

int convertDateToLong(String date) {
  final formatter = DateFormat('MMMM dd, yyyy', 'en_US');
  try {
    return formatter.parse(date).millisecondsSinceEpoch;
  } catch (e) {
    throw FormatException('无法解析回购日期: $date', date);
  }
}

String _normalizeLabel(String value) {
  return value.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
}

Map<String, String> _readDefinitions(Element pledge) {
  final definitions = <String, String>{};

  for (final definitionList in pledge.querySelectorAll('dl')) {
    String? currentLabel;
    for (final element in definitionList.querySelectorAll('dt, dd')) {
      if (element.localName == 'dt') {
        currentLabel = _normalizeLabel(element.text);
      } else if (currentLabel != null) {
        definitions[currentLabel] = element.text.trim();
        currentLabel = null;
      }
    }
  }

  return definitions;
}

String _requiredDefinition(
  Map<String, String> definitions,
  String label,
  String title,
) {
  final value = definitions[_normalizeLabel(label)]?.trim();
  if (value == null || value.isEmpty) {
    throw FormatException('回购条目“$title”缺少 $label 字段');
  }
  return value;
}

int _requiredIdAttribute(Element button, String attribute, String title) {
  final value = int.tryParse(button.attributes[attribute] ?? '');
  if (value == null || value <= 0) {
    throw FormatException('回购条目“$title”的 $attribute 无效');
  }
  return value;
}

List<BuybackItem> parseBuybackItem(String page) {
  final doc = parser.parse(page);
  final buybackItems = <BuybackItem>[];

  for (final pledge in doc.querySelectorAll('article.pledge')) {
    final title = pledge.querySelector('.information h1')?.text.trim() ?? '';
    if (title.isEmpty) {
      throw const FormatException('回购条目缺少标题');
    }

    String image = pledge.querySelector('img')?.attributes['src'] ?? '';
    if (image.startsWith('/')) {
      image = Uri.parse(_rsiBaseUrl).resolve(image).toString();
    }

    final definitions = _readDefinitions(pledge);
    final timeString = _requiredDefinition(definitions, 'Reclaim Date', title);
    final contains = _requiredDefinition(definitions, 'Contained', title);
    final time = convertDateToLong(timeString);

    final button = pledge.querySelector('.holosmallbtn');
    if (button == null) {
      throw FormatException('回购条目“$title”缺少回购按钮');
    }

    String? url;
    int pledgeId;
    var isUpgrade = false;
    var fromShipId = 0;
    var toShipId = 0;
    var toSkuId = 0;

    final href = button.attributes['href']?.trim() ?? '';
    if (href.isNotEmpty) {
      url = Uri.parse(_rsiBaseUrl).resolve(href).toString();
      final pathSegments = Uri.parse(url)
          .pathSegments
          .where((segment) => segment.isNotEmpty)
          .toList();
      pledgeId =
          pathSegments.isEmpty ? 0 : int.tryParse(pathSegments.last) ?? 0;
      if (pledgeId <= 0) {
        throw FormatException('回购条目“$title”的链接缺少有效 ID');
      }
    } else {
      pledgeId = _requiredIdAttribute(button, 'data-pledgeid', title);
      fromShipId = _requiredIdAttribute(button, 'data-fromshipid', title);
      toShipId = _requiredIdAttribute(button, 'data-toshipid', title);
      toSkuId = _requiredIdAttribute(button, 'data-toskuid', title);
      isUpgrade = true;
    }

    buybackItems.add(
      BuybackItem(
        id: pledgeId,
        title: title,
        image: image,
        date: time,
        contains: contains,
        alsoContains: '回购此物品将会消耗一次回购机会',
        insertTime: DateTime.now().millisecondsSinceEpoch,
        isUpgrade: isUpgrade,
        formShipId: fromShipId,
        toShipId: toShipId,
        toSkuId: toSkuId,
        url: url,
        number: 1,
        idList: [pledgeId],
      ),
    );
  }

  return buybackItems;
}
