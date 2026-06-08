// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_related_link_manufacturer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemRelatedLinkManufacturer _$ItemRelatedLinkManufacturerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ItemRelatedLinkManufacturer', json, ($checkedConvert) {
  final val = ItemRelatedLinkManufacturer(
    code: $checkedConvert('code', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
    link: $checkedConvert('link', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ItemRelatedLinkManufacturerToJson(
  ItemRelatedLinkManufacturer instance,
) => <String, dynamic>{
  'code': ?instance.code,
  'name': ?instance.name,
  'link': ?instance.link,
};
