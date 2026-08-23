import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/network/parsers/buyback_parser.dart';

void main() {
  group('parseBuybackItem', () {
    test('解析当前官网的升级回购结构', () {
      final items = parseBuybackItem(_upgradePledgeHtml);

      expect(items, hasLength(1));
      final item = items.single;
      expect(item.id, 107741113);
      expect(item.title, 'Mustang Gamma to Starlite Upgrade');
      expect(item.contains,
          'Upgrade - Mustang Gamma to Starlite Standard Edition');
      expect(
          item.image, 'https://robertsspaceindustries.com/media/buyback.webp');
      expect(item.isUpgrade, isTrue);
      expect(item.formShipId, 67);
      expect(item.toShipId, 319);
      expect(item.toSkuId, 19220);
      expect(item.url, isNull);
      expect(item.date, greaterThan(0));
    });

    test('解析普通回购链接', () {
      final items = parseBuybackItem('''
        <article class="pledge">
          <img src="https://example.com/ship.webp">
          <div class="information"><h1>Standalone Ship</h1></div>
          <dl>
            <dt>Reclaim Date</dt><dd>July 21, 2026</dd>
            <dt>Contained</dt><dd>Standalone Ship - LTI</dd>
          </dl>
          <a class="holosmallbtn"
             href="/account/buy-back-pledges/123456">Buy Back</a>
        </article>
      ''');

      final item = items.single;
      expect(item.id, 123456);
      expect(item.isUpgrade, isFalse);
      expect(item.url,
          'https://robertsspaceindustries.com/account/buy-back-pledges/123456');
    });

    test('按字段名解析，不依赖 dt/dd 位置', () {
      final items = parseBuybackItem('''
        <article class="pledge">
          <div class="information"><h1>Reordered Pledge</h1></div>
          <dl>
            <dt>Extra Field</dt><dd>Ignored</dd>
            <dt>Contained</dt><dd>Expected contents</dd>
            <dt>Reclaim Date</dt><dd>August 01, 2026</dd>
          </dl>
          <a class="holosmallbtn" href="/account/buy-back-pledges/42">
            Buy Back
          </a>
        </article>
      ''');

      expect(items.single.contains, 'Expected contents');
      expect(items.single.id, 42);
    });

    test('空分页返回空列表', () {
      expect(parseBuybackItem('<html><body></body></html>'), isEmpty);
    });

    test('有条目但缺少 Contained 时报告格式错误', () {
      expect(
        () => parseBuybackItem('''
          <article class="pledge">
            <div class="information"><h1>Broken Pledge</h1></div>
            <dl><dt>Reclaim Date</dt><dd>June 27, 2026</dd></dl>
            <a class="holosmallbtn" href="/account/buy-back-pledges/1">
              Buy Back
            </a>
          </article>
        '''),
        throwsA(isA<FormatException>()),
      );
    });

    test('有条目但缺少回购按钮时报告格式错误', () {
      expect(
        () => parseBuybackItem('''
          <article class="pledge">
            <div class="information"><h1>Missing Button</h1></div>
            <dl>
              <dt>Reclaim Date</dt><dd>June 27, 2026</dd>
              <dt>Contained</dt><dd>Standalone Ship</dd>
            </dl>
          </article>
        '''),
        throwsA(isA<FormatException>()),
      );
    });

    test('升级回购缺少必需 ID 时报告格式错误', () {
      expect(
        () => parseBuybackItem('''
          <article class="pledge">
            <div class="information"><h1>Broken Upgrade</h1></div>
            <dl>
              <dt>Reclaim Date</dt><dd>June 27, 2026</dd>
              <dt>Contained</dt><dd>Upgrade</dd>
            </dl>
            <a class="holosmallbtn" href="" data-pledgeId="12">
              Buy Back
            </a>
          </article>
        '''),
        throwsA(isA<FormatException>()),
      );
    });
  });
}

const _upgradePledgeHtml = '''
  <article class="pledge">
    <img src="/media/buyback.webp">
    <div class="information">
      <h1>Mustang Gamma to Starlite Upgrade</h1>
    </div>
    <dl>
      <dt>Reclaim Date</dt>
      <dd>June 27, 2026</dd>
      <dt>Contained</dt>
      <dd>Upgrade - Mustang Gamma to Starlite Standard Edition</dd>
    </dl>
    <a href=""
       class="holosmallbtn js-open-ship-upgrades"
       data-apiurl="/pledge-store/api/upgrade/v2"
       data-pledgeId="107741113"
       data-fromShipId="67"
       data-toShipId="319"
       data-toSkuId="19220">Buy Back</a>
  </article>
''';
