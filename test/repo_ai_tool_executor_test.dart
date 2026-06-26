import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
import 'package:refuge_next/src/datasource/models/buyback.dart';
import 'package:refuge_next/src/repo/repo_ai_tool_executor.dart';

HangarSubItem _sub({String title = '', String kind = '', String? chineseTitle}) =>
    HangarSubItem(
      id: '',
      image: '',
      packageId: 0,
      title: title,
      kind: kind,
      subtitle: '',
      insertTime: 0,
      price: 0,
      fromShipPrice: 0,
      toShipPrice: 0,
      chineseTitle: chineseTitle,
    );

HangarItem _hi({
  int id = 0,
  String name = '',
  String? chineseName,
  int number = 1,
  int price = 0,
  int currentPrice = 0,
  bool isUpgrade = false,
  List<HangarSubItem> items = const [],
  String alsoContains = '',
  String? chineseAlsoContains,
}) =>
    HangarItem(
      id: id,
      idList: const [],
      name: name,
      chineseName: chineseName,
      image: '',
      number: number,
      status: 'Attributed',
      tags: const [],
      date: '',
      contains: '',
      price: price,
      insurance: '',
      alsoContains: alsoContains,
      items: items,
      isUpgrade: isUpgrade,
      chineseAlsoContains: chineseAlsoContains,
      rawData: const [],
      ownedBy: '',
      currentPrice: currentPrice,
      canGit: false,
      canReclaim: false,
      canUpgrade: false,
      page: 0,
    );

BuybackItem _bb({
  int id = 0,
  String title = '',
  String? chinesName,
  int number = 1,
  bool isUpgrade = false,
  String contains = '',
  String? chineseContains,
  String alsoContains = '',
  String? chineseAlsoContains,
}) =>
    BuybackItem(
      id: id,
      title: title,
      image: '',
      date: 0,
      contains: contains,
      alsoContains: alsoContains,
      insertTime: 0,
      isUpgrade: isUpgrade,
      chinesName: chinesName,
      chineseContains: chineseContains,
      chineseAlsoContains: chineseAlsoContains,
      url: null,
      number: number,
      idList: const [],
    );

