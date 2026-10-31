import '../../datasource/models/hangar.dart';
import '../../datasource/models/searchProperty.dart';

enum HangarFilterField {
  type,
  status,
  insurance,
  price,
  capability,
  from,
  to,
  slot,
  text,
  order
}

const hangarFilterOptions = <HangarFilterField, Map<String, String>>{
  HangarFilterField.type: {
    'all': '全部',
    'ship': '舰船',
    'paint': '涂装',
    'upgrade': '升级',
    'subscription': '订阅'
  },
  HangarFilterField.status: {'all': '全部', 'attributed': '在库', 'gifted': '已礼物'},
  HangarFilterField.insurance: {
    'all': '全部',
    'lti': '永久保险',
    '10y': '10年及以上',
    'other': '其他'
  },
  HangarFilterField.price: {
    'all': '不限',
    'zero': '0',
    'non_zero': '非0',
  },
  HangarFilterField.capability: {
    'all': '全部',
    'giftable': '可礼物',
    'non_giftable': '不可礼物',
    'reclaimable': '可融'
  },
};

const hangarFilterTitles = <HangarFilterField, String>{
  HangarFilterField.type: '类型',
  HangarFilterField.status: '状态',
  HangarFilterField.insurance: '保险',
  HangarFilterField.price: '价格',
  HangarFilterField.capability: '赠送与融船',
  HangarFilterField.from: '起始舰船',
  HangarFilterField.to: '目标舰船',
  HangarFilterField.slot: '保存的CCU链',
};

List<String> filterValues(SearchProperty property, HangarFilterField field) =>
    switch (field) {
      HangarFilterField.type => property.searchType,
      HangarFilterField.status => property.searchStatus,
      HangarFilterField.insurance => property.searchInsurance,
      HangarFilterField.price => property.priceRange,
      HangarFilterField.capability => property.reclaimStatus,
      HangarFilterField.from => property.fromShip,
      HangarFilterField.to => property.toShip,
      _ => throw ArgumentError('Not a grouped filter: $field'),
    };

void toggleFilterValue(
    SearchProperty property, HangarFilterField field, String value) {
  final values = filterValues(property, field);
  if (value == 'all') {
    values
      ..clear()
      ..add('all');
  } else {
    values.remove('all');
    if (!values.remove(value)) values.add(value);
    if (values.isEmpty) values.add('all');
  }
}

Map<String, String> hangarShipOptions(List<HangarItem> items,
        {required bool from}) =>
    {
      for (final item in items)
        if ((from ? item.fromShip : item.toShip) case final ship?)
          ship.id.toString(): ship.chineseName ?? ship.name,
    };

class HangarFilterToken {
  const HangarFilterToken(this.field, this.value, this.label);
  final HangarFilterField field;
  final String value;
  final String label;
  String get key => '${field.name}:$value';

  SearchProperty removedFrom(SearchProperty source) {
    final next = source.copy();
    switch (field) {
      case HangarFilterField.text:
        next.searchText = null;
      case HangarFilterField.order:
        next.orderSelected = false;
      case HangarFilterField.slot:
        next.selectedCCUSlots.remove(int.parse(value));
      default:
        filterValues(next, field).remove(value);
    }
    return next.normalized();
  }
}

List<HangarFilterToken> hangarFilterTokens(
    SearchProperty source, List<HangarItem> items) {
  final property = source.normalized();
  final result = <HangarFilterToken>[];
  if (property.searchText case final text?) {
    result.add(HangarFilterToken(HangarFilterField.text, text, '名称：$text'));
  }
  for (final field in hangarFilterOptions.keys) {
    for (final value
        in filterValues(property, field).where((v) => v != 'all')) {
      final label = hangarFilterOptions[field]![value] ?? value;
      final prefix = field == HangarFilterField.capability
          ? ''
          : '${hangarFilterTitles[field]}：';
      result.add(HangarFilterToken(field, value, '$prefix$label'));
    }
  }
  for (final field in [HangarFilterField.from, HangarFilterField.to]) {
    final names =
        hangarShipOptions(items, from: field == HangarFilterField.from);
    for (final value
        in filterValues(property, field).where((v) => v != 'all')) {
      result.add(HangarFilterToken(field, value,
          '${field == HangarFilterField.from ? '起点' : '终点'}：${names[value] ?? 'ID $value'}'));
    }
  }
  for (final slot in property.selectedCCUSlots) {
    result.add(HangarFilterToken(
        HangarFilterField.slot, '$slot', 'CCU：槽位${slot + 1}'));
  }
  if (property.orderSelected) {
    result.add(HangarFilterToken(HangarFilterField.order, 'price',
        property.priceOrder ? '价格：低到高' : '价格：高到低'));
  }
  return result;
}
