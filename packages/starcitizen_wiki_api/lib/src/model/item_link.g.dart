// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemLink _$ItemLinkFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ItemLink',
  json,
  ($checkedConvert) {
    final val = ItemLink(
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => v as String?),
      deprecatedFields: $checkedConvert(
        'deprecated_fields',
        (v) => v as String?,
      ),
      resource: $checkedConvert(
        'resource',
        (v) => v == null
            ? null
            : CanonicalResourceMeta.fromJson(v as Map<String, dynamic>),
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
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => v == null
            ? null
            : ManufacturerLink.fromJson(v as Map<String, dynamic>),
      ),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      baseVariant: $checkedConvert('base_variant', (v) => v as String?),
      variants: $checkedConvert(
        'variants',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ItemLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'updatedAt': 'updated_at',
    'deprecatedFields': 'deprecated_fields',
    'className': 'class_name',
    'typeLabel': 'type_label',
    'subType': 'sub_type',
    'subTypeLabel': 'sub_type_label',
    'classificationLabel': 'classification_label',
    'isBaseVariant': 'is_base_variant',
    'variantName': 'variant_name',
    'webUrl': 'web_url',
    'baseVariant': 'base_variant',
  },
);

Map<String, dynamic> _$ItemLinkToJson(ItemLink instance) => <String, dynamic>{
  'updated_at': ?instance.updatedAt?.toIso8601String(),
  'version': ?instance.version,
  'deprecated_fields': ?instance.deprecatedFields,
  'resource': ?instance.resource?.toJson(),
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
  'manufacturer': ?instance.manufacturer?.toJson(),
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
  'size': ?instance.size,
  'base_variant': ?instance.baseVariant,
  'variants': ?instance.variants?.map((e) => e.toJson()).toList(),
};