void main() {
  group('shapeHangarItems', () {
    test('type=ship 只留含 Ship 子项的项', () {
      final items = [
        _hi(name: 'Cutlass', items: [_sub(title: 'Cutlass Black', kind: 'Ship')]),
        _hi(name: 'PaintX', items: [_sub(title: 'Some Paint', kind: 'Paint')]),
        _hi(name: 'CCU', isUpgrade: true),
      ];
      final r = shapeHangarItems(items, {'type': 'ship'});
      expect(r['total'], 1);
      expect((r['items'] as List).single['type'], 'ship');
    });

    test('type=upgrade 命中 isUpgrade', () {
      final items = [
        _hi(name: 'CCU', isUpgrade: true),
        _hi(name: 'Ship', items: [_sub(kind: 'Ship')]),
      ];
      final r = shapeHangarItems(items, {'type': 'upgrade'});
      expect(r['total'], 1);
      expect((r['items'] as List).single['type'], 'upgrade');
    });

    test('filter 命中中/英/子项；chineseName 为 null 不崩', () {
      final items = [
        _hi(name: 'Aurora', items: [_sub(title: 'Aurora MR', kind: 'Ship')]), // chineseName null
        _hi(name: 'Carrack', chineseName: '卡拉克', items: [_sub(title: 'Carrack', kind: 'Ship')]),
      ];
      expect((shapeHangarItems(items, {'filter': '卡拉克'})['items'] as List).length, 1);
      expect((shapeHangarItems(items, {'filter': 'aurora'})['items'] as List).length, 1);
      expect((shapeHangarItems(items, {'filter': 'MR'})['items'] as List).length, 1); // 子项 title
      expect(shapeHangarItems(items, {'filter': 'zzz'})['total'], 0); // 无命中且不崩
    });

    test('limit/offset 分页，total 为过滤后总数', () {
      final items = List.generate(5, (i) => _hi(name: 'S$i', items: [_sub(kind: 'Ship')]));
      final r = shapeHangarItems(items, {'limit': 2, 'offset': 1});
      expect(r['total'], 5);
      final list = r['items'] as List;
      expect(list.length, 2);
      expect(list[0]['name'], 'S1');
      expect(list[1]['name'], 'S2');
    });

    test('name 优先中文名，price 优先 currentPrice，含 id', () {
      final r = shapeHangarItems([
        _hi(id: 42, name: 'Carrack', chineseName: '卡拉克', price: 100, currentPrice: 80, items: [_sub(kind: 'Ship')]),
      ], {});
      final it = (r['items'] as List).single;
      expect(it['id'], 42);
      expect(it['name'], '卡拉克');
      expect(it['type'], 'ship');
      expect(it['qty'], 1);
      expect(it['price'], 80);
    });

    test('currentPrice<=0 时回退 price', () {
      final r = shapeHangarItems([_hi(name: 'X', price: 50, currentPrice: 0)], {});
      expect((r['items'] as List).single['price'], 50);
    });

    test('contents 含子项(name 优先中文 + kind)，alsoContains 按 # 拆分', () {
      final r = shapeHangarItems([
        _hi(
          name: 'Pack',
          items: [
            _sub(title: 'Cutlass Black', kind: 'Ship', chineseTitle: '弯刀黑'),
            _sub(title: 'Some Paint', kind: 'Paint'), // 无中文 → 回退英文
          ],
          chineseAlsoContains: '6个月保险#星图',
        ),
      ], {});
      final it = (r['items'] as List).single;
      final contents = it['contents'] as List;
      expect(contents.length, 2);
      expect(contents[0], {'name': '弯刀黑', 'kind': 'Ship'});
      expect(contents[1], {'name': 'Some Paint', 'kind': 'Paint'});
      expect(it['alsoContains'], ['6个月保险', '星图']);
    });

    test('无额外内容时不含 alsoContains 键', () {
      final r = shapeHangarItems([_hi(name: 'X', items: [_sub(kind: 'Ship')])], {});
      final it = (r['items'] as List).single;
      expect(it.containsKey('alsoContains'), false);
      expect((it['contents'] as List).length, 1);
    });
  });

  group('shapeUserShips', () {
    test('按显示名聚合 number，仅算 Ship', () {
      final items = [
        _hi(name: 'Aurora', number: 1, items: [_sub(kind: 'Ship')]),
        _hi(name: 'Aurora', number: 2, items: [_sub(kind: 'Ship')]),
        _hi(name: 'PaintX', items: [_sub(kind: 'Paint')]),
      ];
      final ships = shapeUserShips(items)['ships'] as List;
      expect(ships.length, 1);
      expect(ships.single['name'], 'Aurora');
      expect(ships.single['count'], 3);
    });
  });

  group('shapeItemCardAck', () {
    test('命中的进 shown,缺失的进 missing,保持顺序', () {
      final r = shapeItemCardAck(['a', 'x', 'b'], {'a', 'b'});
      expect(r['ok'], true);
      expect(r['shown'], ['a', 'b']);
      expect(r['missing'], ['x']);
    });

    test('空串与非字符串入参归 missing 且不崩', () {
      final r = shapeItemCardAck(['', 123, null], {'a'});
      expect(r['shown'], isEmpty);
      expect(r['missing'], ['', '123', 'null']);
    });

    test('可用集合为空时全部 missing', () {
      final r = shapeItemCardAck(['a', 'b'], <String>{});
      expect(r['shown'], isEmpty);
      expect(r['missing'], ['a', 'b']);
    });

    test('入参为空时 shown/missing 均空', () {
      final r = shapeItemCardAck(const [], {'a'});
      expect(r['shown'], isEmpty);
      expect(r['missing'], isEmpty);
    });
  });

  group('hangarItemType / matchesHangarKeyword', () {
    test('类型判定', () {
      expect(hangarItemType(_hi(isUpgrade: true)), 'upgrade');
      expect(hangarItemType(_hi(items: [_sub(kind: 'Ship')])), 'ship');
      expect(hangarItemType(_hi(items: [_sub(kind: 'Paint')])), 'paint');
      expect(hangarItemType(_hi()), 'other');
    });

    test('关键字匹配 null 安全', () {
      final i = _hi(name: 'Aurora'); // 所有中文字段为 null
      expect(matchesHangarKeyword(i, 'aur'), true);
      expect(matchesHangarKeyword(i, '不存在'), false);
      expect(matchesHangarKeyword(i, ''), true); // 空串视为命中
    });
  });

  // 复刻前端 processBuybackSearch：filter 匹配 title/chinesName/alsoContains，type 为标题启发式。
  // 生产数据 _buybackItems 均已带中文名，故 filter 用例的 item 设 chinesName；
  // 前端 isContainSearchKeyBuyback 强解包 chinesName!，null + filter 会 NPE（与前端行为一致）。
  group('shapeBuybackItems', () {
    final items = [
      _bb(id: 1, title: 'Aurora MR Standalone Ship', chinesName: '曙光 MR', number: 2),
      _bb(id: 2, title: 'Cutlass Black Standalone Ship', chinesName: '海盗黑', alsoContains: 'Black Package'),
      _bb(id: 3, title: 'Hornet Subscriber Flair', chinesName: '大黄蜂订阅'),
      _bb(id: 4, title: 'Upgrade - Aurora to Hornet', chinesName: '升级包', isUpgrade: true),
    ];

    test('filter 命中中文名', () {
      final r = shapeBuybackItems(items, {'filter': '曙光'});
      expect(r['total'], 1);
      expect((r['items'] as List).first['id'], 1);
    });

    test('filter 命中英文 title 与 alsoContains', () {
      expect(shapeBuybackItems(items, {'filter': 'cutlass'})['total'], 1); // title
      expect(shapeBuybackItems(items, {'filter': 'black package'})['total'], 1); // alsoContains
    });

    test('type=upgrade 命中 isUpgrade', () {
      final r = shapeBuybackItems(items, {'type': 'upgrade'});
      expect(r['total'], 1);
      expect((r['items'] as List).first['id'], 4);
    });

    test('type=ship 命中标题含 standalone ship', () {
      expect(shapeBuybackItems(items, {'type': 'ship'})['total'], 2); // id 1,2
    });

    test('type=subscription 命中标题含 subscriber', () {
      final r = shapeBuybackItems(items, {'type': 'subscription'});
      expect(r['total'], 1);
      expect((r['items'] as List).first['id'], 3);
    });

    test('filter 无命中 total=0', () {
      expect(shapeBuybackItems(items, {'filter': 'zzz'})['total'], 0);
    });

    test('limit + offset 分页，total 为过滤后总数', () {
      final r = shapeBuybackItems(items, {'limit': 1, 'offset': 1});
      expect(r['total'], 4); // total 不受分页影响
      final page = r['items'] as List;
      expect(page.length, 1);
      expect(page.first['id'], 2);
    });

    test('name 优先中文回退 title，qty 为 number（堆叠累加后）', () {
      // 无 filter/type：searchText 为 null，isContainSearchKeyBuyback 提前返回 true，不触发强解包。
      final r = shapeBuybackItems([_bb(id: 9, title: 'Hornet', number: 5)], {});
      final first = (r['items'] as List).first;
      expect(first['name'], 'Hornet'); // 无中文名回退 title
      expect(first['qty'], 5);
    });
  });
}
