// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_related_link_ext.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemRelatedLinkExt _$ItemRelatedLinkExtFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ItemRelatedLinkExt',
  json,
  ($checkedConvert) {
    final val = ItemRelatedLinkExt(
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
            : ItemRelatedLinkManufacturer.fromJson(v as Map<String, dynamic>),
      ),
      version: $checkedConvert('version', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      grade: $checkedConvert('grade', (v) => v as String?),
      gradeLabel: $checkedConvert('grade_label', (v) => v as String?),
      class_: $checkedConvert('class', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'className': 'class_name',
    'typeLabel': 'type_label',
    'subType': 'sub_type',
    'subTypeLabel': 'sub_type_label',
    'classificationLabel': 'classification_label',
    'isBaseVariant': 'is_base_variant',
    'variantName': 'variant_name',
    'webUrl': 'web_url',
    'gradeLabel': 'grade_label',
    'class_': 'class',
  },
);

Map<String, dynamic> _$ItemRelatedLinkExtToJson(ItemRelatedLinkExt instance) =>
    <String, dynamic>{
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
      'version': ?instance.version,
      'link': ?instance.link,
      'web_url': ?instance.webUrl,
      'size': ?instance.size,
      'grade': ?instance.grade,
      'grade_label': ?instance.gradeLabel,
      'class': ?instance.class_,
    };
