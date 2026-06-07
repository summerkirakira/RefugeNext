import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
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
      id: 0,
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

    test('name 优先中文名，price 优先 currentPrice', () {
      final r = shapeHangarItems([
        _hi(name: 'Carrack', chineseName: '卡拉克', price: 100, currentPrice: 80, items: [_sub(kind: 'Ship')]),
      ], {});
      final it = (r['items'] as List).single;
      expect(it['name'], '卡拉克');
      expect(it['type'], 'ship');
      expect(it['qty'], 1);
      expect(it['price'], 80);
    });

    test('currentPrice<=0 时回退 price', () {
      final r = shapeHangarItems([_hi(name: 'X', price: 50, currentPrice: 0)], {});
      expect((r['items'] as List).single['price'], 50);
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
}
