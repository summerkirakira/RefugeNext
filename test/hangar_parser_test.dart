import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:refuge_next/src/network/parsers/hangar_parser.dart';

void main() {
  setUpAll(() => initializeDateFormatting());

  test('按条目识别新旧赠送按钮，零金额奖励也可赠送', () async {
    final items = await getHangarItems(
      content: '''
        <div class="list-items">
          ${_pledge(1, r'$5.00 USD', '''
            <a class="shadow-button trans-02s js-gift gift">Gift</a>
            <a class="shadow-button js-reclaim">Exchange</a>
          ''')}
          ${_pledge(2, r'$0.00 USD', '''
            <a class="shadow-button trans-02s trans-color js-gift-v2 gift">
              <span class="label js-label">Gift</span>
            </a>
          ''')}
          ${_pledge(3, r'$5.00 USD', '''
            <a class="shadow-button js-reclaim">Exchange</a>
          ''')}
        </div>
      ''',
      page: 1,
    );

    expect(items.map((item) => item.id), [1, 2, 3]);
    expect(items.map((item) => item.canGit), [true, true, false]);
    expect(items.map((item) => item.canReclaim), [true, false, true]);
    expect(items.map((item) => item.price), [500, 0, 500]);
  });
}

// Minimal, anonymized pledge structure matching the official hangar page.
String _pledge(int id, String value, String actions) => '''
  <div class="row">
    <input class="js-pledge-id" value="$id">
    <input class="js-pledge-name" value="Test pledge $id">
    <input class="js-pledge-value" value="$value">
    <div class="image" style="background-image:url('/test.png');"></div>
    <span class="availability">Attributed</span>
    <div class="date-col"><label>Created:</label>
      October 31, 2026
    </div>
    <div class="items more js-more">$actions</div>
  </div>
''';
