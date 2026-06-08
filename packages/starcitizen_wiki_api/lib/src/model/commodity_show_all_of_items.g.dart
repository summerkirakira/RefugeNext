// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_show_all_of_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityShowAllOfItems _$CommodityShowAllOfItemsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommodityShowAllOfItems',
  json,
  ($checkedConvert) {
    final val = CommodityShowAllOfItems(
      name: $checkedConvert('name', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      typeLabel: $checkedConvert('type_label', (v) => v as String?),
      subType: $checkedConvert('sub_type', (v) => v as String?),
      subTypeLabel: $checkedConvert('sub_type_label', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'typeLabel': 'type_label',
    'subType': 'sub_type',
    'subTypeLabel': 'sub_type_label',
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$CommodityShowAllOfItemsToJson(
  CommodityShowAllOfItems instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'type': ?instance.type,
  'type_label': ?instance.typeLabel,
  'sub_type': ?instance.subType,
  'sub_type_label': ?instance.subTypeLabel,
  'size': ?instance.size,
  'web_url': ?instance.webUrl,
  'link': ?instance.link,
};
