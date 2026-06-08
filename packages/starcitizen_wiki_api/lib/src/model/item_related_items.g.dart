// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_related_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemRelatedItems _$ItemRelatedItemsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ItemRelatedItems',
  json,
  ($checkedConvert) {
    final val = ItemRelatedItems(
      setName: $checkedConvert('set_name', (v) => v as String?),
      baseItem: $checkedConvert(
        'base_item',
        (v) => v == null
            ? null
            : ItemRelatedLink.fromJson(v as Map<String, dynamic>),
      ),
      variantItems: $checkedConvert(
        'variant_items',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemRelatedLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      setItems: $checkedConvert(
        'set_items',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemRelatedLinkExt.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'setName': 'set_name',
    'baseItem': 'base_item',
    'variantItems': 'variant_items',
    'setItems': 'set_items',
  },
);

Map<String, dynamic> _$ItemRelatedItemsToJson(ItemRelatedItems instance) =>
    <String, dynamic>{
      'set_name': ?instance.setName,
      'base_item': ?instance.baseItem?.toJson(),
      'variant_items': ?instance.variantItems?.map((e) => e.toJson()).toList(),
      'set_items': ?instance.setItems?.map((e) => e.toJson()).toList(),
    };
