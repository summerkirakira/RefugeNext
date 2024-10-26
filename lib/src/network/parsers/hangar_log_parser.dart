import 'package:html/parser.dart' as html_parser;
import 'package:intl/intl.dart';

import '../../datasource/models/hangar/hangar_log.dart';


class HangarLogRegex {
  static final RegExp CREATED = RegExp(r'^#(\d+?) - Created by ([\w\d-]+?) - order #([A-Z0-9]+?), value: \$([0-9.]+?) USD$');
  static final RegExp RECLAIMED = RegExp(r'^#(\d+?) - Reclaimed by ([\w\d-]+?) for \$([0-9.]+?) USD$');
  static final RegExp CONSUMED = RegExp(r'^#(\d+?) - Consumed by ([\w\d-]+?) on pledge #(\d+?), value: \$([0-9.]+?) USD$');
  static final RegExp APPLIED_UPGRADE = RegExp(r'^#(\d+?) - Upgrade applied: #(\d+?) ([^,]+?), new value: \$([0-9.]+?) USD$');
  static final RegExp BUYBACK = RegExp(r'^#(\d+?) - Buy-back by ([\w\d-]+?) - order #([\w\d]+?)$');
  static final RegExp GIFT = RegExp(r'^#(\d+?) - Gifted to ([^,]+?), value: \$([0-9.]+?) USD$');
  static final RegExp GIFT_CLAIMED = RegExp(r'^#(\d+) - Claimed as a gift by ([\w\d-]+?), value: \$([0-9.]+?) USD$');
  static final RegExp GIFT_CANCELLED = RegExp(r'^#(\d+?) - Gift cancelled by ([\d\w-]+?), value: \$([0-9.]+?) USD$');
  static final RegExp NAME_CHANGE = RegExp(r'^#(\d+) - Name Reservation: \((.+)\) on item (.+)$');
  static final RegExp NAME_CHANGE_RECLAIMED = RegExp(r'^#(\d+) - Name Release: \(([^\)]+)\) on item (\S+) Reclaimed$');
  static final RegExp GIVEAWAY = RegExp(r'^#(\d+?) - (.*?)$');
}

class HangarLogParser {
  List<HangarLog> parseLog(String log) {
    final document = html_parser.parse(log);
    final logList = document.querySelectorAll('.pledge-log-entry');
    final logListResult = <HangarLog>[];

    for (var logEntry in logList) {
      final logText = logEntry.querySelector('p')?.text ?? '';
      final name = logEntry.querySelector('span')?.text ?? '';
      final inputFormat = DateFormat('MMM dd yyyy, h:mm a', 'en_US');
      final messagePart = logText.split('-');
      final timeText = messagePart[0].trim();
      final time = inputFormat.parse(timeText);
      final content = messagePart[1].trim().substring(name.length).trim();

      String type = 'UNKNOWN';
      int? price;
      String? order;
      String? source;
      String? target;
      String? operator;
      String? reason;

      if (HangarLogRegex.CREATED.hasMatch(content)) {
        final match = HangarLogRegex.CREATED.firstMatch(content)!;
        type = 'CREATED';
        target = match.group(1);
        operator = match.group(2);
        order = match.group(3);
        price = (double.parse(match.group(4)!) * 100).toInt();
      } else if (HangarLogRegex.RECLAIMED.hasMatch(content)) {
        final match = HangarLogRegex.RECLAIMED.firstMatch(content)!;
        type = 'RECLAIMED';
        target = match.group(1);
        operator = match.group(2);
        price = (double.parse(match.group(3)!) * 100).toInt();
      } else if (HangarLogRegex.CONSUMED.hasMatch(content)) {
        final match = HangarLogRegex.CONSUMED.firstMatch(content)!;
        type = 'CONSUMED';
        target = match.group(1);
        operator = match.group(2);
        source = match.group(3);
        price = (double.parse(match.group(4)!) * 100).toInt();
      } else if (HangarLogRegex.APPLIED_UPGRADE.hasMatch(content)) {
        final match = HangarLogRegex.APPLIED_UPGRADE.firstMatch(content)!;
        type = 'APPLIED_UPGRADE';
        target = match.group(1);
        source = match.group(2);
        reason = match.group(3);
        price = (double.parse(match.group(4)!) * 100).toInt();
      } else if (HangarLogRegex.BUYBACK.hasMatch(content)) {
        final match = HangarLogRegex.BUYBACK.firstMatch(content)!;
        type = 'BUYBACK';
        target = match.group(1);
        operator = match.group(2);
        order = match.group(3);
      } else if (HangarLogRegex.GIFT.hasMatch(content)) {
        final match = HangarLogRegex.GIFT.firstMatch(content)!;
        type = 'GIFT';
        target = match.group(1);
        operator = match.group(2);
        price = (double.parse(match.group(3)!) * 100).toInt();
      } else if (HangarLogRegex.GIFT_CLAIMED.hasMatch(content)) {
        final match = HangarLogRegex.GIFT_CLAIMED.firstMatch(content)!;
        type = 'GIFT_CLAIMED';
        target = match.group(1);
        operator = match.group(2);
        price = (double.parse(match.group(3)!) * 100).toInt();
      } else if (HangarLogRegex.GIFT_CANCELLED.hasMatch(content)) {
        final match = HangarLogRegex.GIFT_CANCELLED.firstMatch(content)!;
        type = 'GIFT_CANCELLED';
        target = match.group(1);
        operator = match.group(2);
        price = (double.parse(match.group(3)!) * 100).toInt();
      } else if (HangarLogRegex.NAME_CHANGE.hasMatch(content)) {
        final match = HangarLogRegex.NAME_CHANGE.firstMatch(content)!;
        type = 'NAME_CHANGE';
        target = match.group(1);
        source = match.group(2);
        reason = match.group(3);
      } else if (HangarLogRegex.NAME_CHANGE_RECLAIMED.hasMatch(content)) {
        final match = HangarLogRegex.NAME_CHANGE_RECLAIMED.firstMatch(content)!;
        type = 'NAME_CHANGE_RECLAIMED';
        target = match.group(1);
        source = match.group(2);
        reason = match.group(3);
      } else if (HangarLogRegex.GIVEAWAY.hasMatch(content)) {
        final match = HangarLogRegex.GIVEAWAY.firstMatch(content)!;
        type = 'GIVEAWAY';
        target = match.group(1);
        reason = match.group(2);
      }

      logListResult.add(
        HangarLog(
          id: '$type#$target#${time.millisecondsSinceEpoch}#$content',
          time: time.millisecondsSinceEpoch,
          operator: operator,
          type: type,
          name: name,
          insertTime: DateTime.now().millisecondsSinceEpoch,
          price: price,
          order: order,
          source: source,
          reason: reason,
          target: target,
        ),
      );
    }

    return logListResult;
  }
}
