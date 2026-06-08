// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_port.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPort _$ItemPortFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ItemPort',
  json,
  ($checkedConvert) {
    final val = ItemPort(
      name: $checkedConvert('name', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      position: $checkedConvert('position', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      sizes: $checkedConvert(
        'sizes',
        (v) => v == null
            ? null
            : ItemPortSizes.fromJson(v as Map<String, dynamic>),
      ),
      compatibleTypes: $checkedConvert(
        'compatible_types',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemPortType.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      types: $checkedConvert(
        'types',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      requiredTags: $checkedConvert(
        'required_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      flags: $checkedConvert(
        'flags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      editable: $checkedConvert('editable', (v) => v as bool?),
      uneditable: $checkedConvert('uneditable', (v) => v as bool?),
      equippedItemUuid: $checkedConvert(
        'equipped_item_uuid',
        (v) => v as String?,
      ),
      type: $checkedConvert('type', (v) => v as String?),
      subType: $checkedConvert('sub_type', (v) => v as String?),
      portTags: $checkedConvert(
        'port_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      ports: $checkedConvert(
        'ports',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemPort.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      equippedItem: $checkedConvert(
        'equipped_item',
        (v) =>
            v == null ? null : GamePortItem.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'compatibleTypes': 'compatible_types',
    'requiredTags': 'required_tags',
    'equippedItemUuid': 'equipped_item_uuid',
    'subType': 'sub_type',
    'portTags': 'port_tags',
    'equippedItem': 'equipped_item',
  },
);

Map<String, dynamic> _$ItemPortToJson(ItemPort instance) => <String, dynamic>{
  'name': ?instance.name,
  'display_name': ?instance.displayName,
  'position': ?instance.position,
  'size': ?instance.size,
  'sizes': ?instance.sizes?.toJson(),
  'compatible_types': ?instance.compatibleTypes
      ?.map((e) => e.toJson())
      .toList(),
  'types': ?instance.types,
  'tags': ?instance.tags,
  'required_tags': ?instance.requiredTags,
  'flags': ?instance.flags,
  'editable': ?instance.editable,
  'uneditable': ?instance.uneditable,
  'equipped_item_uuid': ?instance.equippedItemUuid,
  'type': ?instance.type,
  'sub_type': ?instance.subType,
  'port_tags': ?instance.portTags,
  'ports': ?instance.ports?.map((e) => e.toJson()).toList(),
  'equipped_item': ?instance.equippedItem?.toJson(),
};
