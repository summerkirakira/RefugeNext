// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_port_equipped_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePortEquippedItem _$GameVehiclePortEquippedItemFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehiclePortEquippedItem',
  json,
  ($checkedConvert) {
    final val = GameVehiclePortEquippedItem(
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
      type: $checkedConvert('type', (v) => v as String?),
      typeLabel: $checkedConvert('type_label', (v) => v as String?),
      subType: $checkedConvert('sub_type', (v) => v as String?),
      subTypeLabel: $checkedConvert('sub_type_label', (v) => v as String?),
      classification: $checkedConvert('classification', (v) => v as String?),
      classificationLabel: $checkedConvert(
        'classification_label',
        (v) => v as String?,
      ),
      isBaseVariant: $checkedConvert('is_base_variant', (v) => v as bool?),
      variantName: $checkedConvert('variant_name', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      mass: $checkedConvert('mass', (v) => (v as num?)?.toDouble()),
      grade: $checkedConvert('grade', (v) => (v as num?)?.toInt()),
      class_: $checkedConvert('class', (v) => v as String?),
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => v == null
            ? null
            : GamePortItemSummaryManufacturer.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      resourceNetwork: $checkedConvert(
        'resource_network',
        (v) => v == null
            ? null
            : ResourceNetwork.fromJson(v as Map<String, dynamic>),
      ),
      emission: $checkedConvert(
        'emission',
        (v) =>
            v == null ? null : ItemEmission.fromJson(v as Map<String, dynamic>),
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
    'typeLabel': 'type_label',
    'subType': 'sub_type',
    'subTypeLabel': 'sub_type_label',
    'classificationLabel': 'classification_label',
    'isBaseVariant': 'is_base_variant',
    'variantName': 'variant_name',
    'webUrl': 'web_url',
    'class_': 'class',
    'resourceNetwork': 'resource_network',
  },
);

Map<String, dynamic> _$GameVehiclePortEquippedItemToJson(
  GameVehiclePortEquippedItem instance,
) => <String, dynamic>{
  'set_name': ?instance.setName,
  'base_item': ?instance.baseItem?.toJson(),
  'variant_items': ?instance.variantItems?.map((e) => e.toJson()).toList(),
  'set_items': ?instance.setItems?.map((e) => e.toJson()).toList(),
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'class_name': ?instance.className,
  'type': ?instance.type,
  'type_label': ?instance.typeLabel,
  'sub_type': ?instance.subType,
  'sub_type_label': ?instance.subTypeLabel,
  'classification': ?instance.classification,
  'classification_label': ?instance.classificationLabel,
  'is_base_variant': ?instance.isBaseVariant,
  'variant_name': ?instance.variantName,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
  'size': ?instance.size,
  'mass': ?instance.mass,
  'grade': ?instance.grade,
  'class': ?instance.class_,
  'manufacturer': ?instance.manufacturer?.toJson(),
  'resource_network': ?instance.resourceNetwork?.toJson(),
  'emission': ?instance.emission?.toJson(),
  'version': ?instance.version,
};
