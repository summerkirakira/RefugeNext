// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_hardpoint_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleHardpointItem _$GameVehicleHardpointItemFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleHardpointItem',
  json,
  ($checkedConvert) {
    final val = GameVehicleHardpointItem(
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
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      mass: $checkedConvert('mass', (v) => (v as num?)?.toDouble()),
      grade: $checkedConvert('grade', (v) => v as String?),
      class_: $checkedConvert('class', (v) => v as String?),
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => v == null
            ? null
            : ManufacturerLink.fromJson(v as Map<String, dynamic>),
      ),
      type: $checkedConvert('type', (v) => v as String?),
      typeLabel: $checkedConvert('type_label', (v) => v as String?),
      subType: $checkedConvert('sub_type', (v) => v as String?),
      subTypeLabel: $checkedConvert('sub_type_label', (v) => v as String?),
      inventory: $checkedConvert(
        'inventory',
        (v) => v == null
            ? null
            : ItemInventory.fromJson(v as Map<String, dynamic>),
      ),
      ports: $checkedConvert(
        'ports',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemPort.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'setName': 'set_name',
    'baseItem': 'base_item',
    'variantItems': 'variant_items',
    'setItems': 'set_items',
    'className': 'class_name',
    'class_': 'class',
    'typeLabel': 'type_label',
    'subType': 'sub_type',
    'subTypeLabel': 'sub_type_label',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$GameVehicleHardpointItemToJson(
  GameVehicleHardpointItem instance,
) => <String, dynamic>{
  'set_name': ?instance.setName,
  'base_item': ?instance.baseItem?.toJson(),
  'variant_items': ?instance.variantItems?.map((e) => e.toJson()).toList(),
  'set_items': ?instance.setItems?.map((e) => e.toJson()).toList(),
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'class_name': ?instance.className,
  'link': ?instance.link,
  'size': ?instance.size,
  'mass': ?instance.mass,
  'grade': ?instance.grade,
  'class': ?instance.class_,
  'manufacturer': ?instance.manufacturer?.toJson(),
  'type': ?instance.type,
  'type_label': ?instance.typeLabel,
  'sub_type': ?instance.subType,
  'sub_type_label': ?instance.subTypeLabel,
  'inventory': ?instance.inventory?.toJson(),
  'ports': ?instance.ports?.map((e) => e.toJson()).toList(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
  'version': ?instance.version,
};
