import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

class ChooseUpgradeTargetItem {
  final String pledgeId;
  final String name;

  ChooseUpgradeTargetItem(this.pledgeId, this.name);
}

class PledgeUpgradeParser {
  List<ChooseUpgradeTargetItem> parse(String page) {
  final doc = parser.parse(page);
  final chooseUpgradeTargetItems = <ChooseUpgradeTargetItem>[];
  final targetItems = doc.querySelectorAll('div.row');

  for (var item in targetItems) {
  final pledgeId = item.querySelector('input')?.attributes['value'] ?? '';
  final name = item.querySelector('span')?.text ?? '';
  chooseUpgradeTargetItems.add(ChooseUpgradeTargetItem(pledgeId, name));
  }

  return chooseUpgradeTargetItems;
  }
}